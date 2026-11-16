open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily = C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily of (string) * (string) * (string)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planIdxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planRecord : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planFieldCount : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upRecord : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices : int Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep of (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps : t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planBind : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc }

# 39 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque = (fun ec ctx i -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1; Base_dPair.f_Base_dPair_dPair_second = dtb__2 } -> ((fun v -> ((fun r -> r) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec) ctx) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (i + 1)) dtb__2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxItemAt i) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)))

# 33 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque mc0) mc1) ((mc2 - 1) - mc4)) then (Base_dList.C_Base_dList_dList_Cons (((mc2 - 1) - mc4), (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices = (fun ec ctx n tele -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo ec) ctx) n) tele) 0))

# 138 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase = (fun alts -> (if (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then true else (Base_dList.v_Base_dList_dhasDupNames (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_daltNames alts))))

# 267 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (match dtb__5 with
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

# 369 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf = (fun last -> (if ((Base_dString.v_Base_dString_dendsWith "Op") last) then ((fun n -> (if (n > 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring 0) (Base_dNat.v_Base_dNat_dfromInt (n - 2))) last))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (bi_strLength last)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 376 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical = (fun canon -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dlastSeg canon)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (canon, (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dprefixOfName canon), dtb__14))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__15) -> (match dtb__15 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical dtb__16)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 389 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__18, dtb__19, dtb__20) -> (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__21, dtb__22) -> (match dtb__19 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (match dtb__24 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax dtb__21) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__23; Base_dPair.f_Base_dPair_dPair_second = dtb__20 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 395 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dinstArgOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__28, dtb__29) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__28) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 401 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__32, dtb__33, dtb__34) -> (match dtb__32 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__35, dtb__36) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__38 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax dtb__35) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__39; Base_dPair.f_Base_dPair_dPair_second = dtb__40 } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 407 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__44, dtb__45) -> (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__46, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax, dtb__43)), (Base_dList.C_Base_dList_dList_Cons (dtb__48, Base_dList.C_Base_dList_dList_Nil)), dtb__43)), dtb__49)), dtb__43))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed @ marker")
))

# 412 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dqualifyShort = (fun mod_ short -> (if (mod_ = "") then short else (String.concat "" [mod_; "."; short])))

# 436 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__50, dtb__51, dtb__52) -> (match dtb__50 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__53, dtb__54) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__58 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__60 with
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

# 450 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor = (fun ec cname sp -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf ec) cname) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__61))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily = (fun ec cname sp -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName cname) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort cname)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets cname))) (fun canon -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor ec) canon) sp))) else (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor ec) cname) sp)))

# 456 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__62, dtb__63, dtb__64) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily mc0) dtb__62) dtb__64)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "handle mirror case pattern is not a constructor")
))

# 461 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> (match dtb__65 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__67; Base_dPair.f_Base_dPair_dPair_second = dtb__68 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat mc0) dtb__67) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__69) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__69))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__70) -> (if (dtb__70 = mc1) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies mc0) mc1) dtb__66) else ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__67)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_HandleClauseFamilyMismatch (mc1, dtb__70))) mc1) dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (match dtb__71 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__73; Base_dPair.f_Base_dPair_dPair_second = dtb__74 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat mc0) dtb__73) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__75) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__75))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__76) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies mc0) dtb__76) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__77) -> true
  | _ -> false
))

# 479 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__78) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> (if dtb__80 then (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity dtb__83) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm dtb__82) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity dtb__83) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__84 + 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 494 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleKindArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (if dtb__86 then (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleKindArity dtb__89) else (1 + (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleKindArity dtb__89)))
  | _ -> 0
))

# 500 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs = (fun k sp -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp)), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs (k - 1)) sp)))))

# 505 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg = (fun canon k sp -> (if (k <= 0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (canon, sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (canon, sp)), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs k) sp), sp))))

# 510 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResBinder = "@vuna@handle@res"

# 515 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResArg = (fun resName k sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Eff.resFn", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResBinder, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resName, sp)), ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs k) sp)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResBinder, sp)), Base_dList.C_Base_dList_dList_Nil))), sp)), sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))

# 532 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind = (fun globals ec canon -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup canon) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__90) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__90)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder = "@vuna@handle@ret"

# 542 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__91, dtb__92) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax dtb__91) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder, dtb__92)), dtb__92)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__91, dtb__92)))
  | _ -> mc0
))

# 522 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall = (fun headMode canon resName k comp ret opH sp -> ((fun fnName -> ((fun nameArg -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (fnName, sp)), (Base_dList.C_Base_dList_dList_Cons (nameArg, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (canon, sp)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg canon) k) sp), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResArg resName) k) sp), (Base_dList.C_Base_dList_dList_Cons (comp, (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg ret), (Base_dList.C_Base_dList_dList_Cons (opH, Base_dList.C_Base_dList_dList_Nil)))))))))))))), sp))) (if headMode then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffDefaultInstance, sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp))))) (if headMode then "Base.Eff.handleWithAt" else "Base.Eff.handleWith")))

# 549 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResFamilyOf = (fun globals ec canon resName k sp -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup resName) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_EffResFamilyMissing (canon))) canon)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__93) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleKindArity dtb__93) = (k + 1)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = resName; Base_dPair.f_Base_dPair_dPair_second = k })) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (canon))) canon))
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyArityOf = (fun globals ec canon mod_ short sp -> ((fun resName -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind globals) ec) canon) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (canon))) canon)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity dtb__94) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (canon))) canon)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResFamilyOf globals) ec) canon) resName) dtb__95) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dqualifyShort mod_) ("res" ^ short))))

# 419 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr = (fun globals ec opTy op sp -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> (match dtb__96 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (dtb__97, dtb__98, dtb__99) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyArityOf globals) ec) dtb__97) dtb__98) dtb__99) sp)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Eff.performCore", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__97, sp)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg dtb__97) (Base_dPair.v_Base_dPair_dsecondOf p)) sp), (Base_dList.C_Base_dList_dList_Cons (op, Base_dList.C_Base_dList_dList_Nil)))))))), sp))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_EffResFamilyMissing (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) opTy)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue ec) opTy)))

# 573 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith = (fun globals ec expr sp headMode -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100) -> (match dtb__100 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = dtb__102 } -> (match dtb__102 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__103; Base_dPair.f_Base_dPair_dPair_second = dtb__104 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__105, dtb__106, dtb__107) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__109 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match dtb__106 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__112, dtb__113, dtb__114) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies ec) dtb__113)) (fun fam -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> (match dtb__115 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (dtb__116, dtb__117, dtb__118) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyArityOf globals) ec) dtb__116) dtb__117) dtb__118) sp)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall headMode) dtb__116) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)) dtb__101) dtb__103) dtb__104) sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (fam))) fam)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical fam))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed handle marker")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed handle marker")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed handle marker")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed handle marker")
)) dtb__104)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "handle marker expected")
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr)))

# 586 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr = (fun globals ec expr sp -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) false))

# 590 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt = (fun globals ec expr sp -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) true))

# 686 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf = (fun ec ty -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__119) -> (match dtb__119 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__120, dtb__121) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__120) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__122) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__124 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__122; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__121 } }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__122)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty)))

# 697 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 705 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom = (fun i remaining sp -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp)), (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 701 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats = (fun n sp -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom 0) n) sp))

# 714 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (if ((dtb__125).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__125).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = (dtb__125).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType } })) else (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo mc0) dtb__126) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup = (fun fname dd -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo fname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dd)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dd))))

# 721 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__127 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__129; Base_dPair.f_Base_dPair_dPair_second = dtb__130 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup dtb__129) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__129))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__131) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo mc0) dtb__128)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 728 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown = (fun dd fields -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo dd) fields))

# 732 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (match dtb__132 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__134; Base_dPair.f_Base_dPair_dPair_second = dtb__135 } -> (if (dtb__134 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__135)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor mc0) dtb__133))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 738 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg = (fun i f provided sp -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor (f).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName) provided) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136) -> dtb__136
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp))
  | _ -> failwith "DT: impossible branch"
))

# 744 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (Base_dList.C_Base_dList_dList_Cons (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg mc0) dtb__137) mc2) mc3), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs (mc0 + 1)) dtb__138) mc2) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 750 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__139 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = dtb__142 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices mc0) dtb__140)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__143) -> (match dtb__143 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = dtb__145 } -> (Base_dList.C_Base_dList_dList_Cons (dtb__144, ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices mc0) dtb__140)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup dtb__141) mc0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan = (fun ec baseTy fname sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> (match dtb__148 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__151) -> (match dtb__151 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 } -> (match dtb__153 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__154; Base_dPair.f_Base_dPair_dPair_second = dtb__155 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData = dtb__147; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor = dtb__149; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planIdxs = dtb__150; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planRecord = (dtb__147).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField = dtb__152; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planFieldCount = dtb__154; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Base_dList.v_Base_dList_dreverse dtb__150)) dtb__155) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ fname))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup fname) dtb__147))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve record type for field "; fname; "; add a type signature"]))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

# 790 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan = (fun ec baseTy fields sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156) -> (match dtb__156 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__157; Base_dPair.f_Base_dPair_dPair_second = dtb__158 } -> (match dtb__158 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown dtb__157) fields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ dtb__161))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun fs -> ((fun bodyArgs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData = dtb__157; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor = dtb__159; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs = dtb__160; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upRecord = (dtb__157).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount = (Base_dList.v_Base_dList_dlength fs); f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices dtb__157) fields); f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs = bodyArgs }))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs 0) fs) fields) sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dtb__157))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

# 803 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName "Base.Record.HasField")

# 813 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__162, dtb__163) -> (match dtb__162 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__165 } -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__166) -> (match dtb__166 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__167, dtb__168) -> (if (dtb__167 = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__169, dtb__170) -> (match dtb__170 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__174) -> ((fun nd_uscrut27 -> (match nd_uscrut27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__175) -> (match dtb__175 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__176, dtb__177) -> (if (dtb__176 = "Base.Field.Field") then (match dtb__177 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__180) -> (if (dtb__180 = mc4) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__171) mc5) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__181) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__164, mc1, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__173; Base_dPair.f_Base_dPair_dPair_second = dtb__181 } }))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__182) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) dtb__169))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) dtb__168) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__163) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc2) mc1) dtb__165)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 809 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict = (fun ctx ec fname baseTy -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) ctx) ec) fname) baseTy))

# 834 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel = (fun fuel globals ctx ec baseTerm baseTy fname sp -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__183) -> (match dtb__183 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__184, dtb__185) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["type "; dtb__184; " is not a record"]))
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> (match dtb__186 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> (match dtb__188 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__189; Base_dPair.f_Base_dPair_dPair_second = dtb__190 } -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = proj; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__189; Base_dPair.f_Base_dPair_dPair_second = dtb__190 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__189), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__187, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> (match dtb__191 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (match dtb__193 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = proj; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__194), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__192, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) baseTy)))

# 1022 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__196, dtb__197, dtb__198) -> (match dtb__196 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__199, dtb__200) -> (match dtb__197 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__201, dtb__202) -> (match dtb__202 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (match dtb__204 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__199) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail dtb__201) dtb__203) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__205, dtb__206) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__205) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
# 1028 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail = (fun h t -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__207) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (h, dtb__207))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__208, dtb__209) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__208)) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__208)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort mc0) dtb__209))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1042 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor = (fun ec fam short -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort short) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__210))
  | _ -> failwith "DT: impossible branch"
))

# 1048 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo mc0) mc1) dtb__212) mc3)) (fun t -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)), (Base_dList.C_Base_dList_dList_Cons (dtb__211, (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil)))), mc3))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1059 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__213, dtb__214, dtb__215) -> (match dtb__213 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__216, dtb__217) -> (match dtb__214 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (match dtb__219 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (match dtb__221 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax dtb__216) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__218; Base_dPair.f_Base_dPair_dPair_second = dtb__220 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
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

# 1063 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__222, dtb__223, dtb__224) -> (match dtb__222 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__225, dtb__226) -> (match dtb__223 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (match dtb__228 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax dtb__225) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__227; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__229; Base_dPair.f_Base_dPair_dPair_second = dtb__230 } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1077 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dapplyExtra = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (mc0, mc1, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan mc0)))
))

# 1070 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts = (fun e -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts e) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__231) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__231))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> (match dtb__232 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__233; Base_dPair.f_Base_dPair_dPair_second = dtb__234 } -> (match dtb__234 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__235; Base_dPair.f_Base_dPair_dPair_second = dtb__236 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dapplyExtra dtb__233) dtb__236); Base_dPair.f_Base_dPair_dPair_second = dtb__235 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtParts e))
  | _ -> failwith "DT: impossible branch"
))

# 1082 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> e
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__237) -> (match dtb__237 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__238; Base_dPair.f_Base_dPair_dPair_second = dtb__239 } -> dtb__238
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts e)))

# 1087 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> (match dtb__240 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__241; Base_dPair.f_Base_dPair_dPair_second = dtb__242 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__242))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts e)))

# 1092 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr = (fun e sp -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg e) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> dtb__243
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1097 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo mc0) mc1) dtb__245) mc3)) (fun t -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr dtb__244) mc3), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel dtb__244), (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil)))))), mc3))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1104 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit = (fun ec fam elems sp -> (if (fam = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowFamilyName) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Cons") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__247) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__246)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__247)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__248) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Cons") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__248)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__249)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1117 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf ec) expected) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__250) -> dtb__250
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1123 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit = (fun ec dom a -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__251) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))) dtb__251) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan a))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1276 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 }, Base_dList.C_Base_dList_dList_Nil)))))))

# 1279 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm = (fun n -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo n) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor, Base_dList.C_Base_dList_dList_Nil))))

# 1284 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult = (fun sp n -> (if (n < 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NatLiteralOutOfRange) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm n)))))

# 1287 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("natToInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1290 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 1293 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 1297 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 1300 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__252) -> (match dtb__252 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__253, dtb__254) -> (match dtb__254 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__253 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1305 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__255) -> (match dtb__255 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__256, dtb__257) -> (match dtb__257 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__256 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1311 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__258) -> (match dtb__258 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__259, dtb__260) -> (match dtb__260 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__259 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 931 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected = (fun ec name expected -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__261) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then false else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then false else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy ec) expected) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__262, dtb__263) -> false
  | _ -> true
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 942 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__264) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected mc0) mc1) (Base_dPair.v_Base_dPair_dsecondOf dtb__264))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1317 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm = (fun ec expected actual term -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) actual) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm term))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 1322 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands = (fun ec aTy bTy aTerm bTerm -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm) } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = bTy }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm); Base_dPair.f_Base_dPair_dPair_second = bTerm } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = aTy; Base_dPair.f_Base_dPair_dPair_second = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = aTerm; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm) } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))

# 1336 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf = (fun mc0 mc1 -> (if (mc1 = "+") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("+")) else (if (mc1 = "-") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("-")) else (if (mc1 = "*") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("*")) else (if (mc1 = "/") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("/")) else (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot mc1) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName mc0) mc1) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))

# 1343 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName = (fun mc0 -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1349 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name)), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1352 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1361 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName = (fun mc0 -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1357 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1367 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__265, dtb__266) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1471 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower = (fun globals ctx ec traitName methodName lit expected sp -> ((fun dictDom -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__267) -> (match dtb__267 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__268; Base_dPair.f_Base_dPair_dPair_second = dtb__269 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (methodName, sp)), (Base_dList.C_Base_dList_dList_Cons (lit, Base_dList.C_Base_dList_dList_Nil)), sp)); Base_dPair.f_Base_dPair_dPair_second = dtb__269 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__270) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictDom) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName traitName), (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected), Base_dList.C_Base_dList_dList_Nil))))))))

# 1480 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexprFormName = (fun expr -> (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__271, dtb__272) -> "EVar"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__273, dtb__274) -> "EInt"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__275, dtb__276) -> "EStr"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__277, dtb__278, dtb__279) -> "ELam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__280, dtb__281, dtb__282) -> "EApp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288) -> "EPi"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__289, dtb__290, dtb__291, dtb__292) -> "EIf"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__293, dtb__294, dtb__295) -> "ECase"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__296, dtb__297, dtb__298, dtb__299) -> "ELet"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__300, dtb__301) -> "ELocalFun"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__302, dtb__303, dtb__304) -> "EField"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__305, dtb__306, dtb__307) -> "ERecord"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__308, dtb__309, dtb__310) -> "ERecUpdate"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__311, dtb__312) -> "EDo"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__313, dtb__314, dtb__315, dtb__316) -> "EInfix"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__317, dtb__318) -> "EParen"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__319, dtb__320, dtb__321, dtb__322) -> "EBacktick"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__323, dtb__324) -> "ESectOp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__325, dtb__326, dtb__327) -> "ESectL"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__328, dtb__329, dtb__330) -> "ESectR"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__331, dtb__332, dtb__333) -> "EAnn"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__334, dtb__335, dtb__336) -> "EInterp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__337, dtb__338) -> "EFloat"
  | _ -> failwith "DT: impossible branch"
))

# 1617 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__339, dtb__340, dtb__341) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__340)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__342, dtb__343, dtb__344) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__343)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__345, dtb__346, dtb__347) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__345) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__346))
  | _ -> false
))
# 1625 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__348, dtb__349) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__348) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__349))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1630 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__350, dtb__351) -> (match dtb__350 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__352; Base_dPair.f_Base_dPair_dPair_second = dtb__353 } -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__353) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__351))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1635 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__354, dtb__355) -> (match dtb__354 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__356; Base_dPair.f_Base_dPair_dPair_second = dtb__357 } -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__356) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__355))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1640 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__358, dtb__359, dtb__360) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__358)) (fun value2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (value2, dtb__359, dtb__360))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__361, dtb__362) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt mc0)) dtb__361)) (fun stmts2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (stmts2, dtb__362))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__363, dtb__364, dtb__365) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__363)) (fun base2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun fv -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf fv); Base_dPair.f_Base_dPair_dPair_second = v2 })))))) dtb__364)) (fun fields2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (base2, fields2, dtb__365))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__366, dtb__367, dtb__368) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun fv -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf fv); Base_dPair.f_Base_dPair_dPair_second = v2 })))))) dtb__367)) (fun fields2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__366, fields2, dtb__368))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__369, dtb__370, dtb__371) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__369)) (fun base2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (base2, dtb__370, dtb__371))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__372, dtb__373, dtb__374, dtb__375) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__372)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__373)) (fun t2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__374)) (fun el2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, el2, dtb__375))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__376, dtb__377, dtb__378) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__376)) (fun scrut2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__377)) (fun alts2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__378))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__379, dtb__380, dtb__381, dtb__382) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__379)) (fun binds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__380)) (fun body2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (binds2, body2, dtb__381, dtb__382))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__386)) (fun dom2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__387)) (fun cod2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__383, dtb__384, dtb__385, dom2, cod2, dtb__388))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__389, dtb__390, dtb__391) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__389)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0)) dtb__390)) (fun args2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__391))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__392, dtb__393, dtb__394) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__393)) (fun b2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__392, b2, dtb__394))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__395, dtb__396) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__395, dtb__396))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__397, dtb__398) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__397, dtb__398))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__399, dtb__400) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__399, dtb__400))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__401, dtb__402) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__401, dtb__402))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__403, dtb__404) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__403) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__403, dtb__404)))) else ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable mc0)) dtb__403))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unreordered infix/paren in elaboration")
))
# 1681 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind = (fun mc0 mc1 -> (match mc1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__405; Base_dPair.f_Base_dPair_dPair_second = dtb__406 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__406)) (fun v2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__405; Base_dPair.f_Base_dPair_dPair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 1685 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__407, dtb__408) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__407)) (fun v2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (v2, dtb__408))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__409, dtb__410, dtb__411) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__410)) (fun v2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__409, v2, dtb__411))))))
  | _ -> failwith "DT: impossible branch"
))

# 1793 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas = (fun fuel ctx ec v -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__417; Base_dPair.f_Base_dPair_dPair_second = dtb__418 } -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas (fuel - 1)) ctx) dtb__418) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__416) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__417)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = v; Base_dPair.f_Base_dPair_dPair_second = ec }))
)))

# 1805 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__419, dtb__420) -> true
  | _ -> false
))

# 1811 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__421, dtb__422) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__423) -> (match dtb__423 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__424, dtb__425, dtb__426) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__427, dtb__428) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1823 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint = (fun goals0 ctx expected ec piTy -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) <= goals0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__429) -> (match dtb__429 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__430; Base_dPair.f_Base_dPair_dPair_second = dtb__431 } -> ((fun forcedRes -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue dtb__431) forcedRes) then (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue dtb__431) expected) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__431) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) forcedRes) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__432) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__433) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__433))
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__431) dtb__430))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__434) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas 64) ctx) ec) piTy))))

# 1864 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__435) -> (match dtb__435 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__436, dtb__437) -> (match dtb__437 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__438, dtb__439) -> (match dtb__439 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__440, dtb__441) -> (if (dtb__436 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__438; Base_dPair.f_Base_dPair_dPair_second = dtb__440 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1870 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue = (fun v -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult v) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__442) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__442)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1876 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__443, dtb__444) -> (dtb__443 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 1883 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffConsLabelTail = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__445, dtb__446) -> (match dtb__446 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__447, dtb__448) -> (match dtb__448 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__449, dtb__450) -> (match dtb__450 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__451, dtb__452) -> (if (dtb__445 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__447; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__449; Base_dPair.f_Base_dPair_dPair_second = dtb__451 } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1889 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName = (fun g -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dlastSeg g))

# 1898 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__453, dtb__454) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs (String.concat "" [mc0; " "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) dtb__453)])) dtb__454)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1893 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__455) -> (match dtb__455 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__456, dtb__457) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs (v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName dtb__456)) dtb__457)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1903 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__458) -> dtb__458
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
))

# 1909 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText = (fun ec n h -> (String.concat "" [((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText ec) h); "@"; ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText ec) n)]))

# 1913 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels = (fun fuel ec row -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) row) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__459, dtb__460) -> (if (dtb__459 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)) else (if (dtb__459 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__461) -> (match dtb__461 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__462; Base_dPair.f_Base_dPair_dPair_second = dtb__463 } -> (match dtb__463 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__464; Base_dPair.f_Base_dPair_dPair_second = dtb__465 } -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) dtb__464) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels (fuel - 1)) ec) dtb__465) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__466) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText ec) dtb__462) dtb__464), dtb__466))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffConsLabelTail (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__459, dtb__460)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

# 1927 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__467, dtb__468) -> (match dtb__468 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__467
  | _ -> (String.concat "" [dtb__467; ", "; (v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__468)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1934 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel = (fun ec expected actual -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__469) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue ec) dtb__469) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__470) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) ec) dtb__470) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__471) -> (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__471) Base_dList.C_Base_dList_dList_Nil) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__471)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 1951 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dsameLabelValue = (fun a b -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) a)) = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) b))))

# 1954 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue = (fun ec fuel expected label -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__472, dtb__473) -> (if (dtb__472 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__474, dtb__475) -> (match dtb__475 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__476, dtb__477) -> (match dtb__477 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__478, dtb__479) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsameLabelValue label) dtb__476) then true else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue ec) (fuel - 1)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__478)) label))
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) dtb__473) else false)
  | _ -> false
)))

# 1964 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue = (fun ec fuel actual expected -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__480, dtb__481) -> (if (dtb__480 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then true else (if (dtb__480 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__482, dtb__483) -> (match dtb__483 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__484, dtb__485) -> (match dtb__485 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__486, dtb__487) -> (if ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue ec) (fuel - 1)) expected) dtb__484) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue ec) (fuel - 1)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__486)) expected) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) dtb__481) else false))
  | _ -> false
)))

# 1979 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift = (fun ctx globals ec expected actual term -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup "Base.Eff.weaken") globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__488) -> ((fun d -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__489) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__490) -> (match dtb__490 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__491; Base_dPair.f_Base_dPair_dPair_second = dtb__492 } -> (match dtb__492 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__493; Base_dPair.f_Base_dPair_dPair_second = dtb__494 } -> ((fun tailF -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) tailF) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__495) -> (if ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue ec) 64) dtb__495) (Base_dPair.v_Base_dPair_dfirstOf dtb__489)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = term; Base_dPair.f_Base_dPair_dPair_second = ec })) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue ec) dtb__495) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup "Base.Eff.raise") globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__496) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Eff.raise")), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) (Base_dPair.v_Base_dPair_dfirstOf dtb__489)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) (Base_dPair.v_Base_dPair_dsecondOf dtb__489)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), term, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)); Base_dPair.f_Base_dPair_dPair_second = ec }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) d) dtb__495) tailF) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__497) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__498) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Eff.weaken")), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__491), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__493), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) tailF), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) (Base_dPair.v_Base_dPair_dsecondOf dtb__489)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), term, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)); Base_dPair.f_Base_dPair_dPair_second = dtb__498 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__494))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffConsLabelTail ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) (Base_dPair.v_Base_dPair_dfirstOf dtb__489))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
))

# 2085 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm = (fun ec name -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__499) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__499) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (name, Base_dList.C_Base_dList_dList_Nil)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2091 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm = (fun ec name args -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__500) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__500) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (name, args)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 2293 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 2297 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromFloat")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 2300 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 2303 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__501) -> (match dtb__501 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__502, dtb__503) -> (match dtb__503 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__502 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 2365 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__504) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__504; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__505, dtb__506) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__505; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__506) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__507, dtb__508, dtb__509) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType dtb__507) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__510; Base_dPair.f_Base_dPair_dPair_second = dtb__511 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__510; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__511) (Base_dList.C_Base_dList_dList_Cons (dtb__508, Base_dList.C_Base_dList_dList_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 2361 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs dtb__516)
  | _ -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType mc0))
))

# 2372 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__517, dtb__518, dtb__519, dtb__520, dtb__521) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis dtb__521)
  | _ -> mc0
))

# 2376 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__522, dtb__523) -> (match dtb__522 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__524, dtb__525, dtb__526) -> (if (dtb__525 = ((mc1 - 1) - mc0)) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs (mc0 + 1)) mc1) dtb__523) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2383 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine = (fun fam ctor -> ((fun k -> ((fun args -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__527; Base_dPair.f_Base_dPair_dPair_second = dtb__528 } -> (if (dtb__527 = fam) then (if ((Base_dList.v_Base_dList_dlength args) > 0) then (if ((Base_dList.v_Base_dList_dlength args) < k) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

# 2397 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__529, dtb__530) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dsecondOf dtb__529), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo (mc0 - 1)) dtb__530))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2394 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs = (fun n bs -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo n) bs))

# 2416 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__531, dtb__532) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__533, dtb__534) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) mc1) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> (if dtb__536 then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__539) dtb__531)) dtb__532) dtb__534) mc4) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc4) dtb__531); Base_dPair.f_Base_dPair_dPair_second = dtb__533 }, mc5))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 2401 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs = (fun ec ctx ctor expected -> ((fun fam -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine fam) ctor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__540) -> (match dtb__540 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__541, dtb__542) -> ((fun arity -> (if (dtb__541 = fam) then (if ((Base_dList.v_Base_dList_dlength dtb__542) = arity) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) dtb__542) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dList.C_Base_dList_dList_Nil) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)))

# 2431 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__543 = mc0 in (if dtnat__543 = 0 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern resolve") else (let dtb__544 = (dtnat__543 - 1) in (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__545, dtb__546, dtb__547) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__545) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__548) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__544) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__548)) dtb__546) dtb__547)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__546, dtb__547)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__545) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) "Cons") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__549) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__544) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__549)) dtb__546) dtb__547)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__546, dtb__547)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__545) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor mc1) dtb__547) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc3))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__545)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__545))) (fun target -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__544) mc1) mc2) mc3) target) dtb__546) dtb__547))) else (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__544) mc1) mc2) mc3) dtb__545) dtb__546) dtb__547))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__550, dtb__551, dtb__552) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
)))))
# 2448 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (let dtnat__553 = mc0 in (if dtnat__553 = 0 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern resolve") else (let dtb__554 = (dtnat__553 - 1) in (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__555) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__556) -> (match dtb__556 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__557; Base_dPair.f_Base_dPair_dPair_second = dtb__558 } -> (match dtb__558 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__559; Base_dPair.f_Base_dPair_dPair_second = dtb__560 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__554) dtb__560) mc2) dtb__559) mc5)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__561; Base_dPair.f_Base_dPair_dPair_second = dtb__562 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, dtb__561, mc6)); Base_dPair.f_Base_dPair_dPair_second = dtb__562 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs mc1) mc2) dtb__555) mc3))
  | _ -> failwith "DT: impossible branch"
)))))
# 2459 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__563 = mc0 in (if dtnat__563 = 0 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern resolve") else (let dtb__564 = (dtnat__563 - 1) in (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__565, dtb__566) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__567, dtb__568, dtb__569, dtb__570, dtb__571) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__568 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__564) mc1) ctx2) ty2) (Base_dList.C_Base_dList_dList_Cons (dtb__565, dtb__566))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__564) mc1) mc2) dtb__570) dtb__565)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__572; Base_dPair.f_Base_dPair_dPair_second = dtb__573 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__564) dtb__573) ctx2) ty2) dtb__566)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__574; Base_dPair.f_Base_dPair_dPair_second = dtb__575 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__572, dtb__574)); Base_dPair.f_Base_dPair_dPair_second = dtb__575 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__571) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__567) dtb__570) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__567, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 2482 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__576 = mc0 in (if dtnat__576 = 0 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern resolve") else (let dtb__577 = (dtnat__576 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__578, dtb__579) -> (match dtb__578 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__580; Base_dPair.f_Base_dPair_dPair_second = dtb__581 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__580)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__582; Base_dPair.f_Base_dPair_dPair_second = dtb__583 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo dtb__577) dtb__583) mc2) mc3) dtb__579)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__584; Base_dPair.f_Base_dPair_dPair_second = dtb__585 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__582; Base_dPair.f_Base_dPair_dPair_second = dtb__581 }, dtb__584)); Base_dPair.f_Base_dPair_dPair_second = dtb__585 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

# 2478 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts = (fun ec ctx ty alts -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 2510 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__586 = mc0 in (if dtnat__586 = 0 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern resolve") else (let dtb__587 = (dtnat__586 - 1) in (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__588, dtb__589) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__590, dtb__591, dtb__592, dtb__593, dtb__594) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__591 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__587) mc1) ctx2) ty2) (Base_dList.C_Base_dList_dList_Cons (dtb__588, dtb__589))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__587) mc1) mc2) dtb__593) dtb__588)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__595; Base_dPair.f_Base_dPair_dPair_second = dtb__596 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__587) dtb__596) ctx2) ty2) dtb__589)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__597; Base_dPair.f_Base_dPair_dPair_second = dtb__598 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__595, dtb__597)); Base_dPair.f_Base_dPair_dPair_second = dtb__598 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__594) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__590) dtb__593) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__590, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 2499 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__599 = mc0 in (if dtnat__599 = 0 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pattern resolve") else (let dtb__600 = (dtnat__599 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__601, dtb__602) -> (match dtb__601 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__603; Base_dPair.f_Base_dPair_dPair_second = dtb__604 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__603)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__605; Base_dPair.f_Base_dPair_dPair_second = dtb__606 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo dtb__600) dtb__606) mc2) mc3) dtb__602)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__607; Base_dPair.f_Base_dPair_dPair_second = dtb__608 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__605; Base_dPair.f_Base_dPair_dPair_second = dtb__604 }, dtb__607)); Base_dPair.f_Base_dPair_dPair_second = dtb__608 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

# 2494 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats = (fun ec ctx expected clauses -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 2574 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__609, dtb__610, dtb__611) -> (match dtb__609 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__612, dtb__613) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__612) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__614) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 2596 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain = (fun fuel canonical acc expr -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__615, dtb__616, dtb__617) -> (match dtb__615 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__618, dtb__619) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__618) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = expr }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__620) -> (if (canonical <> dtb__620) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__621, dtb__622) -> (match dtb__622 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__623, dtb__624) -> (match dtb__623 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__625, dtb__626, dtb__627) -> (match dtb__625 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__628, dtb__629) -> (match dtb__629 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__624 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain (fuel - 1)) dtb__620) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__628, dtb__621, dtb__619)), acc))) dtb__626)
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
)) dtb__616))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = expr }))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = expr }))
)) expr)))

# 2609 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__630, dtb__631, dtb__632) -> (match dtb__630 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__633, dtb__634) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__633) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__635) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__636) -> (match dtb__636 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__637; Base_dPair.f_Base_dPair_dPair_second = dtb__638 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical = dtb__635; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps = dtb__637; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast = dtb__638; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan = dtb__634 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain 4096) dtb__635) Base_dList.C_Base_dList_dList_Nil) mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 2619 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__639, dtb__640) -> (match dtb__639 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__641, dtb__642, dtb__643) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, dtb__643)), (Base_dList.C_Base_dList_dList_Cons (dtb__642, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (dtb__641, Base_dList.C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild mc0) dtb__640) mc2) mc3), dtb__643)), Base_dList.C_Base_dList_dList_Nil)))), dtb__643))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 2625 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback = (fun chain -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan))

# 2632 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__644, dtb__645) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__644)) dtb__645) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = dtb__644 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__646) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__646))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2639 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__647) -> (match dtb__647 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__648, dtb__649, dtb__650) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__648, dtb__649, Base_dList.C_Base_dList_dList_Nil))))) dtb__650)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__651, dtb__652) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__651, Base_dList.C_Base_dList_dList_Nil))))) dtb__652)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 2655 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__653, dtb__654, dtb__655, dtb__656, dtb__657) -> (if dtb__654 then (match dtb__657 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__658, dtb__659, dtb__660, dtb__661, dtb__662) -> (if dtb__659 then (match dtb__661 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__663, dtb__664, dtb__665) -> (match dtb__663 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__666) -> (match dtb__664 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__667, dtb__668, dtb__669) -> (match dtb__662 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__670, dtb__671, dtb__672, dtb__673, dtb__674) -> (if dtb__671 then (match dtb__674 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__675, dtb__676, dtb__677, dtb__678, dtb__679) -> (if dtb__676 then (match dtb__679 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__680, dtb__681, dtb__682, dtb__683, dtb__684) -> (if dtb__681 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__683 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__685, dtb__686, dtb__687) -> (match dtb__685 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__688, dtb__689, dtb__690) -> (match dtb__686 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__691, dtb__692, dtb__693) -> (match dtb__684 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__694, dtb__695, dtb__696, dtb__697, dtb__698) -> (if dtb__695 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__697 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__699, dtb__700, dtb__701, dtb__702, dtb__703) -> (if dtb__700 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__702 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__704, dtb__705, dtb__706) -> (match dtb__703 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__707, dtb__708, dtb__709) -> (match dtb__707 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__710, dtb__711, dtb__712) -> (match dtb__708 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__713, dtb__714, dtb__715) -> (match dtb__698 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__716, dtb__717, dtb__718) -> (match dtb__716 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__719, dtb__720, dtb__721) -> (match dtb__717 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__722, dtb__723, dtb__724) -> (if (if (if (if (dtb__668 = 0) then (dtb__689 = 3) else false) then (dtb__711 = 5) else false) then (dtb__720 = 5) else false) then (if (if (if (if (dtb__692 = 1) then (dtb__705 = 2) else false) then (dtb__714 = 2) else false) then (dtb__723 = 2) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__682, dtb__696, dtb__701)))) else (if (if (if (if (dtb__692 = 0) then (dtb__705 = 1) else false) then (dtb__714 = 3) else false) then (dtb__723 = 3) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__682, dtb__696, dtb__701)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
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

# 2665 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf = (fun globals ctx ec bindName -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup bindName) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__725) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup bindName) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__726) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (bindName)); Base_dPair.f_Base_dPair_dPair_second = dtb__726 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2674 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf = (fun globals ctx ec bindName -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__727) -> (match dtb__727 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__728; Base_dPair.f_Base_dPair_dPair_second = dtb__729 } -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf dtb__729) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__730) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__728; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__729; Base_dPair.f_Base_dPair_dPair_second = dtb__730 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf globals) ctx) ec) bindName)))

# 2684 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer = (fun ctx ec dom sp -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__731; Base_dPair.f_Base_dPair_dPair_second = dtb__732 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__731; Base_dPair.f_Base_dPair_dPair_second = ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__732) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__732) dom)) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

# 2693 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep = (fun fuel globals ctx ec sp dom -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dom) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__733) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__733))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__734) -> (match dtb__734 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__735; Base_dPair.f_Base_dPair_dPair_second = dtb__736 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__735; Base_dPair.f_Base_dPair_dPair_second = dtb__736 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) sp)))))

# 2719 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock = (fun fuel globals ctx ec sp bindName headTerm bindTyTerm shape mVal aVal -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match shape with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__737, dtb__738, dtb__739) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__740, dtb__741, dtb__742, dtb__743, dtb__744) -> (if dtb__741 then ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__745, dtb__746, dtb__747, dtb__748, dtb__749) -> (if dtb__746 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__748) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__748)) (fun dp -> (match dp with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__750; Base_dPair.f_Base_dPair_dPair_second = dtb__751 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planBind = bindName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead = headTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) mVal); f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal = mVal; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal = aVal; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm = dtb__750; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE = dtb__737; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL = dtb__738; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig = dtb__739; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc = dtb__751 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__744) mVal))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) bindTyTerm)))
  | _ -> failwith "DT: impossible branch"
)))

# 2738 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm = (fun ecLinear ecPaper ctx sp plan binder aVal eTerm argRig lamRig inner -> ((fun depth -> ((fun ctx2 -> ((fun inner2 -> ((fun binderName -> ((fun lamTerm -> ((fun args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead) args)) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) aVal); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = eTerm; Base_dPair.f_Base_dPair_dPair_second = argRig }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = lamTerm; Base_dPair.f_Base_dPair_dPair_second = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL }, Base_dList.C_Base_dList_dList_Nil)))))))))))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, inner2)))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear ecLinear) ctx) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear ecLinear) ctx2) inner) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName sp) depth) binder) else binder) else binder))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) inner) else inner))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binder) aVal) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

# 51 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel globals ctx ec dd idxs scrutVal expected cname args psp body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 psp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownConstructorInCase ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__752) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan psp)) (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__752)) args))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__753; Base_dPair.f_Base_dPair_dPair_second = dtb__754 } -> (match dtb__754 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__755; Base_dPair.f_Base_dPair_dPair_second = dtb__756 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__756) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 psp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_BranchTooManyArgs ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan psp)) (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized ec) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__753)) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__753) dtb__752)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)))) (fun refsIdx -> (match (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__753) refsIdx) with
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImpossibleBranchEmptyCtx)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__753)) refsIdx) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__753) dtb__752)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__757; Base_dPair.f_Base_dPair_dPair_second = dtb__758 } -> ((fun n -> ((fun opaqueIdxs -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = cname; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__755; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = bodyTerm2 }; Base_dPair.f_Base_dPair_dPair_second = dtb__758 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__758) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses opaqueIdxs) dtb__757))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices dtb__758) branchCtx2) n) dtb__755))) (Base_dList.v_Base_dList_dlength dtb__755))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__753) refs2))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)))
# 79 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__759, dtb__760) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match dtb__759 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__761; Base_dPair.f_Base_dPair_dPair_second = dtb__762 } -> (match dtb__761 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__763, dtb__764, dtb__765) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__763) dtb__764) dtb__765) dtb__762)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__766; Base_dPair.f_Base_dPair_dPair_second = dtb__767 } -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__767) mc4) mc5) mc6) mc7) mc8) dtb__760) (Base_dList.C_Base_dList_dList_Cons (dtb__766, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__768, dtb__769) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__760) mc10) dtb__762) dtb__768) dtb__769)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__770) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__760) mc10) dtb__762) "_") dtb__770)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__761)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc10); Base_dPair.f_Base_dPair_dPair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 100 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel globals ctx ec scrutTy dd idxs expected rest acc body pname psp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun ctx2 -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CatchAllNotLast) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__771; Base_dPair.f_Base_dPair_dPair_second = dtb__772 } -> ((fun binds -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ""; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = binds; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = bodyTerm2 }, acc))); Base_dPair.f_Base_dPair_dPair_second = dtb__772 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__772) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) (if (pname = "_") then dtb__771 else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__772) ctx) scrutTy) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__771) else dtb__771)))) (if (pname = "_") then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = pname; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) scrutTy) }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))))) (if (pname = "_") then ctx else (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))
# 126 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__773; Base_dPair.f_Base_dPair_dPair_second = dtb__774 } -> (match dtb__774 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__775; Base_dPair.f_Base_dPair_dPair_second = dtb__776 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts dtb__776) ctx) dtb__775) alts)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__777; Base_dPair.f_Base_dPair_dPair_second = dtb__778 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dstep ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat dtb__778) dtb__777)) (fun _u ec3 -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase dtb__777) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel (fuel - 1)) globals) ctx) ec3) scrut) dtb__777) expected) sp) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel (fuel - 1)) globals) ctx) ec3) dtb__773) dtb__775) dtb__777) expected) sp))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps)))))
# 146 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun name -> ((fun clauses -> ((fun table -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr table) clauses) name)) (fun bodyExpr -> ((((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive table) (fun _u -> (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmatrixOf clauses))) sp) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (name, sp)); Base_dPair.f_Base_dPair_dPair_second = scrut }, Base_dList.C_Base_dList_dList_Nil)), bodyExpr, false, sp))) expected))))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec))) ((Base_dList.v_Base_dList_dmap (fun alt -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf alt), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf alt) })) alts))) ("nd_scrut" ^ (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))))
# 156 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel globals ctx ec scrutTerm scrutTy alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__779) -> (match dtb__779 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__780, dtb__781) -> (if (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disBoolCanonical dtb__780) then ((Base_dList.v_Base_dList_dlength dtb__781) = 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__780 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts alts) then ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel (fuel - 1)) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm scrutTerm)) scrutTerm) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue) alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__780) dtb__781) alts) expected) sp)) else (if (dtb__780 = "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__780 = "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__780) dtb__781) alts) expected) sp)))))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))
# 170 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel globals ctx ec scrutTerm alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__782; Base_dPair.f_Base_dPair_dPair_second = dtb__783 } -> (match dtb__783 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__784; Base_dPair.f_Base_dPair_dPair_second = dtb__785 } -> (match dtb__784 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__786) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__782, dtb__786)); Base_dPair.f_Base_dPair_dPair_second = dtb__785 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) dtb__785) alts) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__787; Base_dPair.f_Base_dPair_dPair_second = dtb__788 } -> (match dtb__788 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__789; Base_dPair.f_Base_dPair_dPair_second = dtb__790 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__782, dtb__787)); Base_dPair.f_Base_dPair_dPair_second = dtb__790 }))
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
# 181 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel = (fun fuel globals ctx ec alts target expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
# 186 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__791, dtb__792) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match dtb__791 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__793; Base_dPair.f_Base_dPair_dPair_second = dtb__794 } -> (match dtb__793 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__795, dtb__796, dtb__797) -> (if (dtb__795 = mc5) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__794) mc6)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__798; Base_dPair.f_Base_dPair_dPair_second = dtb__799 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__798; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc8; Base_dPair.f_Base_dPair_dPair_second = dtb__799 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__792) mc5) mc6) mc7) mc8))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__800, dtb__801) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__794) mc6)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__802; Base_dPair.f_Base_dPair_dPair_second = dtb__803 } -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__803) dtb__792) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__802)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__804) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__794) mc6)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__805; Base_dPair.f_Base_dPair_dPair_second = dtb__806 } -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__806) dtb__792) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__805)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__793)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match mc8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__807) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__807; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc3 } }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc7) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotExhaustive ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 210 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel globals ctx ec scrutTerm tyName alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__808; Base_dPair.f_Base_dPair_dPair_second = dtb__809 } -> (match dtb__809 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__810; Base_dPair.f_Base_dPair_dPair_second = dtb__811 } -> (if dtb__810 then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__808; Base_dPair.f_Base_dPair_dPair_second = dtb__811 })) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 219 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__812, dtb__813) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match dtb__812 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__814; Base_dPair.f_Base_dPair_dPair_second = dtb__815 } -> (match dtb__814 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__816, dtb__817) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__816))) dtb__815) dtb__813) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__818, dtb__819) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__818))) dtb__815) dtb__813) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__820, dtb__821) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__820) dtb__815) mc7) mc8)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__822; Base_dPair.f_Base_dPair_dPair_second = dtb__823 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__822; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__823 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__824) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__815) mc7)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__825; Base_dPair.f_Base_dPair_dPair_second = dtb__826 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__825; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__826 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__814)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 239 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel globals ctx ec scrutTerm tyName litTerm body rest expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__827; Base_dPair.f_Base_dPair_dPair_second = dtb__828 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) dtb__828) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__829; Base_dPair.f_Base_dPair_dPair_second = dtb__830 } -> (match dtb__830 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__831; Base_dPair.f_Base_dPair_dPair_second = dtb__832 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__827, dtb__829)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__831; Base_dPair.f_Base_dPair_dPair_second = dtb__832 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
# 250 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel globals ctx ec scrutTerm tyName name body expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__833; Base_dPair.f_Base_dPair_dPair_second = dtb__834 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__833)), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__834 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dList.C_Base_dList_dList_Nil))))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dList.C_Base_dList_dList_Nil))))) ctx))))
# 275 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__835; Base_dPair.f_Base_dPair_dPair_second = dtb__836 } -> (match dtb__836 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__837; Base_dPair.f_Base_dPair_dPair_second = dtb__838 } -> (if dtb__837 then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__835; Base_dPair.f_Base_dPair_dPair_second = dtb__838 })) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 282 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__839, dtb__840) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match dtb__839 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__841; Base_dPair.f_Base_dPair_dPair_second = dtb__842 } -> (match dtb__841 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__843, dtb__844) -> ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__843))) dtb__842) dtb__840) mc8) mc9)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__845, dtb__846) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__845) dtb__842) mc8) mc9)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__847; Base_dPair.f_Base_dPair_dPair_second = dtb__848 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__847; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__848 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__849) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__842) mc8)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__850; Base_dPair.f_Base_dPair_dPair_second = dtb__851 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__850; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__851 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__841)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 300 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy litTerm body rest expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__852; Base_dPair.f_Base_dPair_dPair_second = dtb__853 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__853) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun q -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__854; Base_dPair.f_Base_dPair_dPair_second = dtb__855 } -> (match dtb__855 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__856; Base_dPair.f_Base_dPair_dPair_second = dtb__857 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("bi_eq_int")), cmpTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__852, dtb__854)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__856; Base_dPair.f_Base_dPair_dPair_second = dtb__857 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
# 310 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel = (fun fuel globals ctx ec bindTerm binderTy name body expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__858; Base_dPair.f_Base_dPair_dPair_second = dtb__859 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__858)), bindTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__859 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) binderTy))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) binderTy) ctx))))
# 320 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel globals ctx ec scrutTerm scrutTy fam idxs alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__860) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__860) idxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) Base_dList.C_Base_dList_dList_Nil)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__861; Base_dPair.f_Base_dPair_dPair_second = dtb__862 } -> (((((((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__862) ctx) dtb__860) idxs) alts) expected) sp) scrutTerm) dtb__861)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 330 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel globals ctx ec scrut alts sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun pmeta -> (match pmeta with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__863; Base_dPair.f_Base_dPair_dPair_second = dtb__864 } -> ((fun metaTy -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) dtb__864) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__865; Base_dPair.f_Base_dPair_dPair_second = dtb__866 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__865; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = metaTy; Base_dPair.f_Base_dPair_dPair_second = dtb__866 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__863))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec))))
# 346 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel globals ctx ec c sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) c) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__867) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__867))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__868) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__869; Base_dPair.f_Base_dPair_dPair_second = dtb__870 } -> (match dtb__870 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__871; Base_dPair.f_Base_dPair_dPair_second = dtb__872 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__871) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__869; Base_dPair.f_Base_dPair_dPair_second = dtb__872 })) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["if condition must be "; Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName; " (got "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__871); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
)))
# 593 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__873) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__874) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__875) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) dtb__875) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__876) -> (match dtb__876 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__877; Base_dPair.f_Base_dPair_dPair_second = dtb__878 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__877)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__879; Base_dPair.f_Base_dPair_dPair_second = dtb__880 } -> (match dtb__880 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__881; Base_dPair.f_Base_dPair_dPair_second = dtb__882 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr globals) dtb__882) dtb__881) dtb__877) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__882) callExpr)))
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
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__883) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__883)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__884) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__884))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__883))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 627 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__885, dtb__886, dtb__887) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__885) dtb__886) dtb__887)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__888, dtb__889) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__889) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DoUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__890, dtb__891, dtb__892) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__890) dtb__891) dtb__892)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__893, dtb__894, dtb__895) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__895) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RecordsUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__896, dtb__897, dtb__898) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__896) dtb__897) dtb__898)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__899, dtb__900, dtb__901) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__899) dtb__900) dtb__901)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__902, dtb__903) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__902) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__903) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__902, dtb__903)))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__904, dtb__905, dtb__906, dtb__907) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) ec) dtb__904) dtb__905) dtb__906) dtb__907)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__908, dtb__909, dtb__910, dtb__911) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__908) dtb__911)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__912; Base_dPair.f_Base_dPair_dPair_second = dtb__913 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__913) dtb__909)) (fun pt -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__914; Base_dPair.f_Base_dPair_dPair_second = dtb__915 } -> (match dtb__915 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__916; Base_dPair.f_Base_dPair_dPair_second = dtb__917 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__917) dtb__910)) (fun pe -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__918; Base_dPair.f_Base_dPair_dPair_second = dtb__919 } -> (match dtb__919 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__920; Base_dPair.f_Base_dPair_dPair_second = dtb__921 } -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__921) dtb__916) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__921) dtb__920) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__912, dtb__914, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__918))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__916; Base_dPair.f_Base_dPair_dPair_second = dtb__921 } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__921) dtb__916) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__921) dtb__920) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__912, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__914), dtb__918)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__921 } })) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__921) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__916) dtb__920)) (fun ec4 -> ((fun branchOpaque -> ((fun tTerm2 -> ((fun eTerm2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__912, tTerm2, eTerm2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__916; Base_dPair.f_Base_dPair_dPair_second = ec4 } }))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__918) else dtb__918))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__914) else dtb__914))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec4) ctx) dtb__916))))))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__922, dtb__923, dtb__924) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__924) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaNoSignature)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__925, dtb__926, dtb__927) -> (match dtb__925 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__928, dtb__929) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__928) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__927) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstParam) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__928, dtb__929))) dtb__926) dtb__927) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__925) dtb__926) dtb__927) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__930, dtb__931, dtb__932, dtb__933, dtb__934, dtb__935) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) dtb__930) dtb__931) dtb__932) dtb__933) dtb__934) dtb__935)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__936, dtb__937) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__936)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__938, dtb__939) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__938)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("String", Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__940, dtb__941) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__940)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Int", Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__942, dtb__943) -> (if (dtb__942 = "Type") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))); Base_dPair.f_Base_dPair_dPair_second = ec } })) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__942) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__943) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_HoleNoExpectedType) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__942) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__943) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__942)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__942))) (fun t -> (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) t) dtb__943))) else (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__942) dtb__943))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unreordered infix/paren in elaboration")
)) expr)))
# 852 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel = (fun fuel globals ctx ec base fname sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__944; Base_dPair.f_Base_dPair_dPair_second = dtb__945 } -> (match dtb__945 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__946; Base_dPair.f_Base_dPair_dPair_second = dtb__947 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf dtb__947) dtb__946) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__948) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan dtb__947) dtb__946) fname) sp)) (fun plan -> ((fun arity -> ((fun tele -> ((fun proj -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = proj; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType; Base_dPair.f_Base_dPair_dPair_second = dtb__947 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__944, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor), tele, (arity + (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField)))) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor)))) (Base_dList.v_Base_dList_dlength ((plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__947) dtb__944) dtb__946) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))))
# 869 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel = (fun fuel globals ctx ec base fields sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match fields with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "record update needs at least one field")
  | _ -> (if (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames fields) then ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "duplicate field in record update") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__949; Base_dPair.f_Base_dPair_dPair_second = dtb__950 } -> (match dtb__950 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__951; Base_dPair.f_Base_dPair_dPair_second = dtb__952 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan dtb__952) dtb__951) fields) sp)) (fun plan -> ((fun body -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (fuel - 1)) globals) ctx) dtb__952) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__949)) dtb__951) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__953; Base_dPair.f_Base_dPair_dPair_second = dtb__954 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__949, (dtb__953).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName, (dtb__953).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders, (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices, (dtb__953).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__951; Base_dPair.f_Base_dPair_dPair_second = dtb__954 } }))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor), sp)), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs, sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb))))
)))
# 887 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel globals ctx ec value ty sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__955; Base_dPair.f_Base_dPair_dPair_second = dtb__956 } -> (match dtb__956 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__957; Base_dPair.f_Base_dPair_dPair_second = dtb__958 } -> ((fun tyVal -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__958) value) tyVal)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__959; Base_dPair.f_Base_dPair_dPair_second = dtb__960 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__959; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = tyVal; Base_dPair.f_Base_dPair_dPair_second = dtb__960 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__955))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))
# 898 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel globals ctx ec name implicit qty dom cod sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__961; Base_dPair.f_Base_dPair_dPair_second = dtb__962 } -> (match dtb__962 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__963; Base_dPair.f_Base_dPair_dPair_second = dtb__964 } -> ((fun domVal -> ((fun isTypeDom -> ((fun isLinDom -> ((fun lvl -> ((fun ctx2 -> ((fun badQty -> ((fun badLinQty -> (if badQty then (if implicit then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_MultiplicityImplicit (name))) name) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearTypeNeedsOne (name))) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx2) dtb__964) cod)) (fun pc -> ((fun nd_uscrut28 -> (match nd_uscrut28 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__965; Base_dPair.f_Base_dPair_dPair_second = dtb__966 } -> (match dtb__966 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__967; Base_dPair.f_Base_dPair_dPair_second = dtb__968 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (name, implicit, (if isLinDom then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else (if implicit then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dimplicitBinderRig ec) domVal) else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfQty false) isTypeDom) qty))), dtb__961, dtb__965)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__963) dtb__967))); Base_dPair.f_Base_dPair_dPair_second = dtb__968 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__969) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero dtb__969) then isLinDom else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__970) -> (if implicit then true else isTypeDom)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__961) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) domVal))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeDomain domVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__961))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))
# 947 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__971, dtb__972) -> (if (dtb__971 = "->") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__973, dtb__974) -> (match dtb__974 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__975, dtb__976) -> (match dtb__976 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dtb__973) dtb__975) sp)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)) args) else (if (dtb__971 = "Type") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__977, dtb__978) -> (match dtb__977 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__979, dtb__980) -> (match dtb__978 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__979 < 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__980) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UniverseLevelNonNegative) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__979))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__979)))); Base_dPair.f_Base_dPair_dPair_second = ec } })))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__972) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__972) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__972) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)) args) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__981, dtb__982) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__981) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__982) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__981)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__981))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__982))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__981) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__983) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__981) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__984) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__984))) args) sp) hint)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__985; Base_dPair.f_Base_dPair_dPair_second = dtb__986 } -> (match dtb__986 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__987; Base_dPair.f_Base_dPair_dPair_second = dtb__988 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__988)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__981))) dtb__985); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__987; Base_dPair.f_Base_dPair_dPair_second = dtb__988 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__981) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__989) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint ec) dtb__981) hint) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__989)) args) sp) hint)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__990; Base_dPair.f_Base_dPair_dPair_second = dtb__991 } -> (match dtb__991 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__992; Base_dPair.f_Base_dPair_dPair_second = dtb__993 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__993)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__981))) dtb__990); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__992; Base_dPair.f_Base_dPair_dPair_second = dtb__993 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__981) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__994) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__994))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__989)) args) sp) hint)) (fun pa -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__995; Base_dPair.f_Base_dPair_dPair_second = dtb__996 } -> (match dtb__996 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__997; Base_dPair.f_Base_dPair_dPair_second = dtb__998 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__998)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__981))) dtb__995); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__997; Base_dPair.f_Base_dPair_dPair_second = dtb__998 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__981) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__999) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__999))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__982) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__981))) dtb__981)
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1000, dtb__1001) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1000) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1001) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1000)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1000))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1001))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1000) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1002) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__1000) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1003) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1003))) args) sp) hint)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1004; Base_dPair.f_Base_dPair_dPair_second = dtb__1005 } -> (match dtb__1005 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1006; Base_dPair.f_Base_dPair_dPair_second = dtb__1007 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1007)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1000))) dtb__1004); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1006; Base_dPair.f_Base_dPair_dPair_second = dtb__1007 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__1000) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1008) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint ec) dtb__1000) hint) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1008)) args) sp) hint)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1009; Base_dPair.f_Base_dPair_dPair_second = dtb__1010 } -> (match dtb__1010 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1011; Base_dPair.f_Base_dPair_dPair_second = dtb__1012 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1012)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1000))) dtb__1009); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1011; Base_dPair.f_Base_dPair_dPair_second = dtb__1012 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1000) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1013) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1013))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1008)) args) sp) hint)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1014; Base_dPair.f_Base_dPair_dPair_second = dtb__1015 } -> (match dtb__1015 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1016; Base_dPair.f_Base_dPair_dPair_second = dtb__1017 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1017)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1000))) dtb__1014); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1016; Base_dPair.f_Base_dPair_dPair_second = dtb__1017 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1000) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1018) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1018))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__1001) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1000))) dtb__1000)
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
# 997 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1019, dtb__1020) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1019) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1021) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1021))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1006 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1022; Base_dPair.f_Base_dPair_dPair_second = dtb__1023 } -> (match dtb__1023 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1024; Base_dPair.f_Base_dPair_dPair_second = dtb__1025 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__1025) dtb__1024) args) sp) hint)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1026; Base_dPair.f_Base_dPair_dPair_second = dtb__1027 } -> (match dtb__1027 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1028; Base_dPair.f_Base_dPair_dPair_second = dtb__1029 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1029)) dtb__1022) dtb__1026); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1028; Base_dPair.f_Base_dPair_dPair_second = dtb__1029 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pf)))))
# 1015 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1128 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1030, dtb__1031, dtb__1032, dtb__1033, dtb__1034) -> (if dtb__1031 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__1033) then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__1033) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1033) dtb__1034) args) sp) hint) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1033) args) sp)) (fun ec0 -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1035) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1033)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1033) dtb__1034) args) sp) hint) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1033)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1033) dtb__1034) args) sp) hint) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1035))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1036) -> (match dtb__1036 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1037; Base_dPair.f_Base_dPair_dPair_second = dtb__1038 } -> ((fun ty2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1038) ty2) args) sp) hint)) (fun q -> ((fun nd_uscrut24 -> (match nd_uscrut24 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1039; Base_dPair.f_Base_dPair_dPair_second = dtb__1040 } -> (match dtb__1040 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1041; Base_dPair.f_Base_dPair_dPair_second = dtb__1042 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1037; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, dtb__1039)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1041; Base_dPair.f_Base_dPair_dPair_second = dtb__1042 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1037)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1033)) sp))))) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec) dtb__1033) then (match ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ec) dtb__1033) with
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__1043, dtb__1044) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1044) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) dtb__1043)) args) sp) hint)) (fun p -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1045; Base_dPair.f_Base_dPair_dPair_second = dtb__1046 } -> (match dtb__1046 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1047; Base_dPair.f_Base_dPair_dPair_second = dtb__1048 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1043); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1045)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1047; Base_dPair.f_Base_dPair_dPair_second = dtb__1048 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__1049) -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1050; Base_dPair.f_Base_dPair_dPair_second = dtb__1051 } -> ((fun ec2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1050))) args) sp) hint)) (fun p -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1052; Base_dPair.f_Base_dPair_dPair_second = dtb__1053 } -> (match dtb__1053 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1054; Base_dPair.f_Base_dPair_dPair_second = dtb__1055 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1050; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1052)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1054; Base_dPair.f_Base_dPair_dPair_second = dtb__1055 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1051) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow) m) dtb__1033) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1056; Base_dPair.f_Base_dPair_dPair_second = dtb__1057 } -> ((fun ec2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1056))) args) sp) hint)) (fun p -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1058; Base_dPair.f_Base_dPair_dPair_second = dtb__1059 } -> (match dtb__1059 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1060; Base_dPair.f_Base_dPair_dPair_second = dtb__1061 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1056; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1058)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1060; Base_dPair.f_Base_dPair_dPair_second = dtb__1061 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1057) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow) m) dtb__1033) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))
  | _ -> failwith "DT: impossible branch"
) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__1033) then (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain ec) dtb__1033) then (match args with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1062, dtb__1063) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dinstArgOperand dtb__1062) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1064) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1064) dtb__1033)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1065; Base_dPair.f_Base_dPair_dPair_second = dtb__1066 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1066) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1065))) dtb__1063) sp) hint)) (fun q -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1067; Base_dPair.f_Base_dPair_dPair_second = dtb__1068 } -> (match dtb__1068 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1069; Base_dPair.f_Base_dPair_dPair_second = dtb__1070 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1065; Base_dPair.f_Base_dPair_dPair_second = dtb__1032 }, dtb__1067)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1069; Base_dPair.f_Base_dPair_dPair_second = dtb__1070 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1071; Base_dPair.f_Base_dPair_dPair_second = dtb__1072 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1072) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1071))) args) sp) hint)) (fun p -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1073; Base_dPair.f_Base_dPair_dPair_second = dtb__1074 } -> (match dtb__1074 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1075; Base_dPair.f_Base_dPair_dPair_second = dtb__1076 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1071; Base_dPair.f_Base_dPair_dPair_second = dtb__1032 }, dtb__1073)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1075; Base_dPair.f_Base_dPair_dPair_second = dtb__1076 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1077; Base_dPair.f_Base_dPair_dPair_second = dtb__1078 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1078) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1077))) args) sp) hint)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1079; Base_dPair.f_Base_dPair_dPair_second = dtb__1080 } -> (match dtb__1080 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1081; Base_dPair.f_Base_dPair_dPair_second = dtb__1082 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1077; Base_dPair.f_Base_dPair_dPair_second = dtb__1032 }, dtb__1079)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1081; Base_dPair.f_Base_dPair_dPair_second = dtb__1082 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1083; Base_dPair.f_Base_dPair_dPair_second = dtb__1084 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1084) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1083))) args) sp) hint)) (fun p -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1085; Base_dPair.f_Base_dPair_dPair_second = dtb__1086 } -> (match dtb__1086 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1087; Base_dPair.f_Base_dPair_dPair_second = dtb__1088 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1083; Base_dPair.f_Base_dPair_dPair_second = dtb__1032 }, dtb__1085)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1087; Base_dPair.f_Base_dPair_dPair_second = dtb__1088 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind)))) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = forced; Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__1089, dtb__1090) -> ((fun ec0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec0) sp) dtb__1030) dtb__1032) dtb__1033)) (fun argRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit ec0) dtb__1033) dtb__1089)) (fun a2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1033)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1091; Base_dPair.f_Base_dPair_dPair_second = dtb__1092 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1092) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1034) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1091))) dtb__1090) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun q -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1093; Base_dPair.f_Base_dPair_dPair_second = dtb__1094 } -> (match dtb__1094 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1095; Base_dPair.f_Base_dPair_dPair_second = dtb__1096 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1091; Base_dPair.f_Base_dPair_dPair_second = argRig }, dtb__1093)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1095; Base_dPair.f_Base_dPair_dPair_second = dtb__1096 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))))) ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1097) -> (match dtb__1097 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1098; Base_dPair.f_Base_dPair_dPair_second = dtb__1099 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint dtb__1098) ctx) dtb__1099) ec) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ec
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1100) -> dtb__1100
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
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = forced; Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__1101, dtb__1102) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1101)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))
# 1224 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel globals ctx ec dom clo args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1103; Base_dPair.f_Base_dPair_dPair_second = dtb__1104 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1104) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1104) dom)) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1103))) args) sp) hint)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1105; Base_dPair.f_Base_dPair_dPair_second = dtb__1106 } -> (match dtb__1106 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1107; Base_dPair.f_Base_dPair_dPair_second = dtb__1108 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1103; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, dtb__1105)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1107; Base_dPair.f_Base_dPair_dPair_second = dtb__1108 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))))
# 1238 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel globals ec ctx dom args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1109) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1110) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1111, dtb__1112) -> (match dtb__1112 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1109) dtb__1110) args) sp)) (fun ecProbe -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__1111) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ecProbe)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1113) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__1111) Base_dList.C_Base_dList_dList_Nil) dtb__1113) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1114) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__1114))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1115) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1109) dtb__1110) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1109) dtb__1110) args) sp)
)) dtb__1109)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1256 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel globals ec ctx argTy argKind args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ec))
  | Base_dList.C_Base_dList_dList_Cons (dtb__1116, dtb__1117) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1118) -> (match dtb__1118 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1119; Base_dPair.f_Base_dPair_dPair_second = dtb__1120 } -> (match dtb__1120 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1121; Base_dPair.f_Base_dPair_dPair_second = dtb__1122 } -> ((fun forced -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1122) ctx) argTy) argKind) dtb__1117) sp) else (if (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__1122) ctx) forced) argKind) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1122) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1123) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1123))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1124) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1122) ctx) argTy) argKind) dtb__1117) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1122) ctx) argTy) argKind) dtb__1117) sp)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1122) dtb__1121))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1125) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1116))
  | _ -> failwith "DT: impossible branch"
)))
# 1374 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1126) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1126) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1381 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel = (fun fuel globals ctx ec op args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1127, dtb__1128) -> (match dtb__1128 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1129, dtb__1130) -> (match dtb__1130 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1127) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1131; Base_dPair.f_Base_dPair_dPair_second = dtb__1132 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1132) dtb__1129) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1133; Base_dPair.f_Base_dPair_dPair_second = dtb__1134 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1131) dtb__1133); Base_dPair.f_Base_dPair_dPair_second = dtb__1134 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1127) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1135; Base_dPair.f_Base_dPair_dPair_second = dtb__1136 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1136) dtb__1129) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1137; Base_dPair.f_Base_dPair_dPair_second = dtb__1138 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1135) dtb__1137); Base_dPair.f_Base_dPair_dPair_second = dtb__1138 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy ec) expected) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1127) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1139; Base_dPair.f_Base_dPair_dPair_second = dtb__1140 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1140) dtb__1129) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1141; Base_dPair.f_Base_dPair_dPair_second = dtb__1142 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 op) dtb__1139) dtb__1141); Base_dPair.f_Base_dPair_dPair_second = dtb__1142 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args)))
# 1404 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1143) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1143) args) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1411 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel = (fun fuel globals ctx ec op args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1144, dtb__1145) -> (match dtb__1145 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1146, dtb__1147) -> (match dtb__1147 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1144)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1148; Base_dPair.f_Base_dPair_dPair_second = dtb__1149 } -> (match dtb__1149 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1150; Base_dPair.f_Base_dPair_dPair_second = dtb__1151 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1151) dtb__1146)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1152; Base_dPair.f_Base_dPair_dPair_second = dtb__1153 } -> (match dtb__1153 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1154; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1155) dtb__1150) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1155) dtb__1154) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1148) dtb__1152); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1155) dtb__1150) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1155) dtb__1154) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1148) dtb__1152); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1155) dtb__1150) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1155) dtb__1154) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 op) dtb__1148) dtb__1152); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1155) dtb__1150) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1155) dtb__1154) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__1146) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1156) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1146)) dtb__1156)) (fun bNat -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1148) bNat); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1148)) dtb__1152); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1155) dtb__1150) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1155) dtb__1154) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__1144) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1157) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1144)) dtb__1157)) (fun aNat -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) aNat) dtb__1152); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1148) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1152)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } }))))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args)))
# 1434 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1158) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1159) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1159))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1160) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr2 -> (match ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term.retry") (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1161) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1161))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1162) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1160))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1163) -> ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term.infer") (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1164) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1165) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))) dtb__1165) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsDefCheck "vuna.elab.term.core") (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexprFormName expr)) (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1506 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1166) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1166) expected)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1167) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1167))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__1166)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 1517 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__1168, dtb__1169, dtb__1170) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1169)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1171; Base_dPair.f_Base_dPair_dPair_second = dtb__1172 } -> (match dtb__1172 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1173; Base_dPair.f_Base_dPair_dPair_second = dtb__1174 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1174) dtb__1168) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1171))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1175, dtb__1176) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__1175) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats ec) ctx) expected) dtb__1175)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1177; Base_dPair.f_Base_dPair_dPair_second = dtb__1178 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__1178)) dtb__1177)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1178) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1175, dtb__1176)))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1179, dtb__1180, dtb__1181, dtb__1182) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel (fuel - 1)) globals) ctx) ec) dtb__1179) dtb__1180) dtb__1181) expected) dtb__1182)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1183, dtb__1184, dtb__1185) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1183) dtb__1184) expected) dtb__1185)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__1186, dtb__1187, dtb__1188, dtb__1189) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1186) dtb__1189)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1190; Base_dPair.f_Base_dPair_dPair_second = dtb__1191 } -> ((fun attempt -> (match attempt with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1192) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1192))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1193) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1191) dtb__1187) expected)) (fun pt -> (match pt with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1194; Base_dPair.f_Base_dPair_dPair_second = dtb__1195 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1195) dtb__1188) expected)) (fun pe -> (match pe with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1196; Base_dPair.f_Base_dPair_dPair_second = dtb__1197 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__1190, dtb__1194, dtb__1196)); Base_dPair.f_Base_dPair_dPair_second = dtb__1197 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__1198, dtb__1199, dtb__1200, dtb__1201, dtb__1202, dtb__1203) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1204, dtb__1205, dtb__1206) -> (match dtb__1204 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1207, dtb__1208) -> (if (dtb__1207 = "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1207 = "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__1207) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__1206) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstParam) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1207, dtb__1208))) dtb__1205) expected) dtb__1206))))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__1204) dtb__1205) expected) dtb__1206)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__1209, dtb__1210, dtb__1211) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (fuel - 1)) globals) ctx) ec) dtb__1209) dtb__1210) expected) dtb__1211)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__1212, dtb__1213) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1214, dtb__1215) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1216) -> (match dtb__1216 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1217, dtb__1218) -> (match dtb__1218 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1217 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__1212)); Base_dPair.f_Base_dPair_dPair_second = ec })) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1219) -> (match dtb__1219 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1220; Base_dPair.f_Base_dPair_dPair_second = dtb__1221 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1221) dtb__1220) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1213)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1222) -> (match dtb__1222 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1223; Base_dPair.f_Base_dPair_dPair_second = dtb__1224 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1224) dtb__1223) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1213))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1225) -> (match dtb__1225 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1226; Base_dPair.f_Base_dPair_dPair_second = dtb__1227 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1227) dtb__1226) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1213))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1228) -> (match dtb__1228 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1229; Base_dPair.f_Base_dPair_dPair_second = dtb__1230 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1230) dtb__1229) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1213))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__1231, dtb__1232) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1233, dtb__1234) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1235) -> (match dtb__1235 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1236, dtb__1237) -> (match dtb__1237 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1236 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__1231)); Base_dPair.f_Base_dPair_dPair_second = ec })) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1238) -> (match dtb__1238 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1239; Base_dPair.f_Base_dPair_dPair_second = dtb__1240 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1240) dtb__1239) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1232)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1241) -> (match dtb__1241 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1242; Base_dPair.f_Base_dPair_dPair_second = dtb__1243 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1243) dtb__1242) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1232))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1244) -> (match dtb__1244 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1245; Base_dPair.f_Base_dPair_dPair_second = dtb__1246 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1246) dtb__1245) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1232))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1247) -> (match dtb__1247 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1248; Base_dPair.f_Base_dPair_dPair_second = dtb__1249 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1249) dtb__1248) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1232))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__1250, dtb__1251) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1252, dtb__1253) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1254) -> (match dtb__1254 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1255, dtb__1256) -> (match dtb__1256 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult dtb__1251) dtb__1250)) (fun t -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = t; Base_dPair.f_Base_dPair_dPair_second = ec })))) else (if (dtb__1255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1257) -> (match dtb__1257 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1258; Base_dPair.f_Base_dPair_dPair_second = dtb__1259 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1259) dtb__1258) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1251))))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1260) -> (match dtb__1260 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1261; Base_dPair.f_Base_dPair_dPair_second = dtb__1262 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1262) dtb__1261) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1251))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1263) -> (match dtb__1263 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1264; Base_dPair.f_Base_dPair_dPair_second = dtb__1265 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1265) dtb__1264) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1251))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1266) -> (match dtb__1266 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1267; Base_dPair.f_Base_dPair_dPair_second = dtb__1268 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1268) dtb__1267) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1251))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1269, dtb__1270) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__1269) then ((fun pmeta -> (match pmeta with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1271; Base_dPair.f_Base_dPair_dPair_second = dtb__1272 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1271; Base_dPair.f_Base_dPair_dPair_second = dtb__1272 }))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewHoleMeta ctx) ec) dtb__1270) expected) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf dtb__1269))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1269) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1270) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1269)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1269))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1270))) Base_dList.C_Base_dList_dList_Nil) expected) dtb__1270))) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1269, dtb__1270))) Base_dList.C_Base_dList_dList_Nil) expected) dtb__1270)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) expr)))
# 1606 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel globals ctx ec binds body rec_u expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 1692 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 1699 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1273, dtb__1274) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1273) dtb__1274) mc5) mc6) mc7) mc8))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 1706 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel globals ctx ec bind rest body rec_u expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match (Base_dPair.v_Base_dPair_dfirstOf bind) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1275, dtb__1276) -> ((fun value -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1277; Base_dPair.f_Base_dPair_dPair_second = dtb__1278 } -> (match dtb__1278 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1279; Base_dPair.f_Base_dPair_dPair_second = dtb__1280 } -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx2) dtb__1280) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1281; Base_dPair.f_Base_dPair_dPair_second = dtb__1282 } -> ((fun bodyTerm2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__1275, rig, bodyTerm2)), dtb__1277, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__1282 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1282) ctx) dtb__1279) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1281) else dtb__1281))
  | _ -> failwith "DT: impossible branch"
)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1275) dtb__1279) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1279))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bind))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1283) -> ((fun value -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1284; Base_dPair.f_Base_dPair_dPair_second = dtb__1285 } -> (match dtb__1285 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1286; Base_dPair.f_Base_dPair_dPair_second = dtb__1287 } -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) dtb__1287) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1288; Base_dPair.f_Base_dPair_dPair_second = dtb__1289 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1288))), dtb__1284, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__1289 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1286))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bind))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Base_dPair.v_Base_dPair_dsecondOf bind), (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf bind); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (rest, body, rec_u, sp)) }, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (Base_dPair.v_Base_dPair_dfirstOf bind))))) expected)
)))
# 1749 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1290, dtb__1291) -> (match dtb__1290 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1292; Base_dPair.f_Base_dPair_dPair_second = dtb__1293 } -> (match dtb__1292 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1294, dtb__1295) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1294) dtb__1293) dtb__1291) body) rec_u) sp)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1296) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1293) dtb__1291) body) rec_u) sp)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1293, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1292; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1291, body, rec_u, sp)) }, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__1292))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds)))
# 1761 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel globals ctx ec name value rest body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1297; Base_dPair.f_Base_dPair_dPair_second = dtb__1298 } -> (match dtb__1298 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1299; Base_dPair.f_Base_dPair_dPair_second = dtb__1300 } -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx2) dtb__1300) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1301; Base_dPair.f_Base_dPair_dPair_second = dtb__1302 } -> (match dtb__1302 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1303; Base_dPair.f_Base_dPair_dPair_second = dtb__1304 } -> ((fun bodyTerm2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, bodyTerm2)), dtb__1297, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1303; Base_dPair.f_Base_dPair_dPair_second = dtb__1304 } }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1304) ctx) dtb__1299) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1301) else dtb__1301))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__1299) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1299))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
# 1777 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel globals ctx ec value rest body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1305; Base_dPair.f_Base_dPair_dPair_second = dtb__1306 } -> (match dtb__1306 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1307; Base_dPair.f_Base_dPair_dPair_second = dtb__1308 } -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) dtb__1308) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1309; Base_dPair.f_Base_dPair_dPair_second = dtb__1310 } -> (match dtb__1310 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1311; Base_dPair.f_Base_dPair_dPair_second = dtb__1312 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1309))), dtb__1305, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1311; Base_dPair.f_Base_dPair_dPair_second = dtb__1312 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1307))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
# 1839 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1313) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1314) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1315) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1316, dtb__1317, dtb__1318) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1316) dtb__1317) dtb__1318) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)); Base_dPair.f_Base_dPair_dPair_second = expected })))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2011 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1319) -> (match dtb__1319 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1320; Base_dPair.f_Base_dPair_dPair_second = dtb__1321 } -> (match dtb__1321 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1322; Base_dPair.f_Base_dPair_dPair_second = dtb__1323 } -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1323) expected) dtb__1322) dtb__1320) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1324) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1324; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1323) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1323) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1322) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1325) -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift ctx) globals) dtb__1323) expected) dtb__1322) dtb__1320) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1326) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__1326); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) (Base_dPair.v_Base_dPair_dsecondOf dtb__1326)) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel dtb__1323) expected) dtb__1322) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1327) -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels dtb__1327) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (("actual: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1322))))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (("expected: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected))))) d))))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnhandledEffects ((v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__1327)))) (v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__1327)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) dtb__1325)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1328) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1320; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1328) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1329) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1329))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected))))
# 2028 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1330, dtb__1331) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun forced -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1332, dtb__1333) -> (match dtb__1333 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun lvl -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt mc7) mc2) mc3) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1334; Base_dPair.f_Base_dPair_dPair_second = dtb__1335 } -> ((fun domVal -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt mc7) mc2) dtb__1335) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1336; Base_dPair.f_Base_dPair_dPair_second = dtb__1337 } -> ((fun piVal -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__1337)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__1337)) lvl) dtb__1332) Base_dList.C_Base_dList_dList_Nil) piVal) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1338) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) mc2) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__1337) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__1338))) (Base_dList.C_Base_dList_dList_Cons (dtb__1330, dtb__1331))) mc5) piVal) mc7)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1339) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, domVal, { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__1336 })))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc2) dtb__1334))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1340, dtb__1341, dtb__1342, dtb__1343, dtb__1344) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain mc3) mc7) dtb__1330) dtb__1342) dtb__1343)) (fun lamRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1331) mc5) expected2) mc7)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1345; Base_dPair.f_Base_dPair_dPair_second = dtb__1346 } -> ((fun inner2 -> ((fun binderName -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__1346 }))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear mc3) mc2) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear mc3) ctx2) dtb__1345) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName mc7) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__1330) else dtb__1330) else dtb__1330))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1346) mc2) dtb__1343) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1345) else dtb__1345))
  | _ -> failwith "DT: impossible branch"
)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1344) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1330) dtb__1343) mc2))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__1340) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)) forced)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2096 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1347, dtb__1348, dtb__1349) -> (match dtb__1347 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1350, dtb__1351) -> (if (if (dtb__1350 = "->") then true else (dtb__1350 = "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1350) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1352) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1350) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1350) dtb__1348) dtb__1351) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1353) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1354) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1354))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1355, dtb__1356) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1355) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1357) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__1355) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1358) -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1358))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1359) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm ec) dtb__1355); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1359; Base_dPair.f_Base_dPair_dPair_second = ec } }))
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
# 2117 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun p -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1360; Base_dPair.f_Base_dPair_dPair_second = dtb__1361 } -> (match dtb__1361 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1362; Base_dPair.f_Base_dPair_dPair_second = dtb__1363 } -> ((fun forced -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1364) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1360; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1364; Base_dPair.f_Base_dPair_dPair_second = dtb__1363 } }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedType (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1362)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1362))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1363) dtb__1362))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 2132 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1365, dtb__1366) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1365) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1366) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1365)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1365))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1366))) args) expected) sp))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1365) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1367) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor ec) dtb__1365) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1368) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1368) args) expected) dtb__1366)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1365) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1365) args) expected) dtb__1366) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1365) args) expected) sp) dtb__1366))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1365) args) expected) sp) dtb__1366))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 2157 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel = (fun fuel globals ctx ec fn name args expected sp vsp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1369) -> (match dtb__1369 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__1370) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__1371) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) name))))
# 2167 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1372; Base_dPair.f_Base_dPair_dPair_second = dtb__1373 } -> (match dtb__1373 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1374; Base_dPair.f_Base_dPair_dPair_second = dtb__1375 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1375) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1374)))) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1372; Base_dPair.f_Base_dPair_dPair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 2175 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1376) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1376)) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1377; Base_dPair.f_Base_dPair_dPair_second = dtb__1378 } -> (match dtb__1378 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1379; Base_dPair.f_Base_dPair_dPair_second = dtb__1380 } -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1380) dtb__1379)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1381) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm dtb__1380) name) dtb__1377); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1381; Base_dPair.f_Base_dPair_dPair_second = dtb__1380 } }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
# 2220 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disEqMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1382, dtb__1383) -> (match dtb__1383 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1384, dtb__1385) -> (match dtb__1385 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1382)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1386; Base_dPair.f_Base_dPair_dPair_second = dtb__1387 } -> (match dtb__1387 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1388; Base_dPair.f_Base_dPair_dPair_second = dtb__1389 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1389) dtb__1384)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1390; Base_dPair.f_Base_dPair_dPair_second = dtb__1391 } -> (match dtb__1391 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1392; Base_dPair.f_Base_dPair_dPair_second = dtb__1393 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1393) dtb__1388) dtb__1392) dtb__1386) dtb__1390) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1394) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1394))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1394))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__1394))) dtb__1393)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1393) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1388) dtb__1392)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__1386) dtb__1390) sp) dtb__1388) ec3)))
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
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
# 2237 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disCmpMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1395, dtb__1396) -> (match dtb__1396 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1397, dtb__1398) -> (match dtb__1398 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1395)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1399; Base_dPair.f_Base_dPair_dPair_second = dtb__1400 } -> (match dtb__1400 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1401; Base_dPair.f_Base_dPair_dPair_second = dtb__1402 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1402) dtb__1397)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1403; Base_dPair.f_Base_dPair_dPair_second = dtb__1404 } -> (match dtb__1404 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1405; Base_dPair.f_Base_dPair_dPair_second = dtb__1406 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1406) dtb__1401) dtb__1405) dtb__1399) dtb__1403) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1407) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1407))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1407))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__1407))) dtb__1406)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1406) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1401) dtb__1405)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__1399) dtb__1403) sp) dtb__1401) ec3)))
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
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
# 2256 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpMethodName) then (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1408) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1408))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1409) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1409))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r3 -> (match r3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1410) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1410))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 2277 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1411, dtb__1412) -> (match dtb__1412 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1411)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1413; Base_dPair.f_Base_dPair_dPair_second = dtb__1414 } -> (match dtb__1414 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1415; Base_dPair.f_Base_dPair_dPair_second = dtb__1416 } -> ((fun tyv -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue tyv) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1413; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = tyv; Base_dPair.f_Base_dPair_dPair_second = dtb__1416 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1416) tyv) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1416) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm dtb__1413); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1416 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1416) tyv) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1416) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1413)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1416 } })))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1416) tyv) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm dtb__1413); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1416 } })))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1416) dtb__1415))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args)))
# 2315 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1417, dtb__1418) -> (match dtb__1418 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1419, dtb__1420) -> (match dtb__1420 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1417) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1421; Base_dPair.f_Base_dPair_dPair_second = dtb__1422 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1422) dtb__1419) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1423; Base_dPair.f_Base_dPair_dPair_second = dtb__1424 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__1421) dtb__1423); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1424 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)) args) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
# 2326 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1425, dtb__1426) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel (fuel - 1)) globals) ctx) ec) dtb__1425) args) expected) sp)) (fun arith -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected ec) dtb__1425) expected) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1425) args) sp)) (fun mspec -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1427) -> (match dtb__1427 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1428; Base_dPair.f_Base_dPair_dPair_second = dtb__1429 } -> (match dtb__1429 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1430; Base_dPair.f_Base_dPair_dPair_second = dtb__1431 } -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1431) expected) dtb__1430) dtb__1428) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1432) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1432; Base_dPair.f_Base_dPair_dPair_second = dtb__1431 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1431) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1430)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1428; Base_dPair.f_Base_dPair_dPair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mspec))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1433) -> (match dtb__1433 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1434; Base_dPair.f_Base_dPair_dPair_second = dtb__1435 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1434; Base_dPair.f_Base_dPair_dPair_second = dtb__1435 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) arith)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
)))
# 2528 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1436) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1436))) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1437; Base_dPair.f_Base_dPair_dPair_second = dtb__1438 } -> (match dtb__1438 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1439; Base_dPair.f_Base_dPair_dPair_second = dtb__1440 } -> ((fun ctorTerm -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1440) expected) dtb__1439) ctorTerm) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1441) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1441; Base_dPair.f_Base_dPair_dPair_second = dtb__1440 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1440) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1439) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1442) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1442)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1437); Base_dPair.f_Base_dPair_dPair_second = dtb__1442 }))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1443) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__1443)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__1443))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1440)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1437))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1444) -> (match dtb__1444 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1445; Base_dPair.f_Base_dPair_dPair_second = dtb__1446 } -> (match dtb__1446 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1447; Base_dPair.f_Base_dPair_dPair_second = dtb__1448 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__1448) dtb__1447) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1449; Base_dPair.f_Base_dPair_dPair_second = dtb__1450 } -> (match dtb__1450 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1451; Base_dPair.f_Base_dPair_dPair_second = dtb__1452 } -> ((fun allArgs -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1452) expected) dtb__1451) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1452)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1453) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1453; Base_dPair.f_Base_dPair_dPair_second = dtb__1452 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1452) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1451) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1454) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1454)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs); Base_dPair.f_Base_dPair_dPair_second = dtb__1454 }))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1455) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__1455)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__1455))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend dtb__1445) dtb__1449))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs ec) ctx) dtb__1436) expected))
  | _ -> failwith "DT: impossible branch"
)))
# 2761 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain = (fun fuel globals ctx ec plan steps last -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1456, dtb__1457) -> (match dtb__1456 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__1458, dtb__1459, dtb__1460) -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt dtb__1460) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1461; Base_dPair.f_Base_dPair_dPair_second = dtb__1462 } -> ((fun aVal -> ((fun mArgTy -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1462) dtb__1460) "_") (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE) mArgTy)) (fun argRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1462) dtb__1459) mArgTy)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1463; Base_dPair.f_Base_dPair_dPair_second = dtb__1464 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1464) dtb__1460) dtb__1458) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig) aVal)) (fun lamRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx2) dtb__1464) plan) dtb__1457) last)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1465; Base_dPair.f_Base_dPair_dPair_second = dtb__1466 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm dtb__1464) dtb__1466) ctx) dtb__1460) plan) dtb__1458) aVal) dtb__1463) argRig) lamRig) dtb__1465); Base_dPair.f_Base_dPair_dPair_second = dtb__1466 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1458) aVal) ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1461))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) last) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal))
  | _ -> failwith "DT: impossible branch"
)) steps)))
# 2783 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel = (fun fuel globals ctx ec chain expected -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1467) -> (match dtb__1467 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1468; Base_dPair.f_Base_dPair_dPair_second = dtb__1469 } -> (match dtb__1469 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1470; Base_dPair.f_Base_dPair_dPair_second = dtb__1471 } -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1472; Base_dPair.f_Base_dPair_dPair_second = dtb__1473 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) dtb__1473) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1474; Base_dPair.f_Base_dPair_dPair_second = dtb__1475 } -> ((fun mVal -> ((fun aVal -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1475) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1468) dtb__1470) dtb__1471) mVal) aVal)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1476) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1476).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1476) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1477; Base_dPair.f_Base_dPair_dPair_second = dtb__1478 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1478) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (dtb__1476).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) (dtb__1476).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal))) (fun ec4 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1477; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1474))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1472))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1479) -> (match dtb__1479 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1480; Base_dPair.f_Base_dPair_dPair_second = dtb__1481 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1468) dtb__1470) dtb__1471) dtb__1480) dtb__1481)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1482) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1482).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1482) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1483; Base_dPair.f_Base_dPair_dPair_second = dtb__1484 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1483; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1484) }))))
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical))))
# 2812 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel = (fun fuel globals ctx ec chain -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1485) -> (match dtb__1485 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1486; Base_dPair.f_Base_dPair_dPair_second = dtb__1487 } -> (match dtb__1487 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1488; Base_dPair.f_Base_dPair_dPair_second = dtb__1489 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1490; Base_dPair.f_Base_dPair_dPair_second = dtb__1491 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) dtb__1491) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1492; Base_dPair.f_Base_dPair_dPair_second = dtb__1493 } -> ((fun mVal -> ((fun aVal -> ((fun resultTy -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1493) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1486) dtb__1488) dtb__1489) mVal) aVal)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1494) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1494).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1494) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1495; Base_dPair.f_Base_dPair_dPair_second = dtb__1496 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1495; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = resultTy; Base_dPair.f_Base_dPair_dPair_second = dtb__1496 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mVal) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1492))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1490))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical))))

# 2192 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind = (fun globals ctx ec expr expected sp -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1497) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel 256) globals) ctx) ec) expr))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p)) }))))
  | _ -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1498, dtb__1499, dtb__1500) -> (match dtb__1498 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1501, dtb__1502) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1501) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1501) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1501))) dtb__1501)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1503) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel 256) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1503)) dtb__1499) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1504; Base_dPair.f_Base_dPair_dPair_second = dtb__1505 } -> (match dtb__1505 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1506; Base_dPair.f_Base_dPair_dPair_second = dtb__1507 } -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1507) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1506) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1508) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm dtb__1508) dtb__1501) dtb__1504); Base_dPair.f_Base_dPair_dPair_second = dtb__1508 }))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__1509) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcTypeMismatch sp) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1506))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1510, dtb__1511) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1510) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1510) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1510))) dtb__1510)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1512) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp)) ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1512)))) (fun ec1 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm ec1) dtb__1510); Base_dPair.f_Base_dPair_dPair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
)) expr)
))
