open Vuna_runtime
type t_PerfFamily = C_PerfFamily_PerfFamily of (string) * (string) * (string)
and t_FieldAccessPlan = { f_FieldAccessPlan_planData : Elab_dTypes.t_DtData; f_FieldAccessPlan_planCtor : Elab_dTypes.t_DtCtor; f_FieldAccessPlan_planIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_FieldAccessPlan_planRecord : string; f_FieldAccessPlan_planField : int; f_FieldAccessPlan_planFieldCount : int; f_FieldAccessPlan_planType : Core_dTerm.t_Value }
and t_UpdateAccessPlan = { f_UpdateAccessPlan_upData : Elab_dTypes.t_DtData; f_UpdateAccessPlan_upCtor : Elab_dTypes.t_DtCtor; f_UpdateAccessPlan_upIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_UpdateAccessPlan_upRecord : string; f_UpdateAccessPlan_upFieldCount : int; f_UpdateAccessPlan_upFieldIndices : int B_dData_dList.t_List; f_UpdateAccessPlan_upBodyArgs : Frontend_dAst.t_Expr B_dData_dList.t_List }
and t_DoChainStep = C_DoChainStep_DoChainStep of (string) * (Frontend_dAst.t_Expr) * (Base_dSource.t_Span) * (Base_dSource.t_Span)
and t_DoChain = { f_DoChain_doChainCanonical : string; f_DoChain_doChainSteps : t_DoChainStep B_dData_dList.t_List; f_DoChain_doChainLast : Frontend_dAst.t_Expr; f_DoChain_doChainSpan : Base_dSource.t_Span }
and t_DoBindShape = C_DoBindShape_DoBindShape of (Core_dTerm.t_Rig) * (Core_dTerm.t_Rig) * (Core_dTerm.t_Rig)
and t_DoPlan = { f_DoPlan_planBind : string; f_DoPlan_planHead : Core_dTerm.t_Term; f_DoPlan_planMTerm : Core_dTerm.t_Term; f_DoPlan_planMVal : Core_dTerm.t_Value; f_DoPlan_planAVal : Core_dTerm.t_Value; f_DoPlan_planDictTerm : Core_dTerm.t_Term; f_DoPlan_planRigE : Core_dTerm.t_Rig; f_DoPlan_planRigL : Core_dTerm.t_Rig; f_DoPlan_planInnerRig : Core_dTerm.t_Rig; f_DoPlan_planEc : Elab_dTypes.t_Ec }

# 45 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_branchBinderOpaque = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (i : int) -> (let nd_uscrut3 = ((Elab_dMeta.v_ctxItemAt i) (ctx).Elab_dTypes.f_Ctx_ctxItems) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = dtb__2 } -> (let v = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (((Core_dTerm.v_shift 0) (i + 1)) dtb__2)) in (let r = (((Elab_dMeta.v_isOpaqueRuntimeTyIn ec) ctx) v) in r))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 37 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_opaqueBranchIndicesGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if (((v_branchBinderOpaque mc0) mc1) ((mc2 - 1) - mc4)) then (B_dData_dList.C_List__x58__x58_ (((mc2 - 1) - mc4), (((((v_opaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))) else (((((v_opaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opaqueBranchIndices = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (n : int) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_opaqueBranchIndicesGo ec) ctx) n) tele) 0))

# 60 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFieldLabels = (fun (dd : Elab_dTypes.t_DtData) (ctor : Elab_dTypes.t_DtCtor) -> (if (Elab_dTypes.v_dtDataIsRecord dd) then ((B_dData_dList.v_map Elab_dTypes.v_dtFieldName) (Elab_dTypes.v_dtDataFields dd)) else (Elab_dCase.v_ctorExplicitNames (Elab_dTypes.v_dtCtorType ctor))))

# 188 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_needsMatrixCase = (fun (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (Elab_dCase.v_anyNestedPat alts) then true else (B_dData_dList.v_hasDupNames (Elab_dCase.v_altNames alts))))

# 366 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitCaseAlts = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> (match dtb__7 with
  | Frontend_dAst.C_Pat_PInt (dtb__9, dtb__10) -> (v_natLitCaseAlts dtb__6)
  | Frontend_dAst.C_Pat_PVar (dtb__11, dtb__12) -> (v_natLitCaseAlts dtb__6)
  | Frontend_dAst.C_Pat_PWild (dtb__13) -> (v_natLitCaseAlts dtb__6)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitCaseHasCatchAll = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__14 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (match dtb__16 with
  | Frontend_dAst.C_Pat_PVar (dtb__18, dtb__19) -> true
  | Frontend_dAst.C_Pat_PWild (dtb__20) -> true
  | _ -> (v_natLitCaseHasCatchAll dtb__15)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfShortOf = (fun (last : string) -> (if ((B_dData_dString.v_endsWith "Op") last) then (let n = (bi_strLength last) in (if (n > 2) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring 0) (B_dData_dNat.v_fromIntClamp (n - 2))) last))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))

# 522 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfCanonical = (fun (canon : string) -> (match (v_perfShortOf (Base_dSource.v_lastSeg canon)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dMaybe.C_Maybe_Just ((C_PerfFamily_PerfFamily (canon, (Base_dSource.v_prefixOfName canon), dtb__21))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__22) -> (match dtb__22 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__23, dtb__24) -> (v_perfFamilyOfCanonical dtb__23)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 537 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performOperand = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Frontend_dAst.C_Expr_EVar (dtb__28, dtb__29) -> (match dtb__26 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut10 = (Frontend_dReserved.v_classify dtb__28) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (match dtb__32 with
  | Frontend_dReserved.C_Reserved_RsPerform -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__27) }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
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

# 545 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_instArgOperand = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__33, dtb__34, dtb__35) -> (match dtb__33 with
  | Frontend_dAst.C_Expr_EVar (dtb__36, dtb__37) -> (match dtb__34 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut10 = (Frontend_dReserved.v_classify dtb__36) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (match dtb__40 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> (B_dData_dMaybe.C_Maybe_Just (dtb__38))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
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

# 553 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtOperand = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Frontend_dAst.C_Expr_EVar (dtb__44, dtb__45) -> (match dtb__42 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (let nd_uscrut12 = (Frontend_dReserved.v_classify dtb__44) in (match nd_uscrut12 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (match dtb__50 with
  | Frontend_dReserved.C_Reserved_RsAppAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
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

# 561 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtCallExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__51, dtb__52, dtb__53) -> (match dtb__51 with
  | Frontend_dAst.C_Expr_EVar (dtb__54, dtb__55) -> (match dtb__52 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb__56, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsInstArg), dtb__53)), (B_dData_dList.C_List__x58__x58_ (dtb__58, B_dData_dList.C_List_Nil)), dtb__53)), dtb__59)), dtb__53))))
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
))

# 589 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOperand = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__60, dtb__61, dtb__62) -> (match dtb__60 with
  | Frontend_dAst.C_Expr_EVar (dtb__63, dtb__64) -> (match dtb__61 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__66 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__68 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut16 = (Frontend_dReserved.v_classify dtb__63) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (match dtb__71 with
  | Frontend_dReserved.C_Reserved_RsHandle -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__69 } }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
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

# 607 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleFamilyOfCtor = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_ctorFamilyNameOf ec) cname) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (Base_dDiag.C_Check_OkC (dtb__72))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamily = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify cname) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (match dtb__73 with
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__74, dtb__75) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) sp) B_dData_dMaybe.C_Maybe_Nothing) dtb__74) dtb__75)) (fun (canon : string) -> (((v_handleFamilyOfCtor ec) canon) sp)))
  | _ -> (((v_handleFamilyOfCtor ec) cname) sp)
)
  | _ -> (((v_handleFamilyOfCtor ec) cname) sp)
)))

# 614 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilyOfPat = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PCon (dtb__76, dtb__77, dtb__78) -> (((v_handleClauseFamily mc0) dtb__76) (Frontend_dAst.v_nodeRefSpan dtb__78))
  | _ -> (Base_dDiag.v_icInternal "handle mirror case pattern is not a constructor")
))

# 619 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleCheckFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__79 with
  | { B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__82 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__81) with
  | Base_dDiag.C_Check_ErrC (dtb__83) -> (Base_dDiag.C_Check_ErrC (dtb__83))
  | Base_dDiag.C_Check_OkC (dtb__84) -> (if (dtb__84 = mc1) then (((v_handleCheckFamilies mc0) mc1) dtb__80) else ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_patSpan dtb__81)) (Base_dDiagnostics_dTc.C_TcErr_HandleClauseFamilyMismatch (mc1, dtb__84))) mc1) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (match dtb__85 with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__87) with
  | Base_dDiag.C_Check_ErrC (dtb__89) -> (Base_dDiag.C_Check_ErrC (dtb__89))
  | Base_dDiag.C_Check_OkC (dtb__90) -> (((v_handleCheckFamilies mc0) dtb__90) dtb__86)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isUniverseTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__91) -> true
  | _ -> false
))

# 649 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_countOpArrows = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__92) -> (B_dData_dMaybe.C_Maybe_Just (0))
  | Core_dTerm.C_Term_TPi (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (if dtb__94 then (v_countOpArrows dtb__97) else (if (v_isUniverseTerm dtb__96) then (match (v_countOpArrows dtb__97) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__98 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 643 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArity = (fun (kind : Core_dTerm.t_Term) -> (match (v_countOpArrows kind) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__99) -> (if (dtb__99 >= 1) then (B_dData_dMaybe.C_Maybe_Just ((dtb__99 - 1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 668 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleHoleArgs = (fun (k : int) (sp : Frontend_dAst.t_NodeRef) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("_", sp)), ((v_handleHoleArgs (k - 1)) sp)))))

# 672 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArg = (fun (canon : string) (k : int) (sp : Frontend_dAst.t_NodeRef) -> (if (k <= 0) then (Frontend_dAst.C_Expr_EVar (canon, sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (canon, sp)), ((v_handleHoleArgs k) sp), sp))))

# 678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigArg = (fun (canon : string) (k : int) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effSigFnName, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleSigBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((((v_handleOpArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleSigBinderName, sp)), B_dData_dList.C_List_Nil)), sp)), sp)), B_dData_dList.C_List_Nil)), sp)))

# 697 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) -> (match ((Elab_dMeta.v_dtDataLookup canon) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__100)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Elab_dMeta.v_globalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 704 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleRetArg = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__101, dtb__102) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify dtb__101) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__103) -> (match dtb__103 with
  | Frontend_dReserved.C_Reserved_RsHandleNoRet -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleRetBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleRetBinderName, dtb__102)), dtb__102))
  | _ -> (Frontend_dAst.C_Expr_EVar (dtb__101, dtb__102))
)
  | _ -> (Frontend_dAst.C_Expr_EVar (dtb__101, dtb__102))
))
  | _ -> mc0
))

# 687 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCall = (fun (headMode : bool) (nameArg : Frontend_dAst.t_Expr) (canon : string) (k : int) (comp : Frontend_dAst.t_Expr) (ret : Frontend_dAst.t_Expr) (opH : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (let fnName = (if headMode then Base_dIntrinsics.v_effHandleWithAtName else Base_dIntrinsics.v_effHandleWithName) in (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (fnName, sp)), (B_dData_dList.C_List__x58__x58_ (nameArg, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (canon, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ (comp, (B_dData_dList.C_List__x58__x58_ ((v_handleRetArg ret), (B_dData_dList.C_List__x58__x58_ (opH, B_dData_dList.C_List_Nil)))))))))))), sp))))

# 715 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opFamilyArityOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) (sp : Base_dSource.t_Span) -> (match (((v_handleOpKind globals) ec) canon) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> (match (v_handleOpArity dtb__104) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (Base_dDiag.C_Check_OkC (dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (opTy : Core_dTerm.t_Value) (op : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (let nd_uscrut5 = ((v_perfFamilyOfValue ec) opTy) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (match dtb__106 with
  | C_PerfFamily_PerfFamily (dtb__107, dtb__108, dtb__109) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__107) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effPerformCoreName, (Frontend_dAst.v_detachedNodeRef sp))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("_", (Frontend_dAst.v_detachedNodeRef sp))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb__107, (Frontend_dAst.v_detachedNodeRef sp))), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg dtb__107) k) (Frontend_dAst.v_detachedNodeRef sp)), (B_dData_dList.C_List__x58__x58_ (op, B_dData_dList.C_List_Nil)))))))), (Frontend_dAst.v_detachedNodeRef sp)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_EffResFamilyMissing (((Core_dEval.v_showValueAt 6) opTy)))) ((Core_dEval.v_showValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)))

# 896 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordTypeOf = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) ty) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__110) -> (match dtb__110 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__111, dtb__112) -> (match ((Elab_dMeta.v_dtDataLookup dtb__111) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__113) then (let nd_uscrut8 = (Elab_dTypes.v_dtDataCtors dtb__113) in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (match dtb__115 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = dtb__112 } }))
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

# 916 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldPatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ((Frontend_dReserved.v_recordProjBinderName i), (Frontend_dAst.v_detachedNodeRef sp))), (((v_recordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 912 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordFieldPatsFrom 0) n) sp))

# 929 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldLookupGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (if ((dtb__116).Elab_dTypes.f_DtFieldMeta_dtFieldName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__116).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (dtb__116).Elab_dTypes.f_DtFieldMeta_dtFieldType } })) else (((v_recordFieldLookupGo mc0) dtb__117) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldLookup = (fun (fname : string) (dd : Elab_dTypes.t_DtData) -> (((v_recordFieldLookupGo fname) (Elab_dTypes.v_dtDataFields dd)) (B_dData_dList.v_length (Elab_dTypes.v_dtDataFields dd))))

# 938 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateUnknownGo = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = dtb__121 } -> (match ((v_recordFieldLookup dtb__120) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__120))
  | B_dData_dMaybe.C_Maybe_Just (dtb__122) -> ((v_recordUpdateUnknownGo mc0) dtb__119)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateUnknown = (fun (dd : Elab_dTypes.t_DtData) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_recordUpdateUnknownGo dd) fields))

# 950 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateValueFor = (fun (mc0 : string) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (if (dtb__125 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__126)) else ((v_recordUpdateValueFor mc0) dtb__124))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 956 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateArg = (fun (i : int) (f : Elab_dTypes.t_DtFieldMeta) (provided : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match ((v_recordUpdateValueFor (f).Elab_dTypes.f_DtFieldMeta_dtFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> dtb__127
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_recordProjBinderName i), (Frontend_dAst.v_detachedNodeRef sp)))
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (B_dData_dList.C_List__x58__x58_ (((((v_recordUpdateArg mc0) dtb__128) mc2) mc3), ((((v_recordUpdateArgs (mc0 + 1)) dtb__129) mc2) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdatedIndices = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (let nd_uscrut9 = ((v_recordFieldLookup dtb__132) mc0) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_recordUpdatedIndices mc0) dtb__131)
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (match dtb__134 with
  | { B_dData_dPair.f_Pair_first = dtb__135; B_dData_dPair.f_Pair_second = dtb__136 } -> (B_dData_dList.C_List__x58__x58_ (dtb__135, ((v_recordUpdatedIndices mc0) dtb__131)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1001 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (match dtb__137 with
  | { B_dData_dPair.f_Pair_first = dtb__138; B_dData_dPair.f_Pair_second = dtb__139 } -> (match dtb__139 with
  | { B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = dtb__141 } -> (let nd_uscrut15 = ((v_recordFieldLookup fname) dtb__138) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (match dtb__142 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (match dtb__144 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> (Base_dDiag.C_Check_OkC ({ f_FieldAccessPlan_planData = dtb__138; f_FieldAccessPlan_planCtor = dtb__140; f_FieldAccessPlan_planIdxs = dtb__141; f_FieldAccessPlan_planRecord = (dtb__138).Elab_dTypes.f_DtData_dtDataName; f_FieldAccessPlan_planField = dtb__143; f_FieldAccessPlan_planFieldCount = dtb__145; f_FieldAccessPlan_planType = ((Core_dEval.v_eval (B_dData_dList.v_reverse dtb__141)) dtb__146) }))
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

# 1012 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdatePlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (match dtb__147 with
  | { B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = dtb__149 } -> (match dtb__149 with
  | { B_dData_dPair.f_Pair_first = dtb__150; B_dData_dPair.f_Pair_second = dtb__151 } -> (match ((v_recordUpdateUnknown dtb__148) fields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> ((Elab_dTypes.v_errAt sp) ("record type has no field " ^ dtb__152))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let fs = (Elab_dTypes.v_dtDataFields dtb__148) in (let bodyArgs = ((((v_recordUpdateArgs 0) fs) fields) sp) in (Base_dDiag.C_Check_OkC ({ f_UpdateAccessPlan_upData = dtb__148; f_UpdateAccessPlan_upCtor = dtb__150; f_UpdateAccessPlan_upIdxs = dtb__151; f_UpdateAccessPlan_upRecord = (dtb__148).Elab_dTypes.f_DtData_dtDataName; f_UpdateAccessPlan_upFieldCount = (B_dData_dList.v_length fs); f_UpdateAccessPlan_upFieldIndices = ((v_recordUpdatedIndices dtb__148) fields); f_UpdateAccessPlan_upBodyArgs = bodyArgs }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)))

# 1027 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldDictName = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_hasFieldTraitName)

# 1037 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctxHasFieldDictGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : string) (mc5 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> (let nd_uscrut13 = ((Elab_dTypes.v_forceVal mc3) (((Elab_dTypes.v_varTypeValue mc2) mc1) dtb__156)) in (match nd_uscrut13 with
  | Core_dTerm.C_Value_VNeutral (dtb__157) -> (match dtb__157 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__158, dtb__159) -> (if (dtb__158 = v_hasFieldDictName) then (let nd_uscrut17 = dtb__159 in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (match dtb__161 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match dtb__163 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (let nd_uscrut27 = ((Elab_dTypes.v_forceVal mc3) dtb__160) in (match nd_uscrut27 with
  | Core_dTerm.C_Value_VNeutral (dtb__166) -> (match dtb__166 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__167, dtb__168) -> (match dtb__168 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (match dtb__169 with
  | Core_dTerm.C_Value_VStr (dtb__171) -> (if (dtb__171 = mc4) then (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc2)) dtb__162) mc5) with
  | Base_dDiag.C_Check_OkC (dtb__172) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__155, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__172 } }))
  | Base_dDiag.C_Check_ErrC (dtb__173) -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) else ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__154) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctxHasFieldDict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fname : string) (baseTy : Core_dTerm.t_Value) -> ((((((v_ctxHasFieldDictGo (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ctx) ec) fname) baseTy))

# 1065 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldAccessFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (baseTerm : Core_dTerm.t_Term) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut8 = ((Elab_dTypes.v_forceVal ec) baseTy) in (match nd_uscrut8 with
  | Core_dTerm.C_Value_VNeutral (dtb__174) -> (match dtb__174 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__175, dtb__176) -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["type "; dtb__175; " is not a record"]))
  | _ -> (let nd_uscrut10 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__177) -> (match dtb__177 with
  | { B_dData_dPair.f_Pair_first = dtb__178; B_dData_dPair.f_Pair_second = dtb__179 } -> (match dtb__179 with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__180), Core_dTerm.C_Rig_Rig0)), dtb__178, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut9 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (match dtb__182 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (match dtb__184 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__185), Core_dTerm.C_Rig_Rig0)), dtb__183, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)))

# 1335 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_listLitElems = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__187, dtb__188, dtb__189) -> (match dtb__187 with
  | Frontend_dAst.C_Expr_EVar (dtb__190, dtb__191) -> (match dtb__188 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__193 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (match dtb__195 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut13 = (Frontend_dReserved.v_classify dtb__190) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (match dtb__196 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((v_listLitConsTail dtb__192) dtb__194)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__197, dtb__198) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify dtb__197) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (match dtb__199 with
  | Frontend_dReserved.C_Reserved_RsListNil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 1347 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_listLitConsTail = (fun (h : Frontend_dAst.t_Expr) (t : Frontend_dAst.t_Expr) -> (match (v_listLitElems t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (h, dtb__200))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_findCtorByShort = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> (if ((Frontend_dAst.v_ctorShortName (Elab_dTypes.v_dtCtorName dtb__201)) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__201)) else ((v_findCtorByShort mc0) dtb__202))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1360 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCtor = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (short : string) -> (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__203) -> ((v_findCtorByShort short) (Elab_dTypes.v_dtDataCtors dtb__203))
  | _ -> failwith "DT: impossible branch"
))

# 1367 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> ((Base_dCommon.v_bind ((((v_expandListLitGo mc0) mc1) dtb__205) mc3)) (fun (t : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc1, (Frontend_dAst.v_detachedNodeRef mc3))), (B_dData_dList.C_List__x58__x58_ (dtb__204, (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef mc3)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (mc0, (Frontend_dAst.v_detachedNodeRef mc3)))))
  | _ -> failwith "DT: impossible branch"
))

# 1378 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowAtParts = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__206, dtb__207, dtb__208) -> (match dtb__206 with
  | Frontend_dAst.C_Expr_EVar (dtb__209, dtb__210) -> (match dtb__207 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (match dtb__212 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__214 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut13 = (Frontend_dReserved.v_classify dtb__209) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__215) -> (match dtb__215 with
  | Frontend_dReserved.C_Reserved_RsRowAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__211; B_dData_dPair.f_Pair_second = dtb__213 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
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

# 1385 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtParts = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__216, dtb__217, dtb__218) -> (match dtb__216 with
  | Frontend_dAst.C_Expr_EVar (dtb__219, dtb__220) -> (match dtb__217 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__222 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (let nd_uscrut12 = (Frontend_dReserved.v_classify dtb__219) in (match nd_uscrut12 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (match dtb__225 with
  | Frontend_dReserved.C_Reserved_RsAppAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__221; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
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

# 1403 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_applyExtra = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dAst.C_Expr_EApp (mc0, mc1, (Frontend_dAst.v_exprRef mc0)))
))

# 1394 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryParts = (fun (e : Frontend_dAst.t_Expr) -> (match (v_rowAtParts e) with
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

# 1408 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitLabel = (fun (e : Frontend_dAst.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> e
  | B_dData_dMaybe.C_Maybe_Just (dtb__232) -> (match dtb__232 with
  | { B_dData_dPair.f_Pair_first = dtb__233; B_dData_dPair.f_Pair_second = dtb__234 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1414 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameArg = (fun (e : Frontend_dAst.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (match dtb__235 with
  | { B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__237 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__237))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1420 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameExpr = (fun (e : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (match (v_rowLitNameArg e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> dtb__238
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, (Frontend_dAst.v_detachedNodeRef sp)))
  | _ -> failwith "DT: impossible branch"
))

# 1443 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_wrapRowEntry = (fun (e : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effNamedName, (Frontend_dAst.v_detachedNodeRef sp))), (B_dData_dList.C_List__x58__x58_ (((v_rowLitNameExpr e) sp), (B_dData_dList.C_List__x58__x58_ ((v_rowLitLabel e), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef sp))))

# 1439 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsEntry = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__239, dtb__240, dtb__241) -> (match dtb__239 with
  | Frontend_dAst.C_Expr_EVar (dtb__242, dtb__243) -> (match dtb__240 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (match dtb__245 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (match dtb__247 with
  | B_dData_dList.C_List_Nil -> (if (dtb__242 = Base_dIntrinsics.v_effNamedName) then mc0 else ((v_wrapRowEntry mc0) mc1))
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

# 1436 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsArgs = (fun (e : Frontend_dAst.t_Expr) (t : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ (((v_rowConsEntry e) sp), (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))))

# 1426 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandRowListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> ((Base_dCommon.v_bind ((((v_expandRowListLitGo mc0) mc1) dtb__249) mc3)) (fun (t : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc1, (Frontend_dAst.v_detachedNodeRef mc3))), (((v_rowConsArgs dtb__248) t) mc3), (Frontend_dAst.v_detachedNodeRef mc3)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (mc0, (Frontend_dAst.v_detachedNodeRef mc3)))))
  | _ -> failwith "DT: impossible branch"
))

# 1454 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_firstCtorOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (match (((v_litFamilyCtor mc0) mc1) dtb__250) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__252) -> (B_dData_dMaybe.C_Maybe_Just (dtb__252))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstCtorOf mc0) mc1) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1451 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCons = (fun (ec : Elab_dTypes.t_Ec) (fam : string) -> (((v_firstCtorOf ec) fam) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil))))))

# 1462 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandListLit = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fam = Base_dIntrinsics.v_effRowFamilyName) then (match (((v_litFamilyCtor ec) fam) "Nil") with
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

# 1480 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_listLitFamily = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_expectedFamilyOf ec) expected) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__257) -> dtb__257
  | B_dData_dMaybe.C_Maybe_Nothing -> Base_dIntrinsics.v_listFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1487 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandArgListLit = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (a : Frontend_dAst.t_Expr) -> (match (v_listLitElems a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__258) -> ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) dom))) dtb__258) (Frontend_dAst.v_exprSpan a))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1706 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitTermGo = (fun (n : int) (acc : Core_dTerm.t_Term) -> (if (n <= 0) then acc else ((v_natLitTermGo (n - 1)) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig1 }, B_dData_dList.C_List_Nil)))))))

# 1709 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitTerm = (fun (n : int) -> ((v_natLitTermGo n) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 1714 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitResult = (fun (sp : Base_dSource.t_Span) (n : int) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC ((v_natLitTerm n)))))

# 1717 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natToIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("natToInt")), t, Core_dTerm.C_Rig_Rig1)))

# 1720 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil))))

# 1723 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_natTypeName, B_dData_dList.C_List_Nil))))

# 1727 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil))))

# 1730 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1736 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 362 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitCaseFast = (fun (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((v_isNatTy ec) scrutTy) then (v_natLitCaseAlts alts) else false) then (v_natLitCaseHasCatchAll alts) else false))

# 1743 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1202 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForExpected = (fun (ec : Elab_dTypes.t_Ec) (name : string) (expected : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_numMethodOpName ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (if ((v_isIntTy ec) expected) then false else (if ((v_isNatTy ec) expected) then false else (if ((v_isFloatTy ec) expected) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VMeta (dtb__269, dtb__270) -> false
  | _ -> true
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1219 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForHint = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (((v_skipArithSpecForExpected mc0) mc1) dtb__271)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1750 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceTerm = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (if (if ((v_isIntTy ec) expected) then ((v_isNatTy ec) actual) else false) then (B_dData_dMaybe.C_Maybe_Just ((v_natToIntTerm term))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1755 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceNatOperands = (fun (ec : Elab_dTypes.t_Ec) (aTy : Core_dTerm.t_Value) (bTy : Core_dTerm.t_Value) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) -> (if (if ((v_isNatTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else (if (if ((v_isNatTy ec) aTy) then ((v_isIntTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = bTy }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = bTerm } })) else (if (if ((v_isIntTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = aTy; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = aTerm; B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else B_dData_dMaybe.C_Maybe_Nothing))))

# 1773 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithOpNameOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) -> (if (mc1 = "+") then (B_dData_dMaybe.C_Maybe_Just ("+")) else (if (mc1 = "-") then (B_dData_dMaybe.C_Maybe_Just ("-")) else (if (mc1 = "*") then (B_dData_dMaybe.C_Maybe_Just ("*")) else (if (mc1 = "/") then (B_dData_dMaybe.C_Maybe_Just ("/")) else (if (Base_dSource.v_containsDot mc1) then ((Elab_dDict.v_numMethodOpName mc0) mc1) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1780 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithNatName = (fun (mc0 : string) -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1786 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (name)), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1789 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithNatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1798 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithFloatName = (fun (mc0 : string) -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1794 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithFloatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1804 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isEIntExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInt (dtb__272, dtb__273) -> (B_dData_dMaybe.C_Maybe_Just (dtb__272))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1913 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isSimpleComp = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__274, dtb__275) -> true
  | _ -> false
))

# 1970 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_literalTraitLower = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (traitName : string) (methodName : string) (lit : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let dictDom = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName traitName), (B_dData_dList.C_List__x58__x58_ (((Elab_dTypes.v_forceVal ec) expected), B_dData_dList.C_List_Nil)))))) in (let nd_uscrut9 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) dictDom) sp) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__276) -> (match dtb__276 with
  | { B_dData_dPair.f_Pair_first = dtb__277; B_dData_dPair.f_Pair_second = dtb__278 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (methodName, (Frontend_dAst.v_detachedNodeRef sp))), (B_dData_dList.C_List__x58__x58_ (lit, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef sp))); B_dData_dPair.f_Pair_second = dtb__278 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__279) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 1980 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_exprFormName = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EFloat (dtb__280, dtb__281) -> "EFloat"
  | Frontend_dAst.C_Expr_EInterp (dtb__282, dtb__283) -> "EInterp"
  | Frontend_dAst.C_Expr_EDo (dtb__284, dtb__285) -> "EDo"
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__286, dtb__287, dtb__288) -> "ERecUpdate"
  | Frontend_dAst.C_Expr_ERecord (dtb__289, dtb__290, dtb__291) -> "ERecord"
  | Frontend_dAst.C_Expr_EField (dtb__292, dtb__293, dtb__294) -> "EField"
  | Frontend_dAst.C_Expr_ELet (dtb__295, dtb__296, dtb__297, dtb__298) -> "ELet"
  | Frontend_dAst.C_Expr_ECase (dtb__299, dtb__300, dtb__301) -> "ECase"
  | Frontend_dAst.C_Expr_EIf (dtb__302, dtb__303, dtb__304, dtb__305) -> "EIf"
  | Frontend_dAst.C_Expr_EPi (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311) -> "EPi"
  | Frontend_dAst.C_Expr_EApp (dtb__312, dtb__313, dtb__314) -> "EApp"
  | Frontend_dAst.C_Expr_ELam (dtb__315, dtb__316, dtb__317) -> "ELam"
  | Frontend_dAst.C_Expr_EStr (dtb__318, dtb__319) -> "EStr"
  | Frontend_dAst.C_Expr_EInt (dtb__320, dtb__321) -> "EInt"
  | Frontend_dAst.C_Expr_EVar (dtb__322, dtb__323) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 2016 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> (match dtb__324 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__325) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__325).Elab_dTypes.f_DtCtor_dtCtorType)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__326) -> true
  | Base_dDiag.C_Check_ErrC (dtb__327) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__328) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__328)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__329) -> true
  | Base_dDiag.C_Check_ErrC (dtb__330) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2052 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPiWithMetasFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec } else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> ((((v_stripPiWithMetasFuel (fuel - 1)) ctx) dtb__337) ((Core_dEval.v_applyClosure dtb__335) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }
)))

# 2049 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_stripPiWithMetas = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_stripPiWithMetasFuel 64) ctx) ec) v))

# 2041 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppResultMatches = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (v : Core_dTerm.t_Value) -> (match (((v_stripPiWithMetas ctx) ec) v) with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__339)) (Elab_dTypes.v_ecSolsP dtb__339)) (Elab_dTypes.v_ctxDepth ctx)) dtb__338) expected) with
  | Base_dDiag.C_Check_OkC (dtb__340) -> true
  | Base_dDiag.C_Check_ErrC (dtb__341) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2033 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__342) -> (match dtb__342 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__343) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__343).Elab_dTypes.f_DtCtor_dtCtorType))
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__344) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__344))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2066 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueAppTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueAppCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__345, dtb__346) -> (match dtb__346 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__345))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2072 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (match dtb__348 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__347))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2213 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_patHasOverCtor = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__349, dtb__350, dtb__351) -> (v_anyFieldHasOverCtor dtb__350)
  | Frontend_dAst.C_Pat_PAs (dtb__352, dtb__353, dtb__354) -> (v_patHasOverCtor dtb__353)
  | Frontend_dAst.C_Pat_PCon (dtb__355, dtb__356, dtb__357) -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb__355) then true else (v_anyPatHasOverCtor dtb__356))
  | _ -> false
))
# 2221 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyPatHasOverCtor = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (if (v_patHasOverCtor dtb__358) then true else (v_anyPatHasOverCtor dtb__359))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 2226 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyFieldHasOverCtor = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__360, dtb__361) -> (match dtb__360 with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (if (v_patHasOverCtor dtb__363) then true else (v_anyFieldHasOverCtor dtb__361))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2231 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_clausesHaveOverCtor = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__364, dtb__365) -> (match dtb__364 with
  | { B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__367 } -> (if (v_anyPatHasOverCtor dtb__366) then true else (v_clausesHaveOverCtor dtb__365))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2301 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_pairsToBindings = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__368, dtb__369) -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (B_dData_dPair.v_firstOf dtb__368); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal ((B_dData_dPair.v_secondOf dtb__368))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty) }, (v_pairsToBindings dtb__369)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2307 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_altsToPairs = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__370).Frontend_dAst.f_Alt_altPat; B_dData_dPair.f_Pair_second = (dtb__370).Frontend_dAst.f_Alt_altBody }, (v_altsToPairs dtb__371)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprWith = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) (headMode : bool) (nameArg : Frontend_dAst.t_Expr) -> (let nd_uscrut6 = (v_handleOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__372) -> (match dtb__372 with
  | { B_dData_dPair.f_Pair_first = dtb__373; B_dData_dPair.f_Pair_second = dtb__374 } -> (match dtb__374 with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> (let nd_uscrut17 = dtb__376 in (match nd_uscrut17 with
  | Frontend_dAst.C_Expr_ELam (dtb__377, dtb__378, dtb__379) -> (match dtb__377 with
  | B_dData_dList.C_List__x58__x58_ (dtb__380, dtb__381) -> (match dtb__381 with
  | B_dData_dList.C_List__x58__x58_ (dtb__382, dtb__383) -> (match dtb__378 with
  | Frontend_dAst.C_Expr_ECase (dtb__384, dtb__385, dtb__386) -> ((Base_dCommon.v_bind ((v_handleClauseFamilies ec) (v_altsToPairs dtb__385))) (fun (fam : string) -> (let nd_uscrut31 = (v_perfFamilyOfCanonical fam) in (match nd_uscrut31 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__387) -> (match dtb__387 with
  | C_PerfFamily_PerfFamily (dtb__388, dtb__389, dtb__390) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__388) (Frontend_dAst.v_nodeRefSpan sp))) (fun (k : int) -> (Base_dDiag.C_Check_OkC (((((((((v_handleCall headMode) nameArg) dtb__388) k) dtb__373) dtb__375) dtb__376) sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (fam))) fam)
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

# 742 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> ((((((v_handleCallExprWith globals) ec) expr) sp) false) (Frontend_dAst.C_Expr_EVar ("_", sp))))

# 746 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAt = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dAst.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))))

# 751 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAtHole = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dAst.C_Expr_EVar ("_", sp))))

# 2311 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_localClausesToPairs = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__391, dtb__392) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__391).Frontend_dAst.f_LocalClause_lcPats; B_dData_dPair.f_Pair_second = (dtb__391).Frontend_dAst.f_LocalClause_lcBody }, (v_localClausesToPairs dtb__392)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2239 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandLocalFunsF = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.C_Check_OkC (e)) else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__393, dtb__394) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__393, dtb__394))))
  | Frontend_dAst.C_Expr_EInt (dtb__395, dtb__396) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__395, dtb__396))))
  | Frontend_dAst.C_Expr_EStr (dtb__397, dtb__398) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__397, dtb__398))))
  | Frontend_dAst.C_Expr_EFloat (dtb__399, dtb__400) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__399, dtb__400))))
  | Frontend_dAst.C_Expr_ELam (dtb__401, dtb__402, dtb__403) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__402)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__401, b2, dtb__403))))))
  | Frontend_dAst.C_Expr_EApp (dtb__404, dtb__405, dtb__406) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__404)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandLocalFunsF (fuel - 1)) ec)) dtb__405)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__406))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__407, dtb__408, dtb__409, dtb__410, dtb__411, dtb__412) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__410)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__411)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__407, dtb__408, dtb__409, dom2, cod2, dtb__412))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__413, dtb__414, dtb__415, dtb__416) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandBindingF (fuel - 1)) ec)) dtb__413)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__414)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__415, dtb__416))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__417, dtb__418, dtb__419) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__417)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandAltF (fuel - 1)) ec)) dtb__418)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__419))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__420, dtb__421, dtb__422, dtb__423) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__420)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__421)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__422)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, el2, dtb__423))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__424, dtb__425, dtb__426) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__424)) (fun (base2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (base2, dtb__425, dtb__426))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__427, dtb__428, dtb__429) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__428)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__427, fields2, dtb__429))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__430, dtb__431, dtb__432) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) dtb__430)) (fun (base2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__431)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (base2, fields2, dtb__432))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__433, dtb__434) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandDoStmtF (fuel - 1)) ec)) dtb__433)) (fun (stmts2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (stmts2, dtb__434))))))
  | _ -> (Base_dDiag.C_Check_OkC (e))
)))
# 2261 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBindingF = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (b : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind (((v_expandBindingValueF (fuel - 1)) ec) b)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ b with Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (e2)) })))))
# 2269 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBindingValueF = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (b : Frontend_dAst.t_Binding) -> (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__435) -> (((v_expandLocalFunsF (fuel - 1)) ec) dtb__435)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__436) -> (if (v_clausesHaveOverCtor (v_localClausesToPairs dtb__436)) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan (b).Frontend_dAst.f_Binding_bindRef)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable ec)) (v_localClausesToPairs dtb__436)))
  | _ -> failwith "DT: impossible branch"
))
# 2283 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandAltF = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (alt : Frontend_dAst.t_Alt) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (fuel - 1)) ec) (alt).Frontend_dAst.f_Alt_altBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ alt with Frontend_dAst.f_Alt_altBody = b2 })))))
# 2289 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandDoStmtF = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Frontend_dAst.t_DoStmt) -> (match mc2 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__437, dtb__438) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandBindingF (mc0 - 1)) mc1)) dtb__437)) (fun (b2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (b2, dtb__438))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__439, dtb__440) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (mc0 - 1)) mc1) dtb__439)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (v2, dtb__440))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb__441, dtb__442, dtb__443) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (mc0 - 1)) mc1) dtb__442)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (dtb__441, v2, dtb__443))))))
  | _ -> failwith "DT: impossible branch"
))

# 2236 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandLocalFuns = (fun (ec : Elab_dTypes.t_Ec) (e : Frontend_dAst.t_Expr) -> (((v_expandLocalFunsF ((Frontend_dAstQuery.v_exprBudget 64) e)) ec) e))

# 2323 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindingToExpr = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (b : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind (((v_expandBindingValueF (fuel - 1)) ec) b)) (fun (value : Frontend_dAst.t_Expr) -> (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__444) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAscribe), (dtb__444).Frontend_dAst.f_BindingSig_sigRef)), (B_dData_dList.C_List__x58__x58_ (value, (B_dData_dList.C_List__x58__x58_ ((dtb__444).Frontend_dAst.f_BindingSig_sigType, B_dData_dList.C_List_Nil)))), (dtb__444).Frontend_dAst.f_BindingSig_sigRef))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (value))
  | _ -> failwith "DT: impossible branch"
))))

# 2316 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_letBindsToPairs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__445, dtb__446) -> ((Base_dCommon.v_bind (((v_bindingToExpr mc0) mc1) dtb__445)) (fun (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_letBindsToPairs (mc0 - 1)) mc1) dtb__446)) (fun (r : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__445).Frontend_dAst.f_Binding_bindPat; B_dData_dPair.f_Pair_second = e }, r))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2458 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPisWithMetas = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__447, dtb__448, dtb__449, dtb__450, dtb__451) -> (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__452; B_dData_dPair.f_Pair_second = dtb__453 } -> ((((v_stripPisWithMetas (fuel - 1)) ctx) dtb__453) ((Core_dEval.v_applyClosure dtb__451) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__452)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }))
)))

# 2473 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isMetaHeadedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VMeta (dtb__454, dtb__455) -> true
  | _ -> false
))

# 2480 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isRigidHeadValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VCon (dtb__456, dtb__457) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__458) -> (match dtb__458 with
  | Core_dTerm.C_Neutral_NVar (dtb__459, dtb__460, dtb__461) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb__462, dtb__463) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2491 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_remainingExplicitPis = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then 0 else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__464, dtb__465, dtb__466, dtb__467, dtb__468) -> (let v2 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__464, (Elab_dTypes.v_ctxDepth ctx), B_dData_dList.C_List_Nil)))) in (let rest = ((((v_remainingExplicitPis (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__468) v2)) in (if dtb__465 then rest else (rest + 1))))
  | _ -> 0
)))

# 2509 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryUseHint = (fun (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) (piTy : Core_dTerm.t_Value) -> (let nd_uscrut4 = ((((v_stripPisWithMetas 64) ctx) ec) piTy) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__469) -> (match dtb__469 with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> (let forcedRes = ((Elab_dTypes.v_forceVal dtb__471) dtb__470) in (if ((v_isMetaHeadedValue dtb__471) forcedRes) then (if ((v_isRigidHeadValue dtb__471) expected) then (match ((((Elab_dMeta.v_convEc dtb__471) (Elab_dTypes.v_ctxDepth ctx)) expected) forcedRes) with
  | Base_dDiag.C_Check_ErrC (dtb__472) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__473) -> (B_dData_dMaybe.C_Maybe_Just (dtb__473))
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__474) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 2556 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowAndResult = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__475) -> (match dtb__475 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__476, dtb__477) -> (match dtb__477 with
  | B_dData_dList.C_List__x58__x58_ (dtb__478, dtb__479) -> (match dtb__479 with
  | B_dData_dList.C_List__x58__x58_ (dtb__480, dtb__481) -> (if (dtb__476 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__478; B_dData_dPair.f_Pair_second = dtb__480 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2562 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowOfValue = (fun (v : Core_dTerm.t_Value) -> (match (v_effRowAndResult v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__482) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__482)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2569 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNilRowValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VCon (dtb__483, dtb__484) -> (dtb__483 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 2576 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryLabelTail = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__485, dtb__486) -> (if (dtb__485 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__486 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__487, dtb__488) -> (match dtb__488 with
  | B_dData_dList.C_List__x58__x58_ (dtb__489, dtb__490) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__487; B_dData_dPair.f_Pair_second = dtb__489 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2587 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_shortGlobalName = (fun (g : string) -> (Base_dSource.v_lastSeg g))

# 2597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_labelHeadArgs = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__491, dtb__492) -> ((v_labelHeadArgs (String.concat "" [mc0; " "; ((Core_dEval.v_showValueAt 6) dtb__491)])) dtb__492)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 2591 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLabelText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__493) -> (match dtb__493 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__494, dtb__495) -> ((v_labelHeadArgs (v_shortGlobalName dtb__494)) dtb__495)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 2602 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__496) -> dtb__496
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 2609 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryText = (fun (ec : Elab_dTypes.t_Ec) (n : Core_dTerm.t_Value) (h : Core_dTerm.t_Value) -> (if (((v_rowNameText ec) n) = "default") then ((v_rowLabelText ec) h) else (String.concat "" [((v_rowLabelText ec) h); "@"; ((v_rowNameText ec) n)])))

# 2617 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_namedLabelParts = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__497) -> (match dtb__497 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__498, dtb__499) -> (if (dtb__498 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut6 = dtb__499 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__500, dtb__501) -> (match dtb__501 with
  | B_dData_dList.C_List__x58__x58_ (dtb__502, dtb__503) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__500; B_dData_dPair.f_Pair_second = dtb__502 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2629 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryTextOf = (fun (ec : Elab_dTypes.t_Ec) (label : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_namedLabelParts ec) label) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_rowLabelText ec) label)
  | B_dData_dMaybe.C_Maybe_Just (dtb__504) -> (match dtb__504 with
  | { B_dData_dPair.f_Pair_first = dtb__505; B_dData_dPair.f_Pair_second = dtb__506 } -> (((v_rowEntryText ec) dtb__505) dtb__506)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2636 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowEffectLabels = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__507, dtb__508) -> (if (dtb__507 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (dtb__507 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__507, dtb__508))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__509) -> (match dtb__509 with
  | { B_dData_dPair.f_Pair_first = dtb__510; B_dData_dPair.f_Pair_second = dtb__511 } -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) dtb__510) then B_dData_dMaybe.C_Maybe_Nothing else (match (((v_rowEffectLabels (fuel - 1)) ec) dtb__511) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__512) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (((v_rowEntryTextOf ec) dtb__510), dtb__512))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2662 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowNonDefaultHostEntries = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__513, dtb__514) -> (if (dtb__513 = Base_dIntrinsics.v_effRowNilCtor) then B_dData_dList.C_List_Nil else (if (dtb__513 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__513, dtb__514))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__515) -> (match dtb__515 with
  | { B_dData_dPair.f_Pair_first = dtb__516; B_dData_dPair.f_Pair_second = dtb__517 } -> (let rest = (((v_rowNonDefaultHostEntries (fuel - 1)) ec) dtb__517) in (let nd_uscrut13 = ((v_namedLabelParts ec) dtb__516) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> rest
  | B_dData_dMaybe.C_Maybe_Just (dtb__518) -> (match dtb__518 with
  | { B_dData_dPair.f_Pair_first = dtb__519; B_dData_dPair.f_Pair_second = dtb__520 } -> (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) dtb__520) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VNeutral (dtb__521) -> (match dtb__521 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__522, dtb__523) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb__522) then (if (((v_rowNameText ec) dtb__519) = "default") then rest else (B_dData_dList.C_List__x58__x58_ ((((v_rowEntryText ec) dtb__519) dtb__520), rest))) else rest)
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

# 2688 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_joinEffectLabels = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__524, dtb__525) -> (match dtb__525 with
  | B_dData_dList.C_List_Nil -> dtb__524
  | _ -> (String.concat "" [dtb__524; ", "; (v_joinEffectLabels dtb__525)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2696 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_unhandledEffectLabel = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) -> (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__526) -> (if ((v_isNilRowValue ec) dtb__526) then (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__527) -> (match (((v_rowEffectLabels 64) ec) dtb__527) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__528) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__528) B_dData_dList.C_List_Nil) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__528)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2718 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_sameLabelValue = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let defs = (Elab_dTypes.v_ecDefTbl ec) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let fa = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) a) in (let fb = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) b) in (let nd_uscrut7 = (((Core_dEval.v_valueEqFuel Core_dTerm.v_defaultFuel) fa) fb) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__529) -> (if dtb__529 then true else false)
  | _ -> false
)))))))

# 2729 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowContainsValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (expected : Core_dTerm.t_Value) (label : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VCon (dtb__530, dtb__531) -> (if (dtb__530 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__530, dtb__531))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__532) -> (match dtb__532 with
  | { B_dData_dPair.f_Pair_first = dtb__533; B_dData_dPair.f_Pair_second = dtb__534 } -> (if (((v_sameLabelValue ec) label) dtb__533) then true else ((((v_rowContainsValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__534)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
)))

# 2744 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowSubValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (actual : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) actual) with
  | Core_dTerm.C_Value_VCon (dtb__535, dtb__536) -> (if (dtb__535 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__535 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__535, dtb__536))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__537) -> (match dtb__537 with
  | { B_dData_dPair.f_Pair_first = dtb__538; B_dData_dPair.f_Pair_second = dtb__539 } -> (if ((((v_rowContainsValue ec) (fuel - 1)) expected) dtb__538) then ((((v_rowSubValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__539)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)))

# 2808 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_weakenLabelTerm = (fun (d : int) (label : Core_dTerm.t_Value) (tailF : Core_dTerm.t_Value) (result : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effWeakenName)), ((Core_dEval.v_quote d) label), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) tailF), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) result), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)))

# 2764 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryEffLift = (fun (ctx : Elab_dTypes.t_Ctx) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (match (((Elab_dMeta.v_globalsLookup Base_dIntrinsics.v_effWeakenName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__540) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__541) -> (let nd_uscrut11 = (v_rowEntryLabelTail ((Elab_dTypes.v_forceVal ec) (B_dData_dPair.v_firstOf dtb__541))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__542) -> (match dtb__542 with
  | { B_dData_dPair.f_Pair_first = dtb__543; B_dData_dPair.f_Pair_second = dtb__544 } -> (let tailF = ((Elab_dTypes.v_forceVal ec) dtb__544) in (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) tailF) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__545) -> (match ((((Elab_dMeta.v_convEc ec) d) (B_dData_dPair.v_secondOf dtb__541)) (B_dData_dPair.v_secondOf dtb__545)) with
  | Base_dDiag.C_Check_ErrC (dtb__546) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__547) -> (let actualRow = (B_dData_dPair.v_firstOf dtb__545) in (if ((((v_rowSubValue dtb__547) 64) actualRow) (B_dData_dPair.v_firstOf dtb__541)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = term; B_dData_dPair.f_Pair_second = dtb__547 })) else (if ((v_isNilRowValue dtb__547) actualRow) then (match (((Elab_dMeta.v_globalsLookup Base_dIntrinsics.v_effRaiseName) globals) dtb__547) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__548) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effRaiseName)), ((Core_dEval.v_quote d) (B_dData_dPair.v_firstOf dtb__541)), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) (B_dData_dPair.v_secondOf dtb__541)), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)); B_dData_dPair.f_Pair_second = dtb__547 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Elab_dMeta.v_convEc dtb__547) d) actualRow) tailF) with
  | Base_dDiag.C_Check_ErrC (dtb__549) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__550) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((((v_weakenLabelTerm d) dtb__543) tailF) (B_dData_dPair.v_secondOf dtb__541)) term); B_dData_dPair.f_Pair_second = dtb__550 }))
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

# 2912 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeHeadTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__551) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__551) then (Core_dTerm.C_Term_TRecord (name, B_dData_dList.C_List_Nil)) else (Core_dTerm.C_Term_TGlobal (name)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2919 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeAppTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__552) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__552) then (Core_dTerm.C_Term_TRecord (name, args)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 3195 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromInt")), t, Core_dTerm.C_Rig_Rig1)))

# 3199 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromFloatTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromFloat")), t, Core_dTerm.C_Rig_Rig1)))

# 3202 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil))))

# 3205 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isStringTyValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__553) -> (match dtb__553 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__554, dtb__555) -> (match dtb__555 with
  | B_dData_dList.C_List_Nil -> (dtb__554 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 3287 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorSpineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__556) -> { B_dData_dPair.f_Pair_first = dtb__556; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__557, dtb__558) -> { B_dData_dPair.f_Pair_first = dtb__557; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__558) }
  | Core_dTerm.C_Term_TApp (dtb__559, dtb__560, dtb__561) -> (match (v_ctorSpineOfType dtb__559) with
  | { B_dData_dPair.f_Pair_first = dtb__562; B_dData_dPair.f_Pair_second = dtb__563 } -> { B_dData_dPair.f_Pair_first = dtb__562; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__563) (B_dData_dList.C_List__x58__x58_ (dtb__560, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 3283 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorResultArgs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__564, dtb__565, dtb__566, dtb__567, dtb__568) -> (v_ctorResultArgs dtb__568)
  | _ -> (B_dData_dPair.v_secondOf (v_ctorSpineOfType mc0))
))

# 3295 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__569, dtb__570, dtb__571, dtb__572, dtb__573) -> (v_dropPis dtb__573)
  | _ -> mc0
))

# 3299 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_identityArgs = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__574, dtb__575) -> (match dtb__574 with
  | Core_dTerm.C_Term_TVar (dtb__576, dtb__577, dtb__578) -> (if (dtb__577 = ((mc1 - 1) - mc0)) then (((v_identityArgs (mc0 + 1)) mc1) dtb__575) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 3309 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorIdentitySpine = (fun (fam : string) (ctor : Elab_dTypes.t_DtCtor) -> (let k = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor)) in (let args = (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor)) in (match (v_ctorSpineOfType (v_dropPis (Elab_dTypes.v_dtCtorType ctor))) with
  | { B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = dtb__580 } -> (if (dtb__579 = fam) then (if ((B_dData_dList.v_length args) > 0) then (if ((B_dData_dList.v_length args) <= k) then (((v_identityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
))))

# 3325 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_takeRigsGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__581, dtb__582) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__581), ((v_takeRigsGo (mc0 - 1)) dtb__582))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 3322 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_takeRigs = (fun (n : int) (bs : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_takeRigsGo n) bs))

# 3343 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorFamilyArgsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc4 : int) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__583, dtb__584) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__585, dtb__586) -> (match ((Elab_dTypes.v_forceVal mc0) mc1) with
  | Core_dTerm.C_Value_VPi (dtb__587, dtb__588, dtb__589, dtb__590, dtb__591) -> (if dtb__588 then ((((((v_ctorFamilyArgsGo mc0) ((Core_dEval.v_applyClosure dtb__591) dtb__583)) dtb__584) dtb__586) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote mc4) dtb__583); B_dData_dPair.f_Pair_second = dtb__585 }, mc5))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 3329 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFamilyArgs = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ctor : Elab_dTypes.t_DtCtor) (expected : Core_dTerm.t_Value) -> (let fam = (Elab_dTypes.v_dtCtorFamily ctor) in (if ((v_ctorIdentitySpine fam) ctor) then (let nd_uscrut5 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__592) -> (match dtb__592 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__593, dtb__594) -> (let arity = (B_dData_dList.v_length (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor))) in (if (dtb__593 = fam) then (if ((B_dData_dList.v_length dtb__594) = arity) then ((((((v_ctorFamilyArgsGo ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType ctor))) dtb__594) ((v_takeRigs arity) (Elab_dTypes.v_dtCtorTelescope ctor))) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 3365 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natPatGo = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n <= 0) then (Frontend_dAst.C_Pat_PCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef sp))) else (Frontend_dAst.C_Pat_PCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ (((v_natPatGo (n - 1)) sp), B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef sp)))))

# 3361 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natPatOf = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC (((v_natPatGo n) sp)))))

# 3373 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dAst.t_Pat) -> (let dtnat__595 = mc0 in (if (dtnat__595 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__596 = (dtnat__595 - 1) in (match mc4 with
  | Frontend_dAst.C_Pat_PCon (dtb__597, dtb__598, dtb__599) -> (let nd_uscrut9 = (Frontend_dReserved.v_classify dtb__597) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__600) -> (match dtb__600 with
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__601, dtb__602) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor mc1) (Frontend_dAst.v_nodeRefSpan dtb__599)) (B_dData_dMaybe.C_Maybe_Just (mc3))) dtb__601) dtb__602)) (fun (target : string) -> (((((((v_resolveCtorPatFuel dtb__596) mc1) mc2) mc3) target) dtb__598) (Frontend_dAst.v_nodeRefSpan dtb__599))))
  | Frontend_dReserved.C_Reserved_RsListCons -> (match ((v_litFamilyCons mc1) ((v_listLitFamily mc1) mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__603) -> (((((((v_resolveCtorPatFuel dtb__596) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__603)) dtb__598) (Frontend_dAst.v_nodeRefSpan dtb__599))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("__list_literal__", dtb__598, dtb__599)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dReserved.C_Reserved_RsListNil -> (match (((v_litFamilyCtor mc1) ((v_listLitFamily mc1) mc3)) "Nil") with
  | B_dData_dMaybe.C_Maybe_Just (dtb__604) -> (((((((v_resolveCtorPatFuel dtb__596) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__604)) dtb__598) (Frontend_dAst.v_nodeRefSpan dtb__599))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("__list_literal__", dtb__598, dtb__599)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_resolveCtorPatFuel dtb__596) mc1) mc2) mc3) dtb__597) dtb__598) (Frontend_dAst.v_nodeRefSpan dtb__599))
)
  | _ -> (((((((v_resolveCtorPatFuel dtb__596) mc1) mc2) mc3) dtb__597) dtb__598) (Frontend_dAst.v_nodeRefSpan dtb__599))
))
  | Frontend_dAst.C_Pat_PInt (dtb__605, dtb__606) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__605) (Frontend_dAst.v_nodeRefSpan dtb__606))) (fun (p : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | Frontend_dAst.C_Pat_PAs (dtb__607, dtb__608, dtb__609) -> (match dtb__608 with
  | Frontend_dAst.C_Pat_PInt (dtb__610, dtb__611) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__610) (Frontend_dAst.v_nodeRefSpan dtb__611))) (fun (p : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__607, p, dtb__609)); B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | Frontend_dAst.C_Pat_PRecord (dtb__612, dtb__613, dtb__614) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)))))
# 3411 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolveCtorPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : string) (mc5 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc6 : Base_dSource.t_Span) -> (let dtnat__615 = mc0 in (if (dtnat__615 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__616 = (dtnat__615 - 1) in (match ((Elab_dMeta.v_dtCtorLookupEc mc1) mc4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (mc4, mc5, (Frontend_dAst.v_detachedNodeRef mc6))); B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__617) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs mc1) mc2) dtb__617) mc3) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__618) -> (match dtb__618 with
  | { B_dData_dPair.f_Pair_first = dtb__619; B_dData_dPair.f_Pair_second = dtb__620 } -> (match dtb__620 with
  | { B_dData_dPair.f_Pair_first = dtb__621; B_dData_dPair.f_Pair_second = dtb__622 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__616) dtb__622) mc2) dtb__621) mc5)) (fun (q : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__623; B_dData_dPair.f_Pair_second = dtb__624 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (mc4, dtb__623, (Frontend_dAst.v_detachedNodeRef mc6))); B_dData_dPair.f_Pair_second = dtb__624 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (mc4, mc5, (Frontend_dAst.v_detachedNodeRef mc6))); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))
# 3427 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolvePatArgsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__625 = mc0 in (if (dtnat__625 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__626 = (dtnat__625 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__627, dtb__628) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__629, dtb__630, dtb__631, dtb__632, dtb__633) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__629, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__629) dtb__632) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__633) v) in (if dtb__630 then (((((v_resolvePatArgsFuel dtb__626) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__627, dtb__628))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__626) mc1) mc2) dtb__632) dtb__627)) (fun (p : (Frontend_dAst.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__634; B_dData_dPair.f_Pair_second = dtb__635 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__626) dtb__635) ctx2) ty2) dtb__628)) (fun (q : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__636; B_dData_dPair.f_Pair_second = dtb__637 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__634, dtb__636)); B_dData_dPair.f_Pair_second = dtb__637 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3459 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverAltsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__638 = mc0 in (if (dtnat__638 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__639 = (dtnat__638 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__640, dtb__641) -> (match dtb__640 with
  | { B_dData_dPair.f_Pair_first = dtb__642; B_dData_dPair.f_Pair_second = dtb__643 } -> ((Base_dCommon.v_bind (((((v_resolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__642)) (fun (p : (Frontend_dAst.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__644; B_dData_dPair.f_Pair_second = dtb__645 } -> ((Base_dCommon.v_bind (((((v_resolveOverAltsGo dtb__639) dtb__645) mc2) mc3) dtb__641)) (fun (q : ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__646; B_dData_dPair.f_Pair_second = dtb__647 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__644; B_dData_dPair.f_Pair_second = dtb__643 }, dtb__646)); B_dData_dPair.f_Pair_second = dtb__647 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3455 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverAlts = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Value) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 3501 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveClausePatsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__648 = mc0 in (if (dtnat__648 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__649 = (dtnat__648 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__650, dtb__651) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__652, dtb__653, dtb__654, dtb__655, dtb__656) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__652, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__652) dtb__655) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__656) v) in (if dtb__653 then (((((v_resolveClausePatsFuel dtb__649) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__650, dtb__651))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__649) mc1) mc2) dtb__655) dtb__650)) (fun (q : (Frontend_dAst.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__657; B_dData_dPair.f_Pair_second = dtb__658 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel dtb__649) dtb__658) ctx2) ty2) dtb__651)) (fun (r : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__659; B_dData_dPair.f_Pair_second = dtb__660 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__657, dtb__659)); B_dData_dPair.f_Pair_second = dtb__660 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3483 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverFunPatsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__661 = mc0 in (if (dtnat__661 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__662 = (dtnat__661 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__663, dtb__664) -> (match dtb__663 with
  | { B_dData_dPair.f_Pair_first = dtb__665; B_dData_dPair.f_Pair_second = dtb__666 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__665)) (fun (q : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__667; B_dData_dPair.f_Pair_second = dtb__668 } -> ((Base_dCommon.v_bind (((((v_resolveOverFunPatsGo dtb__662) dtb__668) mc2) mc3) dtb__664)) (fun (r : ((Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__669; B_dData_dPair.f_Pair_second = dtb__670 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__667; B_dData_dPair.f_Pair_second = dtb__666 }, dtb__669)); B_dData_dPair.f_Pair_second = dtb__670 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3478 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverFunPats = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 3582 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doMarkerHead = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__671, dtb__672, dtb__673) -> (match dtb__671 with
  | Frontend_dAst.C_Expr_EVar (dtb__674, dtb__675) -> (match (Frontend_dReserved.v_doSyntaxCanonical dtb__674) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__676) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 3605 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_decodeDoChain = (fun (fuel : int) (canonical : string) (acc : t_DoChainStep B_dData_dList.t_List) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = expr in (match nd_uscrut4 with
  | Frontend_dAst.C_Expr_EApp (dtb__677, dtb__678, dtb__679) -> (match dtb__677 with
  | Frontend_dAst.C_Expr_EVar (dtb__680, dtb__681) -> (match (Frontend_dReserved.v_doSyntaxCanonical dtb__680) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = expr }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__682) -> (if (canonical <> dtb__682) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut12 = dtb__678 in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__683, dtb__684) -> (match dtb__684 with
  | B_dData_dList.C_List__x58__x58_ (dtb__685, dtb__686) -> (match dtb__685 with
  | Frontend_dAst.C_Expr_ELam (dtb__687, dtb__688, dtb__689) -> (match dtb__687 with
  | B_dData_dList.C_List__x58__x58_ (dtb__690, dtb__691) -> (match dtb__690 with
  | { B_dData_dPair.f_Pair_first = dtb__692; B_dData_dPair.f_Pair_second = dtb__693 } -> (match dtb__691 with
  | B_dData_dList.C_List_Nil -> (match dtb__686 with
  | B_dData_dList.C_List_Nil -> ((((v_decodeDoChain (fuel - 1)) dtb__682) (B_dData_dList.C_List__x58__x58_ ((C_DoChainStep_DoChainStep (dtb__692, dtb__683, (Frontend_dAst.v_nodeRefSpan dtb__681), dtb__693)), acc))) dtb__688)
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

# 3624 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_decodeDoBlock = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__694, dtb__695, dtb__696) -> (match dtb__694 with
  | Frontend_dAst.C_Expr_EVar (dtb__697, dtb__698) -> (match (Frontend_dReserved.v_doSyntaxCanonical dtb__697) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__699) -> (let nd_uscrut8 = ((((v_decodeDoChain 4096) dtb__699) B_dData_dList.C_List_Nil) mc0) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__700) -> (match dtb__700 with
  | { B_dData_dPair.f_Pair_first = dtb__701; B_dData_dPair.f_Pair_second = dtb__702 } -> (B_dData_dMaybe.C_Maybe_Just ({ f_DoChain_doChainCanonical = dtb__699; f_DoChain_doChainSteps = dtb__701; f_DoChain_doChainLast = dtb__702; f_DoChain_doChainSpan = (Frontend_dAst.v_nodeRefSpan dtb__698) }))
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

# 3636 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_doChainBuild = (fun (mc0 : string) (mc1 : t_DoChainStep B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__703, dtb__704) -> (match dtb__703 with
  | C_DoChainStep_DoChainStep (dtb__705, dtb__706, dtb__707, dtb__708) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc0, (Frontend_dAst.v_detachedNodeRef dtb__707))), (B_dData_dList.C_List__x58__x58_ (dtb__706, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__705; B_dData_dPair.f_Pair_second = dtb__708 }, B_dData_dList.C_List_Nil)), ((((v_doChainBuild mc0) dtb__704) mc2) mc3), (Frontend_dAst.v_detachedNodeRef dtb__707))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef dtb__707)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 3645 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainFallback = (fun (chain : t_DoChain) -> ((((v_doChainBuild (chain).f_DoChain_doChainCanonical) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast) (chain).f_DoChain_doChainSpan))

# 3652 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_splitDoSpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__709, dtb__710) -> (match ((v_splitDoSpine ((Core_dEval.v_applyValue mc0) dtb__709)) dtb__710) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__709 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__711) -> (B_dData_dMaybe.C_Maybe_Just (dtb__711))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 3660 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_splitDoExpected = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VNeutral (dtb__712) -> (match dtb__712 with
  | Core_dTerm.C_Neutral_NVar (dtb__713, dtb__714, dtb__715) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__713, dtb__714, B_dData_dList.C_List_Nil))))) dtb__715)
  | Core_dTerm.C_Neutral_NGlobal (dtb__716, dtb__717) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__716, B_dData_dList.C_List_Nil))))) dtb__717)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindShapeOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__718, dtb__719, dtb__720, dtb__721, dtb__722) -> (if dtb__719 then (match dtb__722 with
  | Core_dTerm.C_Term_TPi (dtb__723, dtb__724, dtb__725, dtb__726, dtb__727) -> (if dtb__724 then (match dtb__726 with
  | Core_dTerm.C_Term_TApp (dtb__728, dtb__729, dtb__730) -> (match dtb__728 with
  | Core_dTerm.C_Term_TGlobal (dtb__731) -> (match dtb__729 with
  | Core_dTerm.C_Term_TVar (dtb__732, dtb__733, dtb__734) -> (match dtb__727 with
  | Core_dTerm.C_Term_TPi (dtb__735, dtb__736, dtb__737, dtb__738, dtb__739) -> (if dtb__736 then (match dtb__739 with
  | Core_dTerm.C_Term_TPi (dtb__740, dtb__741, dtb__742, dtb__743, dtb__744) -> (if dtb__741 then (match dtb__744 with
  | Core_dTerm.C_Term_TPi (dtb__745, dtb__746, dtb__747, dtb__748, dtb__749) -> (if dtb__746 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__748 with
  | Core_dTerm.C_Term_TApp (dtb__750, dtb__751, dtb__752) -> (match dtb__750 with
  | Core_dTerm.C_Term_TVar (dtb__753, dtb__754, dtb__755) -> (match dtb__751 with
  | Core_dTerm.C_Term_TVar (dtb__756, dtb__757, dtb__758) -> (match dtb__749 with
  | Core_dTerm.C_Term_TPi (dtb__759, dtb__760, dtb__761, dtb__762, dtb__763) -> (if dtb__760 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__762 with
  | Core_dTerm.C_Term_TPi (dtb__764, dtb__765, dtb__766, dtb__767, dtb__768) -> (if dtb__765 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__767 with
  | Core_dTerm.C_Term_TVar (dtb__769, dtb__770, dtb__771) -> (match dtb__768 with
  | Core_dTerm.C_Term_TApp (dtb__772, dtb__773, dtb__774) -> (match dtb__772 with
  | Core_dTerm.C_Term_TVar (dtb__775, dtb__776, dtb__777) -> (match dtb__773 with
  | Core_dTerm.C_Term_TVar (dtb__778, dtb__779, dtb__780) -> (match dtb__763 with
  | Core_dTerm.C_Term_TApp (dtb__781, dtb__782, dtb__783) -> (match dtb__781 with
  | Core_dTerm.C_Term_TVar (dtb__784, dtb__785, dtb__786) -> (match dtb__782 with
  | Core_dTerm.C_Term_TVar (dtb__787, dtb__788, dtb__789) -> (if (if (if (if (dtb__733 = 0) then (dtb__754 = 3) else false) then (dtb__776 = 5) else false) then (dtb__785 = 5) else false) then (if (if (if (if (dtb__757 = 1) then (dtb__770 = 2) else false) then (dtb__779 = 2) else false) then (dtb__788 = 2) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__747, dtb__761, dtb__766)))) else (if (if (if (if (dtb__757 = 0) then (dtb__770 = 1) else false) then (dtb__779 = 3) else false) then (dtb__788 = 3) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__747, dtb__761, dtb__766)))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 3693 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindHeadOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (match ((Elab_dTypes.v_ctxLookup bindName) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__790) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup bindName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__791) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (bindName)); B_dData_dPair.f_Pair_second = dtb__791 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 3704 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBlockShapeOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (let nd_uscrut4 = ((((v_doBindHeadOf globals) ctx) ec) bindName) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__792) -> (match dtb__792 with
  | { B_dData_dPair.f_Pair_first = dtb__793; B_dData_dPair.f_Pair_second = dtb__794 } -> (match (v_bindShapeOf dtb__794) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__795) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__793; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__794; B_dData_dPair.f_Pair_second = dtb__795 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 3716 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictDefer = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__796; B_dData_dPair.f_Pair_second = dtb__797 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__796; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__797) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__797) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)))

# 3725 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictStep = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dom) then ((((v_doDictDefer ctx) ec) dom) sp) else (let nd_uscrut6 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) ((Elab_dTypes.v_forceVal ec) dom)) sp) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_ErrC (dtb__798) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (if ((Elab_dDict.v_isRigidDictArg ec) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (Base_dDiag.C_Check_ErrC (dtb__798))))
  | Base_dDiag.C_Check_OkC (dtb__799) -> (match dtb__799 with
  | { B_dData_dPair.f_Pair_first = dtb__800; B_dData_dPair.f_Pair_second = dtb__801 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__800; B_dData_dPair.f_Pair_second = dtb__801 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3753 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDoBlock = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (bindName : string) (headTerm : Core_dTerm.t_Term) (bindTyTerm : Core_dTerm.t_Term) (shape : t_DoBindShape) (mVal : Core_dTerm.t_Value) (aVal : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match shape with
  | C_DoBindShape_DoBindShape (dtb__802, dtb__803, dtb__804) -> (let nd_uscrut14 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) bindTyTerm)) in (match nd_uscrut14 with
  | Core_dTerm.C_Value_VPi (dtb__805, dtb__806, dtb__807, dtb__808, dtb__809) -> (if dtb__806 then (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_applyClosure dtb__809) mVal)) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VPi (dtb__810, dtb__811, dtb__812, dtb__813, dtb__814) -> (if dtb__811 then (if ((Elab_dDict.v_isDictDomain ec) dtb__813) then ((Base_dCommon.v_bind ((((((v_doDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__813)) (fun (dp : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dp with
  | { B_dData_dPair.f_Pair_first = dtb__815; B_dData_dPair.f_Pair_second = dtb__816 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ f_DoPlan_planBind = bindName; f_DoPlan_planHead = headTerm; f_DoPlan_planMTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) mVal); f_DoPlan_planMVal = mVal; f_DoPlan_planAVal = aVal; f_DoPlan_planDictTerm = dtb__815; f_DoPlan_planRigE = dtb__802; f_DoPlan_planRigL = dtb__803; f_DoPlan_planInnerRig = dtb__804; f_DoPlan_planEc = dtb__816 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))
  | _ -> failwith "DT: impossible branch"
)))

# 3780 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindAppTerm = (fun (ecLinear : Elab_dTypes.t_Ec) (ecPaper : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (binderSp : Base_dSource.t_Span) (plan : t_DoPlan) (binder : string) (aVal : Core_dTerm.t_Value) (eTerm : Core_dTerm.t_Term) (argRig : Core_dTerm.t_Rig) (lamRig : Core_dTerm.t_Rig) (inner : Core_dTerm.t_Term) -> (let depth = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue binder) aVal) ctx) in (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) inner) else inner) in (let slot0 = ((Core_dTerm.v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) (B_dData_dMaybe.C_Maybe_Just ((((Core_dTerm.v_shift 0) 1) ((Core_dEval.v_quote depth) ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) (plan).f_DoPlan_planAVal)))))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear ecLinear) ctx) then (if (((Elab_dMeta.v_termHasOuterLinear ecLinear) ctx2) inner) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (let lamTerm = (Core_dTerm.C_Term_TLam (binder, lamRig, slot, binderSp, inner2)) in (let args = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planMTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planDictTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) aVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) (plan).f_DoPlan_planAVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = eTerm; B_dData_dPair.f_Pair_second = argRig }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = lamTerm; B_dData_dPair.f_Pair_second = (plan).f_DoPlan_planRigL }, B_dData_dList.C_List_Nil)))))))))))) in ((Elab_dMeta.v_foldAppTerms (plan).f_DoPlan_planHead) args)))))))))

# 67 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_elabConAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (scrutVal : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) (cname : string) (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (psp : Base_dSource.t_Span) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_findCtorIn cname) (Elab_dTypes.v_dtDataCtors dd)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 psp) (Base_dDiagnostics_dTc.C_TcErr_UnknownConstructorInCase ((Frontend_dAst.v_ctorDisplayName cname), (Elab_dTypes.v_dtDataName dd)))) (Frontend_dAst.v_ctorDisplayName cname)) (Elab_dTypes.v_dtDataName dd))
  | B_dData_dMaybe.C_Maybe_Just (dtb__817) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((((Elab_dCase.v_bindCtorTele (Frontend_dAst.v_ctorDisplayName cname)) ((v_ctorFieldLabels dd) dtb__817)) ctx) (Elab_dTypes.v_dtCtorType dtb__817)) args))) (fun (p : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dAst.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__818; B_dData_dPair.f_Pair_second = dtb__819 } -> (match dtb__819 with
  | { B_dData_dPair.f_Pair_first = dtb__820; B_dData_dPair.f_Pair_second = dtb__821 } -> (if (Elab_dMeta.v_nonEmpty dtb__821) then (((Base_dDiagnostics_dTc.v_tcErr1 psp) (Base_dDiagnostics_dTc.C_TcErr_BranchTooManyArgs ((Frontend_dAst.v_ctorDisplayName cname)))) (Frontend_dAst.v_ctorDisplayName cname)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((((Elab_dCase.v_unifyIdxListSized ec) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb__818)) ((Elab_dCase.v_ctorResultValsIn dtb__818) dtb__817)) ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) v))) idxs)))) (fun (refsIdx : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((Elab_dCase.v_branchAfterUnify ec) dtb__818) refsIdx) with
  | Elab_dCase.C_BranchVerdict_BranchImpossibleIndex -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex)
  | Elab_dCase.C_BranchVerdict_BranchImpossibleEmptyCtx -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchEmptyCtx)
  | Elab_dCase.C_BranchVerdict_BranchOk -> ((Base_dCommon.v_bind (((((Elab_dCase.v_reflectScrutinee ec) (Elab_dTypes.v_ctxDepth dtb__818)) refsIdx) ((Elab_dCase.v_ctorValueIn dtb__818) dtb__817)) scrutVal)) (fun (refs2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let refinedExpected = (((Elab_dTypes.v_refineValue refs2) Core_dTerm.v_defaultFuel) expected) in (let branchCtx2 = ((Elab_dTypes.v_ctxRefine dtb__818) refs2) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__822; B_dData_dPair.f_Pair_second = dtb__823 } -> (let n = (B_dData_dList.v_length dtb__820) in (let opaqueIdxs = ((((v_opaqueBranchIndices dtb__823) branchCtx2) n) (Core_dTerm.v_binderPairs dtb__820)) in (let bodyTerm1 = ((Elab_dMeta.v_wrapOpaqueUses opaqueIdxs) dtb__822) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__823) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = cname; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__820; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }; B_dData_dPair.f_Pair_second = dtb__823 }))))))
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
# 108 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCaseAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) (mc5 : Elab_dTypes.t_DtData) (mc6 : Core_dTerm.t_Value B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Core_dTerm.t_Value) (mc9 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__824, dtb__825) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__824 with
  | { B_dData_dPair.f_Pair_first = dtb__826; B_dData_dPair.f_Pair_second = dtb__827 } -> (match dtb__826 with
  | Frontend_dAst.C_Pat_PCon (dtb__828, dtb__829, dtb__830) -> ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__828) dtb__829) (Frontend_dAst.v_nodeRefSpan dtb__830)) dtb__827)) (fun (p : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__831; B_dData_dPair.f_Pair_second = dtb__832 } -> (((((((((((v_elabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__832) mc4) mc5) mc6) mc7) mc8) dtb__825) (B_dData_dList.C_List__x58__x58_ (dtb__831, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PVar (dtb__833, dtb__834) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__825) mc10) dtb__827) dtb__833) (Frontend_dAst.v_nodeRefSpan dtb__834))
  | Frontend_dAst.C_Pat_PWild (dtb__835) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__825) mc10) dtb__827) "_") (Frontend_dAst.v_nodeRefSpan dtb__835))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb__826)) Base_dDiagnostics_dTc.C_TcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc10); B_dData_dPair.f_Pair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 132 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCatchAllFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (pname : string) (psp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (if (pname = "_") then ctx else (((Elab_dTypes.v_ctxBindValue pname) scrutTy) ctx)) in (if (Elab_dMeta.v_nonEmpty rest) then ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast) else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__836; B_dData_dPair.f_Pair_second = dtb__837 } -> (let binds = (if (pname = "_") then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = pname; Core_dTerm.f_Binder_binderRig = ((Elab_dMeta.v_rigOfLinearValue ec) scrutTy); Core_dTerm.f_Binder_binderSpan = ((Base_dSource.v_spanAtName pname) psp) }, B_dData_dList.C_List_Nil))) in (let bodyTerm1 = (if (pname = "_") then dtb__836 else (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__837) ctx) scrutTy) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__836) else dtb__836)) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__837) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = binds; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }, acc))); B_dData_dPair.f_Pair_second = dtb__837 })))))
  | _ -> failwith "DT: impossible branch"
)))))))
# 162 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dAst.t_Expr) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun (ps : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = ps in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__838; B_dData_dPair.f_Pair_second = dtb__839 } -> (match dtb__839 with
  | { B_dData_dPair.f_Pair_first = dtb__840; B_dData_dPair.f_Pair_second = dtb__841 } -> (if (((v_natLitCaseFast dtb__841) dtb__840) alts) then ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__841) alts)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> ((((((((((v_checkNatLitCaseFuel (fuel - 1)) globals) ctx) ec3) (v_natToIntTerm dtb__838)) dtb__838) v_natTyValue) alts) expected) sp))) else ((Base_dCommon.v_bind ((((v_resolveOverAlts dtb__841) ctx) dtb__840) alts)) (fun (q : ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__842; B_dData_dPair.f_Pair_second = dtb__843 } -> (let caseFuel = (((B_dTrait_dOrd.v_max B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (fuel - 1)) (Elab_dCoverage.v_coverageFuelFor ((B_dData_dList.v_map (fun (alt : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)))) dtb__842))) in ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__843) dtb__842)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> (if (v_needsMatrixCase dtb__842) then ((((((((v_checkCaseMatrixFuel caseFuel) globals) ctx) ec3) scrut) dtb__842) expected) sp) else (((((((((v_checkCaseFamFuel caseFuel) globals) ctx) ec3) dtb__838) dtb__840) dtb__842) expected) sp)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 196 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseMatrixFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dAst.t_Expr) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let name = ("nd_scrut" ^ (bi_strFromInt (Elab_dTypes.v_ctxDepth ctx))) in (let clauses = ((B_dData_dList.v_map (fun (alt : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf alt) })) alts) in (let table = (Elab_dMeta.v_ctorFamilyTable ec) in ((Base_dCommon.v_bind (((Elab_dMatch.v_multiToCaseExpr table) clauses) name)) (fun (bodyExpr : Frontend_dAst.t_Expr) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf clauses))) sp) ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (name, (Frontend_dAst.v_detachedNodeRef sp))); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (scrut)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = (Frontend_dAst.v_detachedNodeRef sp) }, B_dData_dList.C_List_Nil)), bodyExpr, false, (Frontend_dAst.v_detachedNodeRef sp)))) expected)))))))))
# 207 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFamFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) scrutTy) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VNeutral (dtb__844) -> (match dtb__844 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__845, dtb__846) -> (if (if (Base_dIntrinsics.v_isBoolCanonical dtb__845) then ((B_dData_dList.v_length dtb__846) = 0) else false) then ((((((((v_checkBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__845 = Base_dIntrinsics.v_intTypeName) then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) Base_dIntrinsics.v_intTypeName) alts) expected) sp) else (if (dtb__845 = Base_dIntrinsics.v_strTypeName) then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) Base_dIntrinsics.v_strTypeName) alts) expected) sp) else (((((((((((v_checkCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__845) dtb__846) alts) expected) sp))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
))))
# 217 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkBoolCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) ec) alts) Base_dIntrinsics.v_boolTrueCtor) expected) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__847; B_dData_dPair.f_Pair_second = dtb__848 } -> (match dtb__848 with
  | { B_dData_dPair.f_Pair_first = dtb__849; B_dData_dPair.f_Pair_second = dtb__850 } -> (match dtb__849 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__851) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__847, dtb__851)); B_dData_dPair.f_Pair_second = dtb__850 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) dtb__850) alts) Base_dIntrinsics.v_boolFalseCtor) expected) sp)) (fun (q : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__852; B_dData_dPair.f_Pair_second = dtb__853 } -> (match dtb__853 with
  | { B_dData_dPair.f_Pair_first = dtb__854; B_dData_dPair.f_Pair_second = dtb__855 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__847, dtb__852)); B_dData_dPair.f_Pair_second = dtb__855 }))
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
# 237 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (target : string) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((((((v_boolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) B_dData_dMaybe.C_Maybe_Nothing)))
# 244 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) (mc8 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__856, dtb__857) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__856 with
  | { B_dData_dPair.f_Pair_first = dtb__858; B_dData_dPair.f_Pair_second = dtb__859 } -> (match dtb__858 with
  | Frontend_dAst.C_Pat_PCon (dtb__860, dtb__861, dtb__862) -> (if (dtb__860 = mc5) then ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__859) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__863; B_dData_dPair.f_Pair_second = dtb__864 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__863; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc8; B_dData_dPair.f_Pair_second = dtb__864 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__857) mc5) mc6) mc7) mc8))
  | Frontend_dAst.C_Pat_PVar (dtb__865, dtb__866) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__859) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__867; B_dData_dPair.f_Pair_second = dtb__868 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__868) dtb__857) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__867)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PWild (dtb__869) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__859) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__870; B_dData_dPair.f_Pair_second = dtb__871 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__871) dtb__857) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__870)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb__858)) Base_dDiagnostics_dTc.C_TcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match mc8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__872) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__872; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc3 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc7) (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive ((Frontend_dAst.v_ctorDisplayName mc5)))) (Frontend_dAst.v_ctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 284 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__873; B_dData_dPair.f_Pair_second = dtb__874 } -> (match dtb__874 with
  | { B_dData_dPair.f_Pair_first = dtb__875; B_dData_dPair.f_Pair_second = dtb__876 } -> (if dtb__875 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__873; B_dData_dPair.f_Pair_second = dtb__876 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 298 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : string) (mc6 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__877, dtb__878) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__877 with
  | { B_dData_dPair.f_Pair_first = dtb__879; B_dData_dPair.f_Pair_second = dtb__880 } -> (match dtb__879 with
  | Frontend_dAst.C_Pat_PInt (dtb__881, dtb__882) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TInt (dtb__881))) dtb__880) dtb__878) mc7) mc8)
  | Frontend_dAst.C_Pat_PStr (dtb__883, dtb__884) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TStr (dtb__883))) dtb__880) dtb__878) mc7) mc8)
  | Frontend_dAst.C_Pat_PVar (dtb__885, dtb__886) -> ((Base_dCommon.v_bind (((((((((((v_checkLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__885) dtb__880) mc7) ((Base_dSource.v_spanAtName dtb__885) (Frontend_dAst.v_nodeRefSpan dtb__886))) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__887; B_dData_dPair.f_Pair_second = dtb__888 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__887; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__888 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PWild (dtb__889) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__880) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__890; B_dData_dPair.f_Pair_second = dtb__891 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__890; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__891 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb__879)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 325 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_litAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (litTerm : Core_dTerm.t_Term) (body : Frontend_dAst.t_Expr) (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__892; B_dData_dPair.f_Pair_second = dtb__893 } -> ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) dtb__893) scrutTerm) tyName) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = q in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__894; B_dData_dPair.f_Pair_second = dtb__895 } -> (match dtb__895 with
  | { B_dData_dPair.f_Pair_first = dtb__896; B_dData_dPair.f_Pair_second = dtb__897 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_litEqName tyName))), scrutTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__892, dtb__894)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__896; B_dData_dPair.f_Pair_second = dtb__897 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 342 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (name : string) (body : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) ctx) in (let rig = ((Elab_dMeta.v_piBinderRig false) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__898; B_dData_dPair.f_Pair_second = dtb__899 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__898)), scrutTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__899 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 383 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__900; B_dData_dPair.f_Pair_second = dtb__901 } -> (match dtb__901 with
  | { B_dData_dPair.f_Pair_first = dtb__902; B_dData_dPair.f_Pair_second = dtb__903 } -> (if dtb__902 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__900; B_dData_dPair.f_Pair_second = dtb__903 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 395 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : Core_dTerm.t_Term) (mc6 : Core_dTerm.t_Value) (mc7 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc8 : Core_dTerm.t_Value) (mc9 : Base_dSource.t_Span) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__904, dtb__905) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__904 with
  | { B_dData_dPair.f_Pair_first = dtb__906; B_dData_dPair.f_Pair_second = dtb__907 } -> (match dtb__906 with
  | Frontend_dAst.C_Pat_PInt (dtb__908, dtb__909) -> ((((((((((((v_natLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Core_dTerm.C_Term_TInt (dtb__908))) dtb__907) dtb__905) mc8) mc9)
  | Frontend_dAst.C_Pat_PVar (dtb__910, dtb__911) -> ((Base_dCommon.v_bind (((((((((((v_checkNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__910) dtb__907) mc8) ((Base_dSource.v_spanAtName dtb__910) (Frontend_dAst.v_nodeRefSpan dtb__911))) mc9)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__912; B_dData_dPair.f_Pair_second = dtb__913 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__912; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__913 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PWild (dtb__914) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__907) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__915; B_dData_dPair.f_Pair_second = dtb__916 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__915; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__916 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb__906)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 420 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_natLitAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (litTerm : Core_dTerm.t_Term) (body : Frontend_dAst.t_Expr) (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__917; B_dData_dPair.f_Pair_second = dtb__918 } -> ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__918) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = q in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__919; B_dData_dPair.f_Pair_second = dtb__920 } -> (match dtb__920 with
  | { B_dData_dPair.f_Pair_first = dtb__921; B_dData_dPair.f_Pair_second = dtb__922 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("bi_eq_int")), cmpTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__917, dtb__919)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__921; B_dData_dPair.f_Pair_second = dtb__922 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 436 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (name : string) (body : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) binderTy) ctx) in (let rig = ((Elab_dMeta.v_piBinderRig false) binderTy) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__923; B_dData_dPair.f_Pair_second = dtb__924 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__923)), bindTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__924 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 450 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseOfFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (fam : string) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
  | B_dData_dMaybe.C_Maybe_Just (dtb__925) -> ((Base_dCommon.v_bind (((((((((((v_elabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__925) idxs) ((Elab_dTypes.v_evalCtx ctx) scrutTerm)) expected) alts) B_dData_dList.C_List_Nil)) (fun (p : (Core_dTerm.t_CaseAlt B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__926; B_dData_dPair.f_Pair_second = dtb__927 } -> (((((((((Elab_dCase.v_checkCaseDone dtb__927) ctx) dtb__925) idxs) alts) expected) sp) scrutTerm) dtb__926)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 466 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferCaseEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dAst.t_Expr) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let pmeta = (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__928; B_dData_dPair.f_Pair_second = dtb__929 } -> (let metaTy = ((Elab_dTypes.v_evalCtx ctx) dtb__928) in ((Base_dCommon.v_bind ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) dtb__929) scrut) alts) metaTy) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__930; B_dData_dPair.f_Pair_second = dtb__931 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__930; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = metaTy; B_dData_dPair.f_Pair_second = dtb__931 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 486 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCondBoolFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (c : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) c) Elab_dPrelude.v_boolTyValue) with
  | Base_dDiag.C_Check_OkC (dtb__932) -> (Base_dDiag.C_Check_OkC (dtb__932))
  | Base_dDiag.C_Check_ErrC (dtb__933) -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pc in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__934; B_dData_dPair.f_Pair_second = dtb__935 } -> (match dtb__935 with
  | { B_dData_dPair.f_Pair_first = dtb__936; B_dData_dPair.f_Pair_second = dtb__937 } -> (if (Elab_dMeta.v_isBoolType dtb__936) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__934; B_dData_dPair.f_Pair_second = dtb__937 })) else ((Elab_dTypes.v_errAt sp) (String.concat "" ["if condition must be "; Base_dIntrinsics.v_boolTypeName; " (got "; ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__936); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 754 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__938) -> ((Base_dCommon.v_bind ((((v_handleCallExprAt globals) ec) expr) (Frontend_dAst.v_exprRef expr))) (fun (callExpr : Frontend_dAst.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr) with
  | Base_dDiag.C_Check_OkC (dtb__939) -> (Base_dDiag.C_Check_OkC (dtb__939))
  | Base_dDiag.C_Check_ErrC (dtb__940) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dAst.v_exprRef expr))) (fun (callExpr2 : Frontend_dAst.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr2) with
  | Base_dDiag.C_Check_OkC (dtb__941) -> (Base_dDiag.C_Check_OkC (dtb__941))
  | Base_dDiag.C_Check_ErrC (dtb__942) -> ((Base_dCommon.v_bind ((((v_handleCallExpr globals) ec) expr) (Frontend_dAst.v_exprRef expr))) (fun (callExpr3 : Frontend_dAst.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr3) with
  | Base_dDiag.C_Check_OkC (dtb__943) -> (Base_dDiag.C_Check_OkC (dtb__943))
  | Base_dDiag.C_Check_ErrC (dtb__944) -> (Base_dDiag.C_Check_ErrC (dtb__940))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut6 = (v_performOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__945) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__946) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) Base_dIntrinsics.v_listFamilyName) dtb__946) (Frontend_dAst.v_exprSpan expr))) (fun (e2 : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__947) -> (match dtb__947 with
  | { B_dData_dPair.f_Pair_first = dtb__948; B_dData_dPair.f_Pair_second = dtb__949 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__948)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = p in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__950; B_dData_dPair.f_Pair_second = dtb__951 } -> (match dtb__951 with
  | { B_dData_dPair.f_Pair_first = dtb__952; B_dData_dPair.f_Pair_second = dtb__953 } -> ((Base_dCommon.v_bind (((((v_performCallExpr globals) dtb__953) dtb__952) dtb__948) (Frontend_dAst.v_exprSpan expr))) (fun (callExpr : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__953) callExpr)))
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
# 796 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCore = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__954) -> ((Base_dCommon.v_bind (((((v_inferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__954)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__955) -> (Base_dDiag.C_Check_OkC (dtb__955))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) (v_doChainFallback dtb__954))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 814 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((v_inferEFuelCorePlainGo fuel) globals) ctx) ec) expr)))
# 818 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dAst.C_Expr_EDo (dtb__956, dtb__957) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__957)) Base_dDiagnostics_dTc.C_TcErr_DoUnsupported)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__958, dtb__959, dtb__960) -> (((((((v_elabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__958) dtb__959) (Frontend_dAst.v_nodeRefSpan dtb__960))
  | Frontend_dAst.C_Expr_ERecord (dtb__961, dtb__962, dtb__963) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__963)) Base_dDiagnostics_dTc.C_TcErr_RecordsUnsupported)
  | Frontend_dAst.C_Expr_EField (dtb__964, dtb__965, dtb__966) -> (((((((v_elabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__964) dtb__965) (Frontend_dAst.v_nodeRefSpan dtb__966))
  | Frontend_dAst.C_Expr_ECase (dtb__967, dtb__968, dtb__969) -> (((((((v_inferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__967) (v_altsToPairs dtb__968)) (Frontend_dAst.v_nodeRefSpan dtb__969))
  | Frontend_dAst.C_Expr_ELet (dtb__970, dtb__971, dtb__972, dtb__973) -> ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) ec) dtb__970) dtb__971) dtb__972) (Frontend_dAst.v_nodeRefSpan dtb__973))
  | Frontend_dAst.C_Expr_EIf (dtb__974, dtb__975, dtb__976, dtb__977) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__974) (Frontend_dAst.v_nodeRefSpan dtb__977))) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__978; B_dData_dPair.f_Pair_second = dtb__979 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__979) dtb__975)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pt in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__980; B_dData_dPair.f_Pair_second = dtb__981 } -> (match dtb__981 with
  | { B_dData_dPair.f_Pair_first = dtb__982; B_dData_dPair.f_Pair_second = dtb__983 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__983) dtb__976)) (fun (pe : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pe in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__984; B_dData_dPair.f_Pair_second = dtb__985 } -> (match dtb__985 with
  | { B_dData_dPair.f_Pair_first = dtb__986; B_dData_dPair.f_Pair_second = dtb__987 } -> (if (if ((v_isIntTy dtb__987) dtb__982) then ((v_isNatTy dtb__987) dtb__986) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__978, dtb__980, (v_natToIntTerm dtb__984))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__982; B_dData_dPair.f_Pair_second = dtb__987 } })) else (if (if ((v_isNatTy dtb__987) dtb__982) then ((v_isIntTy dtb__987) dtb__986) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__978, (v_natToIntTerm dtb__980), dtb__984)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__987 } })) else ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__987) (Elab_dTypes.v_ctxDepth ctx)) dtb__982) dtb__986)) (fun (ec4 : Elab_dTypes.t_Ec) -> (let branchOpaque = (((Elab_dMeta.v_isOpaqueRuntimeTyIn ec4) ctx) dtb__982) in (let tTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__980) else dtb__980) in (let eTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__984) else dtb__984) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__978, tTerm2, eTerm2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__982; B_dData_dPair.f_Pair_second = ec4 } })))))))))
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
  | Frontend_dAst.C_Expr_ELam (dtb__988, dtb__989, dtb__990) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__990)) Base_dDiagnostics_dTc.C_TcErr_LambdaNoSignature)
  | Frontend_dAst.C_Expr_EApp (dtb__991, dtb__992, dtb__993) -> (match dtb__991 with
  | Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995) -> (match dtb__992 with
  | B_dData_dList.C_List__x58__x58_ (dtb__996, dtb__997) -> (match dtb__997 with
  | B_dData_dList.C_List__x58__x58_ (dtb__998, dtb__999) -> (match dtb__999 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut18 = (Frontend_dReserved.v_classify dtb__994) in (match nd_uscrut18 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1000) -> (match dtb__1000 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1001, dtb__1002) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__993)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb__1001, (Frontend_dReserved.v_joinWithAt dtb__1002)))) dtb__1001) (Frontend_dReserved.v_joinWithAt dtb__1002))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__993)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | Frontend_dReserved.C_Reserved_RsAscribe -> (((((((v_inferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__996) dtb__998) (Frontend_dAst.v_nodeRefSpan dtb__993))
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) (B_dData_dList.C_List__x58__x58_ (dtb__996, (B_dData_dList.C_List__x58__x58_ (dtb__998, B_dData_dList.C_List_Nil))))) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) (B_dData_dList.C_List__x58__x58_ (dtb__996, (B_dData_dList.C_List__x58__x58_ (dtb__998, B_dData_dList.C_List_Nil))))) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
))
  | _ -> (let nd_uscrut17 = (Frontend_dReserved.v_classify dtb__994) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1003) -> (match dtb__1003 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1004, dtb__1005) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__993)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb__1004, (Frontend_dReserved.v_joinWithAt dtb__1005)))) dtb__1004) (Frontend_dReserved.v_joinWithAt dtb__1005))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__993)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) dtb__992) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) dtb__992) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
))
)
  | _ -> (let nd_uscrut14 = (Frontend_dReserved.v_classify dtb__994) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1006) -> (match dtb__1006 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1007, dtb__1008) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__993)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb__1007, (Frontend_dReserved.v_joinWithAt dtb__1008)))) dtb__1007) (Frontend_dReserved.v_joinWithAt dtb__1008))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__993)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) dtb__992) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) dtb__992) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
))
)
  | _ -> (let nd_uscrut11 = (Frontend_dReserved.v_classify dtb__994) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1009) -> (match dtb__1009 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1010, dtb__1011) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__993)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb__1010, (Frontend_dReserved.v_joinWithAt dtb__1011)))) dtb__1010) (Frontend_dReserved.v_joinWithAt dtb__1011))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__993)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) dtb__992) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__994, dtb__995))) dtb__992) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
))
)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__991) dtb__992) (Frontend_dAst.v_nodeRefSpan dtb__993)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | Frontend_dAst.C_Expr_EPi (dtb__1012, dtb__1013, dtb__1014, dtb__1015, dtb__1016, dtb__1017) -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) dtb__1012) dtb__1013) dtb__1014) dtb__1015) dtb__1016) (Frontend_dAst.v_nodeRefSpan dtb__1017))
  | Frontend_dAst.C_Expr_EFloat (dtb__1018, dtb__1019) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1018)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dAst.C_Expr_EStr (dtb__1020, dtb__1021) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1020)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dAst.C_Expr_EInt (dtb__1022, dtb__1023) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb__1022)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dAst.C_Expr_EVar (dtb__1024, dtb__1025) -> (if (dtb__1024 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc Core_dTerm.v_levelZero))); B_dData_dPair.f_Pair_second = ec } })) else (let nd_uscrut8 = (Frontend_dReserved.v_classify dtb__1024) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1026) -> (match dtb__1026 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1027, dtb__1028) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb__1025)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb__1027, (Frontend_dReserved.v_joinWithAt dtb__1028)))) dtb__1027) (Frontend_dReserved.v_joinWithAt dtb__1028))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__1029, dtb__1030) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) (Frontend_dAst.v_nodeRefSpan dtb__1025)) B_dData_dMaybe.C_Maybe_Nothing) dtb__1029) dtb__1030)) (fun (t : string) -> (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) t) (Frontend_dAst.v_nodeRefSpan dtb__1025))))
  | _ -> (if (Frontend_dReserved.v_isHoleName dtb__1024) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1025)) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) dtb__1024) (Frontend_dAst.v_nodeRefSpan dtb__1025)))
)
  | _ -> (if (Frontend_dReserved.v_isHoleName dtb__1024) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1025)) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) dtb__1024) (Frontend_dAst.v_nodeRefSpan dtb__1025)))
)))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))))
# 1087 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabEFieldFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dAst.t_Expr) (fname : string) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1031; B_dData_dPair.f_Pair_second = dtb__1032 } -> (match dtb__1032 with
  | { B_dData_dPair.f_Pair_first = dtb__1033; B_dData_dPair.f_Pair_second = dtb__1034 } -> (match ((v_recordTypeOf dtb__1034) dtb__1033) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1035) -> ((Base_dCommon.v_bind ((((v_recordFieldPlan dtb__1034) dtb__1033) fname) sp)) (fun (plan : t_FieldAccessPlan) -> (let arity = (B_dData_dList.v_length ((plan).f_FieldAccessPlan_planData).Elab_dTypes.f_DtData_dtDataParams) in (let tele = ((B_dData_dList.v_drop arity) (Elab_dTypes.v_dtCtorTelescope (plan).f_FieldAccessPlan_planCtor)) in (let proj = (Core_dTerm.C_Term_TProj (dtb__1031, (Elab_dTypes.v_dtCtorName (plan).f_FieldAccessPlan_planCtor), tele, (arity + (plan).f_FieldAccessPlan_planField), (plan).f_FieldAccessPlan_planField)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (plan).f_FieldAccessPlan_planType; B_dData_dPair.f_Pair_second = dtb__1034 } })))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_hasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__1034) dtb__1031) dtb__1033) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1113 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabERecUpdateFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dAst.t_Expr) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fields with
  | B_dData_dList.C_List_Nil -> ((Elab_dTypes.v_errAt sp) "record update needs at least one field")
  | _ -> (if (Elab_dRecords.v_hasDuplicateFieldNames fields) then ((Elab_dTypes.v_errAt sp) "duplicate field in record update") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1036; B_dData_dPair.f_Pair_second = dtb__1037 } -> (match dtb__1037 with
  | { B_dData_dPair.f_Pair_first = dtb__1038; B_dData_dPair.f_Pair_second = dtb__1039 } -> ((Base_dCommon.v_bind ((((v_recordUpdatePlan dtb__1039) dtb__1038) fields) sp)) (fun (plan : t_UpdateAccessPlan) -> (let body = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor), (Frontend_dAst.v_detachedNodeRef sp))), (plan).f_UpdateAccessPlan_upBodyArgs, (Frontend_dAst.v_detachedNodeRef sp))) in ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (fuel - 1)) globals) ctx) dtb__1039) (plan).f_UpdateAccessPlan_upData) (plan).f_UpdateAccessPlan_upIdxs) ((Elab_dTypes.v_evalCtx ctx) dtb__1036)) dtb__1038) (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)) ((v_recordFieldPats (plan).f_UpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun (q : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1040; B_dData_dPair.f_Pair_second = dtb__1041 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb__1036, (dtb__1040).Core_dTerm.f_CaseAlt_caseAltName, (Core_dTerm.v_binderPairs (dtb__1040).Core_dTerm.f_CaseAlt_caseAltBinders), (plan).f_UpdateAccessPlan_upFieldIndices, (dtb__1040).Core_dTerm.f_CaseAlt_caseAltBody)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1038; B_dData_dPair.f_Pair_second = dtb__1041 } }))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
)))
# 1142 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAnnFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dAst.t_Expr) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pt in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1042; B_dData_dPair.f_Pair_second = dtb__1043 } -> (match dtb__1043 with
  | { B_dData_dPair.f_Pair_first = dtb__1044; B_dData_dPair.f_Pair_second = dtb__1045 } -> (let tyVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1042) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1045) value) tyVal)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1046; B_dData_dPair.f_Pair_second = dtb__1047 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1046; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyVal; B_dData_dPair.f_Pair_second = dtb__1047 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1160 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferPiFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (implicit : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dom : Frontend_dAst.t_Expr) (cod : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun (pd : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pd in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1048; B_dData_dPair.f_Pair_second = dtb__1049 } -> (match dtb__1049 with
  | { B_dData_dPair.f_Pair_first = dtb__1050; B_dData_dPair.f_Pair_second = dtb__1051 } -> (let domVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1048) in (let isTypeDom = (Elab_dMeta.v_isTypeDomain domVal) in (let isLinDom = ((Elab_dMeta.v_isLinearType ec) domVal) in (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__1048) ctx) in (let badQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1057) -> (if implicit then true else isTypeDom)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (let badLinQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1056) -> (if (Frontend_dAst.v_qtyIsZero dtb__1056) then isLinDom else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (if badQty then (if implicit then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityImplicit (name))) name) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearTypeNeedsOne (name))) name) else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx2) dtb__1051) cod)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut28 = pc in (match nd_uscrut28 with
  | { B_dData_dPair.f_Pair_first = dtb__1052; B_dData_dPair.f_Pair_second = dtb__1053 } -> (match dtb__1053 with
  | { B_dData_dPair.f_Pair_first = dtb__1054; B_dData_dPair.f_Pair_second = dtb__1055 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (name, implicit, (if isLinDom then Core_dTerm.C_Rig_Rig1 else (if implicit then ((Elab_dMeta.v_implicitBinderRig ec) domVal) else (((Elab_dMeta.v_rigOfQty false) isTypeDom) qty))), dtb__1048, dtb__1052)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType (((Core_dTerm.v_levelMax dtb__1050) dtb__1054))); B_dData_dPair.f_Pair_second = dtb__1055 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1224 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = fn in (match nd_uscrut8 with
  | Frontend_dAst.C_Expr_EVar (dtb__1058, dtb__1059) -> (if (dtb__1058 = "->") then (let nd_uscrut11 = args in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1060, dtb__1061) -> (match dtb__1061 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1062, dtb__1063) -> (match dtb__1063 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) B_dData_dMaybe.C_Maybe_Nothing) dtb__1060) dtb__1062) sp)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)) else (if (dtb__1058 = "Type") then (let nd_uscrut11 = args in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1064, dtb__1065) -> (match dtb__1064 with
  | Frontend_dAst.C_Expr_EInt (dtb__1066, dtb__1067) -> (match dtb__1065 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1066 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1067)) Base_dDiagnostics_dTc.C_TcErr_UniverseLevelNonNegative) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb__1066))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc (Core_dTerm.v_levelOfInt dtb__1066)))); B_dData_dPair.f_Pair_second = ec } })))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1059)) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1059)) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1059)) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)) else (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__1068, dtb__1069) -> (if (Elab_dTerm_dSupport.v_isFieldSelectorName dtb__1068) then ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint) else (if (Frontend_dReserved.v_isOverCtorName dtb__1068) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) (Frontend_dAst.v_nodeRefSpan dtb__1069)) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort dtb__1068)) (Frontend_dReserved.v_overCtorTargets dtb__1068))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (t, dtb__1069))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup dtb__1068) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1070) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) dtb__1068) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1071) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1071))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pa in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1072; B_dData_dPair.f_Pair_second = dtb__1073 } -> (match dtb__1073 with
  | { B_dData_dPair.f_Pair_first = dtb__1074; B_dData_dPair.f_Pair_second = dtb__1075 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1075) (Core_dTerm.C_Term_TGlobal (dtb__1068))) dtb__1072); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1074; B_dData_dPair.f_Pair_second = dtb__1075 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup dtb__1068) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1076) -> (if (((v_skipArithSpecForHint ec) dtb__1068) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1076)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1077; B_dData_dPair.f_Pair_second = dtb__1078 } -> (match dtb__1078 with
  | { B_dData_dPair.f_Pair_first = dtb__1079; B_dData_dPair.f_Pair_second = dtb__1080 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1080) (Core_dTerm.C_Term_TGlobal (dtb__1068))) dtb__1077); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1079; B_dData_dPair.f_Pair_second = dtb__1080 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1068) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1081) -> (Base_dDiag.C_Check_OkC (dtb__1081))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1076)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = pa in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1082; B_dData_dPair.f_Pair_second = dtb__1083 } -> (match dtb__1083 with
  | { B_dData_dPair.f_Pair_first = dtb__1084; B_dData_dPair.f_Pair_second = dtb__1085 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1085) (Core_dTerm.C_Term_TGlobal (dtb__1068))) dtb__1082); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1084; B_dData_dPair.f_Pair_second = dtb__1085 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1068) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1086) -> (Base_dDiag.C_Check_OkC (dtb__1086))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__1069)) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb__1068))) dtb__1068)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
  | _ -> (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__1087, dtb__1088) -> (if (Elab_dTerm_dSupport.v_isFieldSelectorName dtb__1087) then ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint) else (if (Frontend_dReserved.v_isOverCtorName dtb__1087) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) (Frontend_dAst.v_nodeRefSpan dtb__1088)) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort dtb__1087)) (Frontend_dReserved.v_overCtorTargets dtb__1087))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (t, dtb__1088))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup dtb__1087) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1089) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) dtb__1087) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1090) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1090))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1091; B_dData_dPair.f_Pair_second = dtb__1092 } -> (match dtb__1092 with
  | { B_dData_dPair.f_Pair_first = dtb__1093; B_dData_dPair.f_Pair_second = dtb__1094 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1094) (Core_dTerm.C_Term_TGlobal (dtb__1087))) dtb__1091); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1093; B_dData_dPair.f_Pair_second = dtb__1094 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup dtb__1087) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1095) -> (if (((v_skipArithSpecForHint ec) dtb__1087) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1095)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1096; B_dData_dPair.f_Pair_second = dtb__1097 } -> (match dtb__1097 with
  | { B_dData_dPair.f_Pair_first = dtb__1098; B_dData_dPair.f_Pair_second = dtb__1099 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1099) (Core_dTerm.C_Term_TGlobal (dtb__1087))) dtb__1096); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1098; B_dData_dPair.f_Pair_second = dtb__1099 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1087) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1100) -> (Base_dDiag.C_Check_OkC (dtb__1100))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1095)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1101; B_dData_dPair.f_Pair_second = dtb__1102 } -> (match dtb__1102 with
  | { B_dData_dPair.f_Pair_first = dtb__1103; B_dData_dPair.f_Pair_second = dtb__1104 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1104) (Core_dTerm.C_Term_TGlobal (dtb__1087))) dtb__1101); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1103; B_dData_dPair.f_Pair_second = dtb__1104 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1087) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1105) -> (Base_dDiag.C_Check_OkC (dtb__1105))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__1088)) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb__1087))) dtb__1087)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)
))))
# 1297 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__1106, dtb__1107) -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1106) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1108) -> (Base_dDiag.C_Check_OkC (dtb__1108))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1312 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun (pf : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pf in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1109; B_dData_dPair.f_Pair_second = dtb__1110 } -> (match dtb__1110 with
  | { B_dData_dPair.f_Pair_first = dtb__1111; B_dData_dPair.f_Pair_second = dtb__1112 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1112) dtb__1111) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1113; B_dData_dPair.f_Pair_second = dtb__1114 } -> (match dtb__1114 with
  | { B_dData_dPair.f_Pair_first = dtb__1115; B_dData_dPair.f_Pair_second = dtb__1116 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1116)) dtb__1109) dtb__1113); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1115; B_dData_dPair.f_Pair_second = dtb__1116 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1328 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((v_inferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1493 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal ec) ty) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__1117, dtb__1118, dtb__1119, dtb__1120, dtb__1121) -> (if dtb__1118 then (if ((Elab_dDict.v_isDictDomain ec) dtb__1120) then (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dtb__1120) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1120) dtb__1121) args) sp) hint) else ((Base_dCommon.v_bind (((((((v_constrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1120) args) sp)) (fun (ec0 : Elab_dTypes.t_Ec) -> (let nd_uscrut15 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1120)) sp) in (match nd_uscrut15 with
  | Base_dDiag.C_Check_ErrC (dtb__1122) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec0)) ((Elab_dTypes.v_forceVal ec0) dtb__1120)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1120) dtb__1121) args) sp) hint) else (if ((Elab_dDict.v_isRigidDictArg ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1120)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1120) dtb__1121) args) sp) hint) else (Base_dDiag.C_Check_ErrC (dtb__1122))))
  | Base_dDiag.C_Check_OkC (dtb__1123) -> (match dtb__1123 with
  | { B_dData_dPair.f_Pair_first = dtb__1124; B_dData_dPair.f_Pair_second = dtb__1125 } -> (let ty2 = ((Core_dEval.v_applyClosure dtb__1121) ((Elab_dTypes.v_evalCtx ctx) dtb__1124)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1125) ty2) args) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = q in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1126; B_dData_dPair.f_Pair_second = dtb__1127 } -> (match dtb__1127 with
  | { B_dData_dPair.f_Pair_first = dtb__1128; B_dData_dPair.f_Pair_second = dtb__1129 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1124; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1126)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1128; B_dData_dPair.f_Pair_second = dtb__1129 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) else (if ((Elab_dDict.v_isMemberDomain ec) dtb__1120) then (match ((((Elab_dDict.v_memberLookup 64) (Elab_dTypes.v_ctxDepth ctx)) ec) dtb__1120) with
  | Elab_dDict.C_MemberLookup_MemberFound (dtb__1130, dtb__1131) -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1131) ((Core_dEval.v_applyClosure dtb__1121) dtb__1130)) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = p in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1132; B_dData_dPair.f_Pair_second = dtb__1133 } -> (match dtb__1133 with
  | { B_dData_dPair.f_Pair_first = dtb__1134; B_dData_dPair.f_Pair_second = dtb__1135 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) dtb__1130); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1132)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1134; B_dData_dPair.f_Pair_second = dtb__1135 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Elab_dDict.C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | Elab_dDict.C_MemberLookup_MemberAmbiguous (dtb__1136) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = dtb__1138 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1138) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1120) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1121) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1137))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = p in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1139; B_dData_dPair.f_Pair_second = dtb__1140 } -> (match dtb__1140 with
  | { B_dData_dPair.f_Pair_first = dtb__1141; B_dData_dPair.f_Pair_second = dtb__1142 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1139)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1141; B_dData_dPair.f_Pair_second = dtb__1142 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | Elab_dDict.C_MemberLookup_MemberStuck -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1143; B_dData_dPair.f_Pair_second = dtb__1144 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1144) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1120) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1121) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1143))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = p in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1145; B_dData_dPair.f_Pair_second = dtb__1146 } -> (match dtb__1146 with
  | { B_dData_dPair.f_Pair_first = dtb__1147; B_dData_dPair.f_Pair_second = dtb__1148 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1143; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1145)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1147; B_dData_dPair.f_Pair_second = dtb__1148 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__1120) then (if ((Elab_dMeta.v_isStringImplicitDomain ec) dtb__1120) then (match args with
  | B_dData_dList.C_List__x58__x58_ (dtb__1149, dtb__1150) -> (match (v_instArgOperand dtb__1149) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1151) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1151) dtb__1120)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1152; B_dData_dPair.f_Pair_second = dtb__1153 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1153) ((Core_dEval.v_applyClosure dtb__1121) ((Elab_dTypes.v_evalCtx ctx) dtb__1152))) dtb__1150) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut25 = q in (match nd_uscrut25 with
  | { B_dData_dPair.f_Pair_first = dtb__1154; B_dData_dPair.f_Pair_second = dtb__1155 } -> (match dtb__1155 with
  | { B_dData_dPair.f_Pair_first = dtb__1156; B_dData_dPair.f_Pair_second = dtb__1157 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1152; B_dData_dPair.f_Pair_second = dtb__1119 }, dtb__1154)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1156; B_dData_dPair.f_Pair_second = dtb__1157 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1158; B_dData_dPair.f_Pair_second = dtb__1159 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1159) ((Core_dEval.v_applyClosure dtb__1121) ((Elab_dTypes.v_evalCtx ctx) dtb__1158))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut23 = p in (match nd_uscrut23 with
  | { B_dData_dPair.f_Pair_first = dtb__1160; B_dData_dPair.f_Pair_second = dtb__1161 } -> (match dtb__1161 with
  | { B_dData_dPair.f_Pair_first = dtb__1162; B_dData_dPair.f_Pair_second = dtb__1163 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1158; B_dData_dPair.f_Pair_second = dtb__1119 }, dtb__1160)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1162; B_dData_dPair.f_Pair_second = dtb__1163 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1164; B_dData_dPair.f_Pair_second = dtb__1165 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1165) ((Core_dEval.v_applyClosure dtb__1121) ((Elab_dTypes.v_evalCtx ctx) dtb__1164))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = p in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1166; B_dData_dPair.f_Pair_second = dtb__1167 } -> (match dtb__1167 with
  | { B_dData_dPair.f_Pair_first = dtb__1168; B_dData_dPair.f_Pair_second = dtb__1169 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1164; B_dData_dPair.f_Pair_second = dtb__1119 }, dtb__1166)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1168; B_dData_dPair.f_Pair_second = dtb__1169 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1170; B_dData_dPair.f_Pair_second = dtb__1171 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1171) ((Core_dEval.v_applyClosure dtb__1121) ((Elab_dTypes.v_evalCtx ctx) dtb__1170))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = p in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1172; B_dData_dPair.f_Pair_second = dtb__1173 } -> (match dtb__1173 with
  | { B_dData_dPair.f_Pair_first = dtb__1174; B_dData_dPair.f_Pair_second = dtb__1175 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1170; B_dData_dPair.f_Pair_second = dtb__1119 }, dtb__1172)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1174; B_dData_dPair.f_Pair_second = dtb__1175 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)))) else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = forced; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__1176, dtb__1177) -> (let ec0 = (match hint with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1184) -> (if (((((v_remainingExplicitPis 64) ctx) ec) forced) = (B_dData_dList.v_length args)) then (match ((((v_tryUseHint ctx) dtb__1184) ec) forced) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1185) -> dtb__1185
  | _ -> failwith "DT: impossible branch"
) else ec)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec0) sp) dtb__1117) dtb__1119) dtb__1120)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((v_expandArgListLit ec0) dtb__1120) dtb__1176)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1120)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1178; B_dData_dPair.f_Pair_second = dtb__1179 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1179) ((Core_dEval.v_applyClosure dtb__1121) ((Elab_dTypes.v_evalCtx ctx) dtb__1178))) dtb__1177) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = q in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1180; B_dData_dPair.f_Pair_second = dtb__1181 } -> (match dtb__1181 with
  | { B_dData_dPair.f_Pair_first = dtb__1182; B_dData_dPair.f_Pair_second = dtb__1183 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1178; B_dData_dPair.f_Pair_second = argRig }, dtb__1180)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1182; B_dData_dPair.f_Pair_second = dtb__1183 } }))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__1186, dtb__1187) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_exprSpan dtb__1186)) Base_dDiagnostics_dTc.C_TcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
))))
# 1633 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_deferDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1188; B_dData_dPair.f_Pair_second = dtb__1189 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ((((((Elab_dTypes.v_ecAddConstraint dtb__1189) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__1189) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx))) ((Core_dEval.v_applyClosure clo) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1188))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1190; B_dData_dPair.f_Pair_second = dtb__1191 } -> (match dtb__1191 with
  | { B_dData_dPair.f_Pair_first = dtb__1192; B_dData_dPair.f_Pair_second = dtb__1193 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1188; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1190)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1192; B_dData_dPair.f_Pair_second = dtb__1193 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1651 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dom : Core_dTerm.t_Value) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dDict.v_dictClassArg ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1194) -> (match ((Elab_dDict.v_dictArgKind ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1195) -> (let nd_uscrut11 = dtb__1194 in (match nd_uscrut11 with
  | Core_dTerm.C_Value_VMeta (dtb__1196, dtb__1197) -> (match dtb__1197 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1194) dtb__1195) args) sp)) (fun (ecProbe : Elab_dTypes.t_Ec) -> (match ((Core_dTerm.v_metaLookup dtb__1196) (Elab_dTypes.v_ecSolTbl ecProbe)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1198) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) dtb__1196) B_dData_dList.C_List_Nil) dtb__1198) with
  | Base_dDiag.C_Check_OkC (dtb__1199) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__1199))))
  | Base_dDiag.C_Check_ErrC (dtb__1200) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1194) dtb__1195) args) sp)
)
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1194) dtb__1195) args) sp)
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1679 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomGoKFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (argTy : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dList.C_List__x58__x58_ (dtb__1201, dtb__1202) -> (let nd_uscrut11 = (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1201) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__1203) -> (match dtb__1203 with
  | { B_dData_dPair.f_Pair_first = dtb__1204; B_dData_dPair.f_Pair_second = dtb__1205 } -> (match dtb__1205 with
  | { B_dData_dPair.f_Pair_first = dtb__1206; B_dData_dPair.f_Pair_second = dtb__1207 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1207) dtb__1206) in (if (Core_dTerm.v_isTypeValue forced) then ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1207) ctx) argTy) argKind) dtb__1202) sp) else (if (((((Elab_dDict.v_argHeadMatchesKind globals) dtb__1207) ctx) forced) argKind) then (match ((((Elab_dMeta.v_convEc dtb__1207) (Elab_dTypes.v_ctxDepth ctx)) argTy) (Elab_dDict.v_neutralHeadOrSelf forced)) with
  | Base_dDiag.C_Check_OkC (dtb__1208) -> (Base_dDiag.C_Check_OkC (dtb__1208))
  | Base_dDiag.C_Check_ErrC (dtb__1209) -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1207) ctx) argTy) argKind) dtb__1202) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1207) ctx) argTy) argKind) dtb__1202) sp))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1210) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1811 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1211) -> ((((((((v_specializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1211) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1821 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = args in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1212, dtb__1213) -> (match dtb__1213 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1214, dtb__1215) -> (match dtb__1215 with
  | B_dData_dList.C_List_Nil -> (if ((v_isNatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1212) v_natTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1216; B_dData_dPair.f_Pair_second = dtb__1217 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1217) dtb__1214) v_natTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1218; B_dData_dPair.f_Pair_second = dtb__1219 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1216) dtb__1218); B_dData_dPair.f_Pair_second = dtb__1219 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isIntTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1212) v_intTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1220; B_dData_dPair.f_Pair_second = dtb__1221 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1221) dtb__1214) v_intTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1222; B_dData_dPair.f_Pair_second = dtb__1223 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1220) dtb__1222); B_dData_dPair.f_Pair_second = dtb__1223 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isFloatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1212) v_floatTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1224; B_dData_dPair.f_Pair_second = dtb__1225 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1225) dtb__1214) v_floatTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1226; B_dData_dPair.f_Pair_second = dtb__1227 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1224) dtb__1226); B_dData_dPair.f_Pair_second = dtb__1227 }))))
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
# 1867 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1228) -> (((((((v_specializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1228) args) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1877 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1229, dtb__1230) -> (match dtb__1230 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1231, dtb__1232) -> (match dtb__1232 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1229)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1233; B_dData_dPair.f_Pair_second = dtb__1234 } -> (match dtb__1234 with
  | { B_dData_dPair.f_Pair_first = dtb__1235; B_dData_dPair.f_Pair_second = dtb__1236 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1236) dtb__1231)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1237; B_dData_dPair.f_Pair_second = dtb__1238 } -> (match dtb__1238 with
  | { B_dData_dPair.f_Pair_first = dtb__1239; B_dData_dPair.f_Pair_second = dtb__1240 } -> (if (if ((v_isNatTy dtb__1240) dtb__1235) then ((v_isNatTy dtb__1240) dtb__1239) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1233) dtb__1237); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1240 } })))) else (if (if ((v_isIntTy dtb__1240) dtb__1235) then ((v_isIntTy dtb__1240) dtb__1239) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1233) dtb__1237); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1240 } })))) else (if (if ((v_isFloatTy dtb__1240) dtb__1235) then ((v_isFloatTy dtb__1240) dtb__1239) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1233) dtb__1237); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_floatTyValue; B_dData_dPair.f_Pair_second = dtb__1240 } })))) else (if (if ((v_isNatTy dtb__1240) dtb__1235) then ((v_isIntTy dtb__1240) dtb__1239) else false) then (match (v_isEIntExpr dtb__1231) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1241) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dAst.v_exprSpan dtb__1231)) dtb__1241)) (fun (bNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1233) bNat); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1240 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) (v_natToIntTerm dtb__1233)) dtb__1237); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1240 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_isIntTy dtb__1240) dtb__1235) then ((v_isNatTy dtb__1240) dtb__1239) else false) then (match (v_isEIntExpr dtb__1229) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1242) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dAst.v_exprSpan dtb__1229)) dtb__1242)) (fun (aNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) aNat) dtb__1237); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1240 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1233) (v_natToIntTerm dtb__1237)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1240 } }))))
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
# 1917 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1243) -> (let simpleComp = (let nd_uscrut8 = (v_handleOperand expr) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__1250) -> (match dtb__1250 with
  | { B_dData_dPair.f_Pair_first = dtb__1251; B_dData_dPair.f_Pair_second = dtb__1252 } -> (v_isSimpleComp dtb__1251)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let firstCall = (if simpleComp then ((((v_handleCallExpr globals) ec) expr) (Frontend_dAst.v_exprRef expr)) else ((((v_handleCallExprAt globals) ec) expr) (Frontend_dAst.v_exprRef expr))) in (let thirdCall = (if simpleComp then ((((v_handleCallExprAt globals) ec) expr) (Frontend_dAst.v_exprRef expr)) else ((((v_handleCallExpr globals) ec) expr) (Frontend_dAst.v_exprRef expr))) in ((Base_dCommon.v_bind firstCall) (fun (callExpr : Frontend_dAst.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1244) -> (Base_dDiag.C_Check_OkC (dtb__1244))
  | Base_dDiag.C_Check_ErrC (dtb__1245) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dAst.v_exprRef expr))) (fun (callExpr2 : Frontend_dAst.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1246) -> (Base_dDiag.C_Check_OkC (dtb__1246))
  | Base_dDiag.C_Check_ErrC (dtb__1247) -> ((Base_dCommon.v_bind thirdCall) (fun (callExpr3 : Frontend_dAst.t_Expr) -> (match ((Base_dObs.v_obsCheck "vuna.elab.term.retry-third") (fun (_u : int) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Base_dDiag.C_Check_OkC (dtb__1248) -> (Base_dDiag.C_Check_OkC (dtb__1248))
  | Base_dDiag.C_Check_ErrC (dtb__1249) -> (Base_dDiag.C_Check_ErrC (dtb__1245))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1253) -> ((Base_dObs.v_obsCheck "vuna.elab.term.infer") (fun (_u : int) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1254) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dAst.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1255) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) expected))) dtb__1255) (Frontend_dAst.v_exprSpan expr))) (fun (e2 : Frontend_dAst.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dObs.v_obsDefCheckAt 3) "vuna.elab.term.core") (v_exprFormName expr)) (fun (_u : int) -> ((((((v_checkEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1997 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRow = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1256) -> ((Base_dCommon.v_bind ((((((v_checkDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1256) expected)) (fun (r : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1257) -> (Base_dDiag.C_Check_OkC (dtb__1257))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) (v_doChainFallback dtb__1256)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 2078 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuelNoRowPlainGo fuel) globals) ctx) ec) expr) expected)))
# 2082 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dAst.C_Expr_ELet (dtb__1258, dtb__1259, dtb__1260, dtb__1261) -> (((((((((v_checkLetFuel (fuel - 1)) globals) ctx) ec) dtb__1258) dtb__1259) dtb__1260) expected) (Frontend_dAst.v_nodeRefSpan dtb__1261))
  | Frontend_dAst.C_Expr_ECase (dtb__1262, dtb__1263, dtb__1264) -> ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1262) (v_altsToPairs dtb__1263)) expected) (Frontend_dAst.v_nodeRefSpan dtb__1264))
  | Frontend_dAst.C_Expr_EIf (dtb__1265, dtb__1266, dtb__1267, dtb__1268) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1265) (Frontend_dAst.v_nodeRefSpan dtb__1268))) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__1269; B_dData_dPair.f_Pair_second = dtb__1270 } -> (let attempt = ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1270) dtb__1266) expected)) (fun (pt : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__1273; B_dData_dPair.f_Pair_second = dtb__1274 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1274) dtb__1267) expected)) (fun (pe : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__1275; B_dData_dPair.f_Pair_second = dtb__1276 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1269, dtb__1273, dtb__1275)); B_dData_dPair.f_Pair_second = dtb__1276 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) in (match attempt with
  | Base_dDiag.C_Check_OkC (dtb__1271) -> (Base_dDiag.C_Check_OkC (dtb__1271))
  | Base_dDiag.C_Check_ErrC (dtb__1272) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Expr_EPi (dtb__1277, dtb__1278, dtb__1279, dtb__1280, dtb__1281, dtb__1282) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Frontend_dAst.C_Expr_EApp (dtb__1283, dtb__1284, dtb__1285) -> (match dtb__1283 with
  | Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287) -> (if (dtb__1286 = "->") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1286 = "Type") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (match dtb__1284 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1288, dtb__1289) -> (match dtb__1289 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1290, dtb__1291) -> (match dtb__1291 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut19 = (Frontend_dReserved.v_classify dtb__1286) in (match nd_uscrut19 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1292) -> (match dtb__1292 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1285)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | Frontend_dReserved.C_Reserved_RsAscribe -> ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1290)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut23 = pt in (match nd_uscrut23 with
  | { B_dData_dPair.f_Pair_first = dtb__1293; B_dData_dPair.f_Pair_second = dtb__1294 } -> (match dtb__1294 with
  | { B_dData_dPair.f_Pair_first = dtb__1295; B_dData_dPair.f_Pair_second = dtb__1296 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1296) dtb__1288) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1293))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) (B_dData_dList.C_List__x58__x58_ (dtb__1288, (B_dData_dList.C_List__x58__x58_ (dtb__1290, B_dData_dList.C_List_Nil))))) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) (B_dData_dList.C_List__x58__x58_ (dtb__1288, (B_dData_dList.C_List__x58__x58_ (dtb__1290, B_dData_dList.C_List_Nil))))) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
))
  | _ -> (let nd_uscrut18 = (Frontend_dReserved.v_classify dtb__1286) in (match nd_uscrut18 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1297) -> (match dtb__1297 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1285)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) dtb__1284) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) dtb__1284) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
))
)
  | _ -> (let nd_uscrut15 = (Frontend_dReserved.v_classify dtb__1286) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1298) -> (match dtb__1298 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1285)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) dtb__1284) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) dtb__1284) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
))
)
  | _ -> (let nd_uscrut12 = (Frontend_dReserved.v_classify dtb__1286) in (match nd_uscrut12 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1299) -> (match dtb__1299 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb__1285)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) dtb__1284) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1286, dtb__1287))) dtb__1284) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
))
)))
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) dtb__1283) dtb__1284) expected) (Frontend_dAst.v_nodeRefSpan dtb__1285))
)
  | Frontend_dAst.C_Expr_ELam (dtb__1300, dtb__1301, dtb__1302) -> ((((((((v_checkLamFuel (fuel - 1)) globals) ctx) ec) dtb__1300) dtb__1301) expected) (Frontend_dAst.v_nodeRefSpan dtb__1302))
  | Frontend_dAst.C_Expr_EFloat (dtb__1303, dtb__1304) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1305, dtb__1306) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1307) -> (match dtb__1307 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1308, dtb__1309) -> (match dtb__1309 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1308 = Base_dIntrinsics.v_floatTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1303)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1304)) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1310) -> (match dtb__1310 with
  | { B_dData_dPair.f_Pair_first = dtb__1311; B_dData_dPair.f_Pair_second = dtb__1312 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1312) dtb__1311) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1304)) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1313) -> (match dtb__1313 with
  | { B_dData_dPair.f_Pair_first = dtb__1314; B_dData_dPair.f_Pair_second = dtb__1315 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1315) dtb__1314) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1304)) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1316) -> (match dtb__1316 with
  | { B_dData_dPair.f_Pair_first = dtb__1317; B_dData_dPair.f_Pair_second = dtb__1318 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1318) dtb__1317) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1304)) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1319) -> (match dtb__1319 with
  | { B_dData_dPair.f_Pair_first = dtb__1320; B_dData_dPair.f_Pair_second = dtb__1321 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1321) dtb__1320) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dAst.C_Expr_EStr (dtb__1322, dtb__1323) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1324, dtb__1325) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1326) -> (match dtb__1326 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1327, dtb__1328) -> (match dtb__1328 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1327 = Base_dIntrinsics.v_strTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1322)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1323)) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1329) -> (match dtb__1329 with
  | { B_dData_dPair.f_Pair_first = dtb__1330; B_dData_dPair.f_Pair_second = dtb__1331 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1331) dtb__1330) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1323)) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1332) -> (match dtb__1332 with
  | { B_dData_dPair.f_Pair_first = dtb__1333; B_dData_dPair.f_Pair_second = dtb__1334 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1334) dtb__1333) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1323)) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1335) -> (match dtb__1335 with
  | { B_dData_dPair.f_Pair_first = dtb__1336; B_dData_dPair.f_Pair_second = dtb__1337 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1337) dtb__1336) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1323)) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1338) -> (match dtb__1338 with
  | { B_dData_dPair.f_Pair_first = dtb__1339; B_dData_dPair.f_Pair_second = dtb__1340 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1340) dtb__1339) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dAst.C_Expr_EInt (dtb__1341, dtb__1342) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1343, dtb__1344) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1345) -> (match dtb__1345 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1346, dtb__1347) -> (match dtb__1347 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1346 = Base_dIntrinsics.v_natTypeName) then ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dAst.v_nodeRefSpan dtb__1342)) dtb__1341)) (fun (t : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = ec })))) else (if (dtb__1346 = Base_dIntrinsics.v_intTypeName) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1342)) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1348) -> (match dtb__1348 with
  | { B_dData_dPair.f_Pair_first = dtb__1349; B_dData_dPair.f_Pair_second = dtb__1350 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1350) dtb__1349) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1342)) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1351) -> (match dtb__1351 with
  | { B_dData_dPair.f_Pair_first = dtb__1352; B_dData_dPair.f_Pair_second = dtb__1353 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1353) dtb__1352) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1342)) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1354) -> (match dtb__1354 with
  | { B_dData_dPair.f_Pair_first = dtb__1355; B_dData_dPair.f_Pair_second = dtb__1356 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1356) dtb__1355) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) (Frontend_dAst.v_nodeRefSpan dtb__1342)) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1357) -> (match dtb__1357 with
  | { B_dData_dPair.f_Pair_first = dtb__1358; B_dData_dPair.f_Pair_second = dtb__1359 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1359) dtb__1358) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dAst.C_Expr_EVar (dtb__1360, dtb__1361) -> (if (Frontend_dReserved.v_isHoleName dtb__1360) then (let pmeta = (((((Elab_dMetaSpans.v_newHoleMeta ctx) ec) (Frontend_dAst.v_nodeRefSpan dtb__1361)) expected) (Frontend_dReserved.v_holeNameOf dtb__1360)) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__1362; B_dData_dPair.f_Pair_second = dtb__1363 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1362; B_dData_dPair.f_Pair_second = dtb__1363 }))
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = (Frontend_dReserved.v_classify dtb__1360) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1364) -> (match dtb__1364 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1365, dtb__1366) -> ((Base_dCommon.v_bind (((((((v_resolveOverValueTarget globals) ctx) ec) dtb__1365) dtb__1366) expected) (Frontend_dAst.v_nodeRefSpan dtb__1361))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (t, dtb__1361))) B_dData_dList.C_List_Nil) expected) (Frontend_dAst.v_nodeRefSpan dtb__1361))))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__1367, dtb__1368) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) (Frontend_dAst.v_nodeRefSpan dtb__1361)) (B_dData_dMaybe.C_Maybe_Just (expected))) dtb__1367) dtb__1368)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (t, dtb__1361))) B_dData_dList.C_List_Nil) expected) (Frontend_dAst.v_nodeRefSpan dtb__1361))))
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1360, dtb__1361))) B_dData_dList.C_List_Nil) expected) (Frontend_dAst.v_nodeRefSpan dtb__1361))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (dtb__1360, dtb__1361))) B_dData_dList.C_List_Nil) expected) (Frontend_dAst.v_nodeRefSpan dtb__1361))
)))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
))))
# 2199 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds)) (fun (_u : int) -> ((Base_dCommon.v_bind (((v_letBindsToPairs (fuel - 1)) ec) binds)) (fun (binds2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 2333 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds)) (fun (_u : int) -> ((Base_dCommon.v_bind (((v_letBindsToPairs (fuel - 1)) ec) binds)) (fun (binds2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 2343 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Expr) (mc6 : bool) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1369, dtb__1370) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((((v_checkLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1369) dtb__1370) mc5) mc6) mc7) mc8))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 2352 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetOneFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bnd : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (B_dData_dPair.v_firstOf bnd) with
  | Frontend_dAst.C_Pat_PVar (dtb__1371, dtb__1372) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pv in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__1373; B_dData_dPair.f_Pair_second = dtb__1374 } -> (match dtb__1374 with
  | { B_dData_dPair.f_Pair_first = dtb__1375; B_dData_dPair.f_Pair_second = dtb__1376 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1375) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1371) dtb__1375) ctx) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx2) dtb__1376) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1377; B_dData_dPair.f_Pair_second = dtb__1378 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1378) ctx) dtb__1375) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1377) else dtb__1377) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb__1371, rig, B_dData_dMaybe.C_Maybe_Nothing, ((Base_dSource.v_spanAtName dtb__1371) (Frontend_dAst.v_nodeRefSpan dtb__1372)), bodyTerm2)), dtb__1373, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1378 })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dAst.C_Pat_PWild (dtb__1379) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pv in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1380; B_dData_dPair.f_Pair_second = dtb__1381 } -> (match dtb__1381 with
  | { B_dData_dPair.f_Pair_first = dtb__1382; B_dData_dPair.f_Pair_second = dtb__1383 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1382) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) dtb__1383) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1384; B_dData_dPair.f_Pair_second = dtb__1385 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.v_nodeRefSpan dtb__1379), (((Core_dTerm.v_shift 0) 1) dtb__1384))), dtb__1380, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1385 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_ECase ((B_dData_dPair.v_secondOf bnd), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (B_dData_dPair.v_firstOf bnd); Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_ELet ((v_pairsToBindings rest), body, rec_u, (Frontend_dAst.v_detachedNodeRef sp))); Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan (B_dData_dPair.v_firstOf bnd))) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan (B_dData_dPair.v_firstOf bnd)))))) expected)
)))
# 2400 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = binds in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1386, dtb__1387) -> (match dtb__1386 with
  | { B_dData_dPair.f_Pair_first = dtb__1388; B_dData_dPair.f_Pair_second = dtb__1389 } -> (match dtb__1388 with
  | Frontend_dAst.C_Pat_PVar (dtb__1390, dtb__1391) -> (((((((((((v_inferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1390) dtb__1389) dtb__1387) body) rec_u) ((Base_dSource.v_spanAtName dtb__1390) (Frontend_dAst.v_nodeRefSpan dtb__1391))) sp)
  | Frontend_dAst.C_Pat_PWild (dtb__1392) -> ((((((((((v_inferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1389) dtb__1387) body) rec_u) (Frontend_dAst.v_nodeRefSpan dtb__1392)) sp)
  | _ -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_ECase (dtb__1389, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb__1388; Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_ELet ((v_pairsToBindings dtb__1387), body, rec_u, (Frontend_dAst.v_detachedNodeRef sp))); Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb__1388)) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb__1388)))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
))))
# 2414 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetBoundFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (value : Frontend_dAst.t_Expr) (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = pv in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__1393; B_dData_dPair.f_Pair_second = dtb__1394 } -> (match dtb__1394 with
  | { B_dData_dPair.f_Pair_first = dtb__1395; B_dData_dPair.f_Pair_second = dtb__1396 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1395) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dtb__1395) ctx) in ((Base_dCommon.v_bind ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx2) dtb__1396) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = pb in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1397; B_dData_dPair.f_Pair_second = dtb__1398 } -> (match dtb__1398 with
  | { B_dData_dPair.f_Pair_first = dtb__1399; B_dData_dPair.f_Pair_second = dtb__1400 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1400) ctx) dtb__1395) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1397) else dtb__1397) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, bodyTerm2)), dtb__1393, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1399; B_dData_dPair.f_Pair_second = dtb__1400 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2436 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetIgnoredFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dAst.t_Expr) (rest : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pv in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1401; B_dData_dPair.f_Pair_second = dtb__1402 } -> (match dtb__1402 with
  | { B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = dtb__1404 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1403) in ((Base_dCommon.v_bind ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx) dtb__1404) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pb in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1405; B_dData_dPair.f_Pair_second = dtb__1406 } -> (match dtb__1406 with
  | { B_dData_dPair.f_Pair_first = dtb__1407; B_dData_dPair.f_Pair_second = dtb__1408 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, (((Core_dTerm.v_shift 0) 1) dtb__1405))), dtb__1401, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1407; B_dData_dPair.f_Pair_second = dtb__1408 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2529 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelHint = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1409) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1410) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1411) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match expr with
  | Frontend_dAst.C_Expr_EApp (dtb__1412, dtb__1413, dtb__1414) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1412) dtb__1413) (Frontend_dAst.v_nodeRefSpan dtb__1414)) (B_dData_dMaybe.C_Maybe_Just (expected)))
  | _ -> (((((v_inferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2815 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkByInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((((v_inferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__1415) -> (match dtb__1415 with
  | { B_dData_dPair.f_Pair_first = dtb__1416; B_dData_dPair.f_Pair_second = dtb__1417 } -> (match dtb__1417 with
  | { B_dData_dPair.f_Pair_first = dtb__1418; B_dData_dPair.f_Pair_second = dtb__1419 } -> (match ((((v_coerceTerm dtb__1419) expected) dtb__1418) dtb__1416) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1420) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1420; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1419) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1419) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1418) with
  | Base_dDiag.C_Check_ErrC (dtb__1421) -> (match ((((((v_tryEffLift ctx) globals) dtb__1419) expected) dtb__1418) dtb__1416) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1422) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__1422); B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) (B_dData_dPair.v_secondOf dtb__1422)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_unhandledEffectLabel dtb__1419) expected) dtb__1418) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1423) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> ((Elab_dTerm_dSupport.v_withEffectLabels dtb__1423) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("actual: " ^ (Core_dEval.v_showValue dtb__1418))))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("expected: " ^ (Core_dEval.v_showValue expected))))) d))))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((v_joinEffectLabels dtb__1423)))) (v_joinEffectLabels dtb__1423)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan expr)) dtb__1421)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__1424) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1416; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1424) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1425) -> (Base_dDiag.C_Check_ErrC (dtb__1425))
  | _ -> failwith "DT: impossible branch"
))))
# 2836 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLamFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1426, dtb__1427) -> (match dtb__1426 with
  | { B_dData_dPair.f_Pair_first = dtb__1428; B_dData_dPair.f_Pair_second = dtb__1429 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (let nd_uscrut16 = forced in (match nd_uscrut16 with
  | Core_dTerm.C_Value_VMeta (dtb__1430, dtb__1431) -> (match dtb__1431 with
  | B_dData_dList.C_List_Nil -> (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) mc3) with
  | { B_dData_dPair.f_Pair_first = dtb__1432; B_dData_dPair.f_Pair_second = dtb__1433 } -> (let domVal = ((Elab_dTypes.v_evalCtx mc2) dtb__1432) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) dtb__1433) with
  | { B_dData_dPair.f_Pair_first = dtb__1434; B_dData_dPair.f_Pair_second = dtb__1435 } -> (let piVal = (Core_dTerm.C_Value_VPi ("_", false, Core_dTerm.C_Rig_RigOmega, domVal, { Core_dTerm.f_Closure_closureEnv = B_dData_dList.C_List_Nil; Core_dTerm.f_Closure_closureBody = dtb__1434 })) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__1435)) (Elab_dTypes.v_ecSolsP dtb__1435)) lvl) dtb__1430) B_dData_dList.C_List_Nil) piVal) with
  | Base_dDiag.C_Check_OkC (dtb__1436) -> ((((((((v_checkLamFuel (mc0 - 1)) mc1) mc2) ((Elab_dTypes.v_ecPutSols dtb__1435) (Core_dTerm.v_solsList dtb__1436))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1428; B_dData_dPair.f_Pair_second = dtb__1429 }, dtb__1427))) mc5) piVal) mc7)
  | Base_dDiag.C_Check_ErrC (dtb__1437) -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
)
  | Core_dTerm.C_Value_VPi (dtb__1438, dtb__1439, dtb__1440, dtb__1441, dtb__1442) -> (if dtb__1439 then (if (if ((Elab_dDict.v_isDictDomain mc3) dtb__1441) then true else (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__1441)) then (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1438) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1438) dtb__1441) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1442) v) in ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1428; B_dData_dPair.f_Pair_second = dtb__1429 }, dtb__1427))) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1443; B_dData_dPair.f_Pair_second = dtb__1444 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1438, dtb__1440, ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1441)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))), Base_dSource.v_spanEmpty, dtb__1443)); B_dData_dPair.f_Pair_second = dtb__1444 }))
  | _ -> failwith "DT: impossible branch"
))))))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)) else (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1438) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1428) dtb__1441) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1442) v) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain mc3) mc7) dtb__1428) dtb__1440) dtb__1441)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1427) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1445; B_dData_dPair.f_Pair_second = dtb__1446 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1446) mc2) dtb__1441) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1445) else dtb__1445) in (let slot0 = ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1441)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear mc3) mc2) then (if (((Elab_dMeta.v_termHasOuterLinear mc3) ctx2) dtb__1445) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1428, lamRig, slot, dtb__1429, inner2)); B_dData_dPair.f_Pair_second = dtb__1446 })))))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2925 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dAst.C_Expr_EApp (dtb__1447, dtb__1448, dtb__1449) -> (match dtb__1447 with
  | Frontend_dAst.C_Expr_EVar (dtb__1450, dtb__1451) -> (if (if (dtb__1450 = "->") then true else (dtb__1450 = "Type")) then (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Elab_dTypes.v_ctxLookup dtb__1450) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1452) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) dtb__1450) then (match (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1450) dtb__1448) (Frontend_dAst.v_nodeRefSpan dtb__1451)) with
  | Base_dDiag.C_Check_ErrC (dtb__1453) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dDiag.C_Check_OkC (dtb__1454) -> (Base_dDiag.C_Check_OkC (dtb__1454))
  | _ -> failwith "DT: impossible branch"
) else (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Frontend_dAst.C_Expr_EVar (dtb__1455, dtb__1456) -> (match ((Elab_dTypes.v_ctxLookup dtb__1455) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1457) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_typeLookup globals) ec) dtb__1455) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1458) -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1458))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1459) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec) dtb__1455); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1459; B_dData_dPair.f_Pair_second = ec } }))
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
# 2958 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = p in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__1460; B_dData_dPair.f_Pair_second = dtb__1461 } -> (match dtb__1461 with
  | { B_dData_dPair.f_Pair_first = dtb__1462; B_dData_dPair.f_Pair_second = dtb__1463 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1463) dtb__1462) in (match (Core_dTerm.v_typeLevelOf forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1464) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1460; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1464; B_dData_dPair.f_Pair_second = dtb__1463 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedType (((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1462)))) ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1462))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2976 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__1465, dtb__1466) -> (if (Frontend_dReserved.v_isOverCtorName dtb__1465) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) (Frontend_dAst.v_nodeRefSpan dtb__1466)) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort dtb__1465)) (Frontend_dReserved.v_overCtorTargets dtb__1465))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (t, dtb__1466))) args) expected) sp))) else (if (Frontend_dReserved.v_isOverValueName dtb__1465) then ((Base_dCommon.v_bind (((((((v_resolveOverValueAppTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort dtb__1465)) (Frontend_dReserved.v_overValueTargets dtb__1465)) expected) sp)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EVar (t, dtb__1466))) args) expected) sp))) else (match ((Elab_dTypes.v_ctxLookup dtb__1465) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1467) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EApp (fn, args, (Frontend_dAst.v_detachedNodeRef sp)))) expected)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((Elab_dMeta.v_isSortVal ec) expected) then (match ((Elab_dMeta.v_typeNameOfDualCtor ec) dtb__1465) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1468) -> ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1468) args) expected) (Frontend_dAst.v_nodeRefSpan dtb__1466))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) dtb__1465) then ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1465) args) expected) (Frontend_dAst.v_nodeRefSpan dtb__1466)) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1465) args) expected) sp) (Frontend_dAst.v_nodeRefSpan dtb__1466)))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1465) args) expected) sp) (Frontend_dAst.v_nodeRefSpan dtb__1466)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 3009 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppByValueFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dAst.t_Expr) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (vsp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut10 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1469) -> (match dtb__1469 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__1470) -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__1471) -> ((((((((v_checkAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
# 3022 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1472; B_dData_dPair.f_Pair_second = dtb__1473 } -> (match dtb__1473 with
  | { B_dData_dPair.f_Pair_first = dtb__1474; B_dData_dPair.f_Pair_second = dtb__1475 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1475) (Elab_dTypes.v_ctxDepth ctx)) expected) (Core_dTerm.C_Value_VType (dtb__1474)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1472; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 3033 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (((Elab_dMeta.v_typeHeadLookup globals) ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1476) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1476)) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = pa in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__1477; B_dData_dPair.f_Pair_second = dtb__1478 } -> (match dtb__1478 with
  | { B_dData_dPair.f_Pair_first = dtb__1479; B_dData_dPair.f_Pair_second = dtb__1480 } -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb__1480) dtb__1479)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1481) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1480) name) dtb__1477); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1481; B_dData_dPair.f_Pair_second = dtb__1480 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 3094 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeEqAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isEqMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1482, dtb__1483) -> (match dtb__1483 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1484, dtb__1485) -> (match dtb__1485 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1482)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1486; B_dData_dPair.f_Pair_second = dtb__1487 } -> (match dtb__1487 with
  | { B_dData_dPair.f_Pair_first = dtb__1488; B_dData_dPair.f_Pair_second = dtb__1489 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1489) dtb__1484)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1490; B_dData_dPair.f_Pair_second = dtb__1491 } -> (match dtb__1491 with
  | { B_dData_dPair.f_Pair_first = dtb__1492; B_dData_dPair.f_Pair_second = dtb__1493 } -> (match (((((v_coerceNatOperands dtb__1493) dtb__1488) dtb__1492) dtb__1486) dtb__1490) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1494) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1494))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1494))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1494))) dtb__1493)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1493) (Elab_dTypes.v_ctxDepth ctx)) dtb__1488) dtb__1492)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) dtb__1486) dtb__1490) sp) dtb__1488) ec3)))
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
# 3118 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeCmpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isCmpMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1495, dtb__1496) -> (match dtb__1496 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1497, dtb__1498) -> (match dtb__1498 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1495)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1499; B_dData_dPair.f_Pair_second = dtb__1500 } -> (match dtb__1500 with
  | { B_dData_dPair.f_Pair_first = dtb__1501; B_dData_dPair.f_Pair_second = dtb__1502 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1502) dtb__1497)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1503; B_dData_dPair.f_Pair_second = dtb__1504 } -> (match dtb__1504 with
  | { B_dData_dPair.f_Pair_first = dtb__1505; B_dData_dPair.f_Pair_second = dtb__1506 } -> (match (((((v_coerceNatOperands dtb__1506) dtb__1501) dtb__1505) dtb__1499) dtb__1503) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1507) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1507))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1507))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1507))) dtb__1506)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1506) (Elab_dTypes.v_ctxDepth ctx)) dtb__1501) dtb__1505)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) dtb__1499) dtb__1503) sp) dtb__1501) ec3)))
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
# 3144 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeOpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (name = Base_dIntrinsics.v_interpMethodName) then (((((((v_specializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Base_dCommon.v_bind (((((((v_specializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1508) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1508))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r2 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1509) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1509))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r3 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1510) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1510))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_specializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 3177 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeInterpPrimApp = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1511, dtb__1512) -> (match dtb__1512 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1511)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1513; B_dData_dPair.f_Pair_second = dtb__1514 } -> (match dtb__1514 with
  | { B_dData_dPair.f_Pair_first = dtb__1515; B_dData_dPair.f_Pair_second = dtb__1516 } -> (let tyv = ((Elab_dTypes.v_forceVal dtb__1516) dtb__1515) in (if (v_isStringTyValue tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1513; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyv; B_dData_dPair.f_Pair_second = dtb__1516 } })))) else (if (if ((v_isIntTy dtb__1516) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1516) Base_dIntrinsics.v_intTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm dtb__1513); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1516 } })))) else (if (if ((v_isNatTy dtb__1516) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1516) Base_dIntrinsics.v_natTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm (v_natToIntTerm dtb__1513)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1516 } })))) else (if ((v_isFloatTy dtb__1516) tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromFloatTerm dtb__1513); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1516 } })))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 3217 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeBoolAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1517, dtb__1518) -> (match dtb__1518 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1519, dtb__1520) -> (match dtb__1520 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1517) Elab_dPrelude.v_boolTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1521; B_dData_dPair.f_Pair_second = dtb__1522 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1522) dtb__1519) Elab_dPrelude.v_boolTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1523; B_dData_dPair.f_Pair_second = dtb__1524 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((Elab_dDict.v_boolShortCircuit name) dtb__1521) dtb__1523); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__1524 } }))))
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
# 3238 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__1525, dtb__1526) -> ((Base_dCommon.v_bind ((((((((v_specializeArithCheckFuel (fuel - 1)) globals) ctx) ec) dtb__1525) args) expected) sp)) (fun (arith : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut11 = arith in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_skipArithSpecForExpected ec) dtb__1525) expected) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EApp (fn, args, (Frontend_dAst.v_detachedNodeRef sp)))) expected) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1525) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut14 = mspec in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EApp (fn, args, (Frontend_dAst.v_detachedNodeRef sp)))) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1527) -> (match dtb__1527 with
  | { B_dData_dPair.f_Pair_first = dtb__1528; B_dData_dPair.f_Pair_second = dtb__1529 } -> (match dtb__1529 with
  | { B_dData_dPair.f_Pair_first = dtb__1530; B_dData_dPair.f_Pair_second = dtb__1531 } -> (match ((((v_coerceTerm dtb__1531) expected) dtb__1530) dtb__1528) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1532) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1532; B_dData_dPair.f_Pair_second = dtb__1531 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1531) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1530)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1528; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1533) -> (match dtb__1533 with
  | { B_dData_dPair.f_Pair_first = dtb__1534; B_dData_dPair.f_Pair_second = dtb__1535 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1534; B_dData_dPair.f_Pair_second = dtb__1535 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dAst.C_Expr_EApp (fn, args, (Frontend_dAst.v_detachedNodeRef sp)))) expected)
)))
# 3528 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppCtorFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1536) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs ec) ctx) dtb__1536) expected) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1536))) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1537; B_dData_dPair.f_Pair_second = dtb__1538 } -> (match dtb__1538 with
  | { B_dData_dPair.f_Pair_first = dtb__1539; B_dData_dPair.f_Pair_second = dtb__1540 } -> (let ctorTerm = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1540)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1537) in (match ((((v_coerceTerm dtb__1540) expected) dtb__1539) ctorTerm) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1541) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1541; B_dData_dPair.f_Pair_second = dtb__1540 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1540) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1539) with
  | Base_dDiag.C_Check_OkC (dtb__1542) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1542)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1537); B_dData_dPair.f_Pair_second = dtb__1542 }))
  | Base_dDiag.C_Check_ErrC (dtb__1543) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1543)))) (Frontend_dAst.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1543))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1544) -> (match dtb__1544 with
  | { B_dData_dPair.f_Pair_first = dtb__1545; B_dData_dPair.f_Pair_second = dtb__1546 } -> (match dtb__1546 with
  | { B_dData_dPair.f_Pair_first = dtb__1547; B_dData_dPair.f_Pair_second = dtb__1548 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1548) dtb__1547) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pa in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1549; B_dData_dPair.f_Pair_second = dtb__1550 } -> (match dtb__1550 with
  | { B_dData_dPair.f_Pair_first = dtb__1551; B_dData_dPair.f_Pair_second = dtb__1552 } -> (let allArgs = ((B_dData_dList.v_append dtb__1545) dtb__1549) in (match ((((v_coerceTerm dtb__1552) expected) dtb__1551) (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1552)) (Core_dTerm.C_Term_TGlobal (name))) allArgs)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1553) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1553; B_dData_dPair.f_Pair_second = dtb__1552 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1552) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1551) with
  | Base_dDiag.C_Check_OkC (dtb__1554) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1554)) (Core_dTerm.C_Term_TGlobal (name))) allArgs); B_dData_dPair.f_Pair_second = dtb__1554 }))
  | Base_dDiag.C_Check_ErrC (dtb__1555) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1555)))) (Frontend_dAst.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1555))
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
# 3807 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabDoChain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (plan : t_DoPlan) (steps : t_DoChainStep B_dData_dList.t_List) (last : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = steps in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1556, dtb__1557) -> (match dtb__1556 with
  | C_DoChainStep_DoChainStep (dtb__1558, dtb__1559, dtb__1560, dtb__1561) -> (match (((Elab_dMetaSpans.v_newMetaAt dtb__1560) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1562; B_dData_dPair.f_Pair_second = dtb__1563 } -> (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1562) in (let mArgTy = ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) aVal) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1558) aVal) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1563) dtb__1560) "_") (plan).f_DoPlan_planRigE) mArgTy)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1563) dtb__1559) mArgTy)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1564; B_dData_dPair.f_Pair_second = dtb__1565 } -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1565) dtb__1560) dtb__1558) (plan).f_DoPlan_planInnerRig) aVal)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx2) dtb__1565) plan) dtb__1557) last)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1566; B_dData_dPair.f_Pair_second = dtb__1567 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((((((((v_doBindAppTerm dtb__1565) dtb__1567) ctx) dtb__1560) dtb__1561) plan) dtb__1558) aVal) dtb__1564) argRig) lamRig) dtb__1566); B_dData_dPair.f_Pair_second = dtb__1567 }))
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
# 3841 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1568) -> (match dtb__1568 with
  | { B_dData_dPair.f_Pair_first = dtb__1569; B_dData_dPair.f_Pair_second = dtb__1570 } -> (match dtb__1570 with
  | { B_dData_dPair.f_Pair_first = dtb__1571; B_dData_dPair.f_Pair_second = dtb__1572 } -> (let nd_uscrut17 = ((v_splitDoExpected ec) expected) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1573; B_dData_dPair.f_Pair_second = dtb__1574 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1574) with
  | { B_dData_dPair.f_Pair_first = dtb__1575; B_dData_dPair.f_Pair_second = dtb__1576 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1573) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1575) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1576) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1569) dtb__1571) dtb__1572) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1577) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1577).f_DoPlan_planEc) dtb__1577) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1578; B_dData_dPair.f_Pair_second = dtb__1579 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1579) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_applyValue (dtb__1577).f_DoPlan_planMVal) (dtb__1577).f_DoPlan_planAVal))) (fun (ec4 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1578; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1580) -> (match dtb__1580 with
  | { B_dData_dPair.f_Pair_first = dtb__1581; B_dData_dPair.f_Pair_second = dtb__1582 } -> ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1569) dtb__1571) dtb__1572) dtb__1581) dtb__1582)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1583) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1583).f_DoPlan_planEc) dtb__1583) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1584; B_dData_dPair.f_Pair_second = dtb__1585 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1584; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1585) }))))
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
# 3884 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1586) -> (match dtb__1586 with
  | { B_dData_dPair.f_Pair_first = dtb__1587; B_dData_dPair.f_Pair_second = dtb__1588 } -> (match dtb__1588 with
  | { B_dData_dPair.f_Pair_first = dtb__1589; B_dData_dPair.f_Pair_second = dtb__1590 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1591; B_dData_dPair.f_Pair_second = dtb__1592 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1592) with
  | { B_dData_dPair.f_Pair_first = dtb__1593; B_dData_dPair.f_Pair_second = dtb__1594 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1591) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1593) in (let resultTy = ((Core_dEval.v_applyValue mVal) aVal) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1594) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1587) dtb__1589) dtb__1590) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1595) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1595).f_DoPlan_planEc) dtb__1595) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1596; B_dData_dPair.f_Pair_second = dtb__1597 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1596; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__1597 } }))))
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

# 3057 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_checkTypeAtKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dAst.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VType (dtb__1598) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) (((((v_checkTypeFuel 256) globals) ctx) ec) expr))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)) }))))
  | _ -> (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dAst.C_Expr_EApp (dtb__1599, dtb__1600, dtb__1601) -> (match dtb__1599 with
  | Frontend_dAst.C_Expr_EVar (dtb__1602, dtb__1603) -> (if (((Elab_dMeta.v_isTypeName globals) ec) dtb__1602) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) dtb__1602) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb__1602))) dtb__1602)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1604) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel 256) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1604)) dtb__1600) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1605; B_dData_dPair.f_Pair_second = dtb__1606 } -> (match dtb__1606 with
  | { B_dData_dPair.f_Pair_first = dtb__1607; B_dData_dPair.f_Pair_second = dtb__1608 } -> (match ((((Elab_dMeta.v_convEc dtb__1608) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1607) with
  | Base_dDiag.C_Check_OkC (dtb__1609) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1609) dtb__1602) dtb__1605); B_dData_dPair.f_Pair_second = dtb__1609 }))
  | Base_dDiag.C_Check_ErrC (dtb__1610) -> (((Base_dDiagnostics_dTc.v_tcTypeMismatch sp) (Core_dEval.v_showValue expected)) (Core_dEval.v_showValue dtb__1607))
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
  | Frontend_dAst.C_Expr_EVar (dtb__1611, dtb__1612) -> (if (((Elab_dMeta.v_isTypeName globals) ec) dtb__1611) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) dtb__1611) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb__1611))) dtb__1611)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1613) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1613)))) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec1) dtb__1611); B_dData_dPair.f_Pair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected))
))
))

# 981 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planData = (fun (p : t_FieldAccessPlan) -> (match p with
  | { f_FieldAccessPlan_planData = dtb__1614; f_FieldAccessPlan_planCtor = dtb__1615; f_FieldAccessPlan_planIdxs = dtb__1616; f_FieldAccessPlan_planRecord = dtb__1617; f_FieldAccessPlan_planField = dtb__1618; f_FieldAccessPlan_planFieldCount = dtb__1619; f_FieldAccessPlan_planType = dtb__1620 } -> dtb__1614
  | _ -> failwith "DT: impossible branch"
))

# 982 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planCtor = (fun (p : t_FieldAccessPlan) -> (match p with
  | { f_FieldAccessPlan_planData = dtb__1621; f_FieldAccessPlan_planCtor = dtb__1622; f_FieldAccessPlan_planIdxs = dtb__1623; f_FieldAccessPlan_planRecord = dtb__1624; f_FieldAccessPlan_planField = dtb__1625; f_FieldAccessPlan_planFieldCount = dtb__1626; f_FieldAccessPlan_planType = dtb__1627 } -> dtb__1622
  | _ -> failwith "DT: impossible branch"
))

# 983 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planIdxs = (fun (p : t_FieldAccessPlan) -> (match p with
  | { f_FieldAccessPlan_planData = dtb__1628; f_FieldAccessPlan_planCtor = dtb__1629; f_FieldAccessPlan_planIdxs = dtb__1630; f_FieldAccessPlan_planRecord = dtb__1631; f_FieldAccessPlan_planField = dtb__1632; f_FieldAccessPlan_planFieldCount = dtb__1633; f_FieldAccessPlan_planType = dtb__1634 } -> dtb__1630
  | _ -> failwith "DT: impossible branch"
))

# 984 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRecord = (fun (p : t_FieldAccessPlan) -> (match p with
  | { f_FieldAccessPlan_planData = dtb__1635; f_FieldAccessPlan_planCtor = dtb__1636; f_FieldAccessPlan_planIdxs = dtb__1637; f_FieldAccessPlan_planRecord = dtb__1638; f_FieldAccessPlan_planField = dtb__1639; f_FieldAccessPlan_planFieldCount = dtb__1640; f_FieldAccessPlan_planType = dtb__1641 } -> dtb__1638
  | _ -> failwith "DT: impossible branch"
))

# 985 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planField = (fun (p : t_FieldAccessPlan) -> (match p with
  | { f_FieldAccessPlan_planData = dtb__1642; f_FieldAccessPlan_planCtor = dtb__1643; f_FieldAccessPlan_planIdxs = dtb__1644; f_FieldAccessPlan_planRecord = dtb__1645; f_FieldAccessPlan_planField = dtb__1646; f_FieldAccessPlan_planFieldCount = dtb__1647; f_FieldAccessPlan_planType = dtb__1648 } -> dtb__1646
  | _ -> failwith "DT: impossible branch"
))

# 986 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planFieldCount = (fun (p : t_FieldAccessPlan) -> (match p with
  | { f_FieldAccessPlan_planData = dtb__1649; f_FieldAccessPlan_planCtor = dtb__1650; f_FieldAccessPlan_planIdxs = dtb__1651; f_FieldAccessPlan_planRecord = dtb__1652; f_FieldAccessPlan_planField = dtb__1653; f_FieldAccessPlan_planFieldCount = dtb__1654; f_FieldAccessPlan_planType = dtb__1655 } -> dtb__1654
  | _ -> failwith "DT: impossible branch"
))

# 987 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planType = (fun (p : t_FieldAccessPlan) -> (match p with
  | { f_FieldAccessPlan_planData = dtb__1656; f_FieldAccessPlan_planCtor = dtb__1657; f_FieldAccessPlan_planIdxs = dtb__1658; f_FieldAccessPlan_planRecord = dtb__1659; f_FieldAccessPlan_planField = dtb__1660; f_FieldAccessPlan_planFieldCount = dtb__1661; f_FieldAccessPlan_planType = dtb__1662 } -> dtb__1662
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upData = (fun (p : t_UpdateAccessPlan) -> (match p with
  | { f_UpdateAccessPlan_upData = dtb__1663; f_UpdateAccessPlan_upCtor = dtb__1664; f_UpdateAccessPlan_upIdxs = dtb__1665; f_UpdateAccessPlan_upRecord = dtb__1666; f_UpdateAccessPlan_upFieldCount = dtb__1667; f_UpdateAccessPlan_upFieldIndices = dtb__1668; f_UpdateAccessPlan_upBodyArgs = dtb__1669 } -> dtb__1663
  | _ -> failwith "DT: impossible branch"
))

# 992 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upCtor = (fun (p : t_UpdateAccessPlan) -> (match p with
  | { f_UpdateAccessPlan_upData = dtb__1670; f_UpdateAccessPlan_upCtor = dtb__1671; f_UpdateAccessPlan_upIdxs = dtb__1672; f_UpdateAccessPlan_upRecord = dtb__1673; f_UpdateAccessPlan_upFieldCount = dtb__1674; f_UpdateAccessPlan_upFieldIndices = dtb__1675; f_UpdateAccessPlan_upBodyArgs = dtb__1676 } -> dtb__1671
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upIdxs = (fun (p : t_UpdateAccessPlan) -> (match p with
  | { f_UpdateAccessPlan_upData = dtb__1677; f_UpdateAccessPlan_upCtor = dtb__1678; f_UpdateAccessPlan_upIdxs = dtb__1679; f_UpdateAccessPlan_upRecord = dtb__1680; f_UpdateAccessPlan_upFieldCount = dtb__1681; f_UpdateAccessPlan_upFieldIndices = dtb__1682; f_UpdateAccessPlan_upBodyArgs = dtb__1683 } -> dtb__1679
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upRecord = (fun (p : t_UpdateAccessPlan) -> (match p with
  | { f_UpdateAccessPlan_upData = dtb__1684; f_UpdateAccessPlan_upCtor = dtb__1685; f_UpdateAccessPlan_upIdxs = dtb__1686; f_UpdateAccessPlan_upRecord = dtb__1687; f_UpdateAccessPlan_upFieldCount = dtb__1688; f_UpdateAccessPlan_upFieldIndices = dtb__1689; f_UpdateAccessPlan_upBodyArgs = dtb__1690 } -> dtb__1687
  | _ -> failwith "DT: impossible branch"
))

# 995 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upFieldCount = (fun (p : t_UpdateAccessPlan) -> (match p with
  | { f_UpdateAccessPlan_upData = dtb__1691; f_UpdateAccessPlan_upCtor = dtb__1692; f_UpdateAccessPlan_upIdxs = dtb__1693; f_UpdateAccessPlan_upRecord = dtb__1694; f_UpdateAccessPlan_upFieldCount = dtb__1695; f_UpdateAccessPlan_upFieldIndices = dtb__1696; f_UpdateAccessPlan_upBodyArgs = dtb__1697 } -> dtb__1695
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upFieldIndices = (fun (p : t_UpdateAccessPlan) -> (match p with
  | { f_UpdateAccessPlan_upData = dtb__1698; f_UpdateAccessPlan_upCtor = dtb__1699; f_UpdateAccessPlan_upIdxs = dtb__1700; f_UpdateAccessPlan_upRecord = dtb__1701; f_UpdateAccessPlan_upFieldCount = dtb__1702; f_UpdateAccessPlan_upFieldIndices = dtb__1703; f_UpdateAccessPlan_upBodyArgs = dtb__1704 } -> dtb__1703
  | _ -> failwith "DT: impossible branch"
))

# 997 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upBodyArgs = (fun (p : t_UpdateAccessPlan) -> (match p with
  | { f_UpdateAccessPlan_upData = dtb__1705; f_UpdateAccessPlan_upCtor = dtb__1706; f_UpdateAccessPlan_upIdxs = dtb__1707; f_UpdateAccessPlan_upRecord = dtb__1708; f_UpdateAccessPlan_upFieldCount = dtb__1709; f_UpdateAccessPlan_upFieldIndices = dtb__1710; f_UpdateAccessPlan_upBodyArgs = dtb__1711 } -> dtb__1711
  | _ -> failwith "DT: impossible branch"
))

# 3596 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainCanonical = (fun (p : t_DoChain) -> (match p with
  | { f_DoChain_doChainCanonical = dtb__1712; f_DoChain_doChainSteps = dtb__1713; f_DoChain_doChainLast = dtb__1714; f_DoChain_doChainSpan = dtb__1715 } -> dtb__1712
  | _ -> failwith "DT: impossible branch"
))

# 3597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainSteps = (fun (p : t_DoChain) -> (match p with
  | { f_DoChain_doChainCanonical = dtb__1716; f_DoChain_doChainSteps = dtb__1717; f_DoChain_doChainLast = dtb__1718; f_DoChain_doChainSpan = dtb__1719 } -> dtb__1717
  | _ -> failwith "DT: impossible branch"
))

# 3598 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainLast = (fun (p : t_DoChain) -> (match p with
  | { f_DoChain_doChainCanonical = dtb__1720; f_DoChain_doChainSteps = dtb__1721; f_DoChain_doChainLast = dtb__1722; f_DoChain_doChainSpan = dtb__1723 } -> dtb__1722
  | _ -> failwith "DT: impossible branch"
))

# 3599 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainSpan = (fun (p : t_DoChain) -> (match p with
  | { f_DoChain_doChainCanonical = dtb__1724; f_DoChain_doChainSteps = dtb__1725; f_DoChain_doChainLast = dtb__1726; f_DoChain_doChainSpan = dtb__1727 } -> dtb__1727
  | _ -> failwith "DT: impossible branch"
))

# 3739 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planBind = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1728; f_DoPlan_planHead = dtb__1729; f_DoPlan_planMTerm = dtb__1730; f_DoPlan_planMVal = dtb__1731; f_DoPlan_planAVal = dtb__1732; f_DoPlan_planDictTerm = dtb__1733; f_DoPlan_planRigE = dtb__1734; f_DoPlan_planRigL = dtb__1735; f_DoPlan_planInnerRig = dtb__1736; f_DoPlan_planEc = dtb__1737 } -> dtb__1728
  | _ -> failwith "DT: impossible branch"
))

# 3740 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planHead = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1738; f_DoPlan_planHead = dtb__1739; f_DoPlan_planMTerm = dtb__1740; f_DoPlan_planMVal = dtb__1741; f_DoPlan_planAVal = dtb__1742; f_DoPlan_planDictTerm = dtb__1743; f_DoPlan_planRigE = dtb__1744; f_DoPlan_planRigL = dtb__1745; f_DoPlan_planInnerRig = dtb__1746; f_DoPlan_planEc = dtb__1747 } -> dtb__1739
  | _ -> failwith "DT: impossible branch"
))

# 3741 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planMTerm = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1748; f_DoPlan_planHead = dtb__1749; f_DoPlan_planMTerm = dtb__1750; f_DoPlan_planMVal = dtb__1751; f_DoPlan_planAVal = dtb__1752; f_DoPlan_planDictTerm = dtb__1753; f_DoPlan_planRigE = dtb__1754; f_DoPlan_planRigL = dtb__1755; f_DoPlan_planInnerRig = dtb__1756; f_DoPlan_planEc = dtb__1757 } -> dtb__1750
  | _ -> failwith "DT: impossible branch"
))

# 3742 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planMVal = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1758; f_DoPlan_planHead = dtb__1759; f_DoPlan_planMTerm = dtb__1760; f_DoPlan_planMVal = dtb__1761; f_DoPlan_planAVal = dtb__1762; f_DoPlan_planDictTerm = dtb__1763; f_DoPlan_planRigE = dtb__1764; f_DoPlan_planRigL = dtb__1765; f_DoPlan_planInnerRig = dtb__1766; f_DoPlan_planEc = dtb__1767 } -> dtb__1761
  | _ -> failwith "DT: impossible branch"
))

# 3743 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planAVal = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1768; f_DoPlan_planHead = dtb__1769; f_DoPlan_planMTerm = dtb__1770; f_DoPlan_planMVal = dtb__1771; f_DoPlan_planAVal = dtb__1772; f_DoPlan_planDictTerm = dtb__1773; f_DoPlan_planRigE = dtb__1774; f_DoPlan_planRigL = dtb__1775; f_DoPlan_planInnerRig = dtb__1776; f_DoPlan_planEc = dtb__1777 } -> dtb__1772
  | _ -> failwith "DT: impossible branch"
))

# 3744 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDictTerm = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1778; f_DoPlan_planHead = dtb__1779; f_DoPlan_planMTerm = dtb__1780; f_DoPlan_planMVal = dtb__1781; f_DoPlan_planAVal = dtb__1782; f_DoPlan_planDictTerm = dtb__1783; f_DoPlan_planRigE = dtb__1784; f_DoPlan_planRigL = dtb__1785; f_DoPlan_planInnerRig = dtb__1786; f_DoPlan_planEc = dtb__1787 } -> dtb__1783
  | _ -> failwith "DT: impossible branch"
))

# 3745 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRigE = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1788; f_DoPlan_planHead = dtb__1789; f_DoPlan_planMTerm = dtb__1790; f_DoPlan_planMVal = dtb__1791; f_DoPlan_planAVal = dtb__1792; f_DoPlan_planDictTerm = dtb__1793; f_DoPlan_planRigE = dtb__1794; f_DoPlan_planRigL = dtb__1795; f_DoPlan_planInnerRig = dtb__1796; f_DoPlan_planEc = dtb__1797 } -> dtb__1794
  | _ -> failwith "DT: impossible branch"
))

# 3746 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRigL = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1798; f_DoPlan_planHead = dtb__1799; f_DoPlan_planMTerm = dtb__1800; f_DoPlan_planMVal = dtb__1801; f_DoPlan_planAVal = dtb__1802; f_DoPlan_planDictTerm = dtb__1803; f_DoPlan_planRigE = dtb__1804; f_DoPlan_planRigL = dtb__1805; f_DoPlan_planInnerRig = dtb__1806; f_DoPlan_planEc = dtb__1807 } -> dtb__1805
  | _ -> failwith "DT: impossible branch"
))

# 3747 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planInnerRig = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1808; f_DoPlan_planHead = dtb__1809; f_DoPlan_planMTerm = dtb__1810; f_DoPlan_planMVal = dtb__1811; f_DoPlan_planAVal = dtb__1812; f_DoPlan_planDictTerm = dtb__1813; f_DoPlan_planRigE = dtb__1814; f_DoPlan_planRigL = dtb__1815; f_DoPlan_planInnerRig = dtb__1816; f_DoPlan_planEc = dtb__1817 } -> dtb__1816
  | _ -> failwith "DT: impossible branch"
))

# 3748 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planEc = (fun (p : t_DoPlan) -> (match p with
  | { f_DoPlan_planBind = dtb__1818; f_DoPlan_planHead = dtb__1819; f_DoPlan_planMTerm = dtb__1820; f_DoPlan_planMVal = dtb__1821; f_DoPlan_planAVal = dtb__1822; f_DoPlan_planDictTerm = dtb__1823; f_DoPlan_planRigE = dtb__1824; f_DoPlan_planRigL = dtb__1825; f_DoPlan_planInnerRig = dtb__1826; f_DoPlan_planEc = dtb__1827 } -> dtb__1827
  | _ -> failwith "DT: impossible branch"
))
