open Vuna_runtime
type t_PerfFamily = C_PerfFamily_PerfFamily of (string) * (string) * (string)
and t_FieldAccessPlan = { f_FieldAccessPlan_planData : Elab_dTypes.t_DtData; f_FieldAccessPlan_planCtor : Elab_dTypes.t_DtCtor; f_FieldAccessPlan_planIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_FieldAccessPlan_planRecord : string; f_FieldAccessPlan_planField : int; f_FieldAccessPlan_planFieldCount : int; f_FieldAccessPlan_planType : Core_dTerm.t_Value }
and t_UpdateAccessPlan = { f_UpdateAccessPlan_upData : Elab_dTypes.t_DtData; f_UpdateAccessPlan_upCtor : Elab_dTypes.t_DtCtor; f_UpdateAccessPlan_upIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_UpdateAccessPlan_upRecord : string; f_UpdateAccessPlan_upFieldCount : int; f_UpdateAccessPlan_upFieldIndices : int B_dData_dList.t_List; f_UpdateAccessPlan_upBodyArgs : Frontend_dRast.t_Expr B_dData_dList.t_List }
and t_DoChainStep = C_DoChainStep_DoChainStep of (string) * (Frontend_dRast.t_Expr) * (Base_dSource.t_Span) * (Base_dSource.t_Span)
and t_DoChain = { f_DoChain_doChainCanonical : string; f_DoChain_doChainSteps : t_DoChainStep B_dData_dList.t_List; f_DoChain_doChainLast : Frontend_dRast.t_Expr; f_DoChain_doChainSpan : Base_dSource.t_Span }
and t_DoBindShape = C_DoBindShape_DoBindShape of (Core_dTerm.t_Rig) * (Core_dTerm.t_Rig) * (Core_dTerm.t_Rig)
and t_DoPlan = { f_DoPlan_planBind : string; f_DoPlan_planHead : Core_dTerm.t_Term; f_DoPlan_planMTerm : Core_dTerm.t_Term; f_DoPlan_planMVal : Core_dTerm.t_Value; f_DoPlan_planAVal : Core_dTerm.t_Value; f_DoPlan_planDictTerm : Core_dTerm.t_Term; f_DoPlan_planRigE : Core_dTerm.t_Rig; f_DoPlan_planRigL : Core_dTerm.t_Rig; f_DoPlan_planInnerRig : Core_dTerm.t_Rig; f_DoPlan_planEc : Elab_dTypes.t_Ec }

# 44 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_branchBinderOpaque = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (i : int) -> (let nd_uscrut3 = ((Elab_dMeta.v_ctxItemAt i) (ctx).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = dtb__2 } -> (let v = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (((Core_dTerm.v_shift 0) (i + 1)) dtb__2)) in (let r = (((Elab_dMeta.v_isOpaqueRuntimeTyIn ec) ctx) v) in r))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 36 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_opaqueBranchIndicesGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if (((v_branchBinderOpaque mc0) mc1) ((mc2 - 1) - mc4)) then (B_dData_dList.C_List__x58__x58_ (((mc2 - 1) - mc4), (((((v_opaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))) else (((((v_opaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opaqueBranchIndices = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (n : int) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_opaqueBranchIndicesGo ec) ctx) n) tele) 0))

# 170 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_needsMatrixCase = (fun (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (Elab_dCase.v_anyNestedPat alts) then true else (B_dData_dList.v_hasDupNames (Elab_dCase.v_altNames alts))))

# 354 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitCaseAlts = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> (match dtb__7 with
  | Frontend_dRast.C_Pat_PInt (dtb__9, dtb__10) -> (v_natLitCaseAlts dtb__6)
  | Frontend_dRast.C_Pat_PVar (dtb__11, dtb__12) -> (v_natLitCaseAlts dtb__6)
  | Frontend_dRast.C_Pat_PWild (dtb__13) -> (v_natLitCaseAlts dtb__6)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 493 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfShortOf = (fun (last : string) -> (if ((B_dData_dString.v_endsWith "Op") last) then (let n = (bi_strLength last) in (if (n > 2) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring 0) (B_dData_dNat.v_fromInt (n - 2))) last))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))

# 502 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfCanonical = (fun (canon : string) -> (match (v_perfShortOf (Base_dSource.v_lastSeg canon)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (B_dData_dMaybe.C_Maybe_Just ((C_PerfFamily_PerfFamily (canon, (Base_dSource.v_prefixOfName canon), dtb__14))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__15) -> (match dtb__15 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__16, dtb__17) -> (v_perfFamilyOfCanonical dtb__16)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 517 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__18, dtb__19, dtb__20) -> (match dtb__18 with
  | Frontend_dRast.C_Expr_EVar (dtb__21, dtb__22) -> (match dtb__19 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match dtb__24 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isPerformSyntax (Frontend_dRast_dName.v_rnameKey dtb__21)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__20 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 523 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_instArgOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Frontend_dRast.C_Expr_EVar (dtb__28, dtb__29) -> (match dtb__26 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__28)) then (B_dData_dMaybe.C_Maybe_Just (dtb__30)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 529 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__32, dtb__33, dtb__34) -> (match dtb__32 with
  | Frontend_dRast.C_Expr_EVar (dtb__35, dtb__36) -> (match dtb__33 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (match dtb__38 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (if (Frontend_dReserved.v_isAppAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__35)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__37; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__39; B_dData_dPair.f_Pair_second = dtb__40 } })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 535 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtCallExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Frontend_dRast.C_Expr_EVar (dtb__44, dtb__45) -> (match dtb__42 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (dtb__46, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (Frontend_dReserved.v_instArgSyntax)), dtb__43)), (B_dData_dList.C_List__x58__x58_ (dtb__48, B_dData_dList.C_List_Nil)), dtb__43)), dtb__49)), dtb__43))))
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
))

# 563 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__50, dtb__51, dtb__52) -> (match dtb__50 with
  | Frontend_dRast.C_Expr_EVar (dtb__53, dtb__54) -> (match dtb__51 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__58 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isHandleSyntax (Frontend_dRast_dName.v_rnameKey dtb__53)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__59 } })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 579 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleFamilyOfCtor = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_ctorFamilyNameOf ec) cname) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (Base_dDiag.C_Check_OkC (dtb__61))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 569 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamily = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (if (Frontend_dReserved.v_isOverCtorName cname) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) sp) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort cname)) (Frontend_dReserved.v_overCtorTargets cname))) (fun (canon : string) -> (((v_handleFamilyOfCtor ec) canon) sp))) else (((v_handleFamilyOfCtor ec) cname) sp)))

# 586 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilyOfPat = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Pat) -> (match mc1 with
  | Frontend_dRast.C_Pat_PCon (dtb__62, dtb__63, dtb__64) -> (((v_handleClauseFamily mc0) (Frontend_dRast_dName.v_rnameKey dtb__62)) dtb__64)
  | _ -> (Base_dDiag.v_icInternal "handle mirror case pattern is not a constructor")
))

# 591 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleCheckFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__67) with
  | Base_dDiag.C_Check_ErrC (dtb__69) -> (Base_dDiag.C_Check_ErrC (dtb__69))
  | Base_dDiag.C_Check_OkC (dtb__70) -> (if (dtb__70 = mc1) then (((v_handleCheckFamilies mc0) mc1) dtb__66) else ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dRast.v_patSpan dtb__67)) (Base_dDiagnostics_dTc.C_TcErr_HandleClauseFamilyMismatch (mc1, dtb__70))) mc1) dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 603 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | { B_dData_dPair.f_Pair_first = dtb__73; B_dData_dPair.f_Pair_second = dtb__74 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__73) with
  | Base_dDiag.C_Check_ErrC (dtb__75) -> (Base_dDiag.C_Check_ErrC (dtb__75))
  | Base_dDiag.C_Check_OkC (dtb__76) -> (((v_handleCheckFamilies mc0) dtb__76) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isUniverseTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__77) -> true
  | _ -> false
))

# 621 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_countOpArrows = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__78) -> (B_dData_dMaybe.C_Maybe_Just (0))
  | Core_dTerm.C_Term_TPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> (if dtb__80 then (v_countOpArrows dtb__83) else (if (v_isUniverseTerm dtb__82) then (match (v_countOpArrows dtb__83) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__84 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 615 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArity = (fun (kind : Core_dTerm.t_Term) -> (match (v_countOpArrows kind) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> (if (dtb__85 >= 1) then (B_dData_dMaybe.C_Maybe_Just ((dtb__85 - 1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 640 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleHoleArgs = (fun (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), ((v_handleHoleArgs (k - 1)) sp)))))

# 645 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)) else (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)), ((v_handleHoleArgs k) sp), sp))))

# 653 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigBinder = "@vuna@handle@sig"

# 658 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Base.Effect.Core.sigFn"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleSigBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EApp ((((v_handleOpArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (v_handleSigBinder)), sp)), B_dData_dList.C_List_Nil)), sp)), sp)), B_dData_dList.C_List_Nil)), sp)))

# 677 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) -> (match ((Elab_dMeta.v_dtDataLookup canon) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__86)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Elab_dMeta.v_globalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 684 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleDefaultRetBinder = "@vuna@handle@ret"

# 688 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleRetArg = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__87, dtb__88) -> (if (Frontend_dReserved.v_isHandleNoRetSyntax (Frontend_dRast_dName.v_rnameKey dtb__87)) then (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleDefaultRetBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal (v_handleDefaultRetBinder)), dtb__88)), dtb__88)) else (Frontend_dRast.C_Expr_EVar (dtb__87, dtb__88)))
  | _ -> mc0
))

# 667 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCall = (fun (headMode : bool) (nameArg : Frontend_dRast.t_Expr) (canon : string) (k : int) (comp : Frontend_dRast.t_Expr) (ret : Frontend_dRast.t_Expr) (opH : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let fnName = (if headMode then "Base.Effect.Core.handleWithAt" else "Base.Effect.Core.handleWith") in (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName fnName), sp)), (B_dData_dList.C_List__x58__x58_ (nameArg, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (canon, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ (comp, (B_dData_dList.C_List__x58__x58_ ((v_handleRetArg ret), (B_dData_dList.C_List__x58__x58_ (opH, B_dData_dList.C_List_Nil)))))))))))), sp))))

# 699 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opFamilyArityOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) (sp : Base_dSource.t_Span) -> (match (((v_handleOpKind globals) ec) canon) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> (match (v_handleOpArity dtb__89) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__90) -> (Base_dDiag.C_Check_OkC (dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (opTy : Core_dTerm.t_Value) (op : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let nd_uscrut5 = ((v_perfFamilyOfValue ec) opTy) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (match dtb__91 with
  | C_PerfFamily_PerfFamily (dtb__92, dtb__93, dtb__94) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__92) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Base.Effect.Core.performCore"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (dtb__92, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg dtb__92) k) sp), (B_dData_dList.C_List__x58__x58_ (op, B_dData_dList.C_List_Nil)))))))), sp))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_EffResFamilyMissing (((Core_dEval.v_showValueAt 6) opTy)))) ((Core_dEval.v_showValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)))

# 710 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprWith = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) (headMode : bool) (nameArg : Frontend_dRast.t_Expr) -> (let nd_uscrut6 = (v_handleOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (match dtb__95 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> (let nd_uscrut17 = dtb__99 in (match nd_uscrut17 with
  | Frontend_dRast.C_Expr_ELam (dtb__100, dtb__101, dtb__102) -> (match dtb__100 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (match dtb__104 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__101 with
  | Frontend_dRast.C_Expr_ECase (dtb__107, dtb__108, dtb__109) -> ((Base_dCommon.v_bind ((v_handleClauseFamilies ec) dtb__108)) (fun (fam : string) -> (let nd_uscrut31 = (v_perfFamilyOfCanonical fam) in (match nd_uscrut31 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> (match dtb__110 with
  | C_PerfFamily_PerfFamily (dtb__111, dtb__112, dtb__113) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__111) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC (((((((((v_handleCall headMode) nameArg) dtb__111) k) dtb__96) dtb__98) dtb__99) sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (fam))) fam)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.v_icInternal "malformed handle marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed handle marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed handle marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed handle marker")
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "handle marker expected")
  | _ -> failwith "DT: impossible branch"
)))

# 726 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) false) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 731 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAt = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))))

# 736 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAtHole = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 866 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordTypeOf = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) ty) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__114) -> (match dtb__114 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__115, dtb__116) -> (match ((Elab_dMeta.v_dtDataLookup dtb__115) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__117) then (let nd_uscrut8 = (Elab_dTypes.v_dtDataCtors dtb__117) in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__117; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__118; B_dData_dPair.f_Pair_second = dtb__116 } }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 882 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldVarName = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 890 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldPatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ((v_recordFieldVarName i), sp)), (((v_recordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 886 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordFieldPatsFrom 0) n) sp))

# 901 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldLookupGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (if ((dtb__120).Elab_dTypes.f_DtFieldMeta_dtFieldName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__120).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (dtb__120).Elab_dTypes.f_DtFieldMeta_dtFieldType } })) else (((v_recordFieldLookupGo mc0) dtb__121) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldLookup = (fun (fname : string) (dd : Elab_dTypes.t_DtData) -> (((v_recordFieldLookupGo fname) (Elab_dTypes.v_dtDataFields dd)) (B_dData_dList.v_length (Elab_dTypes.v_dtDataFields dd))))

# 910 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateUnknownGo = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (match dtb__122 with
  | { B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = dtb__125 } -> (match ((v_recordFieldLookup dtb__124) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__124))
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> ((v_recordUpdateUnknownGo mc0) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 918 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateUnknown = (fun (dd : Elab_dTypes.t_DtData) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_recordUpdateUnknownGo dd) fields))

# 922 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateValueFor = (fun (mc0 : string) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (match dtb__127 with
  | { B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 } -> (if (dtb__129 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__130)) else ((v_recordUpdateValueFor mc0) dtb__128))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 928 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateArg = (fun (i : int) (f : Elab_dTypes.t_DtFieldMeta) (provided : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match ((v_recordUpdateValueFor (f).Elab_dTypes.f_DtFieldMeta_dtFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> dtb__131
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (v_recordFieldVarName i)), sp))
  | _ -> failwith "DT: impossible branch"
))

# 935 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (B_dData_dList.C_List__x58__x58_ (((((v_recordUpdateArg mc0) dtb__132) mc2) mc3), ((((v_recordUpdateArgs (mc0 + 1)) dtb__133) mc2) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 941 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdatedIndices = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (match dtb__134 with
  | { B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = dtb__137 } -> (let nd_uscrut9 = ((v_recordFieldLookup dtb__136) mc0) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_recordUpdatedIndices mc0) dtb__135)
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (match dtb__138 with
  | { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 } -> (B_dData_dList.C_List__x58__x58_ (dtb__139, ((v_recordUpdatedIndices mc0) dtb__135)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 973 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> (match dtb__141 with
  | { B_dData_dPair.f_Pair_first = dtb__142; B_dData_dPair.f_Pair_second = dtb__143 } -> (match dtb__143 with
  | { B_dData_dPair.f_Pair_first = dtb__144; B_dData_dPair.f_Pair_second = dtb__145 } -> (let nd_uscrut15 = ((v_recordFieldLookup fname) dtb__142) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (match dtb__146 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (Base_dDiag.C_Check_OkC ({ f_FieldAccessPlan_planData = dtb__142; f_FieldAccessPlan_planCtor = dtb__144; f_FieldAccessPlan_planIdxs = dtb__145; f_FieldAccessPlan_planRecord = (dtb__142).Elab_dTypes.f_DtData_dtDataName; f_FieldAccessPlan_planField = dtb__147; f_FieldAccessPlan_planFieldCount = dtb__149; f_FieldAccessPlan_planType = ((Core_dEval.v_eval (B_dData_dList.v_reverse dtb__145)) dtb__150) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) ("record type has no field " ^ fname))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve record type for field "; fname; "; add a type signature"]))
  | _ -> failwith "DT: impossible branch"
)))

# 984 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdatePlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (match dtb__151 with
  | { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = dtb__153 } -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 } -> (match ((v_recordUpdateUnknown dtb__152) fields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> ((Elab_dTypes.v_errAt sp) ("record type has no field " ^ dtb__156))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let fs = (Elab_dTypes.v_dtDataFields dtb__152) in (let bodyArgs = ((((v_recordUpdateArgs 0) fs) fields) sp) in (Base_dDiag.C_Check_OkC ({ f_UpdateAccessPlan_upData = dtb__152; f_UpdateAccessPlan_upCtor = dtb__154; f_UpdateAccessPlan_upIdxs = dtb__155; f_UpdateAccessPlan_upRecord = (dtb__152).Elab_dTypes.f_DtData_dtDataName; f_UpdateAccessPlan_upFieldCount = (B_dData_dList.v_length fs); f_UpdateAccessPlan_upFieldIndices = ((v_recordUpdatedIndices dtb__152) fields); f_UpdateAccessPlan_upBodyArgs = bodyArgs }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)))

# 999 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldDictName = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_hasFieldTraitName)

# 1009 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctxHasFieldDictGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : string) (mc5 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (match dtb__157 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (let nd_uscrut13 = ((Elab_dTypes.v_forceVal mc3) (((Elab_dTypes.v_varTypeValue mc2) mc1) dtb__160)) in (match nd_uscrut13 with
  | Core_dTerm.C_Value_VNeutral (dtb__161) -> (match dtb__161 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__162, dtb__163) -> (if (dtb__162 = v_hasFieldDictName) then (let nd_uscrut17 = dtb__163 in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (match dtb__165 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (match dtb__167 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (let nd_uscrut27 = ((Elab_dTypes.v_forceVal mc3) dtb__164) in (match nd_uscrut27 with
  | Core_dTerm.C_Value_VNeutral (dtb__170) -> (match dtb__170 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__171, dtb__172) -> (match dtb__172 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | Core_dTerm.C_Value_VStr (dtb__175) -> (if (dtb__175 = mc4) then (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc2)) dtb__166) mc5) with
  | Base_dDiag.C_Check_OkC (dtb__176) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__159, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__168; B_dData_dPair.f_Pair_second = dtb__176 } }))
  | Base_dDiag.C_Check_ErrC (dtb__177) -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) else ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctxHasFieldDict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fname : string) (baseTy : Core_dTerm.t_Value) -> ((((((v_ctxHasFieldDictGo (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ctx) ec) fname) baseTy))

# 1037 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldAccessFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (baseTerm : Core_dTerm.t_Term) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut8 = ((Elab_dTypes.v_forceVal ec) baseTy) in (match nd_uscrut8 with
  | Core_dTerm.C_Value_VNeutral (dtb__178) -> (match dtb__178 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__179, dtb__180) -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["type "; dtb__179; " is not a record"]))
  | _ -> (let nd_uscrut10 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__181) -> (match dtb__181 with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> (match dtb__183 with
  | { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__184), Core_dTerm.C_Rig_Rig0)), dtb__182, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut9 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> (match dtb__186 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> (match dtb__188 with
  | { B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = dtb__190 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__189), Core_dTerm.C_Rig_Rig0)), dtb__187, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = dtb__190 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)))

# 1304 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_listLitElems = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__191, dtb__192, dtb__193) -> (match dtb__191 with
  | Frontend_dRast.C_Expr_EVar (dtb__194, dtb__195) -> (match dtb__192 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__197 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__199 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isListConsSyntax (Frontend_dRast_dName.v_rnameKey dtb__194)) then ((v_listLitConsTail dtb__196) dtb__198) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__200, dtb__201) -> (if (Frontend_dReserved.v_isListNilSyntax (Frontend_dRast_dName.v_rnameKey dtb__200)) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 1311 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_listLitConsTail = (fun (h : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) -> (match (v_listLitElems t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__202) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (h, dtb__202))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1318 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_findCtorByShort = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (if ((Frontend_dRast.v_ctorShortName (Elab_dTypes.v_dtCtorName dtb__203)) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__203)) else ((v_findCtorByShort mc0) dtb__204))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1324 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCtor = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (short : string) -> (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> ((v_findCtorByShort short) (Elab_dTypes.v_dtDataCtors dtb__205))
  | _ -> failwith "DT: impossible branch"
))

# 1331 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> ((Base_dCommon.v_bind ((((v_expandListLitGo mc0) mc1) dtb__207) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (B_dData_dList.C_List__x58__x58_ (dtb__206, (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1343 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__208, dtb__209, dtb__210) -> (match dtb__208 with
  | Frontend_dRast.C_Expr_EVar (dtb__211, dtb__212) -> (match dtb__209 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__214 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (match dtb__216 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isRowAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__211)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__215 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1348 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__217, dtb__218, dtb__219) -> (match dtb__217 with
  | Frontend_dRast.C_Expr_EVar (dtb__220, dtb__221) -> (match dtb__218 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__223 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> (if (Frontend_dReserved.v_isAppAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__220)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = dtb__225 } })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1364 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_applyExtra = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dRast.C_Expr_EApp (mc0, mc1, (Frontend_dRast.v_exprSpan mc0)))
))

# 1355 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryParts = (fun (e : Frontend_dRast.t_Expr) -> (match (v_rowAtParts e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__226) -> (B_dData_dMaybe.C_Maybe_Just (dtb__226))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut2 = (v_appAtParts e) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> (match dtb__227 with
  | { B_dData_dPair.f_Pair_first = dtb__228; B_dData_dPair.f_Pair_second = dtb__229 } -> (match dtb__229 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((v_applyExtra dtb__228) dtb__231); B_dData_dPair.f_Pair_second = dtb__230 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1369 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitLabel = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> e
  | B_dData_dMaybe.C_Maybe_Just (dtb__232) -> (match dtb__232 with
  | { B_dData_dPair.f_Pair_first = dtb__233; B_dData_dPair.f_Pair_second = dtb__234 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1375 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameArg = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (match dtb__235 with
  | { B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__237 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__237))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1381 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameExpr = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (match (v_rowLitNameArg e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> dtb__238
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1405 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_wrapRowEntry = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effNamedName), sp)), (B_dData_dList.C_List__x58__x58_ (((v_rowLitNameExpr e) sp), (B_dData_dList.C_List__x58__x58_ ((v_rowLitLabel e), B_dData_dList.C_List_Nil)))), sp)))

# 1400 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsEntry = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__239, dtb__240, dtb__241) -> (match dtb__239 with
  | Frontend_dRast.C_Expr_EVar (dtb__242, dtb__243) -> (match dtb__240 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (match dtb__245 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (match dtb__247 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__242) = Base_dIntrinsics.v_effNamedName) then mc0 else ((v_wrapRowEntry mc0) mc1))
  | _ -> ((v_wrapRowEntry mc0) mc1)
)
  | _ -> ((v_wrapRowEntry mc0) mc1)
)
  | _ -> ((v_wrapRowEntry mc0) mc1)
)
  | _ -> ((v_wrapRowEntry mc0) mc1)
)
  | _ -> ((v_wrapRowEntry mc0) mc1)
))

# 1397 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsArgs = (fun (e : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ (((v_rowConsEntry e) sp), (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))))

# 1387 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandRowListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> ((Base_dCommon.v_bind ((((v_expandRowListLitGo mc0) mc1) dtb__249) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (((v_rowConsArgs dtb__248) t) mc3), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1413 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_firstCtorOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (match (((v_litFamilyCtor mc0) mc1) dtb__250) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__252) -> (B_dData_dMaybe.C_Maybe_Just (dtb__252))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstCtorOf mc0) mc1) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1410 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCons = (fun (ec : Elab_dTypes.t_Ec) (fam : string) -> (((v_firstCtorOf ec) fam) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", (B_dData_dList.C_List__x58__x58_ ("RCons", (B_dData_dList.C_List__x58__x58_ ("VCons", B_dData_dList.C_List_Nil))))))))))

# 1421 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandListLit = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (elems : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fam = Base_dIntrinsics.v_effRowFamilyName) then (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> ((((v_expandRowListLitGo (Elab_dTypes.v_dtCtorName dtb__253)) (Elab_dTypes.v_dtCtorName dtb__254)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__256) -> ((((v_expandListLitGo (Elab_dTypes.v_dtCtorName dtb__255)) (Elab_dTypes.v_dtCtorName dtb__256)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1439 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_listLitFamily = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_expectedFamilyOf ec) expected) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__257) -> dtb__257
  | B_dData_dMaybe.C_Maybe_Nothing -> Base_dIntrinsics.v_listFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1446 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandArgListLit = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (a : Frontend_dRast.t_Expr) -> (match (v_listLitElems a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__258) -> ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) dom))) dtb__258) (Frontend_dRast.v_exprSpan a))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1662 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitTermGo = (fun (n : int) (acc : Core_dTerm.t_Term) -> (if (n <= 0) then acc else ((v_natLitTermGo (n - 1)) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig1 }, B_dData_dList.C_List_Nil)))))))

# 1665 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitTerm = (fun (n : int) -> ((v_natLitTermGo n) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 1670 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitResult = (fun (sp : Base_dSource.t_Span) (n : int) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC ((v_natLitTerm n)))))

# 1673 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natToIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("natToInt")), t, Core_dTerm.C_Rig_Rig1)))

# 1676 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil))))

# 1679 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_natTypeName, B_dData_dList.C_List_Nil))))

# 1683 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil))))

# 1686 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isIntTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__259) -> (match dtb__259 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__260, dtb__261) -> (match dtb__261 with
  | B_dData_dList.C_List_Nil -> (dtb__260 = Base_dIntrinsics.v_intTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1692 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__262) -> (match dtb__262 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__263, dtb__264) -> (match dtb__264 with
  | B_dData_dList.C_List_Nil -> (dtb__263 = Base_dIntrinsics.v_natTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1699 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isFloatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__265) -> (match dtb__265 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__266, dtb__267) -> (match dtb__267 with
  | B_dData_dList.C_List_Nil -> (dtb__266 = Base_dIntrinsics.v_floatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1174 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForExpected = (fun (ec : Elab_dTypes.t_Ec) (name : string) (expected : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_numMethodOpName ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (if ((v_isIntTy ec) expected) then false else (if ((v_isNatTy ec) expected) then false else (if ((v_isFloatTy ec) expected) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VMeta (dtb__269, dtb__270) -> false
  | _ -> true
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1191 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForHint = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (((v_skipArithSpecForExpected mc0) mc1) (B_dData_dPair.v_secondOf dtb__271))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1706 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceTerm = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (if (if ((v_isIntTy ec) expected) then ((v_isNatTy ec) actual) else false) then (B_dData_dMaybe.C_Maybe_Just ((v_natToIntTerm term))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1711 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceNatOperands = (fun (ec : Elab_dTypes.t_Ec) (aTy : Core_dTerm.t_Value) (bTy : Core_dTerm.t_Value) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) -> (if (if ((v_isNatTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else (if (if ((v_isNatTy ec) aTy) then ((v_isIntTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = bTy }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = bTerm } })) else (if (if ((v_isIntTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = aTy; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = aTerm; B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else B_dData_dMaybe.C_Maybe_Nothing))))

# 1729 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithOpNameOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) -> (if (mc1 = "+") then (B_dData_dMaybe.C_Maybe_Just ("+")) else (if (mc1 = "-") then (B_dData_dMaybe.C_Maybe_Just ("-")) else (if (mc1 = "*") then (B_dData_dMaybe.C_Maybe_Just ("*")) else (if (mc1 = "/") then (B_dData_dMaybe.C_Maybe_Just ("/")) else (if (Base_dSource.v_containsDot mc1) then ((Elab_dDict.v_numMethodOpName mc0) mc1) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1736 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithNatName = (fun (mc0 : string) -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1742 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (name)), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1745 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithNatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1754 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithFloatName = (fun (mc0 : string) -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1750 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithFloatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1760 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isEIntExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EInt (dtb__272, dtb__273) -> (B_dData_dMaybe.C_Maybe_Just (dtb__272))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1869 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isSimpleComp = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__274, dtb__275) -> true
  | _ -> false
))

# 1926 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_literalTraitLower = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (traitName : string) (methodName : string) (lit : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let dictDom = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName traitName), (B_dData_dList.C_List__x58__x58_ (((Elab_dTypes.v_forceVal ec) expected), B_dData_dList.C_List_Nil)))))) in (let nd_uscrut9 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) dictDom) sp) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__276) -> (match dtb__276 with
  | { B_dData_dPair.f_Pair_first = dtb__277; B_dData_dPair.f_Pair_second = dtb__278 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName methodName), sp)), (B_dData_dList.C_List__x58__x58_ (lit, B_dData_dList.C_List_Nil)), sp)); B_dData_dPair.f_Pair_second = dtb__278 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__279) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 1935 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_exprFormName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EFloat (dtb__280, dtb__281) -> "EFloat"
  | Frontend_dRast.C_Expr_EInterp (dtb__282, dtb__283, dtb__284) -> "EInterp"
  | Frontend_dRast.C_Expr_EAnn (dtb__285, dtb__286, dtb__287) -> "EAnn"
  | Frontend_dRast.C_Expr_ESectR (dtb__288, dtb__289, dtb__290) -> "ESectR"
  | Frontend_dRast.C_Expr_ESectL (dtb__291, dtb__292, dtb__293) -> "ESectL"
  | Frontend_dRast.C_Expr_ESectOp (dtb__294, dtb__295) -> "ESectOp"
  | Frontend_dRast.C_Expr_EBacktick (dtb__296, dtb__297, dtb__298, dtb__299) -> "EBacktick"
  | Frontend_dRast.C_Expr_EParen (dtb__300, dtb__301) -> "EParen"
  | Frontend_dRast.C_Expr_EInfix (dtb__302, dtb__303, dtb__304, dtb__305) -> "EInfix"
  | Frontend_dRast.C_Expr_EDo (dtb__306, dtb__307) -> "EDo"
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__308, dtb__309, dtb__310) -> "ERecUpdate"
  | Frontend_dRast.C_Expr_ERecord (dtb__311, dtb__312, dtb__313) -> "ERecord"
  | Frontend_dRast.C_Expr_EField (dtb__314, dtb__315, dtb__316) -> "EField"
  | Frontend_dRast.C_Expr_ELocalFun (dtb__317, dtb__318) -> "ELocalFun"
  | Frontend_dRast.C_Expr_ELet (dtb__319, dtb__320, dtb__321, dtb__322) -> "ELet"
  | Frontend_dRast.C_Expr_ECase (dtb__323, dtb__324, dtb__325) -> "ECase"
  | Frontend_dRast.C_Expr_EIf (dtb__326, dtb__327, dtb__328, dtb__329) -> "EIf"
  | Frontend_dRast.C_Expr_EPi (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> "EPi"
  | Frontend_dRast.C_Expr_EApp (dtb__336, dtb__337, dtb__338) -> "EApp"
  | Frontend_dRast.C_Expr_ELam (dtb__339, dtb__340, dtb__341) -> "ELam"
  | Frontend_dRast.C_Expr_EStr (dtb__342, dtb__343) -> "EStr"
  | Frontend_dRast.C_Expr_EInt (dtb__344, dtb__345) -> "EInt"
  | Frontend_dRast.C_Expr_EVar (dtb__346, dtb__347) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 1979 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__348) -> (match dtb__348 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__349) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__349).Elab_dTypes.f_DtCtor_dtCtorType)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__350) -> true
  | Base_dDiag.C_Check_ErrC (dtb__351) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__352) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__352)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__353) -> true
  | Base_dDiag.C_Check_ErrC (dtb__354) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2015 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPiWithMetasFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec } else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__360; B_dData_dPair.f_Pair_second = dtb__361 } -> ((((v_stripPiWithMetasFuel (fuel - 1)) ctx) dtb__361) ((Core_dEval.v_applyClosure dtb__359) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }
)))

# 2012 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_stripPiWithMetas = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_stripPiWithMetasFuel 64) ctx) ec) v))

# 2004 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppResultMatches = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (v : Core_dTerm.t_Value) -> (match (((v_stripPiWithMetas ctx) ec) v) with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__363)) (Elab_dTypes.v_ecSolsP dtb__363)) (Elab_dTypes.v_ctxDepth ctx)) dtb__362) expected) with
  | Base_dDiag.C_Check_OkC (dtb__364) -> true
  | Base_dDiag.C_Check_ErrC (dtb__365) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1996 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (match dtb__366 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__367) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__367).Elab_dTypes.f_DtCtor_dtCtorType))
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__368) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__368))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2029 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueAppTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueAppCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__369, dtb__370) -> (match dtb__370 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__369))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2035 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__372 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__371))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2172 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_patHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__373, dtb__374, dtb__375) -> (v_anyFieldHasOverCtor dtb__374)
  | Frontend_dRast.C_Pat_PAs (dtb__376, dtb__377, dtb__378) -> (v_patHasOverCtor dtb__377)
  | Frontend_dRast.C_Pat_PCon (dtb__379, dtb__380, dtb__381) -> (if (Frontend_dReserved.v_isInternalSyntaxName (Frontend_dRast_dName.v_rnameKey dtb__379)) then true else (v_anyPatHasOverCtor dtb__380))
  | _ -> false
))
# 2180 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyPatHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__382, dtb__383) -> (if (v_patHasOverCtor dtb__382) then true else (v_anyPatHasOverCtor dtb__383))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 2185 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyFieldHasOverCtor = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__384, dtb__385) -> (match dtb__384 with
  | { B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = dtb__387 } -> (if (v_patHasOverCtor dtb__387) then true else (v_anyFieldHasOverCtor dtb__385))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2190 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_clausesHaveOverCtor = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__388, dtb__389) -> (match dtb__388 with
  | { B_dData_dPair.f_Pair_first = dtb__390; B_dData_dPair.f_Pair_second = dtb__391 } -> (if (v_anyPatHasOverCtor dtb__390) then true else (v_clausesHaveOverCtor dtb__389))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2195 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandLocalFuns = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EAnn (dtb__392, dtb__393, dtb__394) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__392)) (fun (value2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EAnn (value2, dtb__393, dtb__394))))))
  | Frontend_dRast.C_Expr_EDo (dtb__395, dtb__396) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandDoStmt mc0)) dtb__395)) (fun (stmts2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EDo (stmts2, dtb__396))))))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__397, dtb__398, dtb__399) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__397)) (fun (base2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__398)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecUpdate (base2, fields2, dtb__399))))))))
  | Frontend_dRast.C_Expr_ERecord (dtb__400, dtb__401, dtb__402) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__401)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecord (dtb__400, fields2, dtb__402))))))
  | Frontend_dRast.C_Expr_EField (dtb__403, dtb__404, dtb__405) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__403)) (fun (base2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EField (base2, dtb__404, dtb__405))))))
  | Frontend_dRast.C_Expr_EIf (dtb__406, dtb__407, dtb__408, dtb__409) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__406)) (fun (c2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__407)) (fun (t2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__408)) (fun (el2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EIf (c2, t2, el2, dtb__409))))))))))
  | Frontend_dRast.C_Expr_ECase (dtb__410, dtb__411, dtb__412) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__410)) (fun (scrut2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__411)) (fun (alts2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase (scrut2, alts2, dtb__412))))))))
  | Frontend_dRast.C_Expr_ELet (dtb__413, dtb__414, dtb__415, dtb__416) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__413)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__414)) (fun (body2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELet (binds2, body2, dtb__415, dtb__416))))))))
  | Frontend_dRast.C_Expr_EPi (dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__420)) (fun (dom2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__421)) (fun (cod2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EPi (dtb__417, dtb__418, dtb__419, dom2, cod2, dtb__422))))))))
  | Frontend_dRast.C_Expr_EApp (dtb__423, dtb__424, dtb__425) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__423)) (fun (fn2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandLocalFuns mc0)) dtb__424)) (fun (args2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (fn2, args2, dtb__425))))))))
  | Frontend_dRast.C_Expr_ELam (dtb__426, dtb__427, dtb__428) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__427)) (fun (b2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELam (dtb__426, b2, dtb__428))))))
  | Frontend_dRast.C_Expr_EFloat (dtb__429, dtb__430) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EFloat (dtb__429, dtb__430))))
  | Frontend_dRast.C_Expr_EStr (dtb__431, dtb__432) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EStr (dtb__431, dtb__432))))
  | Frontend_dRast.C_Expr_EInt (dtb__433, dtb__434) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EInt (dtb__433, dtb__434))))
  | Frontend_dRast.C_Expr_EVar (dtb__435, dtb__436) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar (dtb__435, dtb__436))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__437, dtb__438) -> (if (v_clausesHaveOverCtor dtb__437) then (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELocalFun (dtb__437, dtb__438)))) else ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable mc0)) dtb__437))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))
# 2245 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBind = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__439; B_dData_dPair.f_Pair_second = dtb__440 } -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__440)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__439; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 2249 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandDoStmt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_DoStmt) -> (match mc1 with
  | Frontend_dRast.C_DoStmt_DLet (dtb__441, dtb__442) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__441)) (fun (b2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DLet (b2, dtb__442))))))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__443, dtb__444) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__443)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DExpr (v2, dtb__444))))))
  | Frontend_dRast.C_DoStmt_DBind (dtb__445, dtb__446, dtb__447) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__446)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DBind (dtb__445, v2, dtb__447))))))
  | _ -> failwith "DT: impossible branch"
))

# 2385 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPisWithMetas = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__448, dtb__449, dtb__450, dtb__451, dtb__452) -> (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__453; B_dData_dPair.f_Pair_second = dtb__454 } -> ((((v_stripPisWithMetas (fuel - 1)) ctx) dtb__454) ((Core_dEval.v_applyClosure dtb__452) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__453)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }))
)))

# 2400 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isMetaHeadedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VMeta (dtb__455, dtb__456) -> true
  | _ -> false
))

# 2407 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isRigidHeadValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VCon (dtb__457, dtb__458) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__459) -> (match dtb__459 with
  | Core_dTerm.C_Neutral_NVar (dtb__460, dtb__461, dtb__462) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb__463, dtb__464) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2420 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryUseHint = (fun (goals0 : int) (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) (piTy : Core_dTerm.t_Value) -> (if ((Elab_dTypes.v_ecPendingCount ec) <= goals0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut5 = ((((v_stripPisWithMetas 64) ctx) ec) piTy) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__465) -> (match dtb__465 with
  | { B_dData_dPair.f_Pair_first = dtb__466; B_dData_dPair.f_Pair_second = dtb__467 } -> (let forcedRes = ((Elab_dTypes.v_forceVal dtb__467) dtb__466) in (if ((v_isMetaHeadedValue dtb__467) forcedRes) then (if ((v_isRigidHeadValue dtb__467) expected) then (match ((((Elab_dMeta.v_convEc dtb__467) (Elab_dTypes.v_ctxDepth ctx)) expected) forcedRes) with
  | Base_dDiag.C_Check_ErrC (dtb__468) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__469) -> (B_dData_dMaybe.C_Maybe_Just (dtb__469))
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__470) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 2470 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowAndResult = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__471) -> (match dtb__471 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__472, dtb__473) -> (match dtb__473 with
  | B_dData_dList.C_List__x58__x58_ (dtb__474, dtb__475) -> (match dtb__475 with
  | B_dData_dList.C_List__x58__x58_ (dtb__476, dtb__477) -> (if (dtb__472 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__474; B_dData_dPair.f_Pair_second = dtb__476 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2476 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowOfValue = (fun (v : Core_dTerm.t_Value) -> (match (v_effRowAndResult v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__478) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__478)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2483 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNilRowValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VCon (dtb__479, dtb__480) -> (dtb__479 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 2490 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryLabelTail = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__481, dtb__482) -> (if (dtb__481 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__482 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__483, dtb__484) -> (match dtb__484 with
  | B_dData_dList.C_List__x58__x58_ (dtb__485, dtb__486) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = dtb__485 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2501 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_shortGlobalName = (fun (g : string) -> (Base_dSource.v_lastSeg g))

# 2511 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_labelHeadArgs = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__487, dtb__488) -> ((v_labelHeadArgs (String.concat "" [mc0; " "; ((Core_dEval.v_showValueAt 6) dtb__487)])) dtb__488)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 2505 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLabelText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__489) -> (match dtb__489 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__490, dtb__491) -> ((v_labelHeadArgs (v_shortGlobalName dtb__490)) dtb__491)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 2516 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__492) -> dtb__492
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 2523 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryText = (fun (ec : Elab_dTypes.t_Ec) (n : Core_dTerm.t_Value) (h : Core_dTerm.t_Value) -> (if (((v_rowNameText ec) n) = "default") then ((v_rowLabelText ec) h) else (String.concat "" [((v_rowLabelText ec) h); "@"; ((v_rowNameText ec) n)])))

# 2531 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_namedLabelParts = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__493) -> (match dtb__493 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__494, dtb__495) -> (if (dtb__494 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut6 = dtb__495 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__496, dtb__497) -> (match dtb__497 with
  | B_dData_dList.C_List__x58__x58_ (dtb__498, dtb__499) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__496; B_dData_dPair.f_Pair_second = dtb__498 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2543 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryTextOf = (fun (ec : Elab_dTypes.t_Ec) (label : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_namedLabelParts ec) label) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_rowLabelText ec) label)
  | B_dData_dMaybe.C_Maybe_Just (dtb__500) -> (match dtb__500 with
  | { B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__502 } -> (((v_rowEntryText ec) dtb__501) dtb__502)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2550 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowEffectLabels = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__503, dtb__504) -> (if (dtb__503 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (dtb__503 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__503, dtb__504))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (match dtb__505 with
  | { B_dData_dPair.f_Pair_first = dtb__506; B_dData_dPair.f_Pair_second = dtb__507 } -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) dtb__506) then B_dData_dMaybe.C_Maybe_Nothing else (match (((v_rowEffectLabels (fuel - 1)) ec) dtb__507) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__508) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (((v_rowEntryTextOf ec) dtb__506), dtb__508))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2576 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowNonDefaultHostEntries = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__509, dtb__510) -> (if (dtb__509 = Base_dIntrinsics.v_effRowNilCtor) then B_dData_dList.C_List_Nil else (if (dtb__509 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__509, dtb__510))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> (match dtb__511 with
  | { B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = dtb__513 } -> (let rest = (((v_rowNonDefaultHostEntries (fuel - 1)) ec) dtb__513) in (let nd_uscrut13 = ((v_namedLabelParts ec) dtb__512) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> rest
  | B_dData_dMaybe.C_Maybe_Just (dtb__514) -> (match dtb__514 with
  | { B_dData_dPair.f_Pair_first = dtb__515; B_dData_dPair.f_Pair_second = dtb__516 } -> (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) dtb__516) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VNeutral (dtb__517) -> (match dtb__517 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__518, dtb__519) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb__518) then (if (((v_rowNameText ec) dtb__515) = "default") then rest else (B_dData_dList.C_List__x58__x58_ ((((v_rowEntryText ec) dtb__515) dtb__516), rest))) else rest)
  | _ -> rest
)
  | _ -> rest
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
)))

# 2602 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_joinEffectLabels = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__520, dtb__521) -> (match dtb__521 with
  | B_dData_dList.C_List_Nil -> dtb__520
  | _ -> (String.concat "" [dtb__520; ", "; (v_joinEffectLabels dtb__521)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2610 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_unhandledEffectLabel = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) -> (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__522) -> (if ((v_isNilRowValue ec) dtb__522) then (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (match (((v_rowEffectLabels 64) ec) dtb__523) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__524) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__524) B_dData_dList.C_List_Nil) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__524)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2632 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_sameLabelValue = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let defs = (Elab_dTypes.v_ecDefTbl ec) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let fa = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) a) in (let fb = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) b) in (let nd_uscrut7 = (((Core_dEval.v_valueEqFuel Core_dTerm.v_defaultFuel) fa) fb) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__525) -> (if dtb__525 then true else false)
  | _ -> false
)))))))

# 2643 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowContainsValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (expected : Core_dTerm.t_Value) (label : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VCon (dtb__526, dtb__527) -> (if (dtb__526 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__526, dtb__527))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__528) -> (match dtb__528 with
  | { B_dData_dPair.f_Pair_first = dtb__529; B_dData_dPair.f_Pair_second = dtb__530 } -> (if (((v_sameLabelValue ec) label) dtb__529) then true else ((((v_rowContainsValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__530)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
)))

# 2658 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowSubValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (actual : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) actual) with
  | Core_dTerm.C_Value_VCon (dtb__531, dtb__532) -> (if (dtb__531 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__531 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__531, dtb__532))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__533) -> (match dtb__533 with
  | { B_dData_dPair.f_Pair_first = dtb__534; B_dData_dPair.f_Pair_second = dtb__535 } -> (if ((((v_rowContainsValue ec) (fuel - 1)) expected) dtb__534) then ((((v_rowSubValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__535)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)))

# 2722 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_weakenLabelTerm = (fun (d : int) (label : Core_dTerm.t_Value) (tailF : Core_dTerm.t_Value) (result : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.weaken")), ((Core_dEval.v_quote d) label), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) tailF), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) result), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)))

# 2678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryEffLift = (fun (ctx : Elab_dTypes.t_Ctx) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.weaken") globals) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__536) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__537) -> (let nd_uscrut11 = (v_rowEntryLabelTail ((Elab_dTypes.v_forceVal ec) (B_dData_dPair.v_firstOf dtb__537))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__538) -> (match dtb__538 with
  | { B_dData_dPair.f_Pair_first = dtb__539; B_dData_dPair.f_Pair_second = dtb__540 } -> (let tailF = ((Elab_dTypes.v_forceVal ec) dtb__540) in (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) tailF) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__541) -> (match ((((Elab_dMeta.v_convEc ec) d) (B_dData_dPair.v_secondOf dtb__537)) (B_dData_dPair.v_secondOf dtb__541)) with
  | Base_dDiag.C_Check_ErrC (dtb__542) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__543) -> (let actualRow = (B_dData_dPair.v_firstOf dtb__541) in (if ((((v_rowSubValue dtb__543) 64) actualRow) (B_dData_dPair.v_firstOf dtb__537)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = term; B_dData_dPair.f_Pair_second = dtb__543 })) else (if ((v_isNilRowValue dtb__543) actualRow) then (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.raise") globals) dtb__543) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__544) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.raise")), ((Core_dEval.v_quote d) (B_dData_dPair.v_firstOf dtb__537)), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) (B_dData_dPair.v_secondOf dtb__537)), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)); B_dData_dPair.f_Pair_second = dtb__543 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Elab_dMeta.v_convEc dtb__543) d) actualRow) tailF) with
  | Base_dDiag.C_Check_ErrC (dtb__545) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__546) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((((v_weakenLabelTerm d) dtb__539) tailF) (B_dData_dPair.v_secondOf dtb__537)) term); B_dData_dPair.f_Pair_second = dtb__546 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 2826 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeHeadTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__547) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__547) then (Core_dTerm.C_Term_TRecord (name, B_dData_dList.C_List_Nil)) else (Core_dTerm.C_Term_TGlobal (name)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2833 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeAppTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__548) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__548) then (Core_dTerm.C_Term_TRecord (name, args)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 3109 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromInt")), t, Core_dTerm.C_Rig_Rig1)))

# 3113 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromFloatTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromFloat")), t, Core_dTerm.C_Rig_Rig1)))

# 3116 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil))))

# 3119 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isStringTyValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__549) -> (match dtb__549 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__550, dtb__551) -> (match dtb__551 with
  | B_dData_dList.C_List_Nil -> (dtb__550 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 3201 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorSpineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__552) -> { B_dData_dPair.f_Pair_first = dtb__552; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__553, dtb__554) -> { B_dData_dPair.f_Pair_first = dtb__553; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__554) }
  | Core_dTerm.C_Term_TApp (dtb__555, dtb__556, dtb__557) -> (match (v_ctorSpineOfType dtb__555) with
  | { B_dData_dPair.f_Pair_first = dtb__558; B_dData_dPair.f_Pair_second = dtb__559 } -> { B_dData_dPair.f_Pair_first = dtb__558; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__559) (B_dData_dList.C_List__x58__x58_ (dtb__556, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 3197 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorResultArgs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__560, dtb__561, dtb__562, dtb__563, dtb__564) -> (v_ctorResultArgs dtb__564)
  | _ -> (B_dData_dPair.v_secondOf (v_ctorSpineOfType mc0))
))

# 3209 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> (v_dropPis dtb__569)
  | _ -> mc0
))

# 3213 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_identityArgs = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__570, dtb__571) -> (match dtb__570 with
  | Core_dTerm.C_Term_TVar (dtb__572, dtb__573, dtb__574) -> (if (dtb__573 = ((mc1 - 1) - mc0)) then (((v_identityArgs (mc0 + 1)) mc1) dtb__571) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 3223 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorIdentitySpine = (fun (fam : string) (ctor : Elab_dTypes.t_DtCtor) -> (let k = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor)) in (let args = (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor)) in (match (v_ctorSpineOfType (v_dropPis (Elab_dTypes.v_dtCtorType ctor))) with
  | { B_dData_dPair.f_Pair_first = dtb__575; B_dData_dPair.f_Pair_second = dtb__576 } -> (if (dtb__575 = fam) then (if ((B_dData_dList.v_length args) > 0) then (if ((B_dData_dList.v_length args) <= k) then (((v_identityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
))))

# 3239 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_takeRigsGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__577, dtb__578) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__577), ((v_takeRigsGo (mc0 - 1)) dtb__578))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 3236 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_takeRigs = (fun (n : int) (bs : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_takeRigsGo n) bs))

# 3257 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorFamilyArgsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc4 : int) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__579, dtb__580) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__581, dtb__582) -> (match ((Elab_dTypes.v_forceVal mc0) mc1) with
  | Core_dTerm.C_Value_VPi (dtb__583, dtb__584, dtb__585, dtb__586, dtb__587) -> (if dtb__584 then ((((((v_ctorFamilyArgsGo mc0) ((Core_dEval.v_applyClosure dtb__587) dtb__579)) dtb__580) dtb__582) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote mc4) dtb__579); B_dData_dPair.f_Pair_second = dtb__581 }, mc5))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 3243 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFamilyArgs = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ctor : Elab_dTypes.t_DtCtor) (expected : Core_dTerm.t_Value) -> (let fam = (Elab_dTypes.v_dtCtorFamily ctor) in (if ((v_ctorIdentitySpine fam) ctor) then (let nd_uscrut5 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__588) -> (match dtb__588 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__589, dtb__590) -> (let arity = (B_dData_dList.v_length (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor))) in (if (dtb__589 = fam) then (if ((B_dData_dList.v_length dtb__590) = arity) then ((((((v_ctorFamilyArgsGo ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType ctor))) dtb__590) ((v_takeRigs arity) (Elab_dTypes.v_dtCtorTelescope ctor))) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 3275 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat) -> (let dtnat__591 = mc0 in (if (dtnat__591 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__592 = (dtnat__591 - 1) in (match mc4 with
  | Frontend_dRast.C_Pat_PCon (dtb__593, dtb__594, dtb__595) -> (if (Frontend_dReserved.v_isListNilSyntax (Frontend_dRast_dName.v_rnameKey dtb__593)) then (match (((v_litFamilyCtor mc1) ((v_listLitFamily mc1) mc3)) "Nil") with
  | B_dData_dMaybe.C_Maybe_Just (dtb__596) -> (((((((v_resolveCtorPatFuel dtb__592) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__596)) dtb__594) dtb__595)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__594, dtb__595)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isListConsSyntax (Frontend_dRast_dName.v_rnameKey dtb__593)) then (match ((v_litFamilyCons mc1) ((v_listLitFamily mc1) mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__597) -> (((((((v_resolveCtorPatFuel dtb__592) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__597)) dtb__594) dtb__595)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__594, dtb__595)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__593)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor mc1) dtb__595) (B_dData_dMaybe.C_Maybe_Just (mc3))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__593))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__593)))) (fun (target : string) -> (((((((v_resolveCtorPatFuel dtb__592) mc1) mc2) mc3) target) dtb__594) dtb__595))) else (((((((v_resolveCtorPatFuel dtb__592) mc1) mc2) mc3) (Frontend_dRast_dName.v_rnameKey dtb__593)) dtb__594) dtb__595))))
  | Frontend_dRast.C_Pat_PRecord (dtb__598, dtb__599, dtb__600) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)))))
# 3293 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolveCtorPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : string) (mc5 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc6 : Base_dSource.t_Span) -> (let dtnat__601 = mc0 in (if (dtnat__601 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__602 = (dtnat__601 - 1) in (match ((Elab_dMeta.v_dtCtorLookupEc mc1) mc4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), mc5, mc6)); B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__603) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs mc1) mc2) dtb__603) mc3) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__604) -> (match dtb__604 with
  | { B_dData_dPair.f_Pair_first = dtb__605; B_dData_dPair.f_Pair_second = dtb__606 } -> (match dtb__606 with
  | { B_dData_dPair.f_Pair_first = dtb__607; B_dData_dPair.f_Pair_second = dtb__608 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__602) dtb__608) mc2) dtb__607) mc5)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__609; B_dData_dPair.f_Pair_second = dtb__610 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), dtb__609, mc6)); B_dData_dPair.f_Pair_second = dtb__610 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), mc5, mc6)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))
# 3309 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolvePatArgsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__611 = mc0 in (if (dtnat__611 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__612 = (dtnat__611 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__613, dtb__614) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__615, dtb__616, dtb__617, dtb__618, dtb__619) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__615, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__615) dtb__618) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__619) v) in (if dtb__616 then (((((v_resolvePatArgsFuel dtb__612) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__613, dtb__614))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__612) mc1) mc2) dtb__618) dtb__613)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__620; B_dData_dPair.f_Pair_second = dtb__621 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__612) dtb__621) ctx2) ty2) dtb__614)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__622; B_dData_dPair.f_Pair_second = dtb__623 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__620, dtb__622)); B_dData_dPair.f_Pair_second = dtb__623 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3341 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverAltsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__624 = mc0 in (if (dtnat__624 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__625 = (dtnat__624 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__626, dtb__627) -> (match dtb__626 with
  | { B_dData_dPair.f_Pair_first = dtb__628; B_dData_dPair.f_Pair_second = dtb__629 } -> ((Base_dCommon.v_bind (((((v_resolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__628)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__630; B_dData_dPair.f_Pair_second = dtb__631 } -> ((Base_dCommon.v_bind (((((v_resolveOverAltsGo dtb__625) dtb__631) mc2) mc3) dtb__627)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__632; B_dData_dPair.f_Pair_second = dtb__633 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__630; B_dData_dPair.f_Pair_second = dtb__629 }, dtb__632)); B_dData_dPair.f_Pair_second = dtb__633 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3337 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverAlts = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 3383 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveClausePatsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__634 = mc0 in (if (dtnat__634 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__635 = (dtnat__634 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__636, dtb__637) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__638, dtb__639, dtb__640, dtb__641, dtb__642) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__638, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__638) dtb__641) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__642) v) in (if dtb__639 then (((((v_resolveClausePatsFuel dtb__635) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__636, dtb__637))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__635) mc1) mc2) dtb__641) dtb__636)) (fun (q : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__643; B_dData_dPair.f_Pair_second = dtb__644 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel dtb__635) dtb__644) ctx2) ty2) dtb__637)) (fun (r : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__645; B_dData_dPair.f_Pair_second = dtb__646 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__643, dtb__645)); B_dData_dPair.f_Pair_second = dtb__646 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3365 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverFunPatsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__647 = mc0 in (if (dtnat__647 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__648 = (dtnat__647 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__649, dtb__650) -> (match dtb__649 with
  | { B_dData_dPair.f_Pair_first = dtb__651; B_dData_dPair.f_Pair_second = dtb__652 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__651)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__653; B_dData_dPair.f_Pair_second = dtb__654 } -> ((Base_dCommon.v_bind (((((v_resolveOverFunPatsGo dtb__648) dtb__654) mc2) mc3) dtb__650)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__655; B_dData_dPair.f_Pair_second = dtb__656 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__653; B_dData_dPair.f_Pair_second = dtb__652 }, dtb__655)); B_dData_dPair.f_Pair_second = dtb__656 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3360 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverFunPats = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 3464 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doMarkerHead = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__657, dtb__658, dtb__659) -> (match dtb__657 with
  | Frontend_dRast.C_Expr_EVar (dtb__660, dtb__661) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__660)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__662) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 3487 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_decodeDoChain = (fun (fuel : int) (canonical : string) (acc : t_DoChainStep B_dData_dList.t_List) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = expr in (match nd_uscrut4 with
  | Frontend_dRast.C_Expr_EApp (dtb__663, dtb__664, dtb__665) -> (match dtb__663 with
  | Frontend_dRast.C_Expr_EVar (dtb__666, dtb__667) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__666)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = expr }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__668) -> (if (canonical <> dtb__668) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut12 = dtb__664 in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__669, dtb__670) -> (match dtb__670 with
  | B_dData_dList.C_List__x58__x58_ (dtb__671, dtb__672) -> (match dtb__671 with
  | Frontend_dRast.C_Expr_ELam (dtb__673, dtb__674, dtb__675) -> (match dtb__673 with
  | B_dData_dList.C_List__x58__x58_ (dtb__676, dtb__677) -> (match dtb__676 with
  | { B_dData_dPair.f_Pair_first = dtb__678; B_dData_dPair.f_Pair_second = dtb__679 } -> (match dtb__677 with
  | B_dData_dList.C_List_Nil -> (match dtb__672 with
  | B_dData_dList.C_List_Nil -> ((((v_decodeDoChain (fuel - 1)) dtb__668) (B_dData_dList.C_List__x58__x58_ ((C_DoChainStep_DoChainStep (dtb__678, dtb__669, dtb__667, dtb__679)), acc))) dtb__674)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = expr }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = expr }))
))))

# 3506 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_decodeDoBlock = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__680, dtb__681, dtb__682) -> (match dtb__680 with
  | Frontend_dRast.C_Expr_EVar (dtb__683, dtb__684) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__683)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__685) -> (let nd_uscrut8 = ((((v_decodeDoChain 4096) dtb__685) B_dData_dList.C_List_Nil) mc0) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__686) -> (match dtb__686 with
  | { B_dData_dPair.f_Pair_first = dtb__687; B_dData_dPair.f_Pair_second = dtb__688 } -> (B_dData_dMaybe.C_Maybe_Just ({ f_DoChain_doChainCanonical = dtb__685; f_DoChain_doChainSteps = dtb__687; f_DoChain_doChainLast = dtb__688; f_DoChain_doChainSpan = dtb__684 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3518 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_doChainBuild = (fun (mc0 : string) (mc1 : t_DoChainStep B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__689, dtb__690) -> (match dtb__689 with
  | C_DoChainStep_DoChainStep (dtb__691, dtb__692, dtb__693, dtb__694) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), dtb__693)), (B_dData_dList.C_List__x58__x58_ (dtb__692, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__691; B_dData_dPair.f_Pair_second = dtb__694 }, B_dData_dList.C_List_Nil)), ((((v_doChainBuild mc0) dtb__690) mc2) mc3), dtb__693)), B_dData_dList.C_List_Nil)))), dtb__693))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 3527 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainFallback = (fun (chain : t_DoChain) -> ((((v_doChainBuild (chain).f_DoChain_doChainCanonical) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast) (chain).f_DoChain_doChainSpan))

# 3534 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_splitDoSpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__695, dtb__696) -> (match ((v_splitDoSpine ((Core_dEval.v_applyValue mc0) dtb__695)) dtb__696) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__695 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__697) -> (B_dData_dMaybe.C_Maybe_Just (dtb__697))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 3542 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_splitDoExpected = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VNeutral (dtb__698) -> (match dtb__698 with
  | Core_dTerm.C_Neutral_NVar (dtb__699, dtb__700, dtb__701) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__699, dtb__700, B_dData_dList.C_List_Nil))))) dtb__701)
  | Core_dTerm.C_Neutral_NGlobal (dtb__702, dtb__703) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__702, B_dData_dList.C_List_Nil))))) dtb__703)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3560 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindShapeOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__704, dtb__705, dtb__706, dtb__707, dtb__708) -> (if dtb__705 then (match dtb__708 with
  | Core_dTerm.C_Term_TPi (dtb__709, dtb__710, dtb__711, dtb__712, dtb__713) -> (if dtb__710 then (match dtb__712 with
  | Core_dTerm.C_Term_TApp (dtb__714, dtb__715, dtb__716) -> (match dtb__714 with
  | Core_dTerm.C_Term_TGlobal (dtb__717) -> (match dtb__715 with
  | Core_dTerm.C_Term_TVar (dtb__718, dtb__719, dtb__720) -> (match dtb__713 with
  | Core_dTerm.C_Term_TPi (dtb__721, dtb__722, dtb__723, dtb__724, dtb__725) -> (if dtb__722 then (match dtb__725 with
  | Core_dTerm.C_Term_TPi (dtb__726, dtb__727, dtb__728, dtb__729, dtb__730) -> (if dtb__727 then (match dtb__730 with
  | Core_dTerm.C_Term_TPi (dtb__731, dtb__732, dtb__733, dtb__734, dtb__735) -> (if dtb__732 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__734 with
  | Core_dTerm.C_Term_TApp (dtb__736, dtb__737, dtb__738) -> (match dtb__736 with
  | Core_dTerm.C_Term_TVar (dtb__739, dtb__740, dtb__741) -> (match dtb__737 with
  | Core_dTerm.C_Term_TVar (dtb__742, dtb__743, dtb__744) -> (match dtb__735 with
  | Core_dTerm.C_Term_TPi (dtb__745, dtb__746, dtb__747, dtb__748, dtb__749) -> (if dtb__746 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__748 with
  | Core_dTerm.C_Term_TPi (dtb__750, dtb__751, dtb__752, dtb__753, dtb__754) -> (if dtb__751 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__753 with
  | Core_dTerm.C_Term_TVar (dtb__755, dtb__756, dtb__757) -> (match dtb__754 with
  | Core_dTerm.C_Term_TApp (dtb__758, dtb__759, dtb__760) -> (match dtb__758 with
  | Core_dTerm.C_Term_TVar (dtb__761, dtb__762, dtb__763) -> (match dtb__759 with
  | Core_dTerm.C_Term_TVar (dtb__764, dtb__765, dtb__766) -> (match dtb__749 with
  | Core_dTerm.C_Term_TApp (dtb__767, dtb__768, dtb__769) -> (match dtb__767 with
  | Core_dTerm.C_Term_TVar (dtb__770, dtb__771, dtb__772) -> (match dtb__768 with
  | Core_dTerm.C_Term_TVar (dtb__773, dtb__774, dtb__775) -> (if (if (if (if (dtb__719 = 0) then (dtb__740 = 3) else false) then (dtb__762 = 5) else false) then (dtb__771 = 5) else false) then (if (if (if (if (dtb__743 = 1) then (dtb__756 = 2) else false) then (dtb__765 = 2) else false) then (dtb__774 = 2) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__733, dtb__747, dtb__752)))) else (if (if (if (if (dtb__743 = 0) then (dtb__756 = 1) else false) then (dtb__765 = 3) else false) then (dtb__774 = 3) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__733, dtb__747, dtb__752)))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3575 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindHeadOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (match ((Elab_dTypes.v_ctxLookup bindName) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__776) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup bindName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__777) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (bindName)); B_dData_dPair.f_Pair_second = dtb__777 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 3586 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBlockShapeOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (let nd_uscrut4 = ((((v_doBindHeadOf globals) ctx) ec) bindName) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__778) -> (match dtb__778 with
  | { B_dData_dPair.f_Pair_first = dtb__779; B_dData_dPair.f_Pair_second = dtb__780 } -> (match (v_bindShapeOf dtb__780) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__781) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__779; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__780; B_dData_dPair.f_Pair_second = dtb__781 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 3598 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictDefer = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__782; B_dData_dPair.f_Pair_second = dtb__783 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__782; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__783) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__783) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)))

# 3607 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictStep = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dom) then ((((v_doDictDefer ctx) ec) dom) sp) else (let nd_uscrut6 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) ((Elab_dTypes.v_forceVal ec) dom)) sp) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_ErrC (dtb__784) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (if ((Elab_dDict.v_isRigidDictArg ec) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (Base_dDiag.C_Check_ErrC (dtb__784))))
  | Base_dDiag.C_Check_OkC (dtb__785) -> (match dtb__785 with
  | { B_dData_dPair.f_Pair_first = dtb__786; B_dData_dPair.f_Pair_second = dtb__787 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__786; B_dData_dPair.f_Pair_second = dtb__787 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3635 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDoBlock = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (bindName : string) (headTerm : Core_dTerm.t_Term) (bindTyTerm : Core_dTerm.t_Term) (shape : t_DoBindShape) (mVal : Core_dTerm.t_Value) (aVal : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match shape with
  | C_DoBindShape_DoBindShape (dtb__788, dtb__789, dtb__790) -> (let nd_uscrut14 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) bindTyTerm)) in (match nd_uscrut14 with
  | Core_dTerm.C_Value_VPi (dtb__791, dtb__792, dtb__793, dtb__794, dtb__795) -> (if dtb__792 then (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_applyClosure dtb__795) mVal)) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VPi (dtb__796, dtb__797, dtb__798, dtb__799, dtb__800) -> (if dtb__797 then (if ((Elab_dDict.v_isDictDomain ec) dtb__799) then ((Base_dCommon.v_bind ((((((v_doDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__799)) (fun (dp : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dp with
  | { B_dData_dPair.f_Pair_first = dtb__801; B_dData_dPair.f_Pair_second = dtb__802 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ f_DoPlan_planBind = bindName; f_DoPlan_planHead = headTerm; f_DoPlan_planMTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) mVal); f_DoPlan_planMVal = mVal; f_DoPlan_planAVal = aVal; f_DoPlan_planDictTerm = dtb__801; f_DoPlan_planRigE = dtb__788; f_DoPlan_planRigL = dtb__789; f_DoPlan_planInnerRig = dtb__790; f_DoPlan_planEc = dtb__802 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))
  | _ -> failwith "DT: impossible branch"
)))

# 3662 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindAppTerm = (fun (ecLinear : Elab_dTypes.t_Ec) (ecPaper : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (binderSp : Base_dSource.t_Span) (plan : t_DoPlan) (binder : string) (aVal : Core_dTerm.t_Value) (eTerm : Core_dTerm.t_Term) (argRig : Core_dTerm.t_Rig) (lamRig : Core_dTerm.t_Rig) (inner : Core_dTerm.t_Term) -> (let depth = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue binder) aVal) ctx) in (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) inner) else inner) in (let slot0 = ((Core_dTerm.v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) (B_dData_dMaybe.C_Maybe_Just ((((Core_dTerm.v_shift 0) 1) ((Core_dEval.v_quote depth) ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) (plan).f_DoPlan_planAVal)))))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear ecLinear) ctx) then (if (((Elab_dMeta.v_termHasOuterLinear ecLinear) ctx2) inner) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (let lamTerm = (Core_dTerm.C_Term_TLam (binder, lamRig, slot, binderSp, inner2)) in (let args = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planMTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planDictTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) aVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) (plan).f_DoPlan_planAVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = eTerm; B_dData_dPair.f_Pair_second = argRig }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = lamTerm; B_dData_dPair.f_Pair_second = (plan).f_DoPlan_planRigL }, B_dData_dList.C_List_Nil)))))))))))) in ((Elab_dMeta.v_foldAppTerms (plan).f_DoPlan_planHead) args)))))))))

# 57 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_elabConAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (scrutVal : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) (cname : string) (args : Frontend_dRast.t_Pat B_dData_dList.t_List) (psp : Base_dSource.t_Span) (body : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_findCtorIn cname) (Elab_dTypes.v_dtDataCtors dd)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 psp) (Base_dDiagnostics_dTc.C_TcErr_UnknownConstructorInCase ((Frontend_dRast.v_ctorDisplayName cname), (Elab_dTypes.v_dtDataName dd)))) (Frontend_dRast.v_ctorDisplayName cname)) (Elab_dTypes.v_dtDataName dd))
  | B_dData_dMaybe.C_Maybe_Just (dtb__803) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((Elab_dCase.v_bindCtorTele ctx) (Elab_dTypes.v_dtCtorType dtb__803)) args))) (fun (p : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dRast.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__804; B_dData_dPair.f_Pair_second = dtb__805 } -> (match dtb__805 with
  | { B_dData_dPair.f_Pair_first = dtb__806; B_dData_dPair.f_Pair_second = dtb__807 } -> (if (Elab_dMeta.v_nonEmpty dtb__807) then (((Base_dDiagnostics_dTc.v_tcErr1 psp) (Base_dDiagnostics_dTc.C_TcErr_BranchTooManyArgs ((Frontend_dRast.v_ctorDisplayName cname)))) (Frontend_dRast.v_ctorDisplayName cname)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((((Elab_dCase.v_unifyIdxListSized ec) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb__804)) ((Elab_dCase.v_ctorResultValsIn dtb__804) dtb__803)) ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) v))) idxs)))) (fun (refsIdx : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((Elab_dCase.v_branchAfterUnify ec) dtb__804) refsIdx) with
  | Elab_dCase.C_BranchVerdict_BranchImpossibleIndex -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex)
  | Elab_dCase.C_BranchVerdict_BranchImpossibleEmptyCtx -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchEmptyCtx)
  | Elab_dCase.C_BranchVerdict_BranchOk -> ((Base_dCommon.v_bind (((((Elab_dCase.v_reflectScrutinee ec) (Elab_dTypes.v_ctxDepth dtb__804)) refsIdx) ((Elab_dCase.v_ctorValueIn dtb__804) dtb__803)) scrutVal)) (fun (refs2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let refinedExpected = (((Elab_dTypes.v_refineValue refs2) Core_dTerm.v_defaultFuel) expected) in (let branchCtx2 = ((Elab_dTypes.v_ctxRefine dtb__804) refs2) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__808; B_dData_dPair.f_Pair_second = dtb__809 } -> (let n = (B_dData_dList.v_length dtb__806) in (let opaqueIdxs = ((((v_opaqueBranchIndices dtb__809) branchCtx2) n) (Core_dTerm.v_binderPairs dtb__806)) in (let bodyTerm1 = ((Elab_dMeta.v_wrapOpaqueUses opaqueIdxs) dtb__808) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__809) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = cname; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__806; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }; B_dData_dPair.f_Pair_second = dtb__809 }))))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 98 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCaseAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) (mc5 : Elab_dTypes.t_DtData) (mc6 : Core_dTerm.t_Value B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Core_dTerm.t_Value) (mc9 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__810, dtb__811) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__810 with
  | { B_dData_dPair.f_Pair_first = dtb__812; B_dData_dPair.f_Pair_second = dtb__813 } -> (match dtb__812 with
  | Frontend_dRast.C_Pat_PCon (dtb__814, dtb__815, dtb__816) -> ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) (Frontend_dRast_dName.v_rnameKey dtb__814)) dtb__815) dtb__816) dtb__813)) (fun (p : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__817; B_dData_dPair.f_Pair_second = dtb__818 } -> (((((((((((v_elabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__818) mc4) mc5) mc6) mc7) mc8) dtb__811) (B_dData_dList.C_List__x58__x58_ (dtb__817, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PVar (dtb__819, dtb__820) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__811) mc10) dtb__813) dtb__819) dtb__820)
  | Frontend_dRast.C_Pat_PWild (dtb__821) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__811) mc10) dtb__813) "_") dtb__821)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__812)) Base_dDiagnostics_dTc.C_TcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc10); B_dData_dPair.f_Pair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 122 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCatchAllFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (pname : string) (psp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (if (pname = "_") then ctx else (((Elab_dTypes.v_ctxBindValue pname) scrutTy) ctx)) in (if (Elab_dMeta.v_nonEmpty rest) then ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast) else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__822; B_dData_dPair.f_Pair_second = dtb__823 } -> (let binds = (if (pname = "_") then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = pname; Core_dTerm.f_Binder_binderRig = ((Elab_dMeta.v_rigOfLinearValue ec) scrutTy); Core_dTerm.f_Binder_binderSpan = ((Base_dSource.v_spanAtName pname) psp) }, B_dData_dList.C_List_Nil))) in (let bodyTerm1 = (if (pname = "_") then dtb__822 else (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__823) ctx) scrutTy) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__822) else dtb__822)) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__823) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = binds; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }, acc))); B_dData_dPair.f_Pair_second = dtb__823 })))))
  | _ -> failwith "DT: impossible branch"
)))))))
# 152 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun (ps : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = ps in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__824; B_dData_dPair.f_Pair_second = dtb__825 } -> (match dtb__825 with
  | { B_dData_dPair.f_Pair_first = dtb__826; B_dData_dPair.f_Pair_second = dtb__827 } -> ((Base_dCommon.v_bind ((((v_resolveOverAlts dtb__827) ctx) dtb__826) alts)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__828; B_dData_dPair.f_Pair_second = dtb__829 } -> ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__829) dtb__828)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> (if (v_needsMatrixCase dtb__828) then ((((((((v_checkCaseMatrixFuel (fuel - 1)) globals) ctx) ec3) scrut) dtb__828) expected) sp) else (((((((((v_checkCaseFamFuel (fuel - 1)) globals) ctx) ec3) dtb__824) dtb__826) dtb__828) expected) sp))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 178 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseMatrixFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let name = ("nd_scrut" ^ (bi_strFromInt (Elab_dTypes.v_ctxDepth ctx))) in (let clauses = ((B_dData_dList.v_map (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf alt) })) alts) in (let table = (Elab_dMeta.v_ctorFamilyTable ec) in ((Base_dCommon.v_bind (((Elab_dMatch.v_multiToCaseExpr table) clauses) name)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf clauses))) sp) ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PVar (name, sp)); B_dData_dPair.f_Pair_second = scrut }, B_dData_dList.C_List_Nil)), bodyExpr, false, sp))) expected)))))))))
# 189 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFamFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) scrutTy) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VNeutral (dtb__830) -> (match dtb__830 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__831, dtb__832) -> (if (if (Base_dIntrinsics.v_isBoolCanonical dtb__831) then ((B_dData_dList.v_length dtb__832) = 0) else false) then ((((((((v_checkBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__831 = Base_dIntrinsics.v_natTypeName) then (if (v_natLitCaseAlts alts) then ((((((((((v_checkNatLitCaseFuel (fuel - 1)) globals) ctx) ec) (v_natToIntTerm scrutTerm)) scrutTerm) v_natTyValue) alts) expected) sp) else (((((((((((v_checkCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__831) dtb__832) alts) expected) sp)) else (if (dtb__831 = "Int") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__831 = "String") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_checkCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__831) dtb__832) alts) expected) sp)))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
))))
# 208 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkBoolCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) ec) alts) Base_dIntrinsics.v_boolTrueCtor) expected) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__833; B_dData_dPair.f_Pair_second = dtb__834 } -> (match dtb__834 with
  | { B_dData_dPair.f_Pair_first = dtb__835; B_dData_dPair.f_Pair_second = dtb__836 } -> (match dtb__835 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__837) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__833, dtb__837)); B_dData_dPair.f_Pair_second = dtb__836 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) dtb__836) alts) Base_dIntrinsics.v_boolFalseCtor) expected) sp)) (fun (q : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__838; B_dData_dPair.f_Pair_second = dtb__839 } -> (match dtb__839 with
  | { B_dData_dPair.f_Pair_first = dtb__840; B_dData_dPair.f_Pair_second = dtb__841 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__833, dtb__838)); B_dData_dPair.f_Pair_second = dtb__841 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 228 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (target : string) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((((((v_boolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) B_dData_dMaybe.C_Maybe_Nothing)))
# 235 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) (mc8 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__842, dtb__843) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__842 with
  | { B_dData_dPair.f_Pair_first = dtb__844; B_dData_dPair.f_Pair_second = dtb__845 } -> (match dtb__844 with
  | Frontend_dRast.C_Pat_PCon (dtb__846, dtb__847, dtb__848) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__846) = mc5) then ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__845) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__849; B_dData_dPair.f_Pair_second = dtb__850 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__849; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc8; B_dData_dPair.f_Pair_second = dtb__850 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__843) mc5) mc6) mc7) mc8))
  | Frontend_dRast.C_Pat_PVar (dtb__851, dtb__852) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__845) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__853; B_dData_dPair.f_Pair_second = dtb__854 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__854) dtb__843) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__853)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__855) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__845) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__856; B_dData_dPair.f_Pair_second = dtb__857 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__857) dtb__843) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__856)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__844)) Base_dDiagnostics_dTc.C_TcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match mc8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__858) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__858; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc3 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc7) (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive ((Frontend_dRast.v_ctorDisplayName mc5)))) (Frontend_dRast.v_ctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 275 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__859; B_dData_dPair.f_Pair_second = dtb__860 } -> (match dtb__860 with
  | { B_dData_dPair.f_Pair_first = dtb__861; B_dData_dPair.f_Pair_second = dtb__862 } -> (if dtb__861 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__859; B_dData_dPair.f_Pair_second = dtb__862 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 289 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : string) (mc6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__863, dtb__864) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__863 with
  | { B_dData_dPair.f_Pair_first = dtb__865; B_dData_dPair.f_Pair_second = dtb__866 } -> (match dtb__865 with
  | Frontend_dRast.C_Pat_PInt (dtb__867, dtb__868) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TInt (dtb__867))) dtb__866) dtb__864) mc7) mc8)
  | Frontend_dRast.C_Pat_PStr (dtb__869, dtb__870) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TStr (dtb__869))) dtb__866) dtb__864) mc7) mc8)
  | Frontend_dRast.C_Pat_PVar (dtb__871, dtb__872) -> ((Base_dCommon.v_bind (((((((((((v_checkLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__871) dtb__866) mc7) ((Base_dSource.v_spanAtName dtb__871) dtb__872)) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__873; B_dData_dPair.f_Pair_second = dtb__874 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__873; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__874 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__875) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__866) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__876; B_dData_dPair.f_Pair_second = dtb__877 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__876; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__877 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__865)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 316 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_litAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__878; B_dData_dPair.f_Pair_second = dtb__879 } -> ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) dtb__879) scrutTerm) tyName) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = q in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__880; B_dData_dPair.f_Pair_second = dtb__881 } -> (match dtb__881 with
  | { B_dData_dPair.f_Pair_first = dtb__882; B_dData_dPair.f_Pair_second = dtb__883 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_litEqName tyName))), scrutTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__878, dtb__880)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__882; B_dData_dPair.f_Pair_second = dtb__883 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 333 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__884; B_dData_dPair.f_Pair_second = dtb__885 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__884)), scrutTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__885 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 363 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__886; B_dData_dPair.f_Pair_second = dtb__887 } -> (match dtb__887 with
  | { B_dData_dPair.f_Pair_first = dtb__888; B_dData_dPair.f_Pair_second = dtb__889 } -> (if dtb__888 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__886; B_dData_dPair.f_Pair_second = dtb__889 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 375 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : Core_dTerm.t_Term) (mc6 : Core_dTerm.t_Value) (mc7 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc8 : Core_dTerm.t_Value) (mc9 : Base_dSource.t_Span) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__890, dtb__891) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__890 with
  | { B_dData_dPair.f_Pair_first = dtb__892; B_dData_dPair.f_Pair_second = dtb__893 } -> (match dtb__892 with
  | Frontend_dRast.C_Pat_PInt (dtb__894, dtb__895) -> ((((((((((((v_natLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Core_dTerm.C_Term_TInt (dtb__894))) dtb__893) dtb__891) mc8) mc9)
  | Frontend_dRast.C_Pat_PVar (dtb__896, dtb__897) -> ((Base_dCommon.v_bind (((((((((((v_checkNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__896) dtb__893) mc8) ((Base_dSource.v_spanAtName dtb__896) dtb__897)) mc9)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__898; B_dData_dPair.f_Pair_second = dtb__899 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__898; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__899 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__900) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__893) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__901; B_dData_dPair.f_Pair_second = dtb__902 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__901; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__902 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__892)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 400 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_natLitAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__903; B_dData_dPair.f_Pair_second = dtb__904 } -> ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__904) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = q in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__905; B_dData_dPair.f_Pair_second = dtb__906 } -> (match dtb__906 with
  | { B_dData_dPair.f_Pair_first = dtb__907; B_dData_dPair.f_Pair_second = dtb__908 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("bi_eq_int")), cmpTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__903, dtb__905)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__907; B_dData_dPair.f_Pair_second = dtb__908 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 416 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) binderTy) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) binderTy) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__909; B_dData_dPair.f_Pair_second = dtb__910 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__909)), bindTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__910 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 430 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseOfFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (fam : string) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
  | B_dData_dMaybe.C_Maybe_Just (dtb__911) -> ((Base_dCommon.v_bind (((((((((((v_elabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__911) idxs) ((Elab_dTypes.v_evalCtx ctx) scrutTerm)) expected) alts) B_dData_dList.C_List_Nil)) (fun (p : (Core_dTerm.t_CaseAlt B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__912; B_dData_dPair.f_Pair_second = dtb__913 } -> (((((((((Elab_dCase.v_checkCaseDone dtb__913) ctx) dtb__911) idxs) alts) expected) sp) scrutTerm) dtb__912)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 446 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferCaseEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let pmeta = (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__914; B_dData_dPair.f_Pair_second = dtb__915 } -> (let metaTy = ((Elab_dTypes.v_evalCtx ctx) dtb__914) in ((Base_dCommon.v_bind ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) dtb__915) scrut) alts) metaTy) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = dtb__917 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = metaTy; B_dData_dPair.f_Pair_second = dtb__917 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 466 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCondBoolFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (c : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) c) Elab_dPrelude.v_boolTyValue) with
  | Base_dDiag.C_Check_OkC (dtb__918) -> (Base_dDiag.C_Check_OkC (dtb__918))
  | Base_dDiag.C_Check_ErrC (dtb__919) -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pc in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__920; B_dData_dPair.f_Pair_second = dtb__921 } -> (match dtb__921 with
  | { B_dData_dPair.f_Pair_first = dtb__922; B_dData_dPair.f_Pair_second = dtb__923 } -> (if (Elab_dMeta.v_isBoolType dtb__922) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__920; B_dData_dPair.f_Pair_second = dtb__923 })) else ((Elab_dTypes.v_errAt sp) (String.concat "" ["if condition must be "; Base_dIntrinsics.v_boolTypeName; " (got "; ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__922); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 740 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__924) -> ((Base_dCommon.v_bind ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr) with
  | Base_dDiag.C_Check_OkC (dtb__925) -> (Base_dDiag.C_Check_OkC (dtb__925))
  | Base_dDiag.C_Check_ErrC (dtb__926) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr2) with
  | Base_dDiag.C_Check_OkC (dtb__927) -> (Base_dDiag.C_Check_OkC (dtb__927))
  | Base_dDiag.C_Check_ErrC (dtb__928) -> ((Base_dCommon.v_bind ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr3) with
  | Base_dDiag.C_Check_OkC (dtb__929) -> (Base_dDiag.C_Check_OkC (dtb__929))
  | Base_dDiag.C_Check_ErrC (dtb__930) -> (Base_dDiag.C_Check_ErrC (dtb__926))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut6 = (v_performOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__931) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__932) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) Base_dIntrinsics.v_listFamilyName) dtb__932) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__933) -> (match dtb__933 with
  | { B_dData_dPair.f_Pair_first = dtb__934; B_dData_dPair.f_Pair_second = dtb__935 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__934)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = p in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__936; B_dData_dPair.f_Pair_second = dtb__937 } -> (match dtb__937 with
  | { B_dData_dPair.f_Pair_first = dtb__938; B_dData_dPair.f_Pair_second = dtb__939 } -> ((Base_dCommon.v_bind (((((v_performCallExpr globals) dtb__939) dtb__938) dtb__934) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__939) callExpr)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 782 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCore = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__940) -> ((Base_dCommon.v_bind (((((v_inferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__940)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__941) -> (Base_dDiag.C_Check_OkC (dtb__941))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) (v_doChainFallback dtb__940))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 800 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EAnn (dtb__942, dtb__943, dtb__944) -> (((((((v_inferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__942) dtb__943) dtb__944)
  | Frontend_dRast.C_Expr_EDo (dtb__945, dtb__946) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__946) Base_dDiagnostics_dTc.C_TcErr_DoUnsupported)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__947, dtb__948, dtb__949) -> (((((((v_elabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__947) dtb__948) dtb__949)
  | Frontend_dRast.C_Expr_ERecord (dtb__950, dtb__951, dtb__952) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__952) Base_dDiagnostics_dTc.C_TcErr_RecordsUnsupported)
  | Frontend_dRast.C_Expr_EField (dtb__953, dtb__954, dtb__955) -> (((((((v_elabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__953) dtb__954) dtb__955)
  | Frontend_dRast.C_Expr_ECase (dtb__956, dtb__957, dtb__958) -> (((((((v_inferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__956) dtb__957) dtb__958)
  | Frontend_dRast.C_Expr_ELocalFun (dtb__959, dtb__960) -> (if (v_clausesHaveOverCtor dtb__959) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__960) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__959, dtb__960)))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Frontend_dRast.C_Expr_ELet (dtb__961, dtb__962, dtb__963, dtb__964) -> ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) ec) dtb__961) dtb__962) dtb__963) dtb__964)
  | Frontend_dRast.C_Expr_EIf (dtb__965, dtb__966, dtb__967, dtb__968) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__965) dtb__968)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__969; B_dData_dPair.f_Pair_second = dtb__970 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__970) dtb__966)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pt in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__971; B_dData_dPair.f_Pair_second = dtb__972 } -> (match dtb__972 with
  | { B_dData_dPair.f_Pair_first = dtb__973; B_dData_dPair.f_Pair_second = dtb__974 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__974) dtb__967)) (fun (pe : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pe in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__975; B_dData_dPair.f_Pair_second = dtb__976 } -> (match dtb__976 with
  | { B_dData_dPair.f_Pair_first = dtb__977; B_dData_dPair.f_Pair_second = dtb__978 } -> (if (if ((v_isIntTy dtb__978) dtb__973) then ((v_isNatTy dtb__978) dtb__977) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__969, dtb__971, (v_natToIntTerm dtb__975))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__973; B_dData_dPair.f_Pair_second = dtb__978 } })) else (if (if ((v_isNatTy dtb__978) dtb__973) then ((v_isIntTy dtb__978) dtb__977) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__969, (v_natToIntTerm dtb__971), dtb__975)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__978 } })) else ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__978) (Elab_dTypes.v_ctxDepth ctx)) dtb__973) dtb__977)) (fun (ec4 : Elab_dTypes.t_Ec) -> (let branchOpaque = (((Elab_dMeta.v_isOpaqueRuntimeTyIn ec4) ctx) dtb__973) in (let tTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__971) else dtb__971) in (let eTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__975) else dtb__975) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__969, tTerm2, eTerm2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__973; B_dData_dPair.f_Pair_second = ec4 } })))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Expr_ELam (dtb__979, dtb__980, dtb__981) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__981) Base_dDiagnostics_dTc.C_TcErr_LambdaNoSignature)
  | Frontend_dRast.C_Expr_EApp (dtb__982, dtb__983, dtb__984) -> (match dtb__982 with
  | Frontend_dRast.C_Expr_EVar (dtb__985, dtb__986) -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__985)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__984) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__985)) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__984) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName ((Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__985)), (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__985)))))) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__985))) (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__985)))) else ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__985, dtb__986))) dtb__983) dtb__984) B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__982) dtb__983) dtb__984) B_dData_dMaybe.C_Maybe_Nothing)
)
  | Frontend_dRast.C_Expr_EPi (dtb__987, dtb__988, dtb__989, dtb__990, dtb__991, dtb__992) -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) dtb__987) dtb__988) dtb__989) dtb__990) dtb__991) dtb__992)
  | Frontend_dRast.C_Expr_EFloat (dtb__993, dtb__994) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__993)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EStr (dtb__995, dtb__996) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__995)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("String", B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EInt (dtb__997, dtb__998) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb__997)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("Int", B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EVar (dtb__999, dtb__1000) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__999) = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc Core_dTerm.v_levelZero))); B_dData_dPair.f_Pair_second = ec } })) else (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__999)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1000) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__999)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1000) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__999))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__999)))) (fun (t : string) -> (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) t) dtb__1000))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__999)) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__1000) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName ((Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__999)), (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__999)))))) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__999))) (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__999)))) else (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__999)) dtb__1000)))))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))))
# 1059 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabEFieldFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fname : string) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1001; B_dData_dPair.f_Pair_second = dtb__1002 } -> (match dtb__1002 with
  | { B_dData_dPair.f_Pair_first = dtb__1003; B_dData_dPair.f_Pair_second = dtb__1004 } -> (match ((v_recordTypeOf dtb__1004) dtb__1003) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1005) -> ((Base_dCommon.v_bind ((((v_recordFieldPlan dtb__1004) dtb__1003) fname) sp)) (fun (plan : t_FieldAccessPlan) -> (let arity = (B_dData_dList.v_length ((plan).f_FieldAccessPlan_planData).Elab_dTypes.f_DtData_dtDataParams) in (let tele = ((B_dData_dList.v_drop arity) (Elab_dTypes.v_dtCtorTelescope (plan).f_FieldAccessPlan_planCtor)) in (let proj = (Core_dTerm.C_Term_TProj (dtb__1001, (Elab_dTypes.v_dtCtorName (plan).f_FieldAccessPlan_planCtor), tele, (arity + (plan).f_FieldAccessPlan_planField), (plan).f_FieldAccessPlan_planField)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (plan).f_FieldAccessPlan_planType; B_dData_dPair.f_Pair_second = dtb__1004 } })))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_hasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__1004) dtb__1001) dtb__1003) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1085 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabERecUpdateFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fields with
  | B_dData_dList.C_List_Nil -> ((Elab_dTypes.v_errAt sp) "record update needs at least one field")
  | _ -> (if (Elab_dRecords.v_hasDuplicateFieldNames fields) then ((Elab_dTypes.v_errAt sp) "duplicate field in record update") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1006; B_dData_dPair.f_Pair_second = dtb__1007 } -> (match dtb__1007 with
  | { B_dData_dPair.f_Pair_first = dtb__1008; B_dData_dPair.f_Pair_second = dtb__1009 } -> ((Base_dCommon.v_bind ((((v_recordUpdatePlan dtb__1009) dtb__1008) fields) sp)) (fun (plan : t_UpdateAccessPlan) -> (let body = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)), sp)), (plan).f_UpdateAccessPlan_upBodyArgs, sp)) in ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (fuel - 1)) globals) ctx) dtb__1009) (plan).f_UpdateAccessPlan_upData) (plan).f_UpdateAccessPlan_upIdxs) ((Elab_dTypes.v_evalCtx ctx) dtb__1006)) dtb__1008) (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)) ((v_recordFieldPats (plan).f_UpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun (q : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1010; B_dData_dPair.f_Pair_second = dtb__1011 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb__1006, (dtb__1010).Core_dTerm.f_CaseAlt_caseAltName, (Core_dTerm.v_binderPairs (dtb__1010).Core_dTerm.f_CaseAlt_caseAltBinders), (plan).f_UpdateAccessPlan_upFieldIndices, (dtb__1010).Core_dTerm.f_CaseAlt_caseAltBody)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1008; B_dData_dPair.f_Pair_second = dtb__1011 } }))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
)))
# 1114 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAnnFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pt in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1012; B_dData_dPair.f_Pair_second = dtb__1013 } -> (match dtb__1013 with
  | { B_dData_dPair.f_Pair_first = dtb__1014; B_dData_dPair.f_Pair_second = dtb__1015 } -> (let tyVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1012) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1015) value) tyVal)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1016; B_dData_dPair.f_Pair_second = dtb__1017 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1016; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyVal; B_dData_dPair.f_Pair_second = dtb__1017 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1132 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferPiFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (implicit : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dom : Frontend_dRast.t_Expr) (cod : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun (pd : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pd in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1018; B_dData_dPair.f_Pair_second = dtb__1019 } -> (match dtb__1019 with
  | { B_dData_dPair.f_Pair_first = dtb__1020; B_dData_dPair.f_Pair_second = dtb__1021 } -> (let domVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1018) in (let isTypeDom = (Elab_dMeta.v_isTypeDomain domVal) in (let isLinDom = ((Elab_dMeta.v_isLinearType ec) domVal) in (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__1018) ctx) in (let badQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1027) -> (if implicit then true else isTypeDom)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (let badLinQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1026) -> (if (Frontend_dAst.v_qtyIsZero dtb__1026) then isLinDom else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (if badQty then (if implicit then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityImplicit (name))) name) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearTypeNeedsOne (name))) name) else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx2) dtb__1021) cod)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut28 = pc in (match nd_uscrut28 with
  | { B_dData_dPair.f_Pair_first = dtb__1022; B_dData_dPair.f_Pair_second = dtb__1023 } -> (match dtb__1023 with
  | { B_dData_dPair.f_Pair_first = dtb__1024; B_dData_dPair.f_Pair_second = dtb__1025 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (name, implicit, (if isLinDom then Core_dTerm.C_Rig_Rig1 else (if implicit then ((Elab_dMeta.v_implicitBinderRig ec) domVal) else (((Elab_dMeta.v_rigOfQty false) isTypeDom) qty))), dtb__1018, dtb__1022)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType (((Core_dTerm.v_levelMax dtb__1020) dtb__1024))); B_dData_dPair.f_Pair_second = dtb__1025 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1196 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = fn in (match nd_uscrut8 with
  | Frontend_dRast.C_Expr_EVar (dtb__1028, dtb__1029) -> (match dtb__1028 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1030) -> (if (dtb__1030 = "->") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1031, dtb__1032) -> (match dtb__1032 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1033, dtb__1034) -> (match dtb__1034 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) B_dData_dMaybe.C_Maybe_Nothing) dtb__1031) dtb__1033) sp)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)) else (if (dtb__1030 = "Type") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1035, dtb__1036) -> (match dtb__1035 with
  | Frontend_dRast.C_Expr_EInt (dtb__1037, dtb__1038) -> (match dtb__1036 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1037 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1038) Base_dDiagnostics_dTc.C_TcErr_UniverseLevelNonNegative) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb__1037))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc (Core_dTerm.v_levelOfInt dtb__1037)))); B_dData_dPair.f_Pair_second = ec } })))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1029) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1029) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1029) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)) else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1039, dtb__1040) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1039)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1040) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1039))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1039)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1040))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1039)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1041) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1039)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1042) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1042))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1043; B_dData_dPair.f_Pair_second = dtb__1044 } -> (match dtb__1044 with
  | { B_dData_dPair.f_Pair_first = dtb__1045; B_dData_dPair.f_Pair_second = dtb__1046 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1046) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1039)))) dtb__1043); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1045; B_dData_dPair.f_Pair_second = dtb__1046 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1039)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1047) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1039)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1047)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1048; B_dData_dPair.f_Pair_second = dtb__1049 } -> (match dtb__1049 with
  | { B_dData_dPair.f_Pair_first = dtb__1050; B_dData_dPair.f_Pair_second = dtb__1051 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1051) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1039)))) dtb__1048); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1050; B_dData_dPair.f_Pair_second = dtb__1051 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1039)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1052) -> (Base_dDiag.C_Check_OkC (dtb__1052))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1047)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = pa in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1053; B_dData_dPair.f_Pair_second = dtb__1054 } -> (match dtb__1054 with
  | { B_dData_dPair.f_Pair_first = dtb__1055; B_dData_dPair.f_Pair_second = dtb__1056 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1056) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1039)))) dtb__1053); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1055; B_dData_dPair.f_Pair_second = dtb__1056 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1039)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1057) -> (Base_dDiag.C_Check_OkC (dtb__1057))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1040) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1039)))) (Frontend_dRast_dName.v_rnameKey dtb__1039))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
  | _ -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1058, dtb__1059) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1058)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1059) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1058))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1058)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1059))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1058)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1060) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1058)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1061) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1061))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pa in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1062; B_dData_dPair.f_Pair_second = dtb__1063 } -> (match dtb__1063 with
  | { B_dData_dPair.f_Pair_first = dtb__1064; B_dData_dPair.f_Pair_second = dtb__1065 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1065) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1058)))) dtb__1062); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1064; B_dData_dPair.f_Pair_second = dtb__1065 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1058)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1066) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1058)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1066)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1067; B_dData_dPair.f_Pair_second = dtb__1068 } -> (match dtb__1068 with
  | { B_dData_dPair.f_Pair_first = dtb__1069; B_dData_dPair.f_Pair_second = dtb__1070 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1070) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1058)))) dtb__1067); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1069; B_dData_dPair.f_Pair_second = dtb__1070 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1058)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1071) -> (Base_dDiag.C_Check_OkC (dtb__1071))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1066)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = pa in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1072; B_dData_dPair.f_Pair_second = dtb__1073 } -> (match dtb__1073 with
  | { B_dData_dPair.f_Pair_first = dtb__1074; B_dData_dPair.f_Pair_second = dtb__1075 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1075) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1058)))) dtb__1072); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1074; B_dData_dPair.f_Pair_second = dtb__1075 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1058)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1076) -> (Base_dDiag.C_Check_OkC (dtb__1076))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1059) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1058)))) (Frontend_dRast_dName.v_rnameKey dtb__1058))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)
)
  | _ -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1077, dtb__1078) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1077)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1078) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1077))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1077)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1078))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1077)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1079) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1077)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1080) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1080))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1081; B_dData_dPair.f_Pair_second = dtb__1082 } -> (match dtb__1082 with
  | { B_dData_dPair.f_Pair_first = dtb__1083; B_dData_dPair.f_Pair_second = dtb__1084 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1084) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1077)))) dtb__1081); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1083; B_dData_dPair.f_Pair_second = dtb__1084 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1077)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1085) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1077)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1085)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1086; B_dData_dPair.f_Pair_second = dtb__1087 } -> (match dtb__1087 with
  | { B_dData_dPair.f_Pair_first = dtb__1088; B_dData_dPair.f_Pair_second = dtb__1089 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1089) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1077)))) dtb__1086); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1088; B_dData_dPair.f_Pair_second = dtb__1089 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1077)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1090) -> (Base_dDiag.C_Check_OkC (dtb__1090))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1085)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1091; B_dData_dPair.f_Pair_second = dtb__1092 } -> (match dtb__1092 with
  | { B_dData_dPair.f_Pair_first = dtb__1093; B_dData_dPair.f_Pair_second = dtb__1094 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1094) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1077)))) dtb__1091); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1093; B_dData_dPair.f_Pair_second = dtb__1094 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1077)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1095) -> (Base_dDiag.C_Check_OkC (dtb__1095))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1078) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1077)))) (Frontend_dRast_dName.v_rnameKey dtb__1077))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)
))))
# 1266 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1096, dtb__1097) -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1096)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1098) -> (Base_dDiag.C_Check_OkC (dtb__1098))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1281 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun (pf : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pf in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1099; B_dData_dPair.f_Pair_second = dtb__1100 } -> (match dtb__1100 with
  | { B_dData_dPair.f_Pair_first = dtb__1101; B_dData_dPair.f_Pair_second = dtb__1102 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1102) dtb__1101) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1103; B_dData_dPair.f_Pair_second = dtb__1104 } -> (match dtb__1104 with
  | { B_dData_dPair.f_Pair_first = dtb__1105; B_dData_dPair.f_Pair_second = dtb__1106 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1106)) dtb__1099) dtb__1103); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1105; B_dData_dPair.f_Pair_second = dtb__1106 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1297 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((v_inferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1452 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal ec) ty) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__1107, dtb__1108, dtb__1109, dtb__1110, dtb__1111) -> (if dtb__1108 then (if ((Elab_dDict.v_isDictDomain ec) dtb__1110) then (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dtb__1110) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1110) dtb__1111) args) sp) hint) else ((Base_dCommon.v_bind (((((((v_constrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1110) args) sp)) (fun (ec0 : Elab_dTypes.t_Ec) -> (let nd_uscrut15 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1110)) sp) in (match nd_uscrut15 with
  | Base_dDiag.C_Check_ErrC (dtb__1112) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec0)) ((Elab_dTypes.v_forceVal ec0) dtb__1110)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1110) dtb__1111) args) sp) hint) else (if ((Elab_dDict.v_isRigidDictArg ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1110)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1110) dtb__1111) args) sp) hint) else (Base_dDiag.C_Check_ErrC (dtb__1112))))
  | Base_dDiag.C_Check_OkC (dtb__1113) -> (match dtb__1113 with
  | { B_dData_dPair.f_Pair_first = dtb__1114; B_dData_dPair.f_Pair_second = dtb__1115 } -> (let ty2 = ((Core_dEval.v_applyClosure dtb__1111) ((Elab_dTypes.v_evalCtx ctx) dtb__1114)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1115) ty2) args) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = q in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1116; B_dData_dPair.f_Pair_second = dtb__1117 } -> (match dtb__1117 with
  | { B_dData_dPair.f_Pair_first = dtb__1118; B_dData_dPair.f_Pair_second = dtb__1119 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1114; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1116)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1118; B_dData_dPair.f_Pair_second = dtb__1119 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) else (if ((Elab_dDict.v_isMemberDomain ec) dtb__1110) then (match ((((Elab_dDict.v_memberLookup 64) (Elab_dTypes.v_ctxDepth ctx)) ec) dtb__1110) with
  | Elab_dDict.C_MemberLookup_MemberFound (dtb__1120, dtb__1121) -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1121) ((Core_dEval.v_applyClosure dtb__1111) dtb__1120)) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = p in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1122; B_dData_dPair.f_Pair_second = dtb__1123 } -> (match dtb__1123 with
  | { B_dData_dPair.f_Pair_first = dtb__1124; B_dData_dPair.f_Pair_second = dtb__1125 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) dtb__1120); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1122)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1124; B_dData_dPair.f_Pair_second = dtb__1125 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Elab_dDict.C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | Elab_dDict.C_MemberLookup_MemberAmbiguous (dtb__1126) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1127; B_dData_dPair.f_Pair_second = dtb__1128 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1128) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1110) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1111) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1127))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = p in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1129; B_dData_dPair.f_Pair_second = dtb__1130 } -> (match dtb__1130 with
  | { B_dData_dPair.f_Pair_first = dtb__1131; B_dData_dPair.f_Pair_second = dtb__1132 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1127; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1129)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1131; B_dData_dPair.f_Pair_second = dtb__1132 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | Elab_dDict.C_MemberLookup_MemberStuck -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1133; B_dData_dPair.f_Pair_second = dtb__1134 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1134) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1110) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1111) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1133))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = p in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1135; B_dData_dPair.f_Pair_second = dtb__1136 } -> (match dtb__1136 with
  | { B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = dtb__1138 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1133; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1135)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = dtb__1138 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__1110) then (if ((Elab_dMeta.v_isStringImplicitDomain ec) dtb__1110) then (match args with
  | B_dData_dList.C_List__x58__x58_ (dtb__1139, dtb__1140) -> (match (v_instArgOperand dtb__1139) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1141) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1141) dtb__1110)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1142; B_dData_dPair.f_Pair_second = dtb__1143 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1143) ((Core_dEval.v_applyClosure dtb__1111) ((Elab_dTypes.v_evalCtx ctx) dtb__1142))) dtb__1140) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut25 = q in (match nd_uscrut25 with
  | { B_dData_dPair.f_Pair_first = dtb__1144; B_dData_dPair.f_Pair_second = dtb__1145 } -> (match dtb__1145 with
  | { B_dData_dPair.f_Pair_first = dtb__1146; B_dData_dPair.f_Pair_second = dtb__1147 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1142; B_dData_dPair.f_Pair_second = dtb__1109 }, dtb__1144)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1146; B_dData_dPair.f_Pair_second = dtb__1147 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1148; B_dData_dPair.f_Pair_second = dtb__1149 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1149) ((Core_dEval.v_applyClosure dtb__1111) ((Elab_dTypes.v_evalCtx ctx) dtb__1148))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut23 = p in (match nd_uscrut23 with
  | { B_dData_dPair.f_Pair_first = dtb__1150; B_dData_dPair.f_Pair_second = dtb__1151 } -> (match dtb__1151 with
  | { B_dData_dPair.f_Pair_first = dtb__1152; B_dData_dPair.f_Pair_second = dtb__1153 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1148; B_dData_dPair.f_Pair_second = dtb__1109 }, dtb__1150)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1152; B_dData_dPair.f_Pair_second = dtb__1153 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1154; B_dData_dPair.f_Pair_second = dtb__1155 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1155) ((Core_dEval.v_applyClosure dtb__1111) ((Elab_dTypes.v_evalCtx ctx) dtb__1154))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = p in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1156; B_dData_dPair.f_Pair_second = dtb__1157 } -> (match dtb__1157 with
  | { B_dData_dPair.f_Pair_first = dtb__1158; B_dData_dPair.f_Pair_second = dtb__1159 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1154; B_dData_dPair.f_Pair_second = dtb__1109 }, dtb__1156)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1158; B_dData_dPair.f_Pair_second = dtb__1159 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1160; B_dData_dPair.f_Pair_second = dtb__1161 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1161) ((Core_dEval.v_applyClosure dtb__1111) ((Elab_dTypes.v_evalCtx ctx) dtb__1160))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = p in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1162; B_dData_dPair.f_Pair_second = dtb__1163 } -> (match dtb__1163 with
  | { B_dData_dPair.f_Pair_first = dtb__1164; B_dData_dPair.f_Pair_second = dtb__1165 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1160; B_dData_dPair.f_Pair_second = dtb__1109 }, dtb__1162)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1164; B_dData_dPair.f_Pair_second = dtb__1165 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)))) else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = forced; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__1166, dtb__1167) -> (let ec0 = (let nd_uscrut17 = hint in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1174) -> (match dtb__1174 with
  | { B_dData_dPair.f_Pair_first = dtb__1175; B_dData_dPair.f_Pair_second = dtb__1176 } -> (match (((((v_tryUseHint dtb__1175) ctx) dtb__1176) ec) forced) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1177) -> dtb__1177
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | _ -> failwith "DT: impossible branch"
)) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec0) sp) dtb__1107) dtb__1109) dtb__1110)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((v_expandArgListLit ec0) dtb__1110) dtb__1166)) (fun (a2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1110)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1168; B_dData_dPair.f_Pair_second = dtb__1169 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1169) ((Core_dEval.v_applyClosure dtb__1111) ((Elab_dTypes.v_evalCtx ctx) dtb__1168))) dtb__1167) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = q in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1170; B_dData_dPair.f_Pair_second = dtb__1171 } -> (match dtb__1171 with
  | { B_dData_dPair.f_Pair_first = dtb__1172; B_dData_dPair.f_Pair_second = dtb__1173 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1168; B_dData_dPair.f_Pair_second = argRig }, dtb__1170)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1172; B_dData_dPair.f_Pair_second = dtb__1173 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = forced; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__1178, dtb__1179) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_exprSpan dtb__1178)) Base_dDiagnostics_dTc.C_TcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
))))
# 1589 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_deferDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1180; B_dData_dPair.f_Pair_second = dtb__1181 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ((((((Elab_dTypes.v_ecAddConstraint dtb__1181) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__1181) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx))) ((Core_dEval.v_applyClosure clo) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1180))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1182; B_dData_dPair.f_Pair_second = dtb__1183 } -> (match dtb__1183 with
  | { B_dData_dPair.f_Pair_first = dtb__1184; B_dData_dPair.f_Pair_second = dtb__1185 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1180; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1182)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1184; B_dData_dPair.f_Pair_second = dtb__1185 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1607 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dom : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dDict.v_dictClassArg ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1186) -> (match ((Elab_dDict.v_dictArgKind ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1187) -> (let nd_uscrut11 = dtb__1186 in (match nd_uscrut11 with
  | Core_dTerm.C_Value_VMeta (dtb__1188, dtb__1189) -> (match dtb__1189 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1186) dtb__1187) args) sp)) (fun (ecProbe : Elab_dTypes.t_Ec) -> (match ((Core_dTerm.v_metaLookup dtb__1188) (Elab_dTypes.v_ecSolTbl ecProbe)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1190) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) dtb__1188) B_dData_dList.C_List_Nil) dtb__1190) with
  | Base_dDiag.C_Check_OkC (dtb__1191) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__1191))))
  | Base_dDiag.C_Check_ErrC (dtb__1192) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1186) dtb__1187) args) sp)
)
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1186) dtb__1187) args) sp)
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1635 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomGoKFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (argTy : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dList.C_List__x58__x58_ (dtb__1193, dtb__1194) -> (let nd_uscrut11 = (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1193) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__1195) -> (match dtb__1195 with
  | { B_dData_dPair.f_Pair_first = dtb__1196; B_dData_dPair.f_Pair_second = dtb__1197 } -> (match dtb__1197 with
  | { B_dData_dPair.f_Pair_first = dtb__1198; B_dData_dPair.f_Pair_second = dtb__1199 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1199) dtb__1198) in (if (Core_dTerm.v_isTypeValue forced) then ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1199) ctx) argTy) argKind) dtb__1194) sp) else (if (((((Elab_dDict.v_argHeadMatchesKind globals) dtb__1199) ctx) forced) argKind) then (match ((((Elab_dMeta.v_convEc dtb__1199) (Elab_dTypes.v_ctxDepth ctx)) argTy) (Elab_dDict.v_neutralHeadOrSelf forced)) with
  | Base_dDiag.C_Check_OkC (dtb__1200) -> (Base_dDiag.C_Check_OkC (dtb__1200))
  | Base_dDiag.C_Check_ErrC (dtb__1201) -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1199) ctx) argTy) argKind) dtb__1194) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1199) ctx) argTy) argKind) dtb__1194) sp))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1202) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1767 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1203) -> ((((((((v_specializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1203) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1777 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = args in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1204, dtb__1205) -> (match dtb__1205 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1206, dtb__1207) -> (match dtb__1207 with
  | B_dData_dList.C_List_Nil -> (if ((v_isNatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1204) v_natTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1208; B_dData_dPair.f_Pair_second = dtb__1209 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1209) dtb__1206) v_natTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1210; B_dData_dPair.f_Pair_second = dtb__1211 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1208) dtb__1210); B_dData_dPair.f_Pair_second = dtb__1211 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isIntTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1204) v_intTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1212; B_dData_dPair.f_Pair_second = dtb__1213 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1213) dtb__1206) v_intTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1214; B_dData_dPair.f_Pair_second = dtb__1215 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1212) dtb__1214); B_dData_dPair.f_Pair_second = dtb__1215 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isFloatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1204) v_floatTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1216; B_dData_dPair.f_Pair_second = dtb__1217 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1217) dtb__1206) v_floatTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1218; B_dData_dPair.f_Pair_second = dtb__1219 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1216) dtb__1218); B_dData_dPair.f_Pair_second = dtb__1219 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 1823 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1220) -> (((((((v_specializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1220) args) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1833 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1221, dtb__1222) -> (match dtb__1222 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1223, dtb__1224) -> (match dtb__1224 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1221)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1225; B_dData_dPair.f_Pair_second = dtb__1226 } -> (match dtb__1226 with
  | { B_dData_dPair.f_Pair_first = dtb__1227; B_dData_dPair.f_Pair_second = dtb__1228 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1228) dtb__1223)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1229; B_dData_dPair.f_Pair_second = dtb__1230 } -> (match dtb__1230 with
  | { B_dData_dPair.f_Pair_first = dtb__1231; B_dData_dPair.f_Pair_second = dtb__1232 } -> (if (if ((v_isNatTy dtb__1232) dtb__1227) then ((v_isNatTy dtb__1232) dtb__1231) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1225) dtb__1229); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1232 } })))) else (if (if ((v_isIntTy dtb__1232) dtb__1227) then ((v_isIntTy dtb__1232) dtb__1231) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1225) dtb__1229); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1232 } })))) else (if (if ((v_isFloatTy dtb__1232) dtb__1227) then ((v_isFloatTy dtb__1232) dtb__1231) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1225) dtb__1229); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_floatTyValue; B_dData_dPair.f_Pair_second = dtb__1232 } })))) else (if (if ((v_isNatTy dtb__1232) dtb__1227) then ((v_isIntTy dtb__1232) dtb__1231) else false) then (match (v_isEIntExpr dtb__1223) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1233) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1223)) dtb__1233)) (fun (bNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1225) bNat); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1232 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) (v_natToIntTerm dtb__1225)) dtb__1229); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1232 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_isIntTy dtb__1232) dtb__1227) then ((v_isNatTy dtb__1232) dtb__1231) else false) then (match (v_isEIntExpr dtb__1221) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1234) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1221)) dtb__1234)) (fun (aNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) aNat) dtb__1229); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1232 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1225) (v_natToIntTerm dtb__1229)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1232 } }))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 1873 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1235) -> (let simpleComp = (let nd_uscrut8 = (v_handleOperand expr) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__1242) -> (match dtb__1242 with
  | { B_dData_dPair.f_Pair_first = dtb__1243; B_dData_dPair.f_Pair_second = dtb__1244 } -> (v_isSimpleComp dtb__1243)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let firstCall = (if simpleComp then ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in (let thirdCall = (if simpleComp then ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in ((Base_dCommon.v_bind firstCall) (fun (callExpr : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1236) -> (Base_dDiag.C_Check_OkC (dtb__1236))
  | Base_dDiag.C_Check_ErrC (dtb__1237) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1238) -> (Base_dDiag.C_Check_OkC (dtb__1238))
  | Base_dDiag.C_Check_ErrC (dtb__1239) -> ((Base_dCommon.v_bind thirdCall) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match ((Base_dObs.v_obsCheck "vuna.elab.term.retry-third") (fun (_u : int) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Base_dDiag.C_Check_OkC (dtb__1240) -> (Base_dDiag.C_Check_OkC (dtb__1240))
  | Base_dDiag.C_Check_ErrC (dtb__1241) -> (Base_dDiag.C_Check_ErrC (dtb__1237))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1245) -> ((Base_dObs.v_obsCheck "vuna.elab.term.infer") (fun (_u : int) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1246) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1247) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) expected))) dtb__1247) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dObs.v_obsDefCheckAt 3) "vuna.elab.term.core") (v_exprFormName expr)) (fun (_u : int) -> ((((((v_checkEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1960 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRow = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1248) -> ((Base_dCommon.v_bind ((((((v_checkDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1248) expected)) (fun (r : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1249) -> (Base_dDiag.C_Check_OkC (dtb__1249))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) (v_doChainFallback dtb__1248)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 2041 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EAnn (dtb__1250, dtb__1251, dtb__1252) -> ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1251)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pt in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1253; B_dData_dPair.f_Pair_second = dtb__1254 } -> (match dtb__1254 with
  | { B_dData_dPair.f_Pair_first = dtb__1255; B_dData_dPair.f_Pair_second = dtb__1256 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1256) dtb__1250) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1253))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__1257, dtb__1258) -> (if (v_clausesHaveOverCtor dtb__1257) then ((Base_dCommon.v_bind ((((v_resolveOverFunPats ec) ctx) expected) dtb__1257)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__1259; B_dData_dPair.f_Pair_second = dtb__1260 } -> ((Base_dCommon.v_bind ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable dtb__1260)) dtb__1259)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1260) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__1257, dtb__1258)))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Frontend_dRast.C_Expr_ELet (dtb__1261, dtb__1262, dtb__1263, dtb__1264) -> (((((((((v_checkLetFuel (fuel - 1)) globals) ctx) ec) dtb__1261) dtb__1262) dtb__1263) expected) dtb__1264)
  | Frontend_dRast.C_Expr_ECase (dtb__1265, dtb__1266, dtb__1267) -> ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1265) dtb__1266) expected) dtb__1267)
  | Frontend_dRast.C_Expr_EIf (dtb__1268, dtb__1269, dtb__1270, dtb__1271) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1268) dtb__1271)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__1272; B_dData_dPair.f_Pair_second = dtb__1273 } -> (let attempt = ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1273) dtb__1269) expected)) (fun (pt : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__1276; B_dData_dPair.f_Pair_second = dtb__1277 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1277) dtb__1270) expected)) (fun (pe : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__1278; B_dData_dPair.f_Pair_second = dtb__1279 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1272, dtb__1276, dtb__1278)); B_dData_dPair.f_Pair_second = dtb__1279 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) in (match attempt with
  | Base_dDiag.C_Check_OkC (dtb__1274) -> (Base_dDiag.C_Check_OkC (dtb__1274))
  | Base_dDiag.C_Check_ErrC (dtb__1275) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Expr_EPi (dtb__1280, dtb__1281, dtb__1282, dtb__1283, dtb__1284, dtb__1285) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Frontend_dRast.C_Expr_EApp (dtb__1286, dtb__1287, dtb__1288) -> (match dtb__1286 with
  | Frontend_dRast.C_Expr_EVar (dtb__1289, dtb__1290) -> (match dtb__1289 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1291) -> (if (dtb__1291 = "->") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1291 = "Type") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1289)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1288) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1289, dtb__1290))) dtb__1287) expected) dtb__1288))))
  | _ -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1289)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1288) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1289, dtb__1290))) dtb__1287) expected) dtb__1288))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) dtb__1286) dtb__1287) expected) dtb__1288)
)
  | Frontend_dRast.C_Expr_ELam (dtb__1292, dtb__1293, dtb__1294) -> ((((((((v_checkLamFuel (fuel - 1)) globals) ctx) ec) dtb__1292) dtb__1293) expected) dtb__1294)
  | Frontend_dRast.C_Expr_EFloat (dtb__1295, dtb__1296) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1297, dtb__1298) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1299) -> (match dtb__1299 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1300, dtb__1301) -> (match dtb__1301 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1300 = Base_dIntrinsics.v_floatTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1295)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1296) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1302) -> (match dtb__1302 with
  | { B_dData_dPair.f_Pair_first = dtb__1303; B_dData_dPair.f_Pair_second = dtb__1304 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1304) dtb__1303) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1296) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1305) -> (match dtb__1305 with
  | { B_dData_dPair.f_Pair_first = dtb__1306; B_dData_dPair.f_Pair_second = dtb__1307 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1307) dtb__1306) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1296) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1308) -> (match dtb__1308 with
  | { B_dData_dPair.f_Pair_first = dtb__1309; B_dData_dPair.f_Pair_second = dtb__1310 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1310) dtb__1309) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1296) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1311) -> (match dtb__1311 with
  | { B_dData_dPair.f_Pair_first = dtb__1312; B_dData_dPair.f_Pair_second = dtb__1313 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1313) dtb__1312) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EStr (dtb__1314, dtb__1315) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1316, dtb__1317) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1318) -> (match dtb__1318 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1319, dtb__1320) -> (match dtb__1320 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1319 = Base_dIntrinsics.v_strTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1314)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1315) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1321) -> (match dtb__1321 with
  | { B_dData_dPair.f_Pair_first = dtb__1322; B_dData_dPair.f_Pair_second = dtb__1323 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1323) dtb__1322) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1315) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1324) -> (match dtb__1324 with
  | { B_dData_dPair.f_Pair_first = dtb__1325; B_dData_dPair.f_Pair_second = dtb__1326 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1326) dtb__1325) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1315) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1327) -> (match dtb__1327 with
  | { B_dData_dPair.f_Pair_first = dtb__1328; B_dData_dPair.f_Pair_second = dtb__1329 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1329) dtb__1328) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1315) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1330) -> (match dtb__1330 with
  | { B_dData_dPair.f_Pair_first = dtb__1331; B_dData_dPair.f_Pair_second = dtb__1332 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1332) dtb__1331) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EInt (dtb__1333, dtb__1334) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1335, dtb__1336) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1337) -> (match dtb__1337 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1338, dtb__1339) -> (match dtb__1339 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1338 = Base_dIntrinsics.v_natTypeName) then ((Base_dCommon.v_bind ((v_natLitResult dtb__1334) dtb__1333)) (fun (t : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = ec })))) else (if (dtb__1338 = Base_dIntrinsics.v_intTypeName) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1334) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1340) -> (match dtb__1340 with
  | { B_dData_dPair.f_Pair_first = dtb__1341; B_dData_dPair.f_Pair_second = dtb__1342 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1342) dtb__1341) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1334) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1343) -> (match dtb__1343 with
  | { B_dData_dPair.f_Pair_first = dtb__1344; B_dData_dPair.f_Pair_second = dtb__1345 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1345) dtb__1344) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1334) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1346) -> (match dtb__1346 with
  | { B_dData_dPair.f_Pair_first = dtb__1347; B_dData_dPair.f_Pair_second = dtb__1348 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1348) dtb__1347) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1334) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1349) -> (match dtb__1349 with
  | { B_dData_dPair.f_Pair_first = dtb__1350; B_dData_dPair.f_Pair_second = dtb__1351 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1351) dtb__1350) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EVar (dtb__1352, dtb__1353) -> (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1352)) then (let pmeta = (((((Elab_dMetaSpans.v_newHoleMeta ctx) ec) dtb__1353) expected) (Frontend_dReserved.v_holeNameOf (Frontend_dRast_dName.v_rnameKey dtb__1352))) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__1354; B_dData_dPair.f_Pair_second = dtb__1355 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1354; B_dData_dPair.f_Pair_second = dtb__1355 }))
  | _ -> failwith "DT: impossible branch"
)) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1352)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1353) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1352))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1352)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1353))) B_dData_dList.C_List_Nil) expected) dtb__1353))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1352)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1352))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1352))) expected) dtb__1353)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1353))) B_dData_dList.C_List_Nil) expected) dtb__1353))) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1352, dtb__1353))) B_dData_dList.C_List_Nil) expected) dtb__1353))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
))))
# 2158 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 2260 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 2270 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : bool) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1356, dtb__1357) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((((v_checkLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1356) dtb__1357) mc5) mc6) mc7) mc8))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 2279 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetOneFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bnd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (B_dData_dPair.v_firstOf bnd) with
  | Frontend_dRast.C_Pat_PVar (dtb__1358, dtb__1359) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pv in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__1360; B_dData_dPair.f_Pair_second = dtb__1361 } -> (match dtb__1361 with
  | { B_dData_dPair.f_Pair_first = dtb__1362; B_dData_dPair.f_Pair_second = dtb__1363 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1362) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1358) dtb__1362) ctx) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx2) dtb__1363) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1364; B_dData_dPair.f_Pair_second = dtb__1365 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1365) ctx) dtb__1362) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1364) else dtb__1364) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb__1358, rig, B_dData_dMaybe.C_Maybe_Nothing, ((Base_dSource.v_spanAtName dtb__1358) dtb__1359), bodyTerm2)), dtb__1360, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1365 })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dRast.C_Pat_PWild (dtb__1366) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pv in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1367; B_dData_dPair.f_Pair_second = dtb__1368 } -> (match dtb__1368 with
  | { B_dData_dPair.f_Pair_first = dtb__1369; B_dData_dPair.f_Pair_second = dtb__1370 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1369) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) dtb__1370) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1371; B_dData_dPair.f_Pair_second = dtb__1372 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, dtb__1366, (((Core_dTerm.v_shift 0) 1) dtb__1371))), dtb__1367, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1372 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase ((B_dData_dPair.v_secondOf bnd), (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf bnd); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (rest, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan (B_dData_dPair.v_firstOf bnd))))) expected)
)))
# 2327 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = binds in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1373, dtb__1374) -> (match dtb__1373 with
  | { B_dData_dPair.f_Pair_first = dtb__1375; B_dData_dPair.f_Pair_second = dtb__1376 } -> (match dtb__1375 with
  | Frontend_dRast.C_Pat_PVar (dtb__1377, dtb__1378) -> (((((((((((v_inferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1377) dtb__1376) dtb__1374) body) rec_u) ((Base_dSource.v_spanAtName dtb__1377) dtb__1378)) sp)
  | Frontend_dRast.C_Pat_PWild (dtb__1379) -> ((((((((((v_inferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1376) dtb__1374) body) rec_u) dtb__1379) sp)
  | _ -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase (dtb__1376, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1375; B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (dtb__1374, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan dtb__1375))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
))))
# 2341 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetBoundFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = pv in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__1380; B_dData_dPair.f_Pair_second = dtb__1381 } -> (match dtb__1381 with
  | { B_dData_dPair.f_Pair_first = dtb__1382; B_dData_dPair.f_Pair_second = dtb__1383 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1382) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dtb__1382) ctx) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx2) dtb__1383) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = pb in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1384; B_dData_dPair.f_Pair_second = dtb__1385 } -> (match dtb__1385 with
  | { B_dData_dPair.f_Pair_first = dtb__1386; B_dData_dPair.f_Pair_second = dtb__1387 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1387) ctx) dtb__1382) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1384) else dtb__1384) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, bodyTerm2)), dtb__1380, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1386; B_dData_dPair.f_Pair_second = dtb__1387 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2363 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetIgnoredFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pv in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1388; B_dData_dPair.f_Pair_second = dtb__1389 } -> (match dtb__1389 with
  | { B_dData_dPair.f_Pair_first = dtb__1390; B_dData_dPair.f_Pair_second = dtb__1391 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1390) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) dtb__1391) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pb in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1392; B_dData_dPair.f_Pair_second = dtb__1393 } -> (match dtb__1393 with
  | { B_dData_dPair.f_Pair_first = dtb__1394; B_dData_dPair.f_Pair_second = dtb__1395 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, (((Core_dTerm.v_shift 0) 1) dtb__1392))), dtb__1388, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1394; B_dData_dPair.f_Pair_second = dtb__1395 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2443 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelHint = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1396) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1397) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1398) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match expr with
  | Frontend_dRast.C_Expr_EApp (dtb__1399, dtb__1400, dtb__1401) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1399) dtb__1400) dtb__1401) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_ecPendingCount ec); B_dData_dPair.f_Pair_second = expected })))
  | _ -> (((((v_inferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2729 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkByInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((((v_inferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__1402) -> (match dtb__1402 with
  | { B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = dtb__1404 } -> (match dtb__1404 with
  | { B_dData_dPair.f_Pair_first = dtb__1405; B_dData_dPair.f_Pair_second = dtb__1406 } -> (match ((((v_coerceTerm dtb__1406) expected) dtb__1405) dtb__1403) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1407) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1407; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1406) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1406) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1405) with
  | Base_dDiag.C_Check_ErrC (dtb__1408) -> (match ((((((v_tryEffLift ctx) globals) dtb__1406) expected) dtb__1405) dtb__1403) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1409) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__1409); B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) (B_dData_dPair.v_secondOf dtb__1409)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_unhandledEffectLabel dtb__1406) expected) dtb__1405) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1410) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> ((Elab_dTerm_dSupport.v_withEffectLabels dtb__1410) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("actual: " ^ (Core_dEval.v_showValue dtb__1405))))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("expected: " ^ (Core_dEval.v_showValue expected))))) d))))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((v_joinEffectLabels dtb__1410)))) (v_joinEffectLabels dtb__1410)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan (Frontend_dRast.v_exprSpan expr)) dtb__1408)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__1411) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1411) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1412) -> (Base_dDiag.C_Check_ErrC (dtb__1412))
  | _ -> failwith "DT: impossible branch"
))))
# 2750 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLamFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1413, dtb__1414) -> (match dtb__1413 with
  | { B_dData_dPair.f_Pair_first = dtb__1415; B_dData_dPair.f_Pair_second = dtb__1416 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (let nd_uscrut16 = forced in (match nd_uscrut16 with
  | Core_dTerm.C_Value_VMeta (dtb__1417, dtb__1418) -> (match dtb__1418 with
  | B_dData_dList.C_List_Nil -> (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) mc3) with
  | { B_dData_dPair.f_Pair_first = dtb__1419; B_dData_dPair.f_Pair_second = dtb__1420 } -> (let domVal = ((Elab_dTypes.v_evalCtx mc2) dtb__1419) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) dtb__1420) with
  | { B_dData_dPair.f_Pair_first = dtb__1421; B_dData_dPair.f_Pair_second = dtb__1422 } -> (let piVal = (Core_dTerm.C_Value_VPi ("_", false, Core_dTerm.C_Rig_RigOmega, domVal, { Core_dTerm.f_Closure_closureEnv = B_dData_dList.C_List_Nil; Core_dTerm.f_Closure_closureBody = dtb__1421 })) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__1422)) (Elab_dTypes.v_ecSolsP dtb__1422)) lvl) dtb__1417) B_dData_dList.C_List_Nil) piVal) with
  | Base_dDiag.C_Check_OkC (dtb__1423) -> ((((((((v_checkLamFuel (mc0 - 1)) mc1) mc2) ((Elab_dTypes.v_ecPutSols dtb__1422) (Core_dTerm.v_solsList dtb__1423))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1415; B_dData_dPair.f_Pair_second = dtb__1416 }, dtb__1414))) mc5) piVal) mc7)
  | Base_dDiag.C_Check_ErrC (dtb__1424) -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
)
  | Core_dTerm.C_Value_VPi (dtb__1425, dtb__1426, dtb__1427, dtb__1428, dtb__1429) -> (if dtb__1426 then (if (if ((Elab_dDict.v_isDictDomain mc3) dtb__1428) then true else (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__1428)) then (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1425) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1425) dtb__1428) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1429) v) in ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1415; B_dData_dPair.f_Pair_second = dtb__1416 }, dtb__1414))) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1430; B_dData_dPair.f_Pair_second = dtb__1431 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1425, dtb__1427, ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1428)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))), Base_dSource.v_spanEmpty, dtb__1430)); B_dData_dPair.f_Pair_second = dtb__1431 }))
  | _ -> failwith "DT: impossible branch"
))))))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)) else (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1425) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1415) dtb__1428) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1429) v) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain mc3) mc7) dtb__1415) dtb__1427) dtb__1428)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1414) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1432; B_dData_dPair.f_Pair_second = dtb__1433 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1433) mc2) dtb__1428) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1432) else dtb__1432) in (let slot0 = ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1428)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear mc3) mc2) then (if (((Elab_dMeta.v_termHasOuterLinear mc3) ctx2) dtb__1432) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1415, lamRig, slot, dtb__1416, inner2)); B_dData_dPair.f_Pair_second = dtb__1433 })))))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2839 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EApp (dtb__1434, dtb__1435, dtb__1436) -> (match dtb__1434 with
  | Frontend_dRast.C_Expr_EVar (dtb__1437, dtb__1438) -> (if (if ((Frontend_dRast_dName.v_rnameKey dtb__1437) = "->") then true else ((Frontend_dRast_dName.v_rnameKey dtb__1437) = "Type")) then (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1437)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1439) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1437)) then (match (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1437)) dtb__1435) dtb__1438) with
  | Base_dDiag.C_Check_ErrC (dtb__1440) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dDiag.C_Check_OkC (dtb__1441) -> (Base_dDiag.C_Check_OkC (dtb__1441))
  | _ -> failwith "DT: impossible branch"
) else (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Frontend_dRast.C_Expr_EVar (dtb__1442, dtb__1443) -> (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1442)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1444) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_typeLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1442)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1445) -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1445))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1446) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec) (Frontend_dRast_dName.v_rnameKey dtb__1442)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1446; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
))))
# 2872 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = p in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__1447; B_dData_dPair.f_Pair_second = dtb__1448 } -> (match dtb__1448 with
  | { B_dData_dPair.f_Pair_first = dtb__1449; B_dData_dPair.f_Pair_second = dtb__1450 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1450) dtb__1449) in (match (Core_dTerm.v_typeLevelOf forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1451) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1447; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1451; B_dData_dPair.f_Pair_second = dtb__1450 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedType (((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1449)))) ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1449))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2890 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1452, dtb__1453) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1452)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1453) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1452))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1452)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1453))) args) expected) sp))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1452)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueAppTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1452))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1452))) expected) sp)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1453))) args) expected) sp))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1452)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1454) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((Elab_dMeta.v_isSortVal ec) expected) then (match ((Elab_dMeta.v_typeNameOfDualCtor ec) (Frontend_dRast_dName.v_rnameKey dtb__1452)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1455) -> ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1455) args) expected) dtb__1453)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1452)) then ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1452)) args) expected) dtb__1453) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1452)) args) expected) sp) dtb__1453))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1452)) args) expected) sp) dtb__1453))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 2923 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppByValueFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (vsp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut10 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1456) -> (match dtb__1456 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__1457) -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__1458) -> ((((((((v_checkAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
# 2936 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1459; B_dData_dPair.f_Pair_second = dtb__1460 } -> (match dtb__1460 with
  | { B_dData_dPair.f_Pair_first = dtb__1461; B_dData_dPair.f_Pair_second = dtb__1462 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1462) (Elab_dTypes.v_ctxDepth ctx)) expected) (Core_dTerm.C_Value_VType (dtb__1461)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1459; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2947 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (((Elab_dMeta.v_typeHeadLookup globals) ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1463) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1463)) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = pa in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__1464; B_dData_dPair.f_Pair_second = dtb__1465 } -> (match dtb__1465 with
  | { B_dData_dPair.f_Pair_first = dtb__1466; B_dData_dPair.f_Pair_second = dtb__1467 } -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb__1467) dtb__1466)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1468) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1467) name) dtb__1464); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1468; B_dData_dPair.f_Pair_second = dtb__1467 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 3008 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeEqAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isEqMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1469, dtb__1470) -> (match dtb__1470 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1471, dtb__1472) -> (match dtb__1472 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1469)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1473; B_dData_dPair.f_Pair_second = dtb__1474 } -> (match dtb__1474 with
  | { B_dData_dPair.f_Pair_first = dtb__1475; B_dData_dPair.f_Pair_second = dtb__1476 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1476) dtb__1471)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1477; B_dData_dPair.f_Pair_second = dtb__1478 } -> (match dtb__1478 with
  | { B_dData_dPair.f_Pair_first = dtb__1479; B_dData_dPair.f_Pair_second = dtb__1480 } -> (match (((((v_coerceNatOperands dtb__1480) dtb__1475) dtb__1479) dtb__1473) dtb__1477) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1481) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1481))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1481))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1481))) dtb__1480)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1480) (Elab_dTypes.v_ctxDepth ctx)) dtb__1475) dtb__1479)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) dtb__1473) dtb__1477) sp) dtb__1475) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))
# 3032 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeCmpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isCmpMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1482, dtb__1483) -> (match dtb__1483 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1484, dtb__1485) -> (match dtb__1485 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1482)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1486; B_dData_dPair.f_Pair_second = dtb__1487 } -> (match dtb__1487 with
  | { B_dData_dPair.f_Pair_first = dtb__1488; B_dData_dPair.f_Pair_second = dtb__1489 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1489) dtb__1484)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1490; B_dData_dPair.f_Pair_second = dtb__1491 } -> (match dtb__1491 with
  | { B_dData_dPair.f_Pair_first = dtb__1492; B_dData_dPair.f_Pair_second = dtb__1493 } -> (match (((((v_coerceNatOperands dtb__1493) dtb__1488) dtb__1492) dtb__1486) dtb__1490) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1494) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1494))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1494))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1494))) dtb__1493)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1493) (Elab_dTypes.v_ctxDepth ctx)) dtb__1488) dtb__1492)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) dtb__1486) dtb__1490) sp) dtb__1488) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))
# 3058 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeOpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (name = Base_dIntrinsics.v_interpMethodName) then (((((((v_specializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Base_dCommon.v_bind (((((((v_specializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1495) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1495))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r2 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1496) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1496))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r3 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1497) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1497))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_specializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 3091 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeInterpPrimApp = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1498, dtb__1499) -> (match dtb__1499 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1498)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1500; B_dData_dPair.f_Pair_second = dtb__1501 } -> (match dtb__1501 with
  | { B_dData_dPair.f_Pair_first = dtb__1502; B_dData_dPair.f_Pair_second = dtb__1503 } -> (let tyv = ((Elab_dTypes.v_forceVal dtb__1503) dtb__1502) in (if (v_isStringTyValue tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1500; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyv; B_dData_dPair.f_Pair_second = dtb__1503 } })))) else (if (if ((v_isIntTy dtb__1503) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1503) Base_dIntrinsics.v_intTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm dtb__1500); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1503 } })))) else (if (if ((v_isNatTy dtb__1503) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1503) Base_dIntrinsics.v_natTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm (v_natToIntTerm dtb__1500)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1503 } })))) else (if ((v_isFloatTy dtb__1503) tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromFloatTerm dtb__1500); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1503 } })))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 3131 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeBoolAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1504, dtb__1505) -> (match dtb__1505 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1506, dtb__1507) -> (match dtb__1507 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1504) Elab_dPrelude.v_boolTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1508; B_dData_dPair.f_Pair_second = dtb__1509 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1509) dtb__1506) Elab_dPrelude.v_boolTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1510; B_dData_dPair.f_Pair_second = dtb__1511 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((Elab_dDict.v_boolShortCircuit name) dtb__1508) dtb__1510); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__1511 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NeedsTwoArgs (name))) name)
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))
# 3152 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1512, dtb__1513) -> ((Base_dCommon.v_bind ((((((((v_specializeArithCheckFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1512)) args) expected) sp)) (fun (arith : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut11 = arith in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_skipArithSpecForExpected ec) (Frontend_dRast_dName.v_rnameKey dtb__1512)) expected) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1512)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut14 = mspec in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1514) -> (match dtb__1514 with
  | { B_dData_dPair.f_Pair_first = dtb__1515; B_dData_dPair.f_Pair_second = dtb__1516 } -> (match dtb__1516 with
  | { B_dData_dPair.f_Pair_first = dtb__1517; B_dData_dPair.f_Pair_second = dtb__1518 } -> (match ((((v_coerceTerm dtb__1518) expected) dtb__1517) dtb__1515) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1519) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1519; B_dData_dPair.f_Pair_second = dtb__1518 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1518) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1517)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1515; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1520) -> (match dtb__1520 with
  | { B_dData_dPair.f_Pair_first = dtb__1521; B_dData_dPair.f_Pair_second = dtb__1522 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1521; B_dData_dPair.f_Pair_second = dtb__1522 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
)))
# 3410 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppCtorFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1523) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs ec) ctx) dtb__1523) expected) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1523))) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1524; B_dData_dPair.f_Pair_second = dtb__1525 } -> (match dtb__1525 with
  | { B_dData_dPair.f_Pair_first = dtb__1526; B_dData_dPair.f_Pair_second = dtb__1527 } -> (let ctorTerm = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1527)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1524) in (match ((((v_coerceTerm dtb__1527) expected) dtb__1526) ctorTerm) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1528) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1528; B_dData_dPair.f_Pair_second = dtb__1527 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1527) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1526) with
  | Base_dDiag.C_Check_OkC (dtb__1529) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1529)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1524); B_dData_dPair.f_Pair_second = dtb__1529 }))
  | Base_dDiag.C_Check_ErrC (dtb__1530) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1530)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1530))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1531) -> (match dtb__1531 with
  | { B_dData_dPair.f_Pair_first = dtb__1532; B_dData_dPair.f_Pair_second = dtb__1533 } -> (match dtb__1533 with
  | { B_dData_dPair.f_Pair_first = dtb__1534; B_dData_dPair.f_Pair_second = dtb__1535 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1535) dtb__1534) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pa in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1536; B_dData_dPair.f_Pair_second = dtb__1537 } -> (match dtb__1537 with
  | { B_dData_dPair.f_Pair_first = dtb__1538; B_dData_dPair.f_Pair_second = dtb__1539 } -> (let allArgs = ((B_dData_dList.v_append dtb__1532) dtb__1536) in (match ((((v_coerceTerm dtb__1539) expected) dtb__1538) (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1539)) (Core_dTerm.C_Term_TGlobal (name))) allArgs)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1540) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1540; B_dData_dPair.f_Pair_second = dtb__1539 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1539) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1538) with
  | Base_dDiag.C_Check_OkC (dtb__1541) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1541)) (Core_dTerm.C_Term_TGlobal (name))) allArgs); B_dData_dPair.f_Pair_second = dtb__1541 }))
  | Base_dDiag.C_Check_ErrC (dtb__1542) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1542)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1542))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 3689 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabDoChain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (plan : t_DoPlan) (steps : t_DoChainStep B_dData_dList.t_List) (last : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = steps in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1543, dtb__1544) -> (match dtb__1543 with
  | C_DoChainStep_DoChainStep (dtb__1545, dtb__1546, dtb__1547, dtb__1548) -> (match (((Elab_dMetaSpans.v_newMetaAt dtb__1547) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1549; B_dData_dPair.f_Pair_second = dtb__1550 } -> (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1549) in (let mArgTy = ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) aVal) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1545) aVal) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1550) dtb__1547) "_") (plan).f_DoPlan_planRigE) mArgTy)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1550) dtb__1546) mArgTy)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1551; B_dData_dPair.f_Pair_second = dtb__1552 } -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1552) dtb__1547) dtb__1545) (plan).f_DoPlan_planInnerRig) aVal)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx2) dtb__1552) plan) dtb__1544) last)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1553; B_dData_dPair.f_Pair_second = dtb__1554 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((((((((v_doBindAppTerm dtb__1552) dtb__1554) ctx) dtb__1547) dtb__1548) plan) dtb__1545) aVal) dtb__1551) argRig) lamRig) dtb__1553); B_dData_dPair.f_Pair_second = dtb__1554 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) last) ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) (plan).f_DoPlan_planAVal))
  | _ -> failwith "DT: impossible branch"
))))
# 3723 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1555) -> (match dtb__1555 with
  | { B_dData_dPair.f_Pair_first = dtb__1556; B_dData_dPair.f_Pair_second = dtb__1557 } -> (match dtb__1557 with
  | { B_dData_dPair.f_Pair_first = dtb__1558; B_dData_dPair.f_Pair_second = dtb__1559 } -> (let nd_uscrut17 = ((v_splitDoExpected ec) expected) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1560; B_dData_dPair.f_Pair_second = dtb__1561 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1561) with
  | { B_dData_dPair.f_Pair_first = dtb__1562; B_dData_dPair.f_Pair_second = dtb__1563 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1560) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1562) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1563) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1556) dtb__1558) dtb__1559) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1564) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1564).f_DoPlan_planEc) dtb__1564) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1565; B_dData_dPair.f_Pair_second = dtb__1566 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1566) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_applyValue (dtb__1564).f_DoPlan_planMVal) (dtb__1564).f_DoPlan_planAVal))) (fun (ec4 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1565; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1567) -> (match dtb__1567 with
  | { B_dData_dPair.f_Pair_first = dtb__1568; B_dData_dPair.f_Pair_second = dtb__1569 } -> ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1556) dtb__1558) dtb__1559) dtb__1568) dtb__1569)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1570) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1570).f_DoPlan_planEc) dtb__1570) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1571; B_dData_dPair.f_Pair_second = dtb__1572 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1571; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1572) }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))))
# 3766 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1573) -> (match dtb__1573 with
  | { B_dData_dPair.f_Pair_first = dtb__1574; B_dData_dPair.f_Pair_second = dtb__1575 } -> (match dtb__1575 with
  | { B_dData_dPair.f_Pair_first = dtb__1576; B_dData_dPair.f_Pair_second = dtb__1577 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1578; B_dData_dPair.f_Pair_second = dtb__1579 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1579) with
  | { B_dData_dPair.f_Pair_first = dtb__1580; B_dData_dPair.f_Pair_second = dtb__1581 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1578) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1580) in (let resultTy = ((Core_dEval.v_applyValue mVal) aVal) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1581) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1574) dtb__1576) dtb__1577) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1582) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1582).f_DoPlan_planEc) dtb__1582) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1583; B_dData_dPair.f_Pair_second = dtb__1584 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1583; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__1584 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))))

# 2971 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_checkTypeAtKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VType (dtb__1585) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) (((((v_checkTypeFuel 256) globals) ctx) ec) expr))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)) }))))
  | _ -> (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EApp (dtb__1586, dtb__1587, dtb__1588) -> (match dtb__1586 with
  | Frontend_dRast.C_Expr_EVar (dtb__1589, dtb__1590) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1589)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1589)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1589)))) (Frontend_dRast_dName.v_rnameKey dtb__1589))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1591) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel 256) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1591)) dtb__1587) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1592; B_dData_dPair.f_Pair_second = dtb__1593 } -> (match dtb__1593 with
  | { B_dData_dPair.f_Pair_first = dtb__1594; B_dData_dPair.f_Pair_second = dtb__1595 } -> (match ((((Elab_dMeta.v_convEc dtb__1595) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1594) with
  | Base_dDiag.C_Check_OkC (dtb__1596) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1596) (Frontend_dRast_dName.v_rnameKey dtb__1589)) dtb__1592); B_dData_dPair.f_Pair_second = dtb__1596 }))
  | Base_dDiag.C_Check_ErrC (dtb__1597) -> (((Base_dDiagnostics_dTc.v_tcTypeMismatch sp) (Core_dEval.v_showValue expected)) (Core_dEval.v_showValue dtb__1594))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected))
)
  | Frontend_dRast.C_Expr_EVar (dtb__1598, dtb__1599) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1598)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1598)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1598)))) (Frontend_dRast_dName.v_rnameKey dtb__1598))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1600) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1600)))) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec1) (Frontend_dRast_dName.v_rnameKey dtb__1598)); B_dData_dPair.f_Pair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected))
))
))
