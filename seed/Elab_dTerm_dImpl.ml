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

# 178 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_needsMatrixCase = (fun (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (Elab_dCase.v_anyNestedPat alts) then true else (B_dData_dList.v_hasDupNames (Elab_dCase.v_altNames alts))))

# 363 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 372 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitCaseHasCatchAll = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__14 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (match dtb__16 with
  | Frontend_dRast.C_Pat_PVar (dtb__18, dtb__19) -> true
  | Frontend_dRast.C_Pat_PWild (dtb__20) -> true
  | _ -> (v_natLitCaseHasCatchAll dtb__15)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfShortOf = (fun (last : string) -> (if ((B_dData_dString.v_endsWith "Op") last) then (let n = (bi_strLength last) in (if (n > 2) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring 0) (B_dData_dNat.v_fromInt (n - 2))) last))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))

# 519 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfCanonical = (fun (canon : string) -> (match (v_perfShortOf (Base_dSource.v_lastSeg canon)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dMaybe.C_Maybe_Just ((C_PerfFamily_PerfFamily (canon, (Base_dSource.v_prefixOfName canon), dtb__21))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__22) -> (match dtb__22 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__23, dtb__24) -> (v_perfFamilyOfCanonical dtb__23)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 534 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Frontend_dRast.C_Expr_EVar (dtb__28, dtb__29) -> (match dtb__26 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isPerformSyntax (Frontend_dRast_dName.v_rnameKey dtb__28)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__27 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 540 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_instArgOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__32, dtb__33, dtb__34) -> (match dtb__32 with
  | Frontend_dRast.C_Expr_EVar (dtb__35, dtb__36) -> (match dtb__33 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (match dtb__38 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__35)) then (B_dData_dMaybe.C_Maybe_Just (dtb__37)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 546 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__39, dtb__40, dtb__41) -> (match dtb__39 with
  | Frontend_dRast.C_Expr_EVar (dtb__42, dtb__43) -> (match dtb__40 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (if (Frontend_dReserved.v_isAppAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__42)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 552 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtCallExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__48, dtb__49, dtb__50) -> (match dtb__48 with
  | Frontend_dRast.C_Expr_EVar (dtb__51, dtb__52) -> (match dtb__49 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__54 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (dtb__53, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (Frontend_dReserved.v_instArgSyntax)), dtb__50)), (B_dData_dList.C_List__x58__x58_ (dtb__55, B_dData_dList.C_List_Nil)), dtb__50)), dtb__56)), dtb__50))))
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
))

# 580 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__57, dtb__58, dtb__59) -> (match dtb__57 with
  | Frontend_dRast.C_Expr_EVar (dtb__60, dtb__61) -> (match dtb__58 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__67 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isHandleSyntax (Frontend_dRast_dName.v_rnameKey dtb__60)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__62; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__66 } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 596 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleFamilyOfCtor = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_ctorFamilyNameOf ec) cname) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (Base_dDiag.C_Check_OkC (dtb__68))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 586 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamily = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (if (Frontend_dReserved.v_isOverCtorName cname) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) sp) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort cname)) (Frontend_dReserved.v_overCtorTargets cname))) (fun (canon : string) -> (((v_handleFamilyOfCtor ec) canon) sp))) else (((v_handleFamilyOfCtor ec) cname) sp)))

# 603 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilyOfPat = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Pat) -> (match mc1 with
  | Frontend_dRast.C_Pat_PCon (dtb__69, dtb__70, dtb__71) -> (((v_handleClauseFamily mc0) (Frontend_dRast_dName.v_rnameKey dtb__69)) dtb__71)
  | _ -> (Base_dDiag.v_icInternal "handle mirror case pattern is not a constructor")
))

# 608 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleCheckFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__72 with
  | { B_dData_dPair.f_Pair_first = dtb__74; B_dData_dPair.f_Pair_second = dtb__75 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__74) with
  | Base_dDiag.C_Check_ErrC (dtb__76) -> (Base_dDiag.C_Check_ErrC (dtb__76))
  | Base_dDiag.C_Check_OkC (dtb__77) -> (if (dtb__77 = mc1) then (((v_handleCheckFamilies mc0) mc1) dtb__73) else ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dRast.v_patSpan dtb__74)) (Base_dDiagnostics_dTc.C_TcErr_HandleClauseFamilyMismatch (mc1, dtb__77))) mc1) dtb__77))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | { B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__80) with
  | Base_dDiag.C_Check_ErrC (dtb__82) -> (Base_dDiag.C_Check_ErrC (dtb__82))
  | Base_dDiag.C_Check_OkC (dtb__83) -> (((v_handleCheckFamilies mc0) dtb__83) dtb__79)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 652 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isUniverseTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__84) -> true
  | _ -> false
))

# 638 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_countOpArrows = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__85) -> (B_dData_dMaybe.C_Maybe_Just (0))
  | Core_dTerm.C_Term_TPi (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> (if dtb__87 then (v_countOpArrows dtb__90) else (if (v_isUniverseTerm dtb__89) then (match (v_countOpArrows dtb__90) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__91 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 632 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArity = (fun (kind : Core_dTerm.t_Term) -> (match (v_countOpArrows kind) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (if (dtb__92 >= 1) then (B_dData_dMaybe.C_Maybe_Just ((dtb__92 - 1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 657 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleHoleArgs = (fun (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), ((v_handleHoleArgs (k - 1)) sp)))))

# 662 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)) else (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)), ((v_handleHoleArgs k) sp), sp))))

# 670 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigBinder = "@vuna@handle@sig"

# 675 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Base.Effect.Core.sigFn"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleSigBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EApp ((((v_handleOpArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (v_handleSigBinder)), sp)), B_dData_dList.C_List_Nil)), sp)), sp)), B_dData_dList.C_List_Nil)), sp)))

# 694 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) -> (match ((Elab_dMeta.v_dtDataLookup canon) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__93)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Elab_dMeta.v_globalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 701 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleDefaultRetBinder = "@vuna@handle@ret"

# 705 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleRetArg = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__94, dtb__95) -> (if (Frontend_dReserved.v_isHandleNoRetSyntax (Frontend_dRast_dName.v_rnameKey dtb__94)) then (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleDefaultRetBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal (v_handleDefaultRetBinder)), dtb__95)), dtb__95)) else (Frontend_dRast.C_Expr_EVar (dtb__94, dtb__95)))
  | _ -> mc0
))

# 684 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCall = (fun (headMode : bool) (nameArg : Frontend_dRast.t_Expr) (canon : string) (k : int) (comp : Frontend_dRast.t_Expr) (ret : Frontend_dRast.t_Expr) (opH : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let fnName = (if headMode then "Base.Effect.Core.handleWithAt" else "Base.Effect.Core.handleWith") in (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName fnName), sp)), (B_dData_dList.C_List__x58__x58_ (nameArg, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (canon, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ (comp, (B_dData_dList.C_List__x58__x58_ ((v_handleRetArg ret), (B_dData_dList.C_List__x58__x58_ (opH, B_dData_dList.C_List_Nil)))))))))))), sp))))

# 716 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opFamilyArityOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) (sp : Base_dSource.t_Span) -> (match (((v_handleOpKind globals) ec) canon) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__96) -> (match (v_handleOpArity dtb__96) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__97) -> (Base_dDiag.C_Check_OkC (dtb__97))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (opTy : Core_dTerm.t_Value) (op : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let nd_uscrut5 = ((v_perfFamilyOfValue ec) opTy) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (match dtb__98 with
  | C_PerfFamily_PerfFamily (dtb__99, dtb__100, dtb__101) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__99) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Base.Effect.Core.performCore"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (dtb__99, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg dtb__99) k) sp), (B_dData_dList.C_List__x58__x58_ (op, B_dData_dList.C_List_Nil)))))))), sp))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_EffResFamilyMissing (((Core_dEval.v_showValueAt 6) opTy)))) ((Core_dEval.v_showValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)))

# 727 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprWith = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) (headMode : bool) (nameArg : Frontend_dRast.t_Expr) -> (let nd_uscrut6 = (v_handleOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (match dtb__102 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (match dtb__104 with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> (let nd_uscrut17 = dtb__106 in (match nd_uscrut17 with
  | Frontend_dRast.C_Expr_ELam (dtb__107, dtb__108, dtb__109) -> (match dtb__107 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match dtb__111 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (match dtb__108 with
  | Frontend_dRast.C_Expr_ECase (dtb__114, dtb__115, dtb__116) -> ((Base_dCommon.v_bind ((v_handleClauseFamilies ec) dtb__115)) (fun (fam : string) -> (let nd_uscrut31 = (v_perfFamilyOfCanonical fam) in (match nd_uscrut31 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (match dtb__117 with
  | C_PerfFamily_PerfFamily (dtb__118, dtb__119, dtb__120) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__118) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC (((((((((v_handleCall headMode) nameArg) dtb__118) k) dtb__103) dtb__105) dtb__106) sp)))))
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

# 743 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) false) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 748 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAt = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))))

# 753 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAtHole = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 883 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordTypeOf = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) ty) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__121) -> (match dtb__121 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__122, dtb__123) -> (match ((Elab_dMeta.v_dtDataLookup dtb__122) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__124) then (let nd_uscrut8 = (Elab_dTypes.v_dtDataCtors dtb__124) in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (match dtb__126 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__123 } }))
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

# 899 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldVarName = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 907 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldPatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ((v_recordFieldVarName i), sp)), (((v_recordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 903 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordFieldPatsFrom 0) n) sp))

# 918 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldLookupGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (if ((dtb__127).Elab_dTypes.f_DtFieldMeta_dtFieldName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__127).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (dtb__127).Elab_dTypes.f_DtFieldMeta_dtFieldType } })) else (((v_recordFieldLookupGo mc0) dtb__128) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 915 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldLookup = (fun (fname : string) (dd : Elab_dTypes.t_DtData) -> (((v_recordFieldLookupGo fname) (Elab_dTypes.v_dtDataFields dd)) (B_dData_dList.v_length (Elab_dTypes.v_dtDataFields dd))))

# 927 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateUnknownGo = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> (match ((v_recordFieldLookup dtb__131) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__131))
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> ((v_recordUpdateUnknownGo mc0) dtb__130)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 935 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateUnknown = (fun (dd : Elab_dTypes.t_DtData) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_recordUpdateUnknownGo dd) fields))

# 939 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateValueFor = (fun (mc0 : string) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (match dtb__134 with
  | { B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = dtb__137 } -> (if (dtb__136 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__137)) else ((v_recordUpdateValueFor mc0) dtb__135))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 945 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateArg = (fun (i : int) (f : Elab_dTypes.t_DtFieldMeta) (provided : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match ((v_recordUpdateValueFor (f).Elab_dTypes.f_DtFieldMeta_dtFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> dtb__138
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (v_recordFieldVarName i)), sp))
  | _ -> failwith "DT: impossible branch"
))

# 952 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (B_dData_dList.C_List__x58__x58_ (((((v_recordUpdateArg mc0) dtb__139) mc2) mc3), ((((v_recordUpdateArgs (mc0 + 1)) dtb__140) mc2) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 958 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdatedIndices = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (match dtb__141 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (let nd_uscrut9 = ((v_recordFieldLookup dtb__143) mc0) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_recordUpdatedIndices mc0) dtb__142)
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> (match dtb__145 with
  | { B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__147 } -> (B_dData_dList.C_List__x58__x58_ (dtb__146, ((v_recordUpdatedIndices mc0) dtb__142)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 990 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (match dtb__150 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (let nd_uscrut15 = ((v_recordFieldLookup fname) dtb__149) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 } -> (match dtb__155 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (Base_dDiag.C_Check_OkC ({ f_FieldAccessPlan_planData = dtb__149; f_FieldAccessPlan_planCtor = dtb__151; f_FieldAccessPlan_planIdxs = dtb__152; f_FieldAccessPlan_planRecord = (dtb__149).Elab_dTypes.f_DtData_dtDataName; f_FieldAccessPlan_planField = dtb__154; f_FieldAccessPlan_planFieldCount = dtb__156; f_FieldAccessPlan_planType = ((Core_dEval.v_eval (B_dData_dList.v_reverse dtb__152)) dtb__157) }))
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

# 1001 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdatePlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (match dtb__158 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (match dtb__160 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (match ((v_recordUpdateUnknown dtb__159) fields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> ((Elab_dTypes.v_errAt sp) ("record type has no field " ^ dtb__163))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let fs = (Elab_dTypes.v_dtDataFields dtb__159) in (let bodyArgs = ((((v_recordUpdateArgs 0) fs) fields) sp) in (Base_dDiag.C_Check_OkC ({ f_UpdateAccessPlan_upData = dtb__159; f_UpdateAccessPlan_upCtor = dtb__161; f_UpdateAccessPlan_upIdxs = dtb__162; f_UpdateAccessPlan_upRecord = (dtb__159).Elab_dTypes.f_DtData_dtDataName; f_UpdateAccessPlan_upFieldCount = (B_dData_dList.v_length fs); f_UpdateAccessPlan_upFieldIndices = ((v_recordUpdatedIndices dtb__159) fields); f_UpdateAccessPlan_upBodyArgs = bodyArgs }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)))

# 1016 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldDictName = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_hasFieldTraitName)

# 1026 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctxHasFieldDictGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : string) (mc5 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (match dtb__164 with
  | { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } -> (let nd_uscrut13 = ((Elab_dTypes.v_forceVal mc3) (((Elab_dTypes.v_varTypeValue mc2) mc1) dtb__167)) in (match nd_uscrut13 with
  | Core_dTerm.C_Value_VNeutral (dtb__168) -> (match dtb__168 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__169, dtb__170) -> (if (dtb__169 = v_hasFieldDictName) then (let nd_uscrut17 = dtb__170 in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (match dtb__172 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (let nd_uscrut27 = ((Elab_dTypes.v_forceVal mc3) dtb__171) in (match nd_uscrut27 with
  | Core_dTerm.C_Value_VNeutral (dtb__177) -> (match dtb__177 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__178, dtb__179) -> (match dtb__179 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (match dtb__180 with
  | Core_dTerm.C_Value_VStr (dtb__182) -> (if (dtb__182 = mc4) then (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc2)) dtb__173) mc5) with
  | Base_dDiag.C_Check_OkC (dtb__183) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__166, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__183 } }))
  | Base_dDiag.C_Check_ErrC (dtb__184) -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) else ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__165) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1022 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctxHasFieldDict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fname : string) (baseTy : Core_dTerm.t_Value) -> ((((((v_ctxHasFieldDictGo (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ctx) ec) fname) baseTy))

# 1054 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldAccessFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (baseTerm : Core_dTerm.t_Term) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut8 = ((Elab_dTypes.v_forceVal ec) baseTy) in (match nd_uscrut8 with
  | Core_dTerm.C_Value_VNeutral (dtb__185) -> (match dtb__185 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__186, dtb__187) -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["type "; dtb__186; " is not a record"]))
  | _ -> (let nd_uscrut10 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> (match dtb__188 with
  | { B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = dtb__190 } -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__191), Core_dTerm.C_Rig_Rig0)), dtb__189, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut9 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (match dtb__193 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (match dtb__195 with
  | { B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = dtb__197 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__196), Core_dTerm.C_Rig_Rig0)), dtb__194, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = dtb__197 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)))

# 1321 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_listLitElems = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__198, dtb__199, dtb__200) -> (match dtb__198 with
  | Frontend_dRast.C_Expr_EVar (dtb__201, dtb__202) -> (match dtb__199 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (match dtb__204 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__206 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isListConsSyntax (Frontend_dRast_dName.v_rnameKey dtb__201)) then ((v_listLitConsTail dtb__203) dtb__205) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__207, dtb__208) -> (if (Frontend_dReserved.v_isListNilSyntax (Frontend_dRast_dName.v_rnameKey dtb__207)) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 1328 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_listLitConsTail = (fun (h : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) -> (match (v_listLitElems t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (h, dtb__209))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1335 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_findCtorByShort = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (if ((Frontend_dRast.v_ctorShortName (Elab_dTypes.v_dtCtorName dtb__210)) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__210)) else ((v_findCtorByShort mc0) dtb__211))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1341 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCtor = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (short : string) -> (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> ((v_findCtorByShort short) (Elab_dTypes.v_dtDataCtors dtb__212))
  | _ -> failwith "DT: impossible branch"
))

# 1348 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> ((Base_dCommon.v_bind ((((v_expandListLitGo mc0) mc1) dtb__214) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (B_dData_dList.C_List__x58__x58_ (dtb__213, (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1360 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__215, dtb__216, dtb__217) -> (match dtb__215 with
  | Frontend_dRast.C_Expr_EVar (dtb__218, dtb__219) -> (match dtb__216 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> (match dtb__221 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__223 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isRowAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__218)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__222 })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 1365 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__224, dtb__225, dtb__226) -> (match dtb__224 with
  | Frontend_dRast.C_Expr_EVar (dtb__227, dtb__228) -> (match dtb__225 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (match dtb__230 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (if (Frontend_dReserved.v_isAppAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__227)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__229; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__231; B_dData_dPair.f_Pair_second = dtb__232 } })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1381 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_applyExtra = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dRast.C_Expr_EApp (mc0, mc1, (Frontend_dRast.v_exprSpan mc0)))
))

# 1372 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryParts = (fun (e : Frontend_dRast.t_Expr) -> (match (v_rowAtParts e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__233) -> (B_dData_dMaybe.C_Maybe_Just (dtb__233))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut2 = (v_appAtParts e) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (match dtb__234 with
  | { B_dData_dPair.f_Pair_first = dtb__235; B_dData_dPair.f_Pair_second = dtb__236 } -> (match dtb__236 with
  | { B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = dtb__238 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((v_applyExtra dtb__235) dtb__238); B_dData_dPair.f_Pair_second = dtb__237 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1386 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitLabel = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> e
  | B_dData_dMaybe.C_Maybe_Just (dtb__239) -> (match dtb__239 with
  | { B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = dtb__241 } -> dtb__240
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1392 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameArg = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (match dtb__242 with
  | { B_dData_dPair.f_Pair_first = dtb__243; B_dData_dPair.f_Pair_second = dtb__244 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1398 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameExpr = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (match (v_rowLitNameArg e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__245) -> dtb__245
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1422 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_wrapRowEntry = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effNamedName), sp)), (B_dData_dList.C_List__x58__x58_ (((v_rowLitNameExpr e) sp), (B_dData_dList.C_List__x58__x58_ ((v_rowLitLabel e), B_dData_dList.C_List_Nil)))), sp)))

# 1417 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsEntry = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__246, dtb__247, dtb__248) -> (match dtb__246 with
  | Frontend_dRast.C_Expr_EVar (dtb__249, dtb__250) -> (match dtb__247 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (match dtb__252 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> (match dtb__254 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__249) = Base_dIntrinsics.v_effNamedName) then mc0 else ((v_wrapRowEntry mc0) mc1))
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

# 1414 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsArgs = (fun (e : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ (((v_rowConsEntry e) sp), (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))))

# 1404 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandRowListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__255, dtb__256) -> ((Base_dCommon.v_bind ((((v_expandRowListLitGo mc0) mc1) dtb__256) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (((v_rowConsArgs dtb__255) t) mc3), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1430 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_firstCtorOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match (((v_litFamilyCtor mc0) mc1) dtb__257) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__259) -> (B_dData_dMaybe.C_Maybe_Just (dtb__259))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstCtorOf mc0) mc1) dtb__258)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1427 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCons = (fun (ec : Elab_dTypes.t_Ec) (fam : string) -> (((v_firstCtorOf ec) fam) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", (B_dData_dList.C_List__x58__x58_ ("RCons", (B_dData_dList.C_List__x58__x58_ ("VCons", B_dData_dList.C_List_Nil))))))))))

# 1438 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandListLit = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (elems : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fam = Base_dIntrinsics.v_effRowFamilyName) then (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__260) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__261) -> ((((v_expandRowListLitGo (Elab_dTypes.v_dtCtorName dtb__260)) (Elab_dTypes.v_dtCtorName dtb__261)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> ((((v_expandListLitGo (Elab_dTypes.v_dtCtorName dtb__262)) (Elab_dTypes.v_dtCtorName dtb__263)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1456 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_listLitFamily = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_expectedFamilyOf ec) expected) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> dtb__264
  | B_dData_dMaybe.C_Maybe_Nothing -> Base_dIntrinsics.v_listFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1463 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandArgListLit = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (a : Frontend_dRast.t_Expr) -> (match (v_listLitElems a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) dom))) dtb__265) (Frontend_dRast.v_exprSpan a))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1682 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitTermGo = (fun (n : int) (acc : Core_dTerm.t_Term) -> (if (n <= 0) then acc else ((v_natLitTermGo (n - 1)) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig1 }, B_dData_dList.C_List_Nil)))))))

# 1685 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitTerm = (fun (n : int) -> ((v_natLitTermGo n) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 1690 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitResult = (fun (sp : Base_dSource.t_Span) (n : int) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC ((v_natLitTerm n)))))

# 1693 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natToIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("natToInt")), t, Core_dTerm.C_Rig_Rig1)))

# 1696 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil))))

# 1699 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_natTypeName, B_dData_dList.C_List_Nil))))

# 1703 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil))))

# 1706 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isIntTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__266) -> (match dtb__266 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__267, dtb__268) -> (match dtb__268 with
  | B_dData_dList.C_List_Nil -> (dtb__267 = Base_dIntrinsics.v_intTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1712 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__269) -> (match dtb__269 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__270, dtb__271) -> (match dtb__271 with
  | B_dData_dList.C_List_Nil -> (dtb__270 = Base_dIntrinsics.v_natTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 359 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitCaseFast = (fun (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((v_isNatTy ec) scrutTy) then (v_natLitCaseAlts alts) else false) then (v_natLitCaseHasCatchAll alts) else false))

# 1719 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isFloatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__272) -> (match dtb__272 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__273, dtb__274) -> (match dtb__274 with
  | B_dData_dList.C_List_Nil -> (dtb__273 = Base_dIntrinsics.v_floatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1191 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForExpected = (fun (ec : Elab_dTypes.t_Ec) (name : string) (expected : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_numMethodOpName ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__275) -> (if ((v_isIntTy ec) expected) then false else (if ((v_isNatTy ec) expected) then false else (if ((v_isFloatTy ec) expected) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VMeta (dtb__276, dtb__277) -> false
  | _ -> true
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1208 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForHint = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (((v_skipArithSpecForExpected mc0) mc1) dtb__278)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1726 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceTerm = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (if (if ((v_isIntTy ec) expected) then ((v_isNatTy ec) actual) else false) then (B_dData_dMaybe.C_Maybe_Just ((v_natToIntTerm term))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1731 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceNatOperands = (fun (ec : Elab_dTypes.t_Ec) (aTy : Core_dTerm.t_Value) (bTy : Core_dTerm.t_Value) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) -> (if (if ((v_isNatTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else (if (if ((v_isNatTy ec) aTy) then ((v_isIntTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = bTy }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = bTerm } })) else (if (if ((v_isIntTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = aTy; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = aTerm; B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else B_dData_dMaybe.C_Maybe_Nothing))))

# 1749 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithOpNameOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) -> (if (mc1 = "+") then (B_dData_dMaybe.C_Maybe_Just ("+")) else (if (mc1 = "-") then (B_dData_dMaybe.C_Maybe_Just ("-")) else (if (mc1 = "*") then (B_dData_dMaybe.C_Maybe_Just ("*")) else (if (mc1 = "/") then (B_dData_dMaybe.C_Maybe_Just ("/")) else (if (Base_dSource.v_containsDot mc1) then ((Elab_dDict.v_numMethodOpName mc0) mc1) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1756 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithNatName = (fun (mc0 : string) -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1762 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (name)), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1765 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithNatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1774 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithFloatName = (fun (mc0 : string) -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1770 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithFloatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1780 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isEIntExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EInt (dtb__279, dtb__280) -> (B_dData_dMaybe.C_Maybe_Just (dtb__279))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1889 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isSimpleComp = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__281, dtb__282) -> true
  | _ -> false
))

# 1946 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_literalTraitLower = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (traitName : string) (methodName : string) (lit : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let dictDom = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName traitName), (B_dData_dList.C_List__x58__x58_ (((Elab_dTypes.v_forceVal ec) expected), B_dData_dList.C_List_Nil)))))) in (let nd_uscrut9 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) dictDom) sp) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__283) -> (match dtb__283 with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName methodName), sp)), (B_dData_dList.C_List__x58__x58_ (lit, B_dData_dList.C_List_Nil)), sp)); B_dData_dPair.f_Pair_second = dtb__285 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__286) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 1955 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_exprFormName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EFloat (dtb__287, dtb__288) -> "EFloat"
  | Frontend_dRast.C_Expr_EInterp (dtb__289, dtb__290, dtb__291) -> "EInterp"
  | Frontend_dRast.C_Expr_EAnn (dtb__292, dtb__293, dtb__294) -> "EAnn"
  | Frontend_dRast.C_Expr_ESectR (dtb__295, dtb__296, dtb__297) -> "ESectR"
  | Frontend_dRast.C_Expr_ESectL (dtb__298, dtb__299, dtb__300) -> "ESectL"
  | Frontend_dRast.C_Expr_ESectOp (dtb__301, dtb__302) -> "ESectOp"
  | Frontend_dRast.C_Expr_EBacktick (dtb__303, dtb__304, dtb__305, dtb__306) -> "EBacktick"
  | Frontend_dRast.C_Expr_EParen (dtb__307, dtb__308) -> "EParen"
  | Frontend_dRast.C_Expr_EInfix (dtb__309, dtb__310, dtb__311, dtb__312) -> "EInfix"
  | Frontend_dRast.C_Expr_EDo (dtb__313, dtb__314) -> "EDo"
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__315, dtb__316, dtb__317) -> "ERecUpdate"
  | Frontend_dRast.C_Expr_ERecord (dtb__318, dtb__319, dtb__320) -> "ERecord"
  | Frontend_dRast.C_Expr_EField (dtb__321, dtb__322, dtb__323) -> "EField"
  | Frontend_dRast.C_Expr_ELocalFun (dtb__324, dtb__325) -> "ELocalFun"
  | Frontend_dRast.C_Expr_ELet (dtb__326, dtb__327, dtb__328, dtb__329) -> "ELet"
  | Frontend_dRast.C_Expr_ECase (dtb__330, dtb__331, dtb__332) -> "ECase"
  | Frontend_dRast.C_Expr_EIf (dtb__333, dtb__334, dtb__335, dtb__336) -> "EIf"
  | Frontend_dRast.C_Expr_EPi (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342) -> "EPi"
  | Frontend_dRast.C_Expr_EApp (dtb__343, dtb__344, dtb__345) -> "EApp"
  | Frontend_dRast.C_Expr_ELam (dtb__346, dtb__347, dtb__348) -> "ELam"
  | Frontend_dRast.C_Expr_EStr (dtb__349, dtb__350) -> "EStr"
  | Frontend_dRast.C_Expr_EInt (dtb__351, dtb__352) -> "EInt"
  | Frontend_dRast.C_Expr_EVar (dtb__353, dtb__354) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 1999 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__355) -> (match dtb__355 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__356) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__356).Elab_dTypes.f_DtCtor_dtCtorType)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__357) -> true
  | Base_dDiag.C_Check_ErrC (dtb__358) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__359) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__359)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__360) -> true
  | Base_dDiag.C_Check_ErrC (dtb__361) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2035 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPiWithMetasFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec } else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__362, dtb__363, dtb__364, dtb__365, dtb__366) -> (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__367; B_dData_dPair.f_Pair_second = dtb__368 } -> ((((v_stripPiWithMetasFuel (fuel - 1)) ctx) dtb__368) ((Core_dEval.v_applyClosure dtb__366) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }
)))

# 2032 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_stripPiWithMetas = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_stripPiWithMetasFuel 64) ctx) ec) v))

# 2024 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppResultMatches = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (v : Core_dTerm.t_Value) -> (match (((v_stripPiWithMetas ctx) ec) v) with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__370)) (Elab_dTypes.v_ecSolsP dtb__370)) (Elab_dTypes.v_ctxDepth ctx)) dtb__369) expected) with
  | Base_dDiag.C_Check_OkC (dtb__371) -> true
  | Base_dDiag.C_Check_ErrC (dtb__372) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2016 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__373) -> (match dtb__373 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__374) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__374).Elab_dTypes.f_DtCtor_dtCtorType))
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__375) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__375))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2049 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueAppTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueAppCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__376, dtb__377) -> (match dtb__377 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__376))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2055 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__378, dtb__379) -> (match dtb__379 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__378))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2192 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_patHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__380, dtb__381, dtb__382) -> (v_anyFieldHasOverCtor dtb__381)
  | Frontend_dRast.C_Pat_PAs (dtb__383, dtb__384, dtb__385) -> (v_patHasOverCtor dtb__384)
  | Frontend_dRast.C_Pat_PCon (dtb__386, dtb__387, dtb__388) -> (if (Frontend_dReserved.v_isInternalSyntaxName (Frontend_dRast_dName.v_rnameKey dtb__386)) then true else (v_anyPatHasOverCtor dtb__387))
  | _ -> false
))
# 2200 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyPatHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__389, dtb__390) -> (if (v_patHasOverCtor dtb__389) then true else (v_anyPatHasOverCtor dtb__390))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 2205 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyFieldHasOverCtor = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__391, dtb__392) -> (match dtb__391 with
  | { B_dData_dPair.f_Pair_first = dtb__393; B_dData_dPair.f_Pair_second = dtb__394 } -> (if (v_patHasOverCtor dtb__394) then true else (v_anyFieldHasOverCtor dtb__392))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2210 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_clausesHaveOverCtor = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__395, dtb__396) -> (match dtb__395 with
  | { B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = dtb__398 } -> (if (v_anyPatHasOverCtor dtb__397) then true else (v_clausesHaveOverCtor dtb__396))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2215 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandLocalFuns = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EAnn (dtb__399, dtb__400, dtb__401) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__399)) (fun (value2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EAnn (value2, dtb__400, dtb__401))))))
  | Frontend_dRast.C_Expr_EDo (dtb__402, dtb__403) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandDoStmt mc0)) dtb__402)) (fun (stmts2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EDo (stmts2, dtb__403))))))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__404, dtb__405, dtb__406) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__404)) (fun (base2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__405)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecUpdate (base2, fields2, dtb__406))))))))
  | Frontend_dRast.C_Expr_ERecord (dtb__407, dtb__408, dtb__409) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__408)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecord (dtb__407, fields2, dtb__409))))))
  | Frontend_dRast.C_Expr_EField (dtb__410, dtb__411, dtb__412) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__410)) (fun (base2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EField (base2, dtb__411, dtb__412))))))
  | Frontend_dRast.C_Expr_EIf (dtb__413, dtb__414, dtb__415, dtb__416) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__413)) (fun (c2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__414)) (fun (t2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__415)) (fun (el2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EIf (c2, t2, el2, dtb__416))))))))))
  | Frontend_dRast.C_Expr_ECase (dtb__417, dtb__418, dtb__419) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__417)) (fun (scrut2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__418)) (fun (alts2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase (scrut2, alts2, dtb__419))))))))
  | Frontend_dRast.C_Expr_ELet (dtb__420, dtb__421, dtb__422, dtb__423) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__420)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__421)) (fun (body2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELet (binds2, body2, dtb__422, dtb__423))))))))
  | Frontend_dRast.C_Expr_EPi (dtb__424, dtb__425, dtb__426, dtb__427, dtb__428, dtb__429) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__427)) (fun (dom2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__428)) (fun (cod2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EPi (dtb__424, dtb__425, dtb__426, dom2, cod2, dtb__429))))))))
  | Frontend_dRast.C_Expr_EApp (dtb__430, dtb__431, dtb__432) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__430)) (fun (fn2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandLocalFuns mc0)) dtb__431)) (fun (args2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (fn2, args2, dtb__432))))))))
  | Frontend_dRast.C_Expr_ELam (dtb__433, dtb__434, dtb__435) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__434)) (fun (b2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELam (dtb__433, b2, dtb__435))))))
  | Frontend_dRast.C_Expr_EFloat (dtb__436, dtb__437) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EFloat (dtb__436, dtb__437))))
  | Frontend_dRast.C_Expr_EStr (dtb__438, dtb__439) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EStr (dtb__438, dtb__439))))
  | Frontend_dRast.C_Expr_EInt (dtb__440, dtb__441) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EInt (dtb__440, dtb__441))))
  | Frontend_dRast.C_Expr_EVar (dtb__442, dtb__443) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar (dtb__442, dtb__443))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__444, dtb__445) -> (if (v_clausesHaveOverCtor dtb__444) then (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELocalFun (dtb__444, dtb__445)))) else ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable mc0)) dtb__444))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))
# 2265 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBind = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__447)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 2269 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandDoStmt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_DoStmt) -> (match mc1 with
  | Frontend_dRast.C_DoStmt_DLet (dtb__448, dtb__449) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__448)) (fun (b2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DLet (b2, dtb__449))))))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__450, dtb__451) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__450)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DExpr (v2, dtb__451))))))
  | Frontend_dRast.C_DoStmt_DBind (dtb__452, dtb__453, dtb__454) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__453)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DBind (dtb__452, v2, dtb__454))))))
  | _ -> failwith "DT: impossible branch"
))

# 2405 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPisWithMetas = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__460; B_dData_dPair.f_Pair_second = dtb__461 } -> ((((v_stripPisWithMetas (fuel - 1)) ctx) dtb__461) ((Core_dEval.v_applyClosure dtb__459) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__460)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }))
)))

# 2420 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isMetaHeadedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VMeta (dtb__462, dtb__463) -> true
  | _ -> false
))

# 2427 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isRigidHeadValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VCon (dtb__464, dtb__465) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__466) -> (match dtb__466 with
  | Core_dTerm.C_Neutral_NVar (dtb__467, dtb__468, dtb__469) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb__470, dtb__471) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2438 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_remainingExplicitPis = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then 0 else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (let v2 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__472, (Elab_dTypes.v_ctxDepth ctx), B_dData_dList.C_List_Nil)))) in (let rest = ((((v_remainingExplicitPis (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__476) v2)) in (if dtb__473 then rest else (rest + 1))))
  | _ -> 0
)))

# 2456 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryUseHint = (fun (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) (piTy : Core_dTerm.t_Value) -> (let nd_uscrut4 = ((((v_stripPisWithMetas 64) ctx) ec) piTy) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__477) -> (match dtb__477 with
  | { B_dData_dPair.f_Pair_first = dtb__478; B_dData_dPair.f_Pair_second = dtb__479 } -> (let forcedRes = ((Elab_dTypes.v_forceVal dtb__479) dtb__478) in (if ((v_isMetaHeadedValue dtb__479) forcedRes) then (if ((v_isRigidHeadValue dtb__479) expected) then (match ((((Elab_dMeta.v_convEc dtb__479) (Elab_dTypes.v_ctxDepth ctx)) expected) forcedRes) with
  | Base_dDiag.C_Check_ErrC (dtb__480) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__481) -> (B_dData_dMaybe.C_Maybe_Just (dtb__481))
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__482) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 2503 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowAndResult = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__483) -> (match dtb__483 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__484, dtb__485) -> (match dtb__485 with
  | B_dData_dList.C_List__x58__x58_ (dtb__486, dtb__487) -> (match dtb__487 with
  | B_dData_dList.C_List__x58__x58_ (dtb__488, dtb__489) -> (if (dtb__484 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__486; B_dData_dPair.f_Pair_second = dtb__488 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2509 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowOfValue = (fun (v : Core_dTerm.t_Value) -> (match (v_effRowAndResult v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__490) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__490)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2516 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNilRowValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VCon (dtb__491, dtb__492) -> (dtb__491 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 2523 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryLabelTail = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__493, dtb__494) -> (if (dtb__493 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__494 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__495, dtb__496) -> (match dtb__496 with
  | B_dData_dList.C_List__x58__x58_ (dtb__497, dtb__498) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__495; B_dData_dPair.f_Pair_second = dtb__497 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2534 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_shortGlobalName = (fun (g : string) -> (Base_dSource.v_lastSeg g))

# 2544 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_labelHeadArgs = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__499, dtb__500) -> ((v_labelHeadArgs (String.concat "" [mc0; " "; ((Core_dEval.v_showValueAt 6) dtb__499)])) dtb__500)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 2538 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLabelText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__501) -> (match dtb__501 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__502, dtb__503) -> ((v_labelHeadArgs (v_shortGlobalName dtb__502)) dtb__503)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 2549 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__504) -> dtb__504
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 2556 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryText = (fun (ec : Elab_dTypes.t_Ec) (n : Core_dTerm.t_Value) (h : Core_dTerm.t_Value) -> (if (((v_rowNameText ec) n) = "default") then ((v_rowLabelText ec) h) else (String.concat "" [((v_rowLabelText ec) h); "@"; ((v_rowNameText ec) n)])))

# 2564 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_namedLabelParts = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__505) -> (match dtb__505 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__506, dtb__507) -> (if (dtb__506 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut6 = dtb__507 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__508, dtb__509) -> (match dtb__509 with
  | B_dData_dList.C_List__x58__x58_ (dtb__510, dtb__511) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__508; B_dData_dPair.f_Pair_second = dtb__510 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2576 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryTextOf = (fun (ec : Elab_dTypes.t_Ec) (label : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_namedLabelParts ec) label) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_rowLabelText ec) label)
  | B_dData_dMaybe.C_Maybe_Just (dtb__512) -> (match dtb__512 with
  | { B_dData_dPair.f_Pair_first = dtb__513; B_dData_dPair.f_Pair_second = dtb__514 } -> (((v_rowEntryText ec) dtb__513) dtb__514)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2583 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowEffectLabels = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__515, dtb__516) -> (if (dtb__515 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (dtb__515 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__515, dtb__516))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> (match dtb__517 with
  | { B_dData_dPair.f_Pair_first = dtb__518; B_dData_dPair.f_Pair_second = dtb__519 } -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) dtb__518) then B_dData_dMaybe.C_Maybe_Nothing else (match (((v_rowEffectLabels (fuel - 1)) ec) dtb__519) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__520) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (((v_rowEntryTextOf ec) dtb__518), dtb__520))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2609 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowNonDefaultHostEntries = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__521, dtb__522) -> (if (dtb__521 = Base_dIntrinsics.v_effRowNilCtor) then B_dData_dList.C_List_Nil else (if (dtb__521 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__521, dtb__522))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (match dtb__523 with
  | { B_dData_dPair.f_Pair_first = dtb__524; B_dData_dPair.f_Pair_second = dtb__525 } -> (let rest = (((v_rowNonDefaultHostEntries (fuel - 1)) ec) dtb__525) in (let nd_uscrut13 = ((v_namedLabelParts ec) dtb__524) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> rest
  | B_dData_dMaybe.C_Maybe_Just (dtb__526) -> (match dtb__526 with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) dtb__528) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VNeutral (dtb__529) -> (match dtb__529 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__530, dtb__531) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb__530) then (if (((v_rowNameText ec) dtb__527) = "default") then rest else (B_dData_dList.C_List__x58__x58_ ((((v_rowEntryText ec) dtb__527) dtb__528), rest))) else rest)
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

# 2635 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_joinEffectLabels = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__532, dtb__533) -> (match dtb__533 with
  | B_dData_dList.C_List_Nil -> dtb__532
  | _ -> (String.concat "" [dtb__532; ", "; (v_joinEffectLabels dtb__533)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2643 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_unhandledEffectLabel = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) -> (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__534) -> (if ((v_isNilRowValue ec) dtb__534) then (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__535) -> (match (((v_rowEffectLabels 64) ec) dtb__535) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__536) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__536) B_dData_dList.C_List_Nil) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__536)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2665 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_sameLabelValue = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let defs = (Elab_dTypes.v_ecDefTbl ec) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let fa = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) a) in (let fb = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) b) in (let nd_uscrut7 = (((Core_dEval.v_valueEqFuel Core_dTerm.v_defaultFuel) fa) fb) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__537) -> (if dtb__537 then true else false)
  | _ -> false
)))))))

# 2676 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowContainsValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (expected : Core_dTerm.t_Value) (label : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VCon (dtb__538, dtb__539) -> (if (dtb__538 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__538, dtb__539))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__540) -> (match dtb__540 with
  | { B_dData_dPair.f_Pair_first = dtb__541; B_dData_dPair.f_Pair_second = dtb__542 } -> (if (((v_sameLabelValue ec) label) dtb__541) then true else ((((v_rowContainsValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__542)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
)))

# 2691 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowSubValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (actual : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) actual) with
  | Core_dTerm.C_Value_VCon (dtb__543, dtb__544) -> (if (dtb__543 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__543 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__543, dtb__544))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__545) -> (match dtb__545 with
  | { B_dData_dPair.f_Pair_first = dtb__546; B_dData_dPair.f_Pair_second = dtb__547 } -> (if ((((v_rowContainsValue ec) (fuel - 1)) expected) dtb__546) then ((((v_rowSubValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__547)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)))

# 2755 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_weakenLabelTerm = (fun (d : int) (label : Core_dTerm.t_Value) (tailF : Core_dTerm.t_Value) (result : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.weaken")), ((Core_dEval.v_quote d) label), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) tailF), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) result), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)))

# 2711 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryEffLift = (fun (ctx : Elab_dTypes.t_Ctx) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.weaken") globals) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__548) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__549) -> (let nd_uscrut11 = (v_rowEntryLabelTail ((Elab_dTypes.v_forceVal ec) (B_dData_dPair.v_firstOf dtb__549))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__550) -> (match dtb__550 with
  | { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = dtb__552 } -> (let tailF = ((Elab_dTypes.v_forceVal ec) dtb__552) in (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) tailF) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__553) -> (match ((((Elab_dMeta.v_convEc ec) d) (B_dData_dPair.v_secondOf dtb__549)) (B_dData_dPair.v_secondOf dtb__553)) with
  | Base_dDiag.C_Check_ErrC (dtb__554) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__555) -> (let actualRow = (B_dData_dPair.v_firstOf dtb__553) in (if ((((v_rowSubValue dtb__555) 64) actualRow) (B_dData_dPair.v_firstOf dtb__549)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = term; B_dData_dPair.f_Pair_second = dtb__555 })) else (if ((v_isNilRowValue dtb__555) actualRow) then (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.raise") globals) dtb__555) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__556) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.raise")), ((Core_dEval.v_quote d) (B_dData_dPair.v_firstOf dtb__549)), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) (B_dData_dPair.v_secondOf dtb__549)), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)); B_dData_dPair.f_Pair_second = dtb__555 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Elab_dMeta.v_convEc dtb__555) d) actualRow) tailF) with
  | Base_dDiag.C_Check_ErrC (dtb__557) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__558) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((((v_weakenLabelTerm d) dtb__551) tailF) (B_dData_dPair.v_secondOf dtb__549)) term); B_dData_dPair.f_Pair_second = dtb__558 }))
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

# 2859 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeHeadTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__559) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__559) then (Core_dTerm.C_Term_TRecord (name, B_dData_dList.C_List_Nil)) else (Core_dTerm.C_Term_TGlobal (name)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2866 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeAppTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__560) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__560) then (Core_dTerm.C_Term_TRecord (name, args)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 3142 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromInt")), t, Core_dTerm.C_Rig_Rig1)))

# 3146 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromFloatTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromFloat")), t, Core_dTerm.C_Rig_Rig1)))

# 3149 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil))))

# 3152 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isStringTyValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__561) -> (match dtb__561 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__562, dtb__563) -> (match dtb__563 with
  | B_dData_dList.C_List_Nil -> (dtb__562 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 3234 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorSpineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__564) -> { B_dData_dPair.f_Pair_first = dtb__564; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__565, dtb__566) -> { B_dData_dPair.f_Pair_first = dtb__565; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__566) }
  | Core_dTerm.C_Term_TApp (dtb__567, dtb__568, dtb__569) -> (match (v_ctorSpineOfType dtb__567) with
  | { B_dData_dPair.f_Pair_first = dtb__570; B_dData_dPair.f_Pair_second = dtb__571 } -> { B_dData_dPair.f_Pair_first = dtb__570; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__571) (B_dData_dList.C_List__x58__x58_ (dtb__568, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 3230 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorResultArgs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__572, dtb__573, dtb__574, dtb__575, dtb__576) -> (v_ctorResultArgs dtb__576)
  | _ -> (B_dData_dPair.v_secondOf (v_ctorSpineOfType mc0))
))

# 3242 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__577, dtb__578, dtb__579, dtb__580, dtb__581) -> (v_dropPis dtb__581)
  | _ -> mc0
))

# 3246 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_identityArgs = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__582, dtb__583) -> (match dtb__582 with
  | Core_dTerm.C_Term_TVar (dtb__584, dtb__585, dtb__586) -> (if (dtb__585 = ((mc1 - 1) - mc0)) then (((v_identityArgs (mc0 + 1)) mc1) dtb__583) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 3256 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorIdentitySpine = (fun (fam : string) (ctor : Elab_dTypes.t_DtCtor) -> (let k = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor)) in (let args = (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor)) in (match (v_ctorSpineOfType (v_dropPis (Elab_dTypes.v_dtCtorType ctor))) with
  | { B_dData_dPair.f_Pair_first = dtb__587; B_dData_dPair.f_Pair_second = dtb__588 } -> (if (dtb__587 = fam) then (if ((B_dData_dList.v_length args) > 0) then (if ((B_dData_dList.v_length args) <= k) then (((v_identityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
))))

# 3272 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_takeRigsGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__589, dtb__590) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__589), ((v_takeRigsGo (mc0 - 1)) dtb__590))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 3269 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_takeRigs = (fun (n : int) (bs : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_takeRigsGo n) bs))

# 3290 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorFamilyArgsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc4 : int) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__591, dtb__592) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__593, dtb__594) -> (match ((Elab_dTypes.v_forceVal mc0) mc1) with
  | Core_dTerm.C_Value_VPi (dtb__595, dtb__596, dtb__597, dtb__598, dtb__599) -> (if dtb__596 then ((((((v_ctorFamilyArgsGo mc0) ((Core_dEval.v_applyClosure dtb__599) dtb__591)) dtb__592) dtb__594) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote mc4) dtb__591); B_dData_dPair.f_Pair_second = dtb__593 }, mc5))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 3276 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFamilyArgs = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ctor : Elab_dTypes.t_DtCtor) (expected : Core_dTerm.t_Value) -> (let fam = (Elab_dTypes.v_dtCtorFamily ctor) in (if ((v_ctorIdentitySpine fam) ctor) then (let nd_uscrut5 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__600) -> (match dtb__600 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__601, dtb__602) -> (let arity = (B_dData_dList.v_length (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor))) in (if (dtb__601 = fam) then (if ((B_dData_dList.v_length dtb__602) = arity) then ((((((v_ctorFamilyArgsGo ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType ctor))) dtb__602) ((v_takeRigs arity) (Elab_dTypes.v_dtCtorTelescope ctor))) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 3312 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natPatGo = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n <= 0) then (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natZeroCtor), B_dData_dList.C_List_Nil, sp)) else (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natSuccCtor), (B_dData_dList.C_List__x58__x58_ (((v_natPatGo (n - 1)) sp), B_dData_dList.C_List_Nil)), sp))))

# 3308 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natPatOf = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC (((v_natPatGo n) sp)))))

# 3320 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat) -> (let dtnat__603 = mc0 in (if (dtnat__603 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__604 = (dtnat__603 - 1) in (match mc4 with
  | Frontend_dRast.C_Pat_PCon (dtb__605, dtb__606, dtb__607) -> (if (Frontend_dReserved.v_isListNilSyntax (Frontend_dRast_dName.v_rnameKey dtb__605)) then (match (((v_litFamilyCtor mc1) ((v_listLitFamily mc1) mc3)) "Nil") with
  | B_dData_dMaybe.C_Maybe_Just (dtb__608) -> (((((((v_resolveCtorPatFuel dtb__604) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__608)) dtb__606) dtb__607)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__606, dtb__607)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isListConsSyntax (Frontend_dRast_dName.v_rnameKey dtb__605)) then (match ((v_litFamilyCons mc1) ((v_listLitFamily mc1) mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__609) -> (((((((v_resolveCtorPatFuel dtb__604) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__609)) dtb__606) dtb__607)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__606, dtb__607)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__605)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor mc1) dtb__607) (B_dData_dMaybe.C_Maybe_Just (mc3))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__605))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__605)))) (fun (target : string) -> (((((((v_resolveCtorPatFuel dtb__604) mc1) mc2) mc3) target) dtb__606) dtb__607))) else (((((((v_resolveCtorPatFuel dtb__604) mc1) mc2) mc3) (Frontend_dRast_dName.v_rnameKey dtb__605)) dtb__606) dtb__607))))
  | Frontend_dRast.C_Pat_PInt (dtb__610, dtb__611) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__610) dtb__611)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | Frontend_dRast.C_Pat_PAs (dtb__612, dtb__613, dtb__614) -> (match dtb__613 with
  | Frontend_dRast.C_Pat_PInt (dtb__615, dtb__616) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__615) dtb__616)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PAs (dtb__612, p, dtb__614)); B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | Frontend_dRast.C_Pat_PRecord (dtb__617, dtb__618, dtb__619) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)))))
# 3351 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolveCtorPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : string) (mc5 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc6 : Base_dSource.t_Span) -> (let dtnat__620 = mc0 in (if (dtnat__620 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__621 = (dtnat__620 - 1) in (match ((Elab_dMeta.v_dtCtorLookupEc mc1) mc4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), mc5, mc6)); B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__622) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs mc1) mc2) dtb__622) mc3) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__623) -> (match dtb__623 with
  | { B_dData_dPair.f_Pair_first = dtb__624; B_dData_dPair.f_Pair_second = dtb__625 } -> (match dtb__625 with
  | { B_dData_dPair.f_Pair_first = dtb__626; B_dData_dPair.f_Pair_second = dtb__627 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__621) dtb__627) mc2) dtb__626) mc5)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__628; B_dData_dPair.f_Pair_second = dtb__629 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), dtb__628, mc6)); B_dData_dPair.f_Pair_second = dtb__629 }))
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
# 3367 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolvePatArgsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__630 = mc0 in (if (dtnat__630 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__631 = (dtnat__630 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__632, dtb__633) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__634, dtb__635, dtb__636, dtb__637, dtb__638) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__634, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__634) dtb__637) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__638) v) in (if dtb__635 then (((((v_resolvePatArgsFuel dtb__631) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__632, dtb__633))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__631) mc1) mc2) dtb__637) dtb__632)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__639; B_dData_dPair.f_Pair_second = dtb__640 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__631) dtb__640) ctx2) ty2) dtb__633)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__641; B_dData_dPair.f_Pair_second = dtb__642 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__639, dtb__641)); B_dData_dPair.f_Pair_second = dtb__642 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3399 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverAltsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__643 = mc0 in (if (dtnat__643 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__644 = (dtnat__643 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__645, dtb__646) -> (match dtb__645 with
  | { B_dData_dPair.f_Pair_first = dtb__647; B_dData_dPair.f_Pair_second = dtb__648 } -> ((Base_dCommon.v_bind (((((v_resolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__647)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__649; B_dData_dPair.f_Pair_second = dtb__650 } -> ((Base_dCommon.v_bind (((((v_resolveOverAltsGo dtb__644) dtb__650) mc2) mc3) dtb__646)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__651; B_dData_dPair.f_Pair_second = dtb__652 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__649; B_dData_dPair.f_Pair_second = dtb__648 }, dtb__651)); B_dData_dPair.f_Pair_second = dtb__652 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3395 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverAlts = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 3441 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveClausePatsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__653 = mc0 in (if (dtnat__653 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__654 = (dtnat__653 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__655, dtb__656) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__657, dtb__658, dtb__659, dtb__660, dtb__661) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__657, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__657) dtb__660) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__661) v) in (if dtb__658 then (((((v_resolveClausePatsFuel dtb__654) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__655, dtb__656))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__654) mc1) mc2) dtb__660) dtb__655)) (fun (q : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__662; B_dData_dPair.f_Pair_second = dtb__663 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel dtb__654) dtb__663) ctx2) ty2) dtb__656)) (fun (r : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__664; B_dData_dPair.f_Pair_second = dtb__665 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__662, dtb__664)); B_dData_dPair.f_Pair_second = dtb__665 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3423 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverFunPatsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__666 = mc0 in (if (dtnat__666 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__667 = (dtnat__666 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__668, dtb__669) -> (match dtb__668 with
  | { B_dData_dPair.f_Pair_first = dtb__670; B_dData_dPair.f_Pair_second = dtb__671 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__670)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__672; B_dData_dPair.f_Pair_second = dtb__673 } -> ((Base_dCommon.v_bind (((((v_resolveOverFunPatsGo dtb__667) dtb__673) mc2) mc3) dtb__669)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__674; B_dData_dPair.f_Pair_second = dtb__675 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__672; B_dData_dPair.f_Pair_second = dtb__671 }, dtb__674)); B_dData_dPair.f_Pair_second = dtb__675 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3418 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverFunPats = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 3522 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doMarkerHead = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__676, dtb__677, dtb__678) -> (match dtb__676 with
  | Frontend_dRast.C_Expr_EVar (dtb__679, dtb__680) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__679)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__681) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 3545 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_decodeDoChain = (fun (fuel : int) (canonical : string) (acc : t_DoChainStep B_dData_dList.t_List) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = expr in (match nd_uscrut4 with
  | Frontend_dRast.C_Expr_EApp (dtb__682, dtb__683, dtb__684) -> (match dtb__682 with
  | Frontend_dRast.C_Expr_EVar (dtb__685, dtb__686) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__685)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = expr }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__687) -> (if (canonical <> dtb__687) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut12 = dtb__683 in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__688, dtb__689) -> (match dtb__689 with
  | B_dData_dList.C_List__x58__x58_ (dtb__690, dtb__691) -> (match dtb__690 with
  | Frontend_dRast.C_Expr_ELam (dtb__692, dtb__693, dtb__694) -> (match dtb__692 with
  | B_dData_dList.C_List__x58__x58_ (dtb__695, dtb__696) -> (match dtb__695 with
  | { B_dData_dPair.f_Pair_first = dtb__697; B_dData_dPair.f_Pair_second = dtb__698 } -> (match dtb__696 with
  | B_dData_dList.C_List_Nil -> (match dtb__691 with
  | B_dData_dList.C_List_Nil -> ((((v_decodeDoChain (fuel - 1)) dtb__687) (B_dData_dList.C_List__x58__x58_ ((C_DoChainStep_DoChainStep (dtb__697, dtb__688, dtb__686, dtb__698)), acc))) dtb__693)
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

# 3564 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_decodeDoBlock = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__699, dtb__700, dtb__701) -> (match dtb__699 with
  | Frontend_dRast.C_Expr_EVar (dtb__702, dtb__703) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__702)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__704) -> (let nd_uscrut8 = ((((v_decodeDoChain 4096) dtb__704) B_dData_dList.C_List_Nil) mc0) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__705) -> (match dtb__705 with
  | { B_dData_dPair.f_Pair_first = dtb__706; B_dData_dPair.f_Pair_second = dtb__707 } -> (B_dData_dMaybe.C_Maybe_Just ({ f_DoChain_doChainCanonical = dtb__704; f_DoChain_doChainSteps = dtb__706; f_DoChain_doChainLast = dtb__707; f_DoChain_doChainSpan = dtb__703 }))
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

# 3576 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_doChainBuild = (fun (mc0 : string) (mc1 : t_DoChainStep B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__708, dtb__709) -> (match dtb__708 with
  | C_DoChainStep_DoChainStep (dtb__710, dtb__711, dtb__712, dtb__713) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), dtb__712)), (B_dData_dList.C_List__x58__x58_ (dtb__711, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__710; B_dData_dPair.f_Pair_second = dtb__713 }, B_dData_dList.C_List_Nil)), ((((v_doChainBuild mc0) dtb__709) mc2) mc3), dtb__712)), B_dData_dList.C_List_Nil)))), dtb__712))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 3585 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainFallback = (fun (chain : t_DoChain) -> ((((v_doChainBuild (chain).f_DoChain_doChainCanonical) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast) (chain).f_DoChain_doChainSpan))

# 3592 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_splitDoSpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__714, dtb__715) -> (match ((v_splitDoSpine ((Core_dEval.v_applyValue mc0) dtb__714)) dtb__715) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__714 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__716) -> (B_dData_dMaybe.C_Maybe_Just (dtb__716))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 3600 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_splitDoExpected = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VNeutral (dtb__717) -> (match dtb__717 with
  | Core_dTerm.C_Neutral_NVar (dtb__718, dtb__719, dtb__720) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__718, dtb__719, B_dData_dList.C_List_Nil))))) dtb__720)
  | Core_dTerm.C_Neutral_NGlobal (dtb__721, dtb__722) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__721, B_dData_dList.C_List_Nil))))) dtb__722)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3618 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindShapeOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__723, dtb__724, dtb__725, dtb__726, dtb__727) -> (if dtb__724 then (match dtb__727 with
  | Core_dTerm.C_Term_TPi (dtb__728, dtb__729, dtb__730, dtb__731, dtb__732) -> (if dtb__729 then (match dtb__731 with
  | Core_dTerm.C_Term_TApp (dtb__733, dtb__734, dtb__735) -> (match dtb__733 with
  | Core_dTerm.C_Term_TGlobal (dtb__736) -> (match dtb__734 with
  | Core_dTerm.C_Term_TVar (dtb__737, dtb__738, dtb__739) -> (match dtb__732 with
  | Core_dTerm.C_Term_TPi (dtb__740, dtb__741, dtb__742, dtb__743, dtb__744) -> (if dtb__741 then (match dtb__744 with
  | Core_dTerm.C_Term_TPi (dtb__745, dtb__746, dtb__747, dtb__748, dtb__749) -> (if dtb__746 then (match dtb__749 with
  | Core_dTerm.C_Term_TPi (dtb__750, dtb__751, dtb__752, dtb__753, dtb__754) -> (if dtb__751 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__753 with
  | Core_dTerm.C_Term_TApp (dtb__755, dtb__756, dtb__757) -> (match dtb__755 with
  | Core_dTerm.C_Term_TVar (dtb__758, dtb__759, dtb__760) -> (match dtb__756 with
  | Core_dTerm.C_Term_TVar (dtb__761, dtb__762, dtb__763) -> (match dtb__754 with
  | Core_dTerm.C_Term_TPi (dtb__764, dtb__765, dtb__766, dtb__767, dtb__768) -> (if dtb__765 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__767 with
  | Core_dTerm.C_Term_TPi (dtb__769, dtb__770, dtb__771, dtb__772, dtb__773) -> (if dtb__770 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__772 with
  | Core_dTerm.C_Term_TVar (dtb__774, dtb__775, dtb__776) -> (match dtb__773 with
  | Core_dTerm.C_Term_TApp (dtb__777, dtb__778, dtb__779) -> (match dtb__777 with
  | Core_dTerm.C_Term_TVar (dtb__780, dtb__781, dtb__782) -> (match dtb__778 with
  | Core_dTerm.C_Term_TVar (dtb__783, dtb__784, dtb__785) -> (match dtb__768 with
  | Core_dTerm.C_Term_TApp (dtb__786, dtb__787, dtb__788) -> (match dtb__786 with
  | Core_dTerm.C_Term_TVar (dtb__789, dtb__790, dtb__791) -> (match dtb__787 with
  | Core_dTerm.C_Term_TVar (dtb__792, dtb__793, dtb__794) -> (if (if (if (if (dtb__738 = 0) then (dtb__759 = 3) else false) then (dtb__781 = 5) else false) then (dtb__790 = 5) else false) then (if (if (if (if (dtb__762 = 1) then (dtb__775 = 2) else false) then (dtb__784 = 2) else false) then (dtb__793 = 2) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__752, dtb__766, dtb__771)))) else (if (if (if (if (dtb__762 = 0) then (dtb__775 = 1) else false) then (dtb__784 = 3) else false) then (dtb__793 = 3) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__752, dtb__766, dtb__771)))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 3633 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindHeadOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (match ((Elab_dTypes.v_ctxLookup bindName) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__795) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup bindName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__796) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (bindName)); B_dData_dPair.f_Pair_second = dtb__796 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 3644 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBlockShapeOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (let nd_uscrut4 = ((((v_doBindHeadOf globals) ctx) ec) bindName) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__797) -> (match dtb__797 with
  | { B_dData_dPair.f_Pair_first = dtb__798; B_dData_dPair.f_Pair_second = dtb__799 } -> (match (v_bindShapeOf dtb__799) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__800) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__798; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__799; B_dData_dPair.f_Pair_second = dtb__800 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 3656 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictDefer = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__801; B_dData_dPair.f_Pair_second = dtb__802 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__801; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__802) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__802) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)))

# 3665 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictStep = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dom) then ((((v_doDictDefer ctx) ec) dom) sp) else (let nd_uscrut6 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) ((Elab_dTypes.v_forceVal ec) dom)) sp) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_ErrC (dtb__803) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (if ((Elab_dDict.v_isRigidDictArg ec) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (Base_dDiag.C_Check_ErrC (dtb__803))))
  | Base_dDiag.C_Check_OkC (dtb__804) -> (match dtb__804 with
  | { B_dData_dPair.f_Pair_first = dtb__805; B_dData_dPair.f_Pair_second = dtb__806 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__805; B_dData_dPair.f_Pair_second = dtb__806 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3693 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDoBlock = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (bindName : string) (headTerm : Core_dTerm.t_Term) (bindTyTerm : Core_dTerm.t_Term) (shape : t_DoBindShape) (mVal : Core_dTerm.t_Value) (aVal : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match shape with
  | C_DoBindShape_DoBindShape (dtb__807, dtb__808, dtb__809) -> (let nd_uscrut14 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) bindTyTerm)) in (match nd_uscrut14 with
  | Core_dTerm.C_Value_VPi (dtb__810, dtb__811, dtb__812, dtb__813, dtb__814) -> (if dtb__811 then (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_applyClosure dtb__814) mVal)) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VPi (dtb__815, dtb__816, dtb__817, dtb__818, dtb__819) -> (if dtb__816 then (if ((Elab_dDict.v_isDictDomain ec) dtb__818) then ((Base_dCommon.v_bind ((((((v_doDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__818)) (fun (dp : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dp with
  | { B_dData_dPair.f_Pair_first = dtb__820; B_dData_dPair.f_Pair_second = dtb__821 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ f_DoPlan_planBind = bindName; f_DoPlan_planHead = headTerm; f_DoPlan_planMTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) mVal); f_DoPlan_planMVal = mVal; f_DoPlan_planAVal = aVal; f_DoPlan_planDictTerm = dtb__820; f_DoPlan_planRigE = dtb__807; f_DoPlan_planRigL = dtb__808; f_DoPlan_planInnerRig = dtb__809; f_DoPlan_planEc = dtb__821 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))
  | _ -> failwith "DT: impossible branch"
)))

# 3720 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindAppTerm = (fun (ecLinear : Elab_dTypes.t_Ec) (ecPaper : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (binderSp : Base_dSource.t_Span) (plan : t_DoPlan) (binder : string) (aVal : Core_dTerm.t_Value) (eTerm : Core_dTerm.t_Term) (argRig : Core_dTerm.t_Rig) (lamRig : Core_dTerm.t_Rig) (inner : Core_dTerm.t_Term) -> (let depth = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue binder) aVal) ctx) in (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) inner) else inner) in (let slot0 = ((Core_dTerm.v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) (B_dData_dMaybe.C_Maybe_Just ((((Core_dTerm.v_shift 0) 1) ((Core_dEval.v_quote depth) ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) (plan).f_DoPlan_planAVal)))))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear ecLinear) ctx) then (if (((Elab_dMeta.v_termHasOuterLinear ecLinear) ctx2) inner) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (let lamTerm = (Core_dTerm.C_Term_TLam (binder, lamRig, slot, binderSp, inner2)) in (let args = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planMTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planDictTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) aVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) (plan).f_DoPlan_planAVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = eTerm; B_dData_dPair.f_Pair_second = argRig }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = lamTerm; B_dData_dPair.f_Pair_second = (plan).f_DoPlan_planRigL }, B_dData_dList.C_List_Nil)))))))))))) in ((Elab_dMeta.v_foldAppTerms (plan).f_DoPlan_planHead) args)))))))))

# 57 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_elabConAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (scrutVal : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) (cname : string) (args : Frontend_dRast.t_Pat B_dData_dList.t_List) (psp : Base_dSource.t_Span) (body : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_findCtorIn cname) (Elab_dTypes.v_dtDataCtors dd)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 psp) (Base_dDiagnostics_dTc.C_TcErr_UnknownConstructorInCase ((Frontend_dRast.v_ctorDisplayName cname), (Elab_dTypes.v_dtDataName dd)))) (Frontend_dRast.v_ctorDisplayName cname)) (Elab_dTypes.v_dtDataName dd))
  | B_dData_dMaybe.C_Maybe_Just (dtb__822) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((Elab_dCase.v_bindCtorTele ctx) (Elab_dTypes.v_dtCtorType dtb__822)) args))) (fun (p : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dRast.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__823; B_dData_dPair.f_Pair_second = dtb__824 } -> (match dtb__824 with
  | { B_dData_dPair.f_Pair_first = dtb__825; B_dData_dPair.f_Pair_second = dtb__826 } -> (if (Elab_dMeta.v_nonEmpty dtb__826) then (((Base_dDiagnostics_dTc.v_tcErr1 psp) (Base_dDiagnostics_dTc.C_TcErr_BranchTooManyArgs ((Frontend_dRast.v_ctorDisplayName cname)))) (Frontend_dRast.v_ctorDisplayName cname)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((((Elab_dCase.v_unifyIdxListSized ec) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb__823)) ((Elab_dCase.v_ctorResultValsIn dtb__823) dtb__822)) ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) v))) idxs)))) (fun (refsIdx : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((Elab_dCase.v_branchAfterUnify ec) dtb__823) refsIdx) with
  | Elab_dCase.C_BranchVerdict_BranchImpossibleIndex -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex)
  | Elab_dCase.C_BranchVerdict_BranchImpossibleEmptyCtx -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchEmptyCtx)
  | Elab_dCase.C_BranchVerdict_BranchOk -> ((Base_dCommon.v_bind (((((Elab_dCase.v_reflectScrutinee ec) (Elab_dTypes.v_ctxDepth dtb__823)) refsIdx) ((Elab_dCase.v_ctorValueIn dtb__823) dtb__822)) scrutVal)) (fun (refs2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let refinedExpected = (((Elab_dTypes.v_refineValue refs2) Core_dTerm.v_defaultFuel) expected) in (let branchCtx2 = ((Elab_dTypes.v_ctxRefine dtb__823) refs2) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__827; B_dData_dPair.f_Pair_second = dtb__828 } -> (let n = (B_dData_dList.v_length dtb__825) in (let opaqueIdxs = ((((v_opaqueBranchIndices dtb__828) branchCtx2) n) (Core_dTerm.v_binderPairs dtb__825)) in (let bodyTerm1 = ((Elab_dMeta.v_wrapOpaqueUses opaqueIdxs) dtb__827) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__828) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = cname; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__825; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }; B_dData_dPair.f_Pair_second = dtb__828 }))))))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__829, dtb__830) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__829 with
  | { B_dData_dPair.f_Pair_first = dtb__831; B_dData_dPair.f_Pair_second = dtb__832 } -> (match dtb__831 with
  | Frontend_dRast.C_Pat_PCon (dtb__833, dtb__834, dtb__835) -> ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) (Frontend_dRast_dName.v_rnameKey dtb__833)) dtb__834) dtb__835) dtb__832)) (fun (p : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__836; B_dData_dPair.f_Pair_second = dtb__837 } -> (((((((((((v_elabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__837) mc4) mc5) mc6) mc7) mc8) dtb__830) (B_dData_dList.C_List__x58__x58_ (dtb__836, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PVar (dtb__838, dtb__839) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__830) mc10) dtb__832) dtb__838) dtb__839)
  | Frontend_dRast.C_Pat_PWild (dtb__840) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__830) mc10) dtb__832) "_") dtb__840)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__831)) Base_dDiagnostics_dTc.C_TcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc10); B_dData_dPair.f_Pair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 122 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCatchAllFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (pname : string) (psp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (if (pname = "_") then ctx else (((Elab_dTypes.v_ctxBindValue pname) scrutTy) ctx)) in (if (Elab_dMeta.v_nonEmpty rest) then ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast) else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__841; B_dData_dPair.f_Pair_second = dtb__842 } -> (let binds = (if (pname = "_") then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = pname; Core_dTerm.f_Binder_binderRig = ((Elab_dMeta.v_rigOfLinearValue ec) scrutTy); Core_dTerm.f_Binder_binderSpan = ((Base_dSource.v_spanAtName pname) psp) }, B_dData_dList.C_List_Nil))) in (let bodyTerm1 = (if (pname = "_") then dtb__841 else (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__842) ctx) scrutTy) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__841) else dtb__841)) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__842) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = binds; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }, acc))); B_dData_dPair.f_Pair_second = dtb__842 })))))
  | _ -> failwith "DT: impossible branch"
)))))))
# 152 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun (ps : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = ps in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__843; B_dData_dPair.f_Pair_second = dtb__844 } -> (match dtb__844 with
  | { B_dData_dPair.f_Pair_first = dtb__845; B_dData_dPair.f_Pair_second = dtb__846 } -> (if (((v_natLitCaseFast dtb__846) dtb__845) alts) then ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__846) alts)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> ((((((((((v_checkNatLitCaseFuel (fuel - 1)) globals) ctx) ec3) (v_natToIntTerm dtb__843)) dtb__843) v_natTyValue) alts) expected) sp))) else ((Base_dCommon.v_bind ((((v_resolveOverAlts dtb__846) ctx) dtb__845) alts)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__847; B_dData_dPair.f_Pair_second = dtb__848 } -> (let caseFuel = (((B_dTrait_dOrd.v_max B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (fuel - 1)) (Elab_dCoverage.v_coverageFuelFor ((B_dData_dList.v_map (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)))) dtb__847))) in ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__848) dtb__847)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> (if (v_needsMatrixCase dtb__847) then ((((((((v_checkCaseMatrixFuel caseFuel) globals) ctx) ec3) scrut) dtb__847) expected) sp) else (((((((((v_checkCaseFamFuel caseFuel) globals) ctx) ec3) dtb__843) dtb__845) dtb__847) expected) sp)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 186 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseMatrixFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let name = ("nd_scrut" ^ (bi_strFromInt (Elab_dTypes.v_ctxDepth ctx))) in (let clauses = ((B_dData_dList.v_map (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf alt) })) alts) in (let table = (Elab_dMeta.v_ctorFamilyTable ec) in ((Base_dCommon.v_bind (((Elab_dMatch.v_multiToCaseExpr table) clauses) name)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf clauses))) sp) ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PVar (name, sp)); B_dData_dPair.f_Pair_second = scrut }, B_dData_dList.C_List_Nil)), bodyExpr, false, sp))) expected)))))))))
# 197 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFamFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) scrutTy) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VNeutral (dtb__849) -> (match dtb__849 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__850, dtb__851) -> (if (if (Base_dIntrinsics.v_isBoolCanonical dtb__850) then ((B_dData_dList.v_length dtb__851) = 0) else false) then ((((((((v_checkBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__850 = "Int") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__850 = "String") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_checkCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__850) dtb__851) alts) expected) sp))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
))))
# 214 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkBoolCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) ec) alts) Base_dIntrinsics.v_boolTrueCtor) expected) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__852; B_dData_dPair.f_Pair_second = dtb__853 } -> (match dtb__853 with
  | { B_dData_dPair.f_Pair_first = dtb__854; B_dData_dPair.f_Pair_second = dtb__855 } -> (match dtb__854 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__856) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__852, dtb__856)); B_dData_dPair.f_Pair_second = dtb__855 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) dtb__855) alts) Base_dIntrinsics.v_boolFalseCtor) expected) sp)) (fun (q : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__857; B_dData_dPair.f_Pair_second = dtb__858 } -> (match dtb__858 with
  | { B_dData_dPair.f_Pair_first = dtb__859; B_dData_dPair.f_Pair_second = dtb__860 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__852, dtb__857)); B_dData_dPair.f_Pair_second = dtb__860 }))
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
# 234 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (target : string) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((((((v_boolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) B_dData_dMaybe.C_Maybe_Nothing)))
# 241 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) (mc8 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__861, dtb__862) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__861 with
  | { B_dData_dPair.f_Pair_first = dtb__863; B_dData_dPair.f_Pair_second = dtb__864 } -> (match dtb__863 with
  | Frontend_dRast.C_Pat_PCon (dtb__865, dtb__866, dtb__867) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__865) = mc5) then ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__864) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__868; B_dData_dPair.f_Pair_second = dtb__869 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__868; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc8; B_dData_dPair.f_Pair_second = dtb__869 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__862) mc5) mc6) mc7) mc8))
  | Frontend_dRast.C_Pat_PVar (dtb__870, dtb__871) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__864) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__872; B_dData_dPair.f_Pair_second = dtb__873 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__873) dtb__862) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__872)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__874) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__864) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__875; B_dData_dPair.f_Pair_second = dtb__876 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__876) dtb__862) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__875)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__863)) Base_dDiagnostics_dTc.C_TcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match mc8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__877) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__877; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc3 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc7) (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive ((Frontend_dRast.v_ctorDisplayName mc5)))) (Frontend_dRast.v_ctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 281 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__878; B_dData_dPair.f_Pair_second = dtb__879 } -> (match dtb__879 with
  | { B_dData_dPair.f_Pair_first = dtb__880; B_dData_dPair.f_Pair_second = dtb__881 } -> (if dtb__880 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__878; B_dData_dPair.f_Pair_second = dtb__881 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 295 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : string) (mc6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__882, dtb__883) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__882 with
  | { B_dData_dPair.f_Pair_first = dtb__884; B_dData_dPair.f_Pair_second = dtb__885 } -> (match dtb__884 with
  | Frontend_dRast.C_Pat_PInt (dtb__886, dtb__887) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TInt (dtb__886))) dtb__885) dtb__883) mc7) mc8)
  | Frontend_dRast.C_Pat_PStr (dtb__888, dtb__889) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TStr (dtb__888))) dtb__885) dtb__883) mc7) mc8)
  | Frontend_dRast.C_Pat_PVar (dtb__890, dtb__891) -> ((Base_dCommon.v_bind (((((((((((v_checkLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__890) dtb__885) mc7) ((Base_dSource.v_spanAtName dtb__890) dtb__891)) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__892; B_dData_dPair.f_Pair_second = dtb__893 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__892; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__893 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__894) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__885) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__895; B_dData_dPair.f_Pair_second = dtb__896 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__895; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__896 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__884)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 322 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_litAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__897; B_dData_dPair.f_Pair_second = dtb__898 } -> ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) dtb__898) scrutTerm) tyName) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = q in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__899; B_dData_dPair.f_Pair_second = dtb__900 } -> (match dtb__900 with
  | { B_dData_dPair.f_Pair_first = dtb__901; B_dData_dPair.f_Pair_second = dtb__902 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_litEqName tyName))), scrutTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__897, dtb__899)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__901; B_dData_dPair.f_Pair_second = dtb__902 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 339 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__903; B_dData_dPair.f_Pair_second = dtb__904 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__903)), scrutTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__904 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 380 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__905; B_dData_dPair.f_Pair_second = dtb__906 } -> (match dtb__906 with
  | { B_dData_dPair.f_Pair_first = dtb__907; B_dData_dPair.f_Pair_second = dtb__908 } -> (if dtb__907 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__905; B_dData_dPair.f_Pair_second = dtb__908 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 392 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : Core_dTerm.t_Term) (mc6 : Core_dTerm.t_Value) (mc7 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc8 : Core_dTerm.t_Value) (mc9 : Base_dSource.t_Span) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__909, dtb__910) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__909 with
  | { B_dData_dPair.f_Pair_first = dtb__911; B_dData_dPair.f_Pair_second = dtb__912 } -> (match dtb__911 with
  | Frontend_dRast.C_Pat_PInt (dtb__913, dtb__914) -> ((((((((((((v_natLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Core_dTerm.C_Term_TInt (dtb__913))) dtb__912) dtb__910) mc8) mc9)
  | Frontend_dRast.C_Pat_PVar (dtb__915, dtb__916) -> ((Base_dCommon.v_bind (((((((((((v_checkNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__915) dtb__912) mc8) ((Base_dSource.v_spanAtName dtb__915) dtb__916)) mc9)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__917; B_dData_dPair.f_Pair_second = dtb__918 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__917; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__918 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__919) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__912) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__920; B_dData_dPair.f_Pair_second = dtb__921 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__920; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__921 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__911)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 417 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_natLitAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__922; B_dData_dPair.f_Pair_second = dtb__923 } -> ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__923) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = q in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__924; B_dData_dPair.f_Pair_second = dtb__925 } -> (match dtb__925 with
  | { B_dData_dPair.f_Pair_first = dtb__926; B_dData_dPair.f_Pair_second = dtb__927 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("bi_eq_int")), cmpTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__922, dtb__924)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__926; B_dData_dPair.f_Pair_second = dtb__927 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 433 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) binderTy) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) binderTy) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__928; B_dData_dPair.f_Pair_second = dtb__929 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__928)), bindTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__929 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 447 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseOfFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (fam : string) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
  | B_dData_dMaybe.C_Maybe_Just (dtb__930) -> ((Base_dCommon.v_bind (((((((((((v_elabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__930) idxs) ((Elab_dTypes.v_evalCtx ctx) scrutTerm)) expected) alts) B_dData_dList.C_List_Nil)) (fun (p : (Core_dTerm.t_CaseAlt B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__931; B_dData_dPair.f_Pair_second = dtb__932 } -> (((((((((Elab_dCase.v_checkCaseDone dtb__932) ctx) dtb__930) idxs) alts) expected) sp) scrutTerm) dtb__931)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 463 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferCaseEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let pmeta = (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__933; B_dData_dPair.f_Pair_second = dtb__934 } -> (let metaTy = ((Elab_dTypes.v_evalCtx ctx) dtb__933) in ((Base_dCommon.v_bind ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) dtb__934) scrut) alts) metaTy) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__935; B_dData_dPair.f_Pair_second = dtb__936 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__935; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = metaTy; B_dData_dPair.f_Pair_second = dtb__936 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 483 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCondBoolFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (c : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) c) Elab_dPrelude.v_boolTyValue) with
  | Base_dDiag.C_Check_OkC (dtb__937) -> (Base_dDiag.C_Check_OkC (dtb__937))
  | Base_dDiag.C_Check_ErrC (dtb__938) -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pc in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__939; B_dData_dPair.f_Pair_second = dtb__940 } -> (match dtb__940 with
  | { B_dData_dPair.f_Pair_first = dtb__941; B_dData_dPair.f_Pair_second = dtb__942 } -> (if (Elab_dMeta.v_isBoolType dtb__941) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__939; B_dData_dPair.f_Pair_second = dtb__942 })) else ((Elab_dTypes.v_errAt sp) (String.concat "" ["if condition must be "; Base_dIntrinsics.v_boolTypeName; " (got "; ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__941); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 757 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__943) -> ((Base_dCommon.v_bind ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr) with
  | Base_dDiag.C_Check_OkC (dtb__944) -> (Base_dDiag.C_Check_OkC (dtb__944))
  | Base_dDiag.C_Check_ErrC (dtb__945) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr2) with
  | Base_dDiag.C_Check_OkC (dtb__946) -> (Base_dDiag.C_Check_OkC (dtb__946))
  | Base_dDiag.C_Check_ErrC (dtb__947) -> ((Base_dCommon.v_bind ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr3) with
  | Base_dDiag.C_Check_OkC (dtb__948) -> (Base_dDiag.C_Check_OkC (dtb__948))
  | Base_dDiag.C_Check_ErrC (dtb__949) -> (Base_dDiag.C_Check_ErrC (dtb__945))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut6 = (v_performOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__950) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__951) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) Base_dIntrinsics.v_listFamilyName) dtb__951) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__952) -> (match dtb__952 with
  | { B_dData_dPair.f_Pair_first = dtb__953; B_dData_dPair.f_Pair_second = dtb__954 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__953)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = p in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__955; B_dData_dPair.f_Pair_second = dtb__956 } -> (match dtb__956 with
  | { B_dData_dPair.f_Pair_first = dtb__957; B_dData_dPair.f_Pair_second = dtb__958 } -> ((Base_dCommon.v_bind (((((v_performCallExpr globals) dtb__958) dtb__957) dtb__953) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__958) callExpr)))
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
# 799 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCore = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__959) -> ((Base_dCommon.v_bind (((((v_inferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__959)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__960) -> (Base_dDiag.C_Check_OkC (dtb__960))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) (v_doChainFallback dtb__959))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 817 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EAnn (dtb__961, dtb__962, dtb__963) -> (((((((v_inferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__961) dtb__962) dtb__963)
  | Frontend_dRast.C_Expr_EDo (dtb__964, dtb__965) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__965) Base_dDiagnostics_dTc.C_TcErr_DoUnsupported)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__966, dtb__967, dtb__968) -> (((((((v_elabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__966) dtb__967) dtb__968)
  | Frontend_dRast.C_Expr_ERecord (dtb__969, dtb__970, dtb__971) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__971) Base_dDiagnostics_dTc.C_TcErr_RecordsUnsupported)
  | Frontend_dRast.C_Expr_EField (dtb__972, dtb__973, dtb__974) -> (((((((v_elabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__972) dtb__973) dtb__974)
  | Frontend_dRast.C_Expr_ECase (dtb__975, dtb__976, dtb__977) -> (((((((v_inferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__975) dtb__976) dtb__977)
  | Frontend_dRast.C_Expr_ELocalFun (dtb__978, dtb__979) -> (if (v_clausesHaveOverCtor dtb__978) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__979) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__978, dtb__979)))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Frontend_dRast.C_Expr_ELet (dtb__980, dtb__981, dtb__982, dtb__983) -> ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) ec) dtb__980) dtb__981) dtb__982) dtb__983)
  | Frontend_dRast.C_Expr_EIf (dtb__984, dtb__985, dtb__986, dtb__987) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__984) dtb__987)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__988; B_dData_dPair.f_Pair_second = dtb__989 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__989) dtb__985)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pt in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__990; B_dData_dPair.f_Pair_second = dtb__991 } -> (match dtb__991 with
  | { B_dData_dPair.f_Pair_first = dtb__992; B_dData_dPair.f_Pair_second = dtb__993 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__993) dtb__986)) (fun (pe : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pe in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__994; B_dData_dPair.f_Pair_second = dtb__995 } -> (match dtb__995 with
  | { B_dData_dPair.f_Pair_first = dtb__996; B_dData_dPair.f_Pair_second = dtb__997 } -> (if (if ((v_isIntTy dtb__997) dtb__992) then ((v_isNatTy dtb__997) dtb__996) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__988, dtb__990, (v_natToIntTerm dtb__994))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__992; B_dData_dPair.f_Pair_second = dtb__997 } })) else (if (if ((v_isNatTy dtb__997) dtb__992) then ((v_isIntTy dtb__997) dtb__996) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__988, (v_natToIntTerm dtb__990), dtb__994)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__997 } })) else ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__997) (Elab_dTypes.v_ctxDepth ctx)) dtb__992) dtb__996)) (fun (ec4 : Elab_dTypes.t_Ec) -> (let branchOpaque = (((Elab_dMeta.v_isOpaqueRuntimeTyIn ec4) ctx) dtb__992) in (let tTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__990) else dtb__990) in (let eTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__994) else dtb__994) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__988, tTerm2, eTerm2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__992; B_dData_dPair.f_Pair_second = ec4 } })))))))))
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
  | Frontend_dRast.C_Expr_ELam (dtb__998, dtb__999, dtb__1000) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1000) Base_dDiagnostics_dTc.C_TcErr_LambdaNoSignature)
  | Frontend_dRast.C_Expr_EApp (dtb__1001, dtb__1002, dtb__1003) -> (match dtb__1001 with
  | Frontend_dRast.C_Expr_EVar (dtb__1004, dtb__1005) -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1004)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1003) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1004)) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__1003) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName ((Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1004)), (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1004)))))) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1004))) (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1004)))) else ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1004, dtb__1005))) dtb__1002) dtb__1003) B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1001) dtb__1002) dtb__1003) B_dData_dMaybe.C_Maybe_Nothing)
)
  | Frontend_dRast.C_Expr_EPi (dtb__1006, dtb__1007, dtb__1008, dtb__1009, dtb__1010, dtb__1011) -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) dtb__1006) dtb__1007) dtb__1008) dtb__1009) dtb__1010) dtb__1011)
  | Frontend_dRast.C_Expr_EFloat (dtb__1012, dtb__1013) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1012)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EStr (dtb__1014, dtb__1015) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1014)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("String", B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EInt (dtb__1016, dtb__1017) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb__1016)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("Int", B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EVar (dtb__1018, dtb__1019) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__1018) = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc Core_dTerm.v_levelZero))); B_dData_dPair.f_Pair_second = ec } })) else (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1018)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1019) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1018)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1019) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1018))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1018)))) (fun (t : string) -> (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) t) dtb__1019))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1018)) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__1019) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName ((Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1018)), (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1018)))))) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1018))) (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1018)))) else (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1018)) dtb__1019)))))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))))
# 1076 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabEFieldFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fname : string) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1020; B_dData_dPair.f_Pair_second = dtb__1021 } -> (match dtb__1021 with
  | { B_dData_dPair.f_Pair_first = dtb__1022; B_dData_dPair.f_Pair_second = dtb__1023 } -> (match ((v_recordTypeOf dtb__1023) dtb__1022) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1024) -> ((Base_dCommon.v_bind ((((v_recordFieldPlan dtb__1023) dtb__1022) fname) sp)) (fun (plan : t_FieldAccessPlan) -> (let arity = (B_dData_dList.v_length ((plan).f_FieldAccessPlan_planData).Elab_dTypes.f_DtData_dtDataParams) in (let tele = ((B_dData_dList.v_drop arity) (Elab_dTypes.v_dtCtorTelescope (plan).f_FieldAccessPlan_planCtor)) in (let proj = (Core_dTerm.C_Term_TProj (dtb__1020, (Elab_dTypes.v_dtCtorName (plan).f_FieldAccessPlan_planCtor), tele, (arity + (plan).f_FieldAccessPlan_planField), (plan).f_FieldAccessPlan_planField)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (plan).f_FieldAccessPlan_planType; B_dData_dPair.f_Pair_second = dtb__1023 } })))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_hasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__1023) dtb__1020) dtb__1022) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1102 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabERecUpdateFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fields with
  | B_dData_dList.C_List_Nil -> ((Elab_dTypes.v_errAt sp) "record update needs at least one field")
  | _ -> (if (Elab_dRecords.v_hasDuplicateFieldNames fields) then ((Elab_dTypes.v_errAt sp) "duplicate field in record update") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1025; B_dData_dPair.f_Pair_second = dtb__1026 } -> (match dtb__1026 with
  | { B_dData_dPair.f_Pair_first = dtb__1027; B_dData_dPair.f_Pair_second = dtb__1028 } -> ((Base_dCommon.v_bind ((((v_recordUpdatePlan dtb__1028) dtb__1027) fields) sp)) (fun (plan : t_UpdateAccessPlan) -> (let body = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)), sp)), (plan).f_UpdateAccessPlan_upBodyArgs, sp)) in ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (fuel - 1)) globals) ctx) dtb__1028) (plan).f_UpdateAccessPlan_upData) (plan).f_UpdateAccessPlan_upIdxs) ((Elab_dTypes.v_evalCtx ctx) dtb__1025)) dtb__1027) (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)) ((v_recordFieldPats (plan).f_UpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun (q : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1029; B_dData_dPair.f_Pair_second = dtb__1030 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb__1025, (dtb__1029).Core_dTerm.f_CaseAlt_caseAltName, (Core_dTerm.v_binderPairs (dtb__1029).Core_dTerm.f_CaseAlt_caseAltBinders), (plan).f_UpdateAccessPlan_upFieldIndices, (dtb__1029).Core_dTerm.f_CaseAlt_caseAltBody)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1027; B_dData_dPair.f_Pair_second = dtb__1030 } }))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
)))
# 1131 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAnnFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pt in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1031; B_dData_dPair.f_Pair_second = dtb__1032 } -> (match dtb__1032 with
  | { B_dData_dPair.f_Pair_first = dtb__1033; B_dData_dPair.f_Pair_second = dtb__1034 } -> (let tyVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1031) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1034) value) tyVal)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1035; B_dData_dPair.f_Pair_second = dtb__1036 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1035; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyVal; B_dData_dPair.f_Pair_second = dtb__1036 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1149 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferPiFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (implicit : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dom : Frontend_dRast.t_Expr) (cod : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun (pd : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pd in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1037; B_dData_dPair.f_Pair_second = dtb__1038 } -> (match dtb__1038 with
  | { B_dData_dPair.f_Pair_first = dtb__1039; B_dData_dPair.f_Pair_second = dtb__1040 } -> (let domVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1037) in (let isTypeDom = (Elab_dMeta.v_isTypeDomain domVal) in (let isLinDom = ((Elab_dMeta.v_isLinearType ec) domVal) in (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__1037) ctx) in (let badQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1046) -> (if implicit then true else isTypeDom)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (let badLinQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1045) -> (if (Frontend_dAst.v_qtyIsZero dtb__1045) then isLinDom else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (if badQty then (if implicit then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityImplicit (name))) name) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearTypeNeedsOne (name))) name) else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx2) dtb__1040) cod)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut28 = pc in (match nd_uscrut28 with
  | { B_dData_dPair.f_Pair_first = dtb__1041; B_dData_dPair.f_Pair_second = dtb__1042 } -> (match dtb__1042 with
  | { B_dData_dPair.f_Pair_first = dtb__1043; B_dData_dPair.f_Pair_second = dtb__1044 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (name, implicit, (if isLinDom then Core_dTerm.C_Rig_Rig1 else (if implicit then ((Elab_dMeta.v_implicitBinderRig ec) domVal) else (((Elab_dMeta.v_rigOfQty false) isTypeDom) qty))), dtb__1037, dtb__1041)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType (((Core_dTerm.v_levelMax dtb__1039) dtb__1043))); B_dData_dPair.f_Pair_second = dtb__1044 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1213 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = fn in (match nd_uscrut8 with
  | Frontend_dRast.C_Expr_EVar (dtb__1047, dtb__1048) -> (match dtb__1047 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1049) -> (if (dtb__1049 = "->") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1050, dtb__1051) -> (match dtb__1051 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1052, dtb__1053) -> (match dtb__1053 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) B_dData_dMaybe.C_Maybe_Nothing) dtb__1050) dtb__1052) sp)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)) else (if (dtb__1049 = "Type") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1054, dtb__1055) -> (match dtb__1054 with
  | Frontend_dRast.C_Expr_EInt (dtb__1056, dtb__1057) -> (match dtb__1055 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1056 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1057) Base_dDiagnostics_dTc.C_TcErr_UniverseLevelNonNegative) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb__1056))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc (Core_dTerm.v_levelOfInt dtb__1056)))); B_dData_dPair.f_Pair_second = ec } })))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1048) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1048) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1048) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)) else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1058, dtb__1059) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1058)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1059) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1058))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1058)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1059))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1058)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1060) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1058)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1061) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1061))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1062; B_dData_dPair.f_Pair_second = dtb__1063 } -> (match dtb__1063 with
  | { B_dData_dPair.f_Pair_first = dtb__1064; B_dData_dPair.f_Pair_second = dtb__1065 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1065) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1058)))) dtb__1062); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1064; B_dData_dPair.f_Pair_second = dtb__1065 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1058)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1066) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1058)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1066)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1067; B_dData_dPair.f_Pair_second = dtb__1068 } -> (match dtb__1068 with
  | { B_dData_dPair.f_Pair_first = dtb__1069; B_dData_dPair.f_Pair_second = dtb__1070 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1070) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1058)))) dtb__1067); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1069; B_dData_dPair.f_Pair_second = dtb__1070 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1058)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1071) -> (Base_dDiag.C_Check_OkC (dtb__1071))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1066)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = pa in (match nd_uscrut21 with
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
)))
  | _ -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1077, dtb__1078) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1077)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1078) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1077))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1077)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1078))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1077)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1079) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1077)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1080) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1080))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pa in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1081; B_dData_dPair.f_Pair_second = dtb__1082 } -> (match dtb__1082 with
  | { B_dData_dPair.f_Pair_first = dtb__1083; B_dData_dPair.f_Pair_second = dtb__1084 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1084) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1077)))) dtb__1081); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1083; B_dData_dPair.f_Pair_second = dtb__1084 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1077)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1085) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1077)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1085)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1086; B_dData_dPair.f_Pair_second = dtb__1087 } -> (match dtb__1087 with
  | { B_dData_dPair.f_Pair_first = dtb__1088; B_dData_dPair.f_Pair_second = dtb__1089 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1089) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1077)))) dtb__1086); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1088; B_dData_dPair.f_Pair_second = dtb__1089 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1077)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1090) -> (Base_dDiag.C_Check_OkC (dtb__1090))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1085)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = pa in (match nd_uscrut20 with
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
)
  | _ -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1096, dtb__1097) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1096)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1097) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1096))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1096)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1097))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1096)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1098) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1096)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1099) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1099))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1100; B_dData_dPair.f_Pair_second = dtb__1101 } -> (match dtb__1101 with
  | { B_dData_dPair.f_Pair_first = dtb__1102; B_dData_dPair.f_Pair_second = dtb__1103 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1103) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1096)))) dtb__1100); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1102; B_dData_dPair.f_Pair_second = dtb__1103 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1096)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1104) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1096)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1104)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1105; B_dData_dPair.f_Pair_second = dtb__1106 } -> (match dtb__1106 with
  | { B_dData_dPair.f_Pair_first = dtb__1107; B_dData_dPair.f_Pair_second = dtb__1108 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1108) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1096)))) dtb__1105); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1107; B_dData_dPair.f_Pair_second = dtb__1108 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1096)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1109) -> (Base_dDiag.C_Check_OkC (dtb__1109))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1104)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1110; B_dData_dPair.f_Pair_second = dtb__1111 } -> (match dtb__1111 with
  | { B_dData_dPair.f_Pair_first = dtb__1112; B_dData_dPair.f_Pair_second = dtb__1113 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1113) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1096)))) dtb__1110); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1112; B_dData_dPair.f_Pair_second = dtb__1113 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1096)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1114) -> (Base_dDiag.C_Check_OkC (dtb__1114))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1097) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1096)))) (Frontend_dRast_dName.v_rnameKey dtb__1096))
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
# 1283 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1115, dtb__1116) -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1115)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1117) -> (Base_dDiag.C_Check_OkC (dtb__1117))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1298 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun (pf : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pf in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1118; B_dData_dPair.f_Pair_second = dtb__1119 } -> (match dtb__1119 with
  | { B_dData_dPair.f_Pair_first = dtb__1120; B_dData_dPair.f_Pair_second = dtb__1121 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1121) dtb__1120) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1122; B_dData_dPair.f_Pair_second = dtb__1123 } -> (match dtb__1123 with
  | { B_dData_dPair.f_Pair_first = dtb__1124; B_dData_dPair.f_Pair_second = dtb__1125 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1125)) dtb__1118) dtb__1122); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1124; B_dData_dPair.f_Pair_second = dtb__1125 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1314 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((v_inferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1469 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal ec) ty) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__1126, dtb__1127, dtb__1128, dtb__1129, dtb__1130) -> (if dtb__1127 then (if ((Elab_dDict.v_isDictDomain ec) dtb__1129) then (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dtb__1129) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1129) dtb__1130) args) sp) hint) else ((Base_dCommon.v_bind (((((((v_constrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1129) args) sp)) (fun (ec0 : Elab_dTypes.t_Ec) -> (let nd_uscrut15 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1129)) sp) in (match nd_uscrut15 with
  | Base_dDiag.C_Check_ErrC (dtb__1131) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec0)) ((Elab_dTypes.v_forceVal ec0) dtb__1129)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1129) dtb__1130) args) sp) hint) else (if ((Elab_dDict.v_isRigidDictArg ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1129)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1129) dtb__1130) args) sp) hint) else (Base_dDiag.C_Check_ErrC (dtb__1131))))
  | Base_dDiag.C_Check_OkC (dtb__1132) -> (match dtb__1132 with
  | { B_dData_dPair.f_Pair_first = dtb__1133; B_dData_dPair.f_Pair_second = dtb__1134 } -> (let ty2 = ((Core_dEval.v_applyClosure dtb__1130) ((Elab_dTypes.v_evalCtx ctx) dtb__1133)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1134) ty2) args) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = q in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1135; B_dData_dPair.f_Pair_second = dtb__1136 } -> (match dtb__1136 with
  | { B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = dtb__1138 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1133; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1135)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = dtb__1138 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) else (if ((Elab_dDict.v_isMemberDomain ec) dtb__1129) then (match ((((Elab_dDict.v_memberLookup 64) (Elab_dTypes.v_ctxDepth ctx)) ec) dtb__1129) with
  | Elab_dDict.C_MemberLookup_MemberFound (dtb__1139, dtb__1140) -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1140) ((Core_dEval.v_applyClosure dtb__1130) dtb__1139)) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = p in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1141; B_dData_dPair.f_Pair_second = dtb__1142 } -> (match dtb__1142 with
  | { B_dData_dPair.f_Pair_first = dtb__1143; B_dData_dPair.f_Pair_second = dtb__1144 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) dtb__1139); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1141)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1143; B_dData_dPair.f_Pair_second = dtb__1144 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Elab_dDict.C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | Elab_dDict.C_MemberLookup_MemberAmbiguous (dtb__1145) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1146; B_dData_dPair.f_Pair_second = dtb__1147 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1147) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1129) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1130) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1146))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = p in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1148; B_dData_dPair.f_Pair_second = dtb__1149 } -> (match dtb__1149 with
  | { B_dData_dPair.f_Pair_first = dtb__1150; B_dData_dPair.f_Pair_second = dtb__1151 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1146; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1148)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1150; B_dData_dPair.f_Pair_second = dtb__1151 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | Elab_dDict.C_MemberLookup_MemberStuck -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1152; B_dData_dPair.f_Pair_second = dtb__1153 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1153) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1129) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1130) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1152))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = p in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1154; B_dData_dPair.f_Pair_second = dtb__1155 } -> (match dtb__1155 with
  | { B_dData_dPair.f_Pair_first = dtb__1156; B_dData_dPair.f_Pair_second = dtb__1157 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1152; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1154)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1156; B_dData_dPair.f_Pair_second = dtb__1157 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__1129) then (if ((Elab_dMeta.v_isStringImplicitDomain ec) dtb__1129) then (match args with
  | B_dData_dList.C_List__x58__x58_ (dtb__1158, dtb__1159) -> (match (v_instArgOperand dtb__1158) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1160) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1160) dtb__1129)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1161; B_dData_dPair.f_Pair_second = dtb__1162 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1162) ((Core_dEval.v_applyClosure dtb__1130) ((Elab_dTypes.v_evalCtx ctx) dtb__1161))) dtb__1159) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut25 = q in (match nd_uscrut25 with
  | { B_dData_dPair.f_Pair_first = dtb__1163; B_dData_dPair.f_Pair_second = dtb__1164 } -> (match dtb__1164 with
  | { B_dData_dPair.f_Pair_first = dtb__1165; B_dData_dPair.f_Pair_second = dtb__1166 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1161; B_dData_dPair.f_Pair_second = dtb__1128 }, dtb__1163)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1165; B_dData_dPair.f_Pair_second = dtb__1166 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1167; B_dData_dPair.f_Pair_second = dtb__1168 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1168) ((Core_dEval.v_applyClosure dtb__1130) ((Elab_dTypes.v_evalCtx ctx) dtb__1167))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut23 = p in (match nd_uscrut23 with
  | { B_dData_dPair.f_Pair_first = dtb__1169; B_dData_dPair.f_Pair_second = dtb__1170 } -> (match dtb__1170 with
  | { B_dData_dPair.f_Pair_first = dtb__1171; B_dData_dPair.f_Pair_second = dtb__1172 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1167; B_dData_dPair.f_Pair_second = dtb__1128 }, dtb__1169)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1171; B_dData_dPair.f_Pair_second = dtb__1172 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1173; B_dData_dPair.f_Pair_second = dtb__1174 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1174) ((Core_dEval.v_applyClosure dtb__1130) ((Elab_dTypes.v_evalCtx ctx) dtb__1173))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = p in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1175; B_dData_dPair.f_Pair_second = dtb__1176 } -> (match dtb__1176 with
  | { B_dData_dPair.f_Pair_first = dtb__1177; B_dData_dPair.f_Pair_second = dtb__1178 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1173; B_dData_dPair.f_Pair_second = dtb__1128 }, dtb__1175)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1177; B_dData_dPair.f_Pair_second = dtb__1178 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1179; B_dData_dPair.f_Pair_second = dtb__1180 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1180) ((Core_dEval.v_applyClosure dtb__1130) ((Elab_dTypes.v_evalCtx ctx) dtb__1179))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = p in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1181; B_dData_dPair.f_Pair_second = dtb__1182 } -> (match dtb__1182 with
  | { B_dData_dPair.f_Pair_first = dtb__1183; B_dData_dPair.f_Pair_second = dtb__1184 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1179; B_dData_dPair.f_Pair_second = dtb__1128 }, dtb__1181)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1183; B_dData_dPair.f_Pair_second = dtb__1184 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)))) else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = forced; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__1185, dtb__1186) -> (let ec0 = (match hint with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1193) -> (if (((((v_remainingExplicitPis 64) ctx) ec) forced) = (B_dData_dList.v_length args)) then (match ((((v_tryUseHint ctx) dtb__1193) ec) forced) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1194) -> dtb__1194
  | _ -> failwith "DT: impossible branch"
) else ec)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec0) sp) dtb__1126) dtb__1128) dtb__1129)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((v_expandArgListLit ec0) dtb__1129) dtb__1185)) (fun (a2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1129)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1187; B_dData_dPair.f_Pair_second = dtb__1188 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1188) ((Core_dEval.v_applyClosure dtb__1130) ((Elab_dTypes.v_evalCtx ctx) dtb__1187))) dtb__1186) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = q in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1189; B_dData_dPair.f_Pair_second = dtb__1190 } -> (match dtb__1190 with
  | { B_dData_dPair.f_Pair_first = dtb__1191; B_dData_dPair.f_Pair_second = dtb__1192 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1187; B_dData_dPair.f_Pair_second = argRig }, dtb__1189)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1191; B_dData_dPair.f_Pair_second = dtb__1192 } }))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__1195, dtb__1196) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_exprSpan dtb__1195)) Base_dDiagnostics_dTc.C_TcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
))))
# 1609 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_deferDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1197; B_dData_dPair.f_Pair_second = dtb__1198 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ((((((Elab_dTypes.v_ecAddConstraint dtb__1198) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__1198) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx))) ((Core_dEval.v_applyClosure clo) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1197))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1199; B_dData_dPair.f_Pair_second = dtb__1200 } -> (match dtb__1200 with
  | { B_dData_dPair.f_Pair_first = dtb__1201; B_dData_dPair.f_Pair_second = dtb__1202 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1197; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1199)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1201; B_dData_dPair.f_Pair_second = dtb__1202 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1627 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dom : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dDict.v_dictClassArg ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1203) -> (match ((Elab_dDict.v_dictArgKind ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1204) -> (let nd_uscrut11 = dtb__1203 in (match nd_uscrut11 with
  | Core_dTerm.C_Value_VMeta (dtb__1205, dtb__1206) -> (match dtb__1206 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1203) dtb__1204) args) sp)) (fun (ecProbe : Elab_dTypes.t_Ec) -> (match ((Core_dTerm.v_metaLookup dtb__1205) (Elab_dTypes.v_ecSolTbl ecProbe)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1207) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) dtb__1205) B_dData_dList.C_List_Nil) dtb__1207) with
  | Base_dDiag.C_Check_OkC (dtb__1208) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__1208))))
  | Base_dDiag.C_Check_ErrC (dtb__1209) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1203) dtb__1204) args) sp)
)
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1203) dtb__1204) args) sp)
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1655 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomGoKFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (argTy : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dList.C_List__x58__x58_ (dtb__1210, dtb__1211) -> (let nd_uscrut11 = (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1210) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__1212) -> (match dtb__1212 with
  | { B_dData_dPair.f_Pair_first = dtb__1213; B_dData_dPair.f_Pair_second = dtb__1214 } -> (match dtb__1214 with
  | { B_dData_dPair.f_Pair_first = dtb__1215; B_dData_dPair.f_Pair_second = dtb__1216 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1216) dtb__1215) in (if (Core_dTerm.v_isTypeValue forced) then ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1216) ctx) argTy) argKind) dtb__1211) sp) else (if (((((Elab_dDict.v_argHeadMatchesKind globals) dtb__1216) ctx) forced) argKind) then (match ((((Elab_dMeta.v_convEc dtb__1216) (Elab_dTypes.v_ctxDepth ctx)) argTy) (Elab_dDict.v_neutralHeadOrSelf forced)) with
  | Base_dDiag.C_Check_OkC (dtb__1217) -> (Base_dDiag.C_Check_OkC (dtb__1217))
  | Base_dDiag.C_Check_ErrC (dtb__1218) -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1216) ctx) argTy) argKind) dtb__1211) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1216) ctx) argTy) argKind) dtb__1211) sp))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1219) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1787 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1220) -> ((((((((v_specializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1220) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1797 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = args in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1221, dtb__1222) -> (match dtb__1222 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1223, dtb__1224) -> (match dtb__1224 with
  | B_dData_dList.C_List_Nil -> (if ((v_isNatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1221) v_natTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1225; B_dData_dPair.f_Pair_second = dtb__1226 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1226) dtb__1223) v_natTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1227; B_dData_dPair.f_Pair_second = dtb__1228 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1225) dtb__1227); B_dData_dPair.f_Pair_second = dtb__1228 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isIntTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1221) v_intTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1229; B_dData_dPair.f_Pair_second = dtb__1230 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1230) dtb__1223) v_intTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1231; B_dData_dPair.f_Pair_second = dtb__1232 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1229) dtb__1231); B_dData_dPair.f_Pair_second = dtb__1232 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isFloatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1221) v_floatTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1233; B_dData_dPair.f_Pair_second = dtb__1234 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1234) dtb__1223) v_floatTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1235; B_dData_dPair.f_Pair_second = dtb__1236 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1233) dtb__1235); B_dData_dPair.f_Pair_second = dtb__1236 }))))
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
# 1843 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1237) -> (((((((v_specializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1237) args) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1853 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1238, dtb__1239) -> (match dtb__1239 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1240, dtb__1241) -> (match dtb__1241 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1238)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1242; B_dData_dPair.f_Pair_second = dtb__1243 } -> (match dtb__1243 with
  | { B_dData_dPair.f_Pair_first = dtb__1244; B_dData_dPair.f_Pair_second = dtb__1245 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1245) dtb__1240)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1246; B_dData_dPair.f_Pair_second = dtb__1247 } -> (match dtb__1247 with
  | { B_dData_dPair.f_Pair_first = dtb__1248; B_dData_dPair.f_Pair_second = dtb__1249 } -> (if (if ((v_isNatTy dtb__1249) dtb__1244) then ((v_isNatTy dtb__1249) dtb__1248) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1242) dtb__1246); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1249 } })))) else (if (if ((v_isIntTy dtb__1249) dtb__1244) then ((v_isIntTy dtb__1249) dtb__1248) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1242) dtb__1246); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1249 } })))) else (if (if ((v_isFloatTy dtb__1249) dtb__1244) then ((v_isFloatTy dtb__1249) dtb__1248) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1242) dtb__1246); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_floatTyValue; B_dData_dPair.f_Pair_second = dtb__1249 } })))) else (if (if ((v_isNatTy dtb__1249) dtb__1244) then ((v_isIntTy dtb__1249) dtb__1248) else false) then (match (v_isEIntExpr dtb__1240) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1250) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1240)) dtb__1250)) (fun (bNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1242) bNat); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1249 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) (v_natToIntTerm dtb__1242)) dtb__1246); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1249 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_isIntTy dtb__1249) dtb__1244) then ((v_isNatTy dtb__1249) dtb__1248) else false) then (match (v_isEIntExpr dtb__1238) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1251) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1238)) dtb__1251)) (fun (aNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) aNat) dtb__1246); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1249 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1242) (v_natToIntTerm dtb__1246)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1249 } }))))
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
# 1893 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1252) -> (let simpleComp = (let nd_uscrut8 = (v_handleOperand expr) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__1259) -> (match dtb__1259 with
  | { B_dData_dPair.f_Pair_first = dtb__1260; B_dData_dPair.f_Pair_second = dtb__1261 } -> (v_isSimpleComp dtb__1260)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let firstCall = (if simpleComp then ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in (let thirdCall = (if simpleComp then ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in ((Base_dCommon.v_bind firstCall) (fun (callExpr : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1253) -> (Base_dDiag.C_Check_OkC (dtb__1253))
  | Base_dDiag.C_Check_ErrC (dtb__1254) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1255) -> (Base_dDiag.C_Check_OkC (dtb__1255))
  | Base_dDiag.C_Check_ErrC (dtb__1256) -> ((Base_dCommon.v_bind thirdCall) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match ((Base_dObs.v_obsCheck "vuna.elab.term.retry-third") (fun (_u : int) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Base_dDiag.C_Check_OkC (dtb__1257) -> (Base_dDiag.C_Check_OkC (dtb__1257))
  | Base_dDiag.C_Check_ErrC (dtb__1258) -> (Base_dDiag.C_Check_ErrC (dtb__1254))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1262) -> ((Base_dObs.v_obsCheck "vuna.elab.term.infer") (fun (_u : int) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1263) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1264) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) expected))) dtb__1264) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dObs.v_obsDefCheckAt 3) "vuna.elab.term.core") (v_exprFormName expr)) (fun (_u : int) -> ((((((v_checkEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1980 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRow = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1265) -> ((Base_dCommon.v_bind ((((((v_checkDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1265) expected)) (fun (r : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1266) -> (Base_dDiag.C_Check_OkC (dtb__1266))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) (v_doChainFallback dtb__1265)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 2061 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EAnn (dtb__1267, dtb__1268, dtb__1269) -> ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1268)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pt in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1270; B_dData_dPair.f_Pair_second = dtb__1271 } -> (match dtb__1271 with
  | { B_dData_dPair.f_Pair_first = dtb__1272; B_dData_dPair.f_Pair_second = dtb__1273 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1273) dtb__1267) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1270))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__1274, dtb__1275) -> (if (v_clausesHaveOverCtor dtb__1274) then ((Base_dCommon.v_bind ((((v_resolveOverFunPats ec) ctx) expected) dtb__1274)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__1276; B_dData_dPair.f_Pair_second = dtb__1277 } -> ((Base_dCommon.v_bind ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable dtb__1277)) dtb__1276)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1277) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__1274, dtb__1275)))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Frontend_dRast.C_Expr_ELet (dtb__1278, dtb__1279, dtb__1280, dtb__1281) -> (((((((((v_checkLetFuel (fuel - 1)) globals) ctx) ec) dtb__1278) dtb__1279) dtb__1280) expected) dtb__1281)
  | Frontend_dRast.C_Expr_ECase (dtb__1282, dtb__1283, dtb__1284) -> ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1282) dtb__1283) expected) dtb__1284)
  | Frontend_dRast.C_Expr_EIf (dtb__1285, dtb__1286, dtb__1287, dtb__1288) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1285) dtb__1288)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__1289; B_dData_dPair.f_Pair_second = dtb__1290 } -> (let attempt = ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1290) dtb__1286) expected)) (fun (pt : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__1293; B_dData_dPair.f_Pair_second = dtb__1294 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1294) dtb__1287) expected)) (fun (pe : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__1295; B_dData_dPair.f_Pair_second = dtb__1296 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1289, dtb__1293, dtb__1295)); B_dData_dPair.f_Pair_second = dtb__1296 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) in (match attempt with
  | Base_dDiag.C_Check_OkC (dtb__1291) -> (Base_dDiag.C_Check_OkC (dtb__1291))
  | Base_dDiag.C_Check_ErrC (dtb__1292) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Expr_EPi (dtb__1297, dtb__1298, dtb__1299, dtb__1300, dtb__1301, dtb__1302) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Frontend_dRast.C_Expr_EApp (dtb__1303, dtb__1304, dtb__1305) -> (match dtb__1303 with
  | Frontend_dRast.C_Expr_EVar (dtb__1306, dtb__1307) -> (match dtb__1306 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1308) -> (if (dtb__1308 = "->") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1308 = "Type") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1306)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1305) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1306, dtb__1307))) dtb__1304) expected) dtb__1305))))
  | _ -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1306)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1305) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1306, dtb__1307))) dtb__1304) expected) dtb__1305))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) dtb__1303) dtb__1304) expected) dtb__1305)
)
  | Frontend_dRast.C_Expr_ELam (dtb__1309, dtb__1310, dtb__1311) -> ((((((((v_checkLamFuel (fuel - 1)) globals) ctx) ec) dtb__1309) dtb__1310) expected) dtb__1311)
  | Frontend_dRast.C_Expr_EFloat (dtb__1312, dtb__1313) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1314, dtb__1315) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1316) -> (match dtb__1316 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1317, dtb__1318) -> (match dtb__1318 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1317 = Base_dIntrinsics.v_floatTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1312)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1313) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1319) -> (match dtb__1319 with
  | { B_dData_dPair.f_Pair_first = dtb__1320; B_dData_dPair.f_Pair_second = dtb__1321 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1321) dtb__1320) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1313) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1322) -> (match dtb__1322 with
  | { B_dData_dPair.f_Pair_first = dtb__1323; B_dData_dPair.f_Pair_second = dtb__1324 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1324) dtb__1323) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1313) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1325) -> (match dtb__1325 with
  | { B_dData_dPair.f_Pair_first = dtb__1326; B_dData_dPair.f_Pair_second = dtb__1327 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1327) dtb__1326) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1313) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1328) -> (match dtb__1328 with
  | { B_dData_dPair.f_Pair_first = dtb__1329; B_dData_dPair.f_Pair_second = dtb__1330 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1330) dtb__1329) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EStr (dtb__1331, dtb__1332) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1333, dtb__1334) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1335) -> (match dtb__1335 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1336, dtb__1337) -> (match dtb__1337 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1336 = Base_dIntrinsics.v_strTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1331)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1332) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1338) -> (match dtb__1338 with
  | { B_dData_dPair.f_Pair_first = dtb__1339; B_dData_dPair.f_Pair_second = dtb__1340 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1340) dtb__1339) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1332) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1341) -> (match dtb__1341 with
  | { B_dData_dPair.f_Pair_first = dtb__1342; B_dData_dPair.f_Pair_second = dtb__1343 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1343) dtb__1342) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1332) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1344) -> (match dtb__1344 with
  | { B_dData_dPair.f_Pair_first = dtb__1345; B_dData_dPair.f_Pair_second = dtb__1346 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1346) dtb__1345) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1332) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1347) -> (match dtb__1347 with
  | { B_dData_dPair.f_Pair_first = dtb__1348; B_dData_dPair.f_Pair_second = dtb__1349 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1349) dtb__1348) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EInt (dtb__1350, dtb__1351) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1352, dtb__1353) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1354) -> (match dtb__1354 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1355, dtb__1356) -> (match dtb__1356 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1355 = Base_dIntrinsics.v_natTypeName) then ((Base_dCommon.v_bind ((v_natLitResult dtb__1351) dtb__1350)) (fun (t : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = ec })))) else (if (dtb__1355 = Base_dIntrinsics.v_intTypeName) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1351) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1357) -> (match dtb__1357 with
  | { B_dData_dPair.f_Pair_first = dtb__1358; B_dData_dPair.f_Pair_second = dtb__1359 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1359) dtb__1358) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1351) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1360) -> (match dtb__1360 with
  | { B_dData_dPair.f_Pair_first = dtb__1361; B_dData_dPair.f_Pair_second = dtb__1362 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1362) dtb__1361) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1351) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1363) -> (match dtb__1363 with
  | { B_dData_dPair.f_Pair_first = dtb__1364; B_dData_dPair.f_Pair_second = dtb__1365 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1365) dtb__1364) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1351) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1366) -> (match dtb__1366 with
  | { B_dData_dPair.f_Pair_first = dtb__1367; B_dData_dPair.f_Pair_second = dtb__1368 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1368) dtb__1367) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EVar (dtb__1369, dtb__1370) -> (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1369)) then (let pmeta = (((((Elab_dMetaSpans.v_newHoleMeta ctx) ec) dtb__1370) expected) (Frontend_dReserved.v_holeNameOf (Frontend_dRast_dName.v_rnameKey dtb__1369))) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__1371; B_dData_dPair.f_Pair_second = dtb__1372 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1371; B_dData_dPair.f_Pair_second = dtb__1372 }))
  | _ -> failwith "DT: impossible branch"
)) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1369)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1370) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1369))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1369)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1370))) B_dData_dList.C_List_Nil) expected) dtb__1370))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1369)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1369))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1369))) expected) dtb__1370)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1370))) B_dData_dList.C_List_Nil) expected) dtb__1370))) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1369, dtb__1370))) B_dData_dList.C_List_Nil) expected) dtb__1370))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
))))
# 2178 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 2280 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 2290 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : bool) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1373, dtb__1374) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((((v_checkLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1373) dtb__1374) mc5) mc6) mc7) mc8))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 2299 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetOneFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bnd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (B_dData_dPair.v_firstOf bnd) with
  | Frontend_dRast.C_Pat_PVar (dtb__1375, dtb__1376) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pv in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__1377; B_dData_dPair.f_Pair_second = dtb__1378 } -> (match dtb__1378 with
  | { B_dData_dPair.f_Pair_first = dtb__1379; B_dData_dPair.f_Pair_second = dtb__1380 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1379) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1375) dtb__1379) ctx) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx2) dtb__1380) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1381; B_dData_dPair.f_Pair_second = dtb__1382 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1382) ctx) dtb__1379) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1381) else dtb__1381) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb__1375, rig, B_dData_dMaybe.C_Maybe_Nothing, ((Base_dSource.v_spanAtName dtb__1375) dtb__1376), bodyTerm2)), dtb__1377, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1382 })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dRast.C_Pat_PWild (dtb__1383) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pv in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1384; B_dData_dPair.f_Pair_second = dtb__1385 } -> (match dtb__1385 with
  | { B_dData_dPair.f_Pair_first = dtb__1386; B_dData_dPair.f_Pair_second = dtb__1387 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1386) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) dtb__1387) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1388; B_dData_dPair.f_Pair_second = dtb__1389 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, dtb__1383, (((Core_dTerm.v_shift 0) 1) dtb__1388))), dtb__1384, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1389 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase ((B_dData_dPair.v_secondOf bnd), (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf bnd); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (rest, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan (B_dData_dPair.v_firstOf bnd))))) expected)
)))
# 2347 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = binds in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1390, dtb__1391) -> (match dtb__1390 with
  | { B_dData_dPair.f_Pair_first = dtb__1392; B_dData_dPair.f_Pair_second = dtb__1393 } -> (match dtb__1392 with
  | Frontend_dRast.C_Pat_PVar (dtb__1394, dtb__1395) -> (((((((((((v_inferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1394) dtb__1393) dtb__1391) body) rec_u) ((Base_dSource.v_spanAtName dtb__1394) dtb__1395)) sp)
  | Frontend_dRast.C_Pat_PWild (dtb__1396) -> ((((((((((v_inferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1393) dtb__1391) body) rec_u) dtb__1396) sp)
  | _ -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase (dtb__1393, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1392; B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (dtb__1391, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan dtb__1392))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
))))
# 2361 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetBoundFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = pv in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__1397; B_dData_dPair.f_Pair_second = dtb__1398 } -> (match dtb__1398 with
  | { B_dData_dPair.f_Pair_first = dtb__1399; B_dData_dPair.f_Pair_second = dtb__1400 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1399) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dtb__1399) ctx) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx2) dtb__1400) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = pb in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1401; B_dData_dPair.f_Pair_second = dtb__1402 } -> (match dtb__1402 with
  | { B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = dtb__1404 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1404) ctx) dtb__1399) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1401) else dtb__1401) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, bodyTerm2)), dtb__1397, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = dtb__1404 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2383 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetIgnoredFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pv in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1405; B_dData_dPair.f_Pair_second = dtb__1406 } -> (match dtb__1406 with
  | { B_dData_dPair.f_Pair_first = dtb__1407; B_dData_dPair.f_Pair_second = dtb__1408 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1407) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) dtb__1408) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pb in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1409; B_dData_dPair.f_Pair_second = dtb__1410 } -> (match dtb__1410 with
  | { B_dData_dPair.f_Pair_first = dtb__1411; B_dData_dPair.f_Pair_second = dtb__1412 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, (((Core_dTerm.v_shift 0) 1) dtb__1409))), dtb__1405, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1411; B_dData_dPair.f_Pair_second = dtb__1412 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2476 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelHint = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1413) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1414) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1415) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match expr with
  | Frontend_dRast.C_Expr_EApp (dtb__1416, dtb__1417, dtb__1418) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1416) dtb__1417) dtb__1418) (B_dData_dMaybe.C_Maybe_Just (expected)))
  | _ -> (((((v_inferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2762 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkByInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((((v_inferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__1419) -> (match dtb__1419 with
  | { B_dData_dPair.f_Pair_first = dtb__1420; B_dData_dPair.f_Pair_second = dtb__1421 } -> (match dtb__1421 with
  | { B_dData_dPair.f_Pair_first = dtb__1422; B_dData_dPair.f_Pair_second = dtb__1423 } -> (match ((((v_coerceTerm dtb__1423) expected) dtb__1422) dtb__1420) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1424) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1424; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1423) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1423) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1422) with
  | Base_dDiag.C_Check_ErrC (dtb__1425) -> (match ((((((v_tryEffLift ctx) globals) dtb__1423) expected) dtb__1422) dtb__1420) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1426) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__1426); B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) (B_dData_dPair.v_secondOf dtb__1426)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_unhandledEffectLabel dtb__1423) expected) dtb__1422) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1427) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> ((Elab_dTerm_dSupport.v_withEffectLabels dtb__1427) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("actual: " ^ (Core_dEval.v_showValue dtb__1422))))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("expected: " ^ (Core_dEval.v_showValue expected))))) d))))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((v_joinEffectLabels dtb__1427)))) (v_joinEffectLabels dtb__1427)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan (Frontend_dRast.v_exprSpan expr)) dtb__1425)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__1428) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1420; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1428) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1429) -> (Base_dDiag.C_Check_ErrC (dtb__1429))
  | _ -> failwith "DT: impossible branch"
))))
# 2783 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLamFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1430, dtb__1431) -> (match dtb__1430 with
  | { B_dData_dPair.f_Pair_first = dtb__1432; B_dData_dPair.f_Pair_second = dtb__1433 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (let nd_uscrut16 = forced in (match nd_uscrut16 with
  | Core_dTerm.C_Value_VMeta (dtb__1434, dtb__1435) -> (match dtb__1435 with
  | B_dData_dList.C_List_Nil -> (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) mc3) with
  | { B_dData_dPair.f_Pair_first = dtb__1436; B_dData_dPair.f_Pair_second = dtb__1437 } -> (let domVal = ((Elab_dTypes.v_evalCtx mc2) dtb__1436) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) dtb__1437) with
  | { B_dData_dPair.f_Pair_first = dtb__1438; B_dData_dPair.f_Pair_second = dtb__1439 } -> (let piVal = (Core_dTerm.C_Value_VPi ("_", false, Core_dTerm.C_Rig_RigOmega, domVal, { Core_dTerm.f_Closure_closureEnv = B_dData_dList.C_List_Nil; Core_dTerm.f_Closure_closureBody = dtb__1438 })) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__1439)) (Elab_dTypes.v_ecSolsP dtb__1439)) lvl) dtb__1434) B_dData_dList.C_List_Nil) piVal) with
  | Base_dDiag.C_Check_OkC (dtb__1440) -> ((((((((v_checkLamFuel (mc0 - 1)) mc1) mc2) ((Elab_dTypes.v_ecPutSols dtb__1439) (Core_dTerm.v_solsList dtb__1440))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1432; B_dData_dPair.f_Pair_second = dtb__1433 }, dtb__1431))) mc5) piVal) mc7)
  | Base_dDiag.C_Check_ErrC (dtb__1441) -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
)
  | Core_dTerm.C_Value_VPi (dtb__1442, dtb__1443, dtb__1444, dtb__1445, dtb__1446) -> (if dtb__1443 then (if (if ((Elab_dDict.v_isDictDomain mc3) dtb__1445) then true else (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__1445)) then (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1442) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1442) dtb__1445) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1446) v) in ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1432; B_dData_dPair.f_Pair_second = dtb__1433 }, dtb__1431))) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1447; B_dData_dPair.f_Pair_second = dtb__1448 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1442, dtb__1444, ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1445)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))), Base_dSource.v_spanEmpty, dtb__1447)); B_dData_dPair.f_Pair_second = dtb__1448 }))
  | _ -> failwith "DT: impossible branch"
))))))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)) else (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1442) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1432) dtb__1445) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1446) v) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain mc3) mc7) dtb__1432) dtb__1444) dtb__1445)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1431) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1449; B_dData_dPair.f_Pair_second = dtb__1450 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1450) mc2) dtb__1445) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1449) else dtb__1449) in (let slot0 = ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1445)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear mc3) mc2) then (if (((Elab_dMeta.v_termHasOuterLinear mc3) ctx2) dtb__1449) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1432, lamRig, slot, dtb__1433, inner2)); B_dData_dPair.f_Pair_second = dtb__1450 })))))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2872 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EApp (dtb__1451, dtb__1452, dtb__1453) -> (match dtb__1451 with
  | Frontend_dRast.C_Expr_EVar (dtb__1454, dtb__1455) -> (if (if ((Frontend_dRast_dName.v_rnameKey dtb__1454) = "->") then true else ((Frontend_dRast_dName.v_rnameKey dtb__1454) = "Type")) then (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1454)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1456) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1454)) then (match (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1454)) dtb__1452) dtb__1455) with
  | Base_dDiag.C_Check_ErrC (dtb__1457) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dDiag.C_Check_OkC (dtb__1458) -> (Base_dDiag.C_Check_OkC (dtb__1458))
  | _ -> failwith "DT: impossible branch"
) else (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Frontend_dRast.C_Expr_EVar (dtb__1459, dtb__1460) -> (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1459)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1461) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_typeLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1459)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1462) -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1462))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1463) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec) (Frontend_dRast_dName.v_rnameKey dtb__1459)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1463; B_dData_dPair.f_Pair_second = ec } }))
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
# 2905 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = p in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__1464; B_dData_dPair.f_Pair_second = dtb__1465 } -> (match dtb__1465 with
  | { B_dData_dPair.f_Pair_first = dtb__1466; B_dData_dPair.f_Pair_second = dtb__1467 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1467) dtb__1466) in (match (Core_dTerm.v_typeLevelOf forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1468) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1464; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1468; B_dData_dPair.f_Pair_second = dtb__1467 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedType (((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1466)))) ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1466))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2923 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1469, dtb__1470) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1469)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1470) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1469))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1469)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1470))) args) expected) sp))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1469)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueAppTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1469))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1469))) expected) sp)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1470))) args) expected) sp))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1469)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1471) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((Elab_dMeta.v_isSortVal ec) expected) then (match ((Elab_dMeta.v_typeNameOfDualCtor ec) (Frontend_dRast_dName.v_rnameKey dtb__1469)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1472) -> ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1472) args) expected) dtb__1470)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1469)) then ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1469)) args) expected) dtb__1470) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1469)) args) expected) sp) dtb__1470))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1469)) args) expected) sp) dtb__1470))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 2956 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppByValueFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (vsp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut10 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1473) -> (match dtb__1473 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__1474) -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__1475) -> ((((((((v_checkAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
# 2969 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1476; B_dData_dPair.f_Pair_second = dtb__1477 } -> (match dtb__1477 with
  | { B_dData_dPair.f_Pair_first = dtb__1478; B_dData_dPair.f_Pair_second = dtb__1479 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1479) (Elab_dTypes.v_ctxDepth ctx)) expected) (Core_dTerm.C_Value_VType (dtb__1478)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1476; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2980 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (((Elab_dMeta.v_typeHeadLookup globals) ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1480) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1480)) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = pa in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__1481; B_dData_dPair.f_Pair_second = dtb__1482 } -> (match dtb__1482 with
  | { B_dData_dPair.f_Pair_first = dtb__1483; B_dData_dPair.f_Pair_second = dtb__1484 } -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb__1484) dtb__1483)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1485) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1484) name) dtb__1481); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1485; B_dData_dPair.f_Pair_second = dtb__1484 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 3041 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeEqAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isEqMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1486, dtb__1487) -> (match dtb__1487 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1488, dtb__1489) -> (match dtb__1489 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1486)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1490; B_dData_dPair.f_Pair_second = dtb__1491 } -> (match dtb__1491 with
  | { B_dData_dPair.f_Pair_first = dtb__1492; B_dData_dPair.f_Pair_second = dtb__1493 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1493) dtb__1488)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1494; B_dData_dPair.f_Pair_second = dtb__1495 } -> (match dtb__1495 with
  | { B_dData_dPair.f_Pair_first = dtb__1496; B_dData_dPair.f_Pair_second = dtb__1497 } -> (match (((((v_coerceNatOperands dtb__1497) dtb__1492) dtb__1496) dtb__1490) dtb__1494) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1498) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1498))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1498))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1498))) dtb__1497)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1497) (Elab_dTypes.v_ctxDepth ctx)) dtb__1492) dtb__1496)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) dtb__1490) dtb__1494) sp) dtb__1492) ec3)))
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
# 3065 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeCmpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isCmpMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1499, dtb__1500) -> (match dtb__1500 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1501, dtb__1502) -> (match dtb__1502 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1499)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1503; B_dData_dPair.f_Pair_second = dtb__1504 } -> (match dtb__1504 with
  | { B_dData_dPair.f_Pair_first = dtb__1505; B_dData_dPair.f_Pair_second = dtb__1506 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1506) dtb__1501)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1507; B_dData_dPair.f_Pair_second = dtb__1508 } -> (match dtb__1508 with
  | { B_dData_dPair.f_Pair_first = dtb__1509; B_dData_dPair.f_Pair_second = dtb__1510 } -> (match (((((v_coerceNatOperands dtb__1510) dtb__1505) dtb__1509) dtb__1503) dtb__1507) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1511) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1511))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1511))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1511))) dtb__1510)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1510) (Elab_dTypes.v_ctxDepth ctx)) dtb__1505) dtb__1509)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) dtb__1503) dtb__1507) sp) dtb__1505) ec3)))
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
# 3091 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeOpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (name = Base_dIntrinsics.v_interpMethodName) then (((((((v_specializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Base_dCommon.v_bind (((((((v_specializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1512) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1512))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r2 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1513) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1513))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r3 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1514) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1514))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_specializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 3124 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeInterpPrimApp = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1515, dtb__1516) -> (match dtb__1516 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1515)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1517; B_dData_dPair.f_Pair_second = dtb__1518 } -> (match dtb__1518 with
  | { B_dData_dPair.f_Pair_first = dtb__1519; B_dData_dPair.f_Pair_second = dtb__1520 } -> (let tyv = ((Elab_dTypes.v_forceVal dtb__1520) dtb__1519) in (if (v_isStringTyValue tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1517; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyv; B_dData_dPair.f_Pair_second = dtb__1520 } })))) else (if (if ((v_isIntTy dtb__1520) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1520) Base_dIntrinsics.v_intTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm dtb__1517); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1520 } })))) else (if (if ((v_isNatTy dtb__1520) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1520) Base_dIntrinsics.v_natTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm (v_natToIntTerm dtb__1517)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1520 } })))) else (if ((v_isFloatTy dtb__1520) tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromFloatTerm dtb__1517); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1520 } })))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 3164 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeBoolAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1521, dtb__1522) -> (match dtb__1522 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1523, dtb__1524) -> (match dtb__1524 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1521) Elab_dPrelude.v_boolTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1525; B_dData_dPair.f_Pair_second = dtb__1526 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1526) dtb__1523) Elab_dPrelude.v_boolTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1527; B_dData_dPair.f_Pair_second = dtb__1528 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((Elab_dDict.v_boolShortCircuit name) dtb__1525) dtb__1527); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__1528 } }))))
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
# 3185 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1529, dtb__1530) -> ((Base_dCommon.v_bind ((((((((v_specializeArithCheckFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1529)) args) expected) sp)) (fun (arith : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut11 = arith in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_skipArithSpecForExpected ec) (Frontend_dRast_dName.v_rnameKey dtb__1529)) expected) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1529)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut14 = mspec in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1531) -> (match dtb__1531 with
  | { B_dData_dPair.f_Pair_first = dtb__1532; B_dData_dPair.f_Pair_second = dtb__1533 } -> (match dtb__1533 with
  | { B_dData_dPair.f_Pair_first = dtb__1534; B_dData_dPair.f_Pair_second = dtb__1535 } -> (match ((((v_coerceTerm dtb__1535) expected) dtb__1534) dtb__1532) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1536) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1536; B_dData_dPair.f_Pair_second = dtb__1535 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1535) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1534)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1532; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1537) -> (match dtb__1537 with
  | { B_dData_dPair.f_Pair_first = dtb__1538; B_dData_dPair.f_Pair_second = dtb__1539 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1538; B_dData_dPair.f_Pair_second = dtb__1539 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
)))
# 3468 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppCtorFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1540) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs ec) ctx) dtb__1540) expected) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1540))) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1541; B_dData_dPair.f_Pair_second = dtb__1542 } -> (match dtb__1542 with
  | { B_dData_dPair.f_Pair_first = dtb__1543; B_dData_dPair.f_Pair_second = dtb__1544 } -> (let ctorTerm = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1544)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1541) in (match ((((v_coerceTerm dtb__1544) expected) dtb__1543) ctorTerm) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1545) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1545; B_dData_dPair.f_Pair_second = dtb__1544 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1544) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1543) with
  | Base_dDiag.C_Check_OkC (dtb__1546) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1546)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1541); B_dData_dPair.f_Pair_second = dtb__1546 }))
  | Base_dDiag.C_Check_ErrC (dtb__1547) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1547)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1547))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1548) -> (match dtb__1548 with
  | { B_dData_dPair.f_Pair_first = dtb__1549; B_dData_dPair.f_Pair_second = dtb__1550 } -> (match dtb__1550 with
  | { B_dData_dPair.f_Pair_first = dtb__1551; B_dData_dPair.f_Pair_second = dtb__1552 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1552) dtb__1551) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pa in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1553; B_dData_dPair.f_Pair_second = dtb__1554 } -> (match dtb__1554 with
  | { B_dData_dPair.f_Pair_first = dtb__1555; B_dData_dPair.f_Pair_second = dtb__1556 } -> (let allArgs = ((B_dData_dList.v_append dtb__1549) dtb__1553) in (match ((((v_coerceTerm dtb__1556) expected) dtb__1555) (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1556)) (Core_dTerm.C_Term_TGlobal (name))) allArgs)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1557) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1557; B_dData_dPair.f_Pair_second = dtb__1556 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1556) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1555) with
  | Base_dDiag.C_Check_OkC (dtb__1558) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1558)) (Core_dTerm.C_Term_TGlobal (name))) allArgs); B_dData_dPair.f_Pair_second = dtb__1558 }))
  | Base_dDiag.C_Check_ErrC (dtb__1559) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1559)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1559))
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
# 3747 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabDoChain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (plan : t_DoPlan) (steps : t_DoChainStep B_dData_dList.t_List) (last : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = steps in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1560, dtb__1561) -> (match dtb__1560 with
  | C_DoChainStep_DoChainStep (dtb__1562, dtb__1563, dtb__1564, dtb__1565) -> (match (((Elab_dMetaSpans.v_newMetaAt dtb__1564) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1566; B_dData_dPair.f_Pair_second = dtb__1567 } -> (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1566) in (let mArgTy = ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) aVal) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1562) aVal) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1567) dtb__1564) "_") (plan).f_DoPlan_planRigE) mArgTy)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1567) dtb__1563) mArgTy)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1568; B_dData_dPair.f_Pair_second = dtb__1569 } -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1569) dtb__1564) dtb__1562) (plan).f_DoPlan_planInnerRig) aVal)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx2) dtb__1569) plan) dtb__1561) last)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1570; B_dData_dPair.f_Pair_second = dtb__1571 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((((((((v_doBindAppTerm dtb__1569) dtb__1571) ctx) dtb__1564) dtb__1565) plan) dtb__1562) aVal) dtb__1568) argRig) lamRig) dtb__1570); B_dData_dPair.f_Pair_second = dtb__1571 }))
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
# 3781 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1572) -> (match dtb__1572 with
  | { B_dData_dPair.f_Pair_first = dtb__1573; B_dData_dPair.f_Pair_second = dtb__1574 } -> (match dtb__1574 with
  | { B_dData_dPair.f_Pair_first = dtb__1575; B_dData_dPair.f_Pair_second = dtb__1576 } -> (let nd_uscrut17 = ((v_splitDoExpected ec) expected) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1577; B_dData_dPair.f_Pair_second = dtb__1578 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1578) with
  | { B_dData_dPair.f_Pair_first = dtb__1579; B_dData_dPair.f_Pair_second = dtb__1580 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1577) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1579) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1580) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1573) dtb__1575) dtb__1576) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1581) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1581).f_DoPlan_planEc) dtb__1581) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1582; B_dData_dPair.f_Pair_second = dtb__1583 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1583) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_applyValue (dtb__1581).f_DoPlan_planMVal) (dtb__1581).f_DoPlan_planAVal))) (fun (ec4 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1582; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1584) -> (match dtb__1584 with
  | { B_dData_dPair.f_Pair_first = dtb__1585; B_dData_dPair.f_Pair_second = dtb__1586 } -> ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1573) dtb__1575) dtb__1576) dtb__1585) dtb__1586)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1587) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1587).f_DoPlan_planEc) dtb__1587) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1588; B_dData_dPair.f_Pair_second = dtb__1589 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1588; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1589) }))))
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
# 3824 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1590) -> (match dtb__1590 with
  | { B_dData_dPair.f_Pair_first = dtb__1591; B_dData_dPair.f_Pair_second = dtb__1592 } -> (match dtb__1592 with
  | { B_dData_dPair.f_Pair_first = dtb__1593; B_dData_dPair.f_Pair_second = dtb__1594 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1595; B_dData_dPair.f_Pair_second = dtb__1596 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1596) with
  | { B_dData_dPair.f_Pair_first = dtb__1597; B_dData_dPair.f_Pair_second = dtb__1598 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1595) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1597) in (let resultTy = ((Core_dEval.v_applyValue mVal) aVal) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1598) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1591) dtb__1593) dtb__1594) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1599) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1599).f_DoPlan_planEc) dtb__1599) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1600; B_dData_dPair.f_Pair_second = dtb__1601 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1600; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__1601 } }))))
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

# 3004 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_checkTypeAtKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VType (dtb__1602) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) (((((v_checkTypeFuel 256) globals) ctx) ec) expr))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)) }))))
  | _ -> (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EApp (dtb__1603, dtb__1604, dtb__1605) -> (match dtb__1603 with
  | Frontend_dRast.C_Expr_EVar (dtb__1606, dtb__1607) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1606)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1606)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1606)))) (Frontend_dRast_dName.v_rnameKey dtb__1606))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1608) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel 256) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1608)) dtb__1604) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1609; B_dData_dPair.f_Pair_second = dtb__1610 } -> (match dtb__1610 with
  | { B_dData_dPair.f_Pair_first = dtb__1611; B_dData_dPair.f_Pair_second = dtb__1612 } -> (match ((((Elab_dMeta.v_convEc dtb__1612) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1611) with
  | Base_dDiag.C_Check_OkC (dtb__1613) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1613) (Frontend_dRast_dName.v_rnameKey dtb__1606)) dtb__1609); B_dData_dPair.f_Pair_second = dtb__1613 }))
  | Base_dDiag.C_Check_ErrC (dtb__1614) -> (((Base_dDiagnostics_dTc.v_tcTypeMismatch sp) (Core_dEval.v_showValue expected)) (Core_dEval.v_showValue dtb__1611))
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
  | Frontend_dRast.C_Expr_EVar (dtb__1615, dtb__1616) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1615)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1615)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1615)))) (Frontend_dRast_dName.v_rnameKey dtb__1615))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1617) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1617)))) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec1) (Frontend_dRast_dName.v_rnameKey dtb__1615)); B_dData_dPair.f_Pair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected))
))
))
