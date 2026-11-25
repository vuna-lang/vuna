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
let v_perfShortOf = (fun (last : string) -> (if ((B_dData_dString.v_endsWith "Op") last) then (let n = (bi_strLength last) in (if (n > 2) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring 0) (B_dData_dNat.v_fromIntClamp (n - 2))) last))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))

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

# 887 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 903 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldVarName = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 911 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldPatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ((v_recordFieldVarName i), sp)), (((v_recordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 907 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordFieldPatsFrom 0) n) sp))

# 922 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldLookupGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (if ((dtb__127).Elab_dTypes.f_DtFieldMeta_dtFieldName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__127).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (dtb__127).Elab_dTypes.f_DtFieldMeta_dtFieldType } })) else (((v_recordFieldLookupGo mc0) dtb__128) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 919 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldLookup = (fun (fname : string) (dd : Elab_dTypes.t_DtData) -> (((v_recordFieldLookupGo fname) (Elab_dTypes.v_dtDataFields dd)) (B_dData_dList.v_length (Elab_dTypes.v_dtDataFields dd))))

# 931 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 939 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateUnknown = (fun (dd : Elab_dTypes.t_DtData) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_recordUpdateUnknownGo dd) fields))

# 943 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateValueFor = (fun (mc0 : string) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (match dtb__134 with
  | { B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = dtb__137 } -> (if (dtb__136 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__137)) else ((v_recordUpdateValueFor mc0) dtb__135))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 949 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateArg = (fun (i : int) (f : Elab_dTypes.t_DtFieldMeta) (provided : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match ((v_recordUpdateValueFor (f).Elab_dTypes.f_DtFieldMeta_dtFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> dtb__138
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (v_recordFieldVarName i)), sp))
  | _ -> failwith "DT: impossible branch"
))

# 956 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (B_dData_dList.C_List__x58__x58_ (((((v_recordUpdateArg mc0) dtb__139) mc2) mc3), ((((v_recordUpdateArgs (mc0 + 1)) dtb__140) mc2) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 994 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1005 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1020 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldDictName = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_hasFieldTraitName)

# 1030 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1026 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctxHasFieldDict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fname : string) (baseTy : Core_dTerm.t_Value) -> ((((((v_ctxHasFieldDictGo (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ctx) ec) fname) baseTy))

# 1058 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1325 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 1332 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_listLitConsTail = (fun (h : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) -> (match (v_listLitElems t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (h, dtb__209))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1339 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_findCtorByShort = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (if ((Frontend_dRast.v_ctorShortName (Elab_dTypes.v_dtCtorName dtb__210)) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__210)) else ((v_findCtorByShort mc0) dtb__211))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1345 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCtor = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (short : string) -> (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> ((v_findCtorByShort short) (Elab_dTypes.v_dtDataCtors dtb__212))
  | _ -> failwith "DT: impossible branch"
))

# 1352 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> ((Base_dCommon.v_bind ((((v_expandListLitGo mc0) mc1) dtb__214) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (B_dData_dList.C_List__x58__x58_ (dtb__213, (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1364 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1369 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1385 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_applyExtra = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dRast.C_Expr_EApp (mc0, mc1, (Frontend_dRast.v_exprSpan mc0)))
))

# 1376 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1390 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitLabel = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> e
  | B_dData_dMaybe.C_Maybe_Just (dtb__239) -> (match dtb__239 with
  | { B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = dtb__241 } -> dtb__240
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1396 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameArg = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (match dtb__242 with
  | { B_dData_dPair.f_Pair_first = dtb__243; B_dData_dPair.f_Pair_second = dtb__244 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1402 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameExpr = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (match (v_rowLitNameArg e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__245) -> dtb__245
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1426 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_wrapRowEntry = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effNamedName), sp)), (B_dData_dList.C_List__x58__x58_ (((v_rowLitNameExpr e) sp), (B_dData_dList.C_List__x58__x58_ ((v_rowLitLabel e), B_dData_dList.C_List_Nil)))), sp)))

# 1421 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1418 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsArgs = (fun (e : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ (((v_rowConsEntry e) sp), (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))))

# 1408 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandRowListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__255, dtb__256) -> ((Base_dCommon.v_bind ((((v_expandRowListLitGo mc0) mc1) dtb__256) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (((v_rowConsArgs dtb__255) t) mc3), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1434 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_firstCtorOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match (((v_litFamilyCtor mc0) mc1) dtb__257) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__259) -> (B_dData_dMaybe.C_Maybe_Just (dtb__259))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstCtorOf mc0) mc1) dtb__258)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1431 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCons = (fun (ec : Elab_dTypes.t_Ec) (fam : string) -> (((v_firstCtorOf ec) fam) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", (B_dData_dList.C_List__x58__x58_ ("RCons", (B_dData_dList.C_List__x58__x58_ ("VCons", B_dData_dList.C_List_Nil))))))))))

# 1442 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1460 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_listLitFamily = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_expectedFamilyOf ec) expected) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> dtb__264
  | B_dData_dMaybe.C_Maybe_Nothing -> Base_dIntrinsics.v_listFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1467 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandArgListLit = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (a : Frontend_dRast.t_Expr) -> (match (v_listLitElems a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) dom))) dtb__265) (Frontend_dRast.v_exprSpan a))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1686 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitTermGo = (fun (n : int) (acc : Core_dTerm.t_Term) -> (if (n <= 0) then acc else ((v_natLitTermGo (n - 1)) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig1 }, B_dData_dList.C_List_Nil)))))))

# 1689 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitTerm = (fun (n : int) -> ((v_natLitTermGo n) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 1694 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitResult = (fun (sp : Base_dSource.t_Span) (n : int) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC ((v_natLitTerm n)))))

# 1697 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natToIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("natToInt")), t, Core_dTerm.C_Rig_Rig1)))

# 1700 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil))))

# 1703 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_natTypeName, B_dData_dList.C_List_Nil))))

# 1707 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil))))

# 1710 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1716 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1723 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 1195 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForExpected = (fun (ec : Elab_dTypes.t_Ec) (name : string) (expected : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_numMethodOpName ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__275) -> (if ((v_isIntTy ec) expected) then false else (if ((v_isNatTy ec) expected) then false else (if ((v_isFloatTy ec) expected) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VMeta (dtb__276, dtb__277) -> false
  | _ -> true
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1212 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForHint = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (((v_skipArithSpecForExpected mc0) mc1) dtb__278)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1730 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceTerm = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (if (if ((v_isIntTy ec) expected) then ((v_isNatTy ec) actual) else false) then (B_dData_dMaybe.C_Maybe_Just ((v_natToIntTerm term))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1735 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceNatOperands = (fun (ec : Elab_dTypes.t_Ec) (aTy : Core_dTerm.t_Value) (bTy : Core_dTerm.t_Value) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) -> (if (if ((v_isNatTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else (if (if ((v_isNatTy ec) aTy) then ((v_isIntTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = bTy }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = bTerm } })) else (if (if ((v_isIntTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = aTy; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = aTerm; B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else B_dData_dMaybe.C_Maybe_Nothing))))

# 1753 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithOpNameOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) -> (if (mc1 = "+") then (B_dData_dMaybe.C_Maybe_Just ("+")) else (if (mc1 = "-") then (B_dData_dMaybe.C_Maybe_Just ("-")) else (if (mc1 = "*") then (B_dData_dMaybe.C_Maybe_Just ("*")) else (if (mc1 = "/") then (B_dData_dMaybe.C_Maybe_Just ("/")) else (if (Base_dSource.v_containsDot mc1) then ((Elab_dDict.v_numMethodOpName mc0) mc1) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1760 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithNatName = (fun (mc0 : string) -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1766 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (name)), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1769 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithNatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1778 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithFloatName = (fun (mc0 : string) -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1774 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithFloatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1784 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isEIntExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EInt (dtb__279, dtb__280) -> (B_dData_dMaybe.C_Maybe_Just (dtb__279))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1893 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isSimpleComp = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__281, dtb__282) -> true
  | _ -> false
))

# 1950 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_literalTraitLower = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (traitName : string) (methodName : string) (lit : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let dictDom = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName traitName), (B_dData_dList.C_List__x58__x58_ (((Elab_dTypes.v_forceVal ec) expected), B_dData_dList.C_List_Nil)))))) in (let nd_uscrut9 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) dictDom) sp) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__283) -> (match dtb__283 with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName methodName), sp)), (B_dData_dList.C_List__x58__x58_ (lit, B_dData_dList.C_List_Nil)), sp)); B_dData_dPair.f_Pair_second = dtb__285 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__286) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 1959 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_exprFormName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EFloat (dtb__287, dtb__288) -> "EFloat"
  | Frontend_dRast.C_Expr_EInterp (dtb__289, dtb__290) -> "EInterp"
  | Frontend_dRast.C_Expr_EAnn (dtb__291, dtb__292, dtb__293) -> "EAnn"
  | Frontend_dRast.C_Expr_EDo (dtb__294, dtb__295) -> "EDo"
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__296, dtb__297, dtb__298) -> "ERecUpdate"
  | Frontend_dRast.C_Expr_ERecord (dtb__299, dtb__300, dtb__301) -> "ERecord"
  | Frontend_dRast.C_Expr_EField (dtb__302, dtb__303, dtb__304) -> "EField"
  | Frontend_dRast.C_Expr_ELocalFun (dtb__305, dtb__306) -> "ELocalFun"
  | Frontend_dRast.C_Expr_ELet (dtb__307, dtb__308, dtb__309, dtb__310) -> "ELet"
  | Frontend_dRast.C_Expr_ECase (dtb__311, dtb__312, dtb__313) -> "ECase"
  | Frontend_dRast.C_Expr_EIf (dtb__314, dtb__315, dtb__316, dtb__317) -> "EIf"
  | Frontend_dRast.C_Expr_EPi (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323) -> "EPi"
  | Frontend_dRast.C_Expr_EApp (dtb__324, dtb__325, dtb__326) -> "EApp"
  | Frontend_dRast.C_Expr_ELam (dtb__327, dtb__328, dtb__329) -> "ELam"
  | Frontend_dRast.C_Expr_EStr (dtb__330, dtb__331) -> "EStr"
  | Frontend_dRast.C_Expr_EInt (dtb__332, dtb__333) -> "EInt"
  | Frontend_dRast.C_Expr_EVar (dtb__334, dtb__335) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 1997 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__336) -> (match dtb__336 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__337) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__337).Elab_dTypes.f_DtCtor_dtCtorType)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__338) -> true
  | Base_dDiag.C_Check_ErrC (dtb__339) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__340) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__340)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__341) -> true
  | Base_dDiag.C_Check_ErrC (dtb__342) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2033 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPiWithMetasFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec } else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347) -> (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__348; B_dData_dPair.f_Pair_second = dtb__349 } -> ((((v_stripPiWithMetasFuel (fuel - 1)) ctx) dtb__349) ((Core_dEval.v_applyClosure dtb__347) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }
)))

# 2030 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_stripPiWithMetas = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_stripPiWithMetasFuel 64) ctx) ec) v))

# 2022 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppResultMatches = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (v : Core_dTerm.t_Value) -> (match (((v_stripPiWithMetas ctx) ec) v) with
  | { B_dData_dPair.f_Pair_first = dtb__350; B_dData_dPair.f_Pair_second = dtb__351 } -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__351)) (Elab_dTypes.v_ecSolsP dtb__351)) (Elab_dTypes.v_ctxDepth ctx)) dtb__350) expected) with
  | Base_dDiag.C_Check_OkC (dtb__352) -> true
  | Base_dDiag.C_Check_ErrC (dtb__353) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2014 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__354) -> (match dtb__354 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__355) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__355).Elab_dTypes.f_DtCtor_dtCtorType))
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__356) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__356))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2047 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueAppTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueAppCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__357, dtb__358) -> (match dtb__358 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__357))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2053 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (match dtb__360 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__359))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2194 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_patHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__361, dtb__362, dtb__363) -> (v_anyFieldHasOverCtor dtb__362)
  | Frontend_dRast.C_Pat_PAs (dtb__364, dtb__365, dtb__366) -> (v_patHasOverCtor dtb__365)
  | Frontend_dRast.C_Pat_PCon (dtb__367, dtb__368, dtb__369) -> (if (Frontend_dReserved.v_isInternalSyntaxName (Frontend_dRast_dName.v_rnameKey dtb__367)) then true else (v_anyPatHasOverCtor dtb__368))
  | _ -> false
))
# 2202 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyPatHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (if (v_patHasOverCtor dtb__370) then true else (v_anyPatHasOverCtor dtb__371))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 2207 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyFieldHasOverCtor = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__372, dtb__373) -> (match dtb__372 with
  | { B_dData_dPair.f_Pair_first = dtb__374; B_dData_dPair.f_Pair_second = dtb__375 } -> (if (v_patHasOverCtor dtb__375) then true else (v_anyFieldHasOverCtor dtb__373))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2212 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_clausesHaveOverCtor = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__376, dtb__377) -> (match dtb__376 with
  | { B_dData_dPair.f_Pair_first = dtb__378; B_dData_dPair.f_Pair_second = dtb__379 } -> (if (v_anyPatHasOverCtor dtb__378) then true else (v_clausesHaveOverCtor dtb__377))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2217 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandLocalFuns = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EAnn (dtb__380, dtb__381, dtb__382) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__380)) (fun (value2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EAnn (value2, dtb__381, dtb__382))))))
  | Frontend_dRast.C_Expr_EDo (dtb__383, dtb__384) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandDoStmt mc0)) dtb__383)) (fun (stmts2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EDo (stmts2, dtb__384))))))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__385, dtb__386, dtb__387) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__385)) (fun (base2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__386)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecUpdate (base2, fields2, dtb__387))))))))
  | Frontend_dRast.C_Expr_ERecord (dtb__388, dtb__389, dtb__390) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__389)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecord (dtb__388, fields2, dtb__390))))))
  | Frontend_dRast.C_Expr_EField (dtb__391, dtb__392, dtb__393) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__391)) (fun (base2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EField (base2, dtb__392, dtb__393))))))
  | Frontend_dRast.C_Expr_EIf (dtb__394, dtb__395, dtb__396, dtb__397) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__394)) (fun (c2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__395)) (fun (t2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__396)) (fun (el2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EIf (c2, t2, el2, dtb__397))))))))))
  | Frontend_dRast.C_Expr_ECase (dtb__398, dtb__399, dtb__400) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__398)) (fun (scrut2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__399)) (fun (alts2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase (scrut2, alts2, dtb__400))))))))
  | Frontend_dRast.C_Expr_ELet (dtb__401, dtb__402, dtb__403, dtb__404) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__401)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__402)) (fun (body2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELet (binds2, body2, dtb__403, dtb__404))))))))
  | Frontend_dRast.C_Expr_EPi (dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__408)) (fun (dom2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__409)) (fun (cod2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EPi (dtb__405, dtb__406, dtb__407, dom2, cod2, dtb__410))))))))
  | Frontend_dRast.C_Expr_EApp (dtb__411, dtb__412, dtb__413) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__411)) (fun (fn2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandLocalFuns mc0)) dtb__412)) (fun (args2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (fn2, args2, dtb__413))))))))
  | Frontend_dRast.C_Expr_ELam (dtb__414, dtb__415, dtb__416) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__415)) (fun (b2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELam (dtb__414, b2, dtb__416))))))
  | Frontend_dRast.C_Expr_EFloat (dtb__417, dtb__418) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EFloat (dtb__417, dtb__418))))
  | Frontend_dRast.C_Expr_EStr (dtb__419, dtb__420) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EStr (dtb__419, dtb__420))))
  | Frontend_dRast.C_Expr_EInt (dtb__421, dtb__422) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EInt (dtb__421, dtb__422))))
  | Frontend_dRast.C_Expr_EVar (dtb__423, dtb__424) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar (dtb__423, dtb__424))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__425, dtb__426) -> (if (v_clausesHaveOverCtor dtb__425) then (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELocalFun (dtb__425, dtb__426)))) else ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable mc0)) dtb__425))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))
# 2267 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBind = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__427; B_dData_dPair.f_Pair_second = dtb__428 } -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__428)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__427; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 2271 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandDoStmt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_DoStmt) -> (match mc1 with
  | Frontend_dRast.C_DoStmt_DLet (dtb__429, dtb__430) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__429)) (fun (b2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DLet (b2, dtb__430))))))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__431, dtb__432) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__431)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DExpr (v2, dtb__432))))))
  | Frontend_dRast.C_DoStmt_DBind (dtb__433, dtb__434, dtb__435) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__434)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DBind (dtb__433, v2, dtb__435))))))
  | _ -> failwith "DT: impossible branch"
))

# 2407 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPisWithMetas = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__436, dtb__437, dtb__438, dtb__439, dtb__440) -> (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__441; B_dData_dPair.f_Pair_second = dtb__442 } -> ((((v_stripPisWithMetas (fuel - 1)) ctx) dtb__442) ((Core_dEval.v_applyClosure dtb__440) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__441)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }))
)))

# 2422 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isMetaHeadedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VMeta (dtb__443, dtb__444) -> true
  | _ -> false
))

# 2429 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isRigidHeadValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VCon (dtb__445, dtb__446) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__447) -> (match dtb__447 with
  | Core_dTerm.C_Neutral_NVar (dtb__448, dtb__449, dtb__450) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb__451, dtb__452) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2440 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_remainingExplicitPis = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then 0 else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__453, dtb__454, dtb__455, dtb__456, dtb__457) -> (let v2 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__453, (Elab_dTypes.v_ctxDepth ctx), B_dData_dList.C_List_Nil)))) in (let rest = ((((v_remainingExplicitPis (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__457) v2)) in (if dtb__454 then rest else (rest + 1))))
  | _ -> 0
)))

# 2458 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryUseHint = (fun (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) (piTy : Core_dTerm.t_Value) -> (let nd_uscrut4 = ((((v_stripPisWithMetas 64) ctx) ec) piTy) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__458) -> (match dtb__458 with
  | { B_dData_dPair.f_Pair_first = dtb__459; B_dData_dPair.f_Pair_second = dtb__460 } -> (let forcedRes = ((Elab_dTypes.v_forceVal dtb__460) dtb__459) in (if ((v_isMetaHeadedValue dtb__460) forcedRes) then (if ((v_isRigidHeadValue dtb__460) expected) then (match ((((Elab_dMeta.v_convEc dtb__460) (Elab_dTypes.v_ctxDepth ctx)) expected) forcedRes) with
  | Base_dDiag.C_Check_ErrC (dtb__461) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__462) -> (B_dData_dMaybe.C_Maybe_Just (dtb__462))
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__463) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 2505 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowAndResult = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__464) -> (match dtb__464 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__465, dtb__466) -> (match dtb__466 with
  | B_dData_dList.C_List__x58__x58_ (dtb__467, dtb__468) -> (match dtb__468 with
  | B_dData_dList.C_List__x58__x58_ (dtb__469, dtb__470) -> (if (dtb__465 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__467; B_dData_dPair.f_Pair_second = dtb__469 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2511 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowOfValue = (fun (v : Core_dTerm.t_Value) -> (match (v_effRowAndResult v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__471) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__471)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2518 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNilRowValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VCon (dtb__472, dtb__473) -> (dtb__472 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 2525 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryLabelTail = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__474, dtb__475) -> (if (dtb__474 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__475 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__476, dtb__477) -> (match dtb__477 with
  | B_dData_dList.C_List__x58__x58_ (dtb__478, dtb__479) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__478 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2536 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_shortGlobalName = (fun (g : string) -> (Base_dSource.v_lastSeg g))

# 2546 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_labelHeadArgs = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__480, dtb__481) -> ((v_labelHeadArgs (String.concat "" [mc0; " "; ((Core_dEval.v_showValueAt 6) dtb__480)])) dtb__481)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 2540 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLabelText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__482) -> (match dtb__482 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__483, dtb__484) -> ((v_labelHeadArgs (v_shortGlobalName dtb__483)) dtb__484)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 2551 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__485) -> dtb__485
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 2558 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryText = (fun (ec : Elab_dTypes.t_Ec) (n : Core_dTerm.t_Value) (h : Core_dTerm.t_Value) -> (if (((v_rowNameText ec) n) = "default") then ((v_rowLabelText ec) h) else (String.concat "" [((v_rowLabelText ec) h); "@"; ((v_rowNameText ec) n)])))

# 2566 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_namedLabelParts = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__486) -> (match dtb__486 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__487, dtb__488) -> (if (dtb__487 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut6 = dtb__488 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__489, dtb__490) -> (match dtb__490 with
  | B_dData_dList.C_List__x58__x58_ (dtb__491, dtb__492) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__489; B_dData_dPair.f_Pair_second = dtb__491 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2578 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryTextOf = (fun (ec : Elab_dTypes.t_Ec) (label : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_namedLabelParts ec) label) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_rowLabelText ec) label)
  | B_dData_dMaybe.C_Maybe_Just (dtb__493) -> (match dtb__493 with
  | { B_dData_dPair.f_Pair_first = dtb__494; B_dData_dPair.f_Pair_second = dtb__495 } -> (((v_rowEntryText ec) dtb__494) dtb__495)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2585 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowEffectLabels = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__496, dtb__497) -> (if (dtb__496 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (dtb__496 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__496, dtb__497))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__498) -> (match dtb__498 with
  | { B_dData_dPair.f_Pair_first = dtb__499; B_dData_dPair.f_Pair_second = dtb__500 } -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) dtb__499) then B_dData_dMaybe.C_Maybe_Nothing else (match (((v_rowEffectLabels (fuel - 1)) ec) dtb__500) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__501) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (((v_rowEntryTextOf ec) dtb__499), dtb__501))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2611 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowNonDefaultHostEntries = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__502, dtb__503) -> (if (dtb__502 = Base_dIntrinsics.v_effRowNilCtor) then B_dData_dList.C_List_Nil else (if (dtb__502 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__502, dtb__503))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__504) -> (match dtb__504 with
  | { B_dData_dPair.f_Pair_first = dtb__505; B_dData_dPair.f_Pair_second = dtb__506 } -> (let rest = (((v_rowNonDefaultHostEntries (fuel - 1)) ec) dtb__506) in (let nd_uscrut13 = ((v_namedLabelParts ec) dtb__505) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> rest
  | B_dData_dMaybe.C_Maybe_Just (dtb__507) -> (match dtb__507 with
  | { B_dData_dPair.f_Pair_first = dtb__508; B_dData_dPair.f_Pair_second = dtb__509 } -> (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) dtb__509) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VNeutral (dtb__510) -> (match dtb__510 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__511, dtb__512) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb__511) then (if (((v_rowNameText ec) dtb__508) = "default") then rest else (B_dData_dList.C_List__x58__x58_ ((((v_rowEntryText ec) dtb__508) dtb__509), rest))) else rest)
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

# 2637 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_joinEffectLabels = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__513, dtb__514) -> (match dtb__514 with
  | B_dData_dList.C_List_Nil -> dtb__513
  | _ -> (String.concat "" [dtb__513; ", "; (v_joinEffectLabels dtb__514)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2645 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_unhandledEffectLabel = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) -> (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__515) -> (if ((v_isNilRowValue ec) dtb__515) then (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__516) -> (match (((v_rowEffectLabels 64) ec) dtb__516) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__517) B_dData_dList.C_List_Nil) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__517)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2667 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_sameLabelValue = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let defs = (Elab_dTypes.v_ecDefTbl ec) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let fa = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) a) in (let fb = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) b) in (let nd_uscrut7 = (((Core_dEval.v_valueEqFuel Core_dTerm.v_defaultFuel) fa) fb) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__518) -> (if dtb__518 then true else false)
  | _ -> false
)))))))

# 2678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowContainsValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (expected : Core_dTerm.t_Value) (label : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VCon (dtb__519, dtb__520) -> (if (dtb__519 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__519, dtb__520))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__521) -> (match dtb__521 with
  | { B_dData_dPair.f_Pair_first = dtb__522; B_dData_dPair.f_Pair_second = dtb__523 } -> (if (((v_sameLabelValue ec) label) dtb__522) then true else ((((v_rowContainsValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__523)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
)))

# 2693 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowSubValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (actual : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) actual) with
  | Core_dTerm.C_Value_VCon (dtb__524, dtb__525) -> (if (dtb__524 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__524 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__524, dtb__525))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__526) -> (match dtb__526 with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> (if ((((v_rowContainsValue ec) (fuel - 1)) expected) dtb__527) then ((((v_rowSubValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__528)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)))

# 2757 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_weakenLabelTerm = (fun (d : int) (label : Core_dTerm.t_Value) (tailF : Core_dTerm.t_Value) (result : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.weaken")), ((Core_dEval.v_quote d) label), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) tailF), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) result), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)))

# 2713 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryEffLift = (fun (ctx : Elab_dTypes.t_Ctx) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.weaken") globals) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__529) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__530) -> (let nd_uscrut11 = (v_rowEntryLabelTail ((Elab_dTypes.v_forceVal ec) (B_dData_dPair.v_firstOf dtb__530))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__531) -> (match dtb__531 with
  | { B_dData_dPair.f_Pair_first = dtb__532; B_dData_dPair.f_Pair_second = dtb__533 } -> (let tailF = ((Elab_dTypes.v_forceVal ec) dtb__533) in (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) tailF) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__534) -> (match ((((Elab_dMeta.v_convEc ec) d) (B_dData_dPair.v_secondOf dtb__530)) (B_dData_dPair.v_secondOf dtb__534)) with
  | Base_dDiag.C_Check_ErrC (dtb__535) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__536) -> (let actualRow = (B_dData_dPair.v_firstOf dtb__534) in (if ((((v_rowSubValue dtb__536) 64) actualRow) (B_dData_dPair.v_firstOf dtb__530)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = term; B_dData_dPair.f_Pair_second = dtb__536 })) else (if ((v_isNilRowValue dtb__536) actualRow) then (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.raise") globals) dtb__536) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__537) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.raise")), ((Core_dEval.v_quote d) (B_dData_dPair.v_firstOf dtb__530)), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) (B_dData_dPair.v_secondOf dtb__530)), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)); B_dData_dPair.f_Pair_second = dtb__536 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Elab_dMeta.v_convEc dtb__536) d) actualRow) tailF) with
  | Base_dDiag.C_Check_ErrC (dtb__538) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__539) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((((v_weakenLabelTerm d) dtb__532) tailF) (B_dData_dPair.v_secondOf dtb__530)) term); B_dData_dPair.f_Pair_second = dtb__539 }))
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

# 2861 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeHeadTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__540) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__540) then (Core_dTerm.C_Term_TRecord (name, B_dData_dList.C_List_Nil)) else (Core_dTerm.C_Term_TGlobal (name)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2868 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeAppTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__541) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__541) then (Core_dTerm.C_Term_TRecord (name, args)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 3144 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromInt")), t, Core_dTerm.C_Rig_Rig1)))

# 3148 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromFloatTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromFloat")), t, Core_dTerm.C_Rig_Rig1)))

# 3151 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil))))

# 3154 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isStringTyValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__542) -> (match dtb__542 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__543, dtb__544) -> (match dtb__544 with
  | B_dData_dList.C_List_Nil -> (dtb__543 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 3236 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorSpineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__545) -> { B_dData_dPair.f_Pair_first = dtb__545; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__546, dtb__547) -> { B_dData_dPair.f_Pair_first = dtb__546; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__547) }
  | Core_dTerm.C_Term_TApp (dtb__548, dtb__549, dtb__550) -> (match (v_ctorSpineOfType dtb__548) with
  | { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = dtb__552 } -> { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__552) (B_dData_dList.C_List__x58__x58_ (dtb__549, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 3232 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorResultArgs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__553, dtb__554, dtb__555, dtb__556, dtb__557) -> (v_ctorResultArgs dtb__557)
  | _ -> (B_dData_dPair.v_secondOf (v_ctorSpineOfType mc0))
))

# 3244 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__558, dtb__559, dtb__560, dtb__561, dtb__562) -> (v_dropPis dtb__562)
  | _ -> mc0
))

# 3248 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_identityArgs = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__563, dtb__564) -> (match dtb__563 with
  | Core_dTerm.C_Term_TVar (dtb__565, dtb__566, dtb__567) -> (if (dtb__566 = ((mc1 - 1) - mc0)) then (((v_identityArgs (mc0 + 1)) mc1) dtb__564) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 3258 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorIdentitySpine = (fun (fam : string) (ctor : Elab_dTypes.t_DtCtor) -> (let k = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor)) in (let args = (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor)) in (match (v_ctorSpineOfType (v_dropPis (Elab_dTypes.v_dtCtorType ctor))) with
  | { B_dData_dPair.f_Pair_first = dtb__568; B_dData_dPair.f_Pair_second = dtb__569 } -> (if (dtb__568 = fam) then (if ((B_dData_dList.v_length args) > 0) then (if ((B_dData_dList.v_length args) <= k) then (((v_identityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
))))

# 3274 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_takeRigsGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__570, dtb__571) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__570), ((v_takeRigsGo (mc0 - 1)) dtb__571))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 3271 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_takeRigs = (fun (n : int) (bs : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_takeRigsGo n) bs))

# 3292 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorFamilyArgsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc4 : int) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__572, dtb__573) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__574, dtb__575) -> (match ((Elab_dTypes.v_forceVal mc0) mc1) with
  | Core_dTerm.C_Value_VPi (dtb__576, dtb__577, dtb__578, dtb__579, dtb__580) -> (if dtb__577 then ((((((v_ctorFamilyArgsGo mc0) ((Core_dEval.v_applyClosure dtb__580) dtb__572)) dtb__573) dtb__575) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote mc4) dtb__572); B_dData_dPair.f_Pair_second = dtb__574 }, mc5))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 3278 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFamilyArgs = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ctor : Elab_dTypes.t_DtCtor) (expected : Core_dTerm.t_Value) -> (let fam = (Elab_dTypes.v_dtCtorFamily ctor) in (if ((v_ctorIdentitySpine fam) ctor) then (let nd_uscrut5 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__581) -> (match dtb__581 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__582, dtb__583) -> (let arity = (B_dData_dList.v_length (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor))) in (if (dtb__582 = fam) then (if ((B_dData_dList.v_length dtb__583) = arity) then ((((((v_ctorFamilyArgsGo ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType ctor))) dtb__583) ((v_takeRigs arity) (Elab_dTypes.v_dtCtorTelescope ctor))) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 3314 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natPatGo = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n <= 0) then (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natZeroCtor), B_dData_dList.C_List_Nil, sp)) else (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natSuccCtor), (B_dData_dList.C_List__x58__x58_ (((v_natPatGo (n - 1)) sp), B_dData_dList.C_List_Nil)), sp))))

# 3310 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natPatOf = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC (((v_natPatGo n) sp)))))

# 3322 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat) -> (let dtnat__584 = mc0 in (if (dtnat__584 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__585 = (dtnat__584 - 1) in (match mc4 with
  | Frontend_dRast.C_Pat_PCon (dtb__586, dtb__587, dtb__588) -> (if (Frontend_dReserved.v_isListNilSyntax (Frontend_dRast_dName.v_rnameKey dtb__586)) then (match (((v_litFamilyCtor mc1) ((v_listLitFamily mc1) mc3)) "Nil") with
  | B_dData_dMaybe.C_Maybe_Just (dtb__589) -> (((((((v_resolveCtorPatFuel dtb__585) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__589)) dtb__587) dtb__588)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__587, dtb__588)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isListConsSyntax (Frontend_dRast_dName.v_rnameKey dtb__586)) then (match ((v_litFamilyCons mc1) ((v_listLitFamily mc1) mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__590) -> (((((((v_resolveCtorPatFuel dtb__585) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__590)) dtb__587) dtb__588)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__587, dtb__588)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__586)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor mc1) dtb__588) (B_dData_dMaybe.C_Maybe_Just (mc3))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__586))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__586)))) (fun (target : string) -> (((((((v_resolveCtorPatFuel dtb__585) mc1) mc2) mc3) target) dtb__587) dtb__588))) else (((((((v_resolveCtorPatFuel dtb__585) mc1) mc2) mc3) (Frontend_dRast_dName.v_rnameKey dtb__586)) dtb__587) dtb__588))))
  | Frontend_dRast.C_Pat_PInt (dtb__591, dtb__592) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__591) dtb__592)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | Frontend_dRast.C_Pat_PAs (dtb__593, dtb__594, dtb__595) -> (match dtb__594 with
  | Frontend_dRast.C_Pat_PInt (dtb__596, dtb__597) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__596) dtb__597)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PAs (dtb__593, p, dtb__595)); B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | Frontend_dRast.C_Pat_PRecord (dtb__598, dtb__599, dtb__600) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)))))
# 3353 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 3369 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3401 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3397 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverAlts = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 3443 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3425 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3420 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverFunPats = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 3524 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3547 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3566 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3578 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_doChainBuild = (fun (mc0 : string) (mc1 : t_DoChainStep B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__689, dtb__690) -> (match dtb__689 with
  | C_DoChainStep_DoChainStep (dtb__691, dtb__692, dtb__693, dtb__694) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), dtb__693)), (B_dData_dList.C_List__x58__x58_ (dtb__692, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__691; B_dData_dPair.f_Pair_second = dtb__694 }, B_dData_dList.C_List_Nil)), ((((v_doChainBuild mc0) dtb__690) mc2) mc3), dtb__693)), B_dData_dList.C_List_Nil)))), dtb__693))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 3587 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainFallback = (fun (chain : t_DoChain) -> ((((v_doChainBuild (chain).f_DoChain_doChainCanonical) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast) (chain).f_DoChain_doChainSpan))

# 3594 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_splitDoSpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__695, dtb__696) -> (match ((v_splitDoSpine ((Core_dEval.v_applyValue mc0) dtb__695)) dtb__696) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__695 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__697) -> (B_dData_dMaybe.C_Maybe_Just (dtb__697))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 3602 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_splitDoExpected = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VNeutral (dtb__698) -> (match dtb__698 with
  | Core_dTerm.C_Neutral_NVar (dtb__699, dtb__700, dtb__701) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__699, dtb__700, B_dData_dList.C_List_Nil))))) dtb__701)
  | Core_dTerm.C_Neutral_NGlobal (dtb__702, dtb__703) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__702, B_dData_dList.C_List_Nil))))) dtb__703)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3620 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3635 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindHeadOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (match ((Elab_dTypes.v_ctxLookup bindName) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__776) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup bindName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__777) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (bindName)); B_dData_dPair.f_Pair_second = dtb__777 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 3646 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3658 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictDefer = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__782; B_dData_dPair.f_Pair_second = dtb__783 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__782; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__783) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__783) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)))

# 3667 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictStep = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dom) then ((((v_doDictDefer ctx) ec) dom) sp) else (let nd_uscrut6 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) ((Elab_dTypes.v_forceVal ec) dom)) sp) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_ErrC (dtb__784) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (if ((Elab_dDict.v_isRigidDictArg ec) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (Base_dDiag.C_Check_ErrC (dtb__784))))
  | Base_dDiag.C_Check_OkC (dtb__785) -> (match dtb__785 with
  | { B_dData_dPair.f_Pair_first = dtb__786; B_dData_dPair.f_Pair_second = dtb__787 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__786; B_dData_dPair.f_Pair_second = dtb__787 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3695 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 3722 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
  | { B_dData_dPair.f_Pair_first = dtb__826; B_dData_dPair.f_Pair_second = dtb__827 } -> (if (((v_natLitCaseFast dtb__827) dtb__826) alts) then ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__827) alts)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> ((((((((((v_checkNatLitCaseFuel (fuel - 1)) globals) ctx) ec3) (v_natToIntTerm dtb__824)) dtb__824) v_natTyValue) alts) expected) sp))) else ((Base_dCommon.v_bind ((((v_resolveOverAlts dtb__827) ctx) dtb__826) alts)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__828; B_dData_dPair.f_Pair_second = dtb__829 } -> (let caseFuel = (((B_dTrait_dOrd.v_max B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (fuel - 1)) (Elab_dCoverage.v_coverageFuelFor ((B_dData_dList.v_map (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)))) dtb__828))) in ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__829) dtb__828)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> (if (v_needsMatrixCase dtb__828) then ((((((((v_checkCaseMatrixFuel caseFuel) globals) ctx) ec3) scrut) dtb__828) expected) sp) else (((((((((v_checkCaseFamFuel caseFuel) globals) ctx) ec3) dtb__824) dtb__826) dtb__828) expected) sp)))))
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
  | Core_dTerm.C_Value_VNeutral (dtb__830) -> (match dtb__830 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__831, dtb__832) -> (if (if (Base_dIntrinsics.v_isBoolCanonical dtb__831) then ((B_dData_dList.v_length dtb__832) = 0) else false) then ((((((((v_checkBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__831 = "Int") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__831 = "String") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_checkCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__831) dtb__832) alts) expected) sp))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
))))
# 214 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 234 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (target : string) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((((((v_boolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) B_dData_dMaybe.C_Maybe_Nothing)))
# 241 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 281 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__859; B_dData_dPair.f_Pair_second = dtb__860 } -> (match dtb__860 with
  | { B_dData_dPair.f_Pair_first = dtb__861; B_dData_dPair.f_Pair_second = dtb__862 } -> (if dtb__861 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__859; B_dData_dPair.f_Pair_second = dtb__862 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 295 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 322 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 339 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__884; B_dData_dPair.f_Pair_second = dtb__885 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__884)), scrutTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__885 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 380 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__886; B_dData_dPair.f_Pair_second = dtb__887 } -> (match dtb__887 with
  | { B_dData_dPair.f_Pair_first = dtb__888; B_dData_dPair.f_Pair_second = dtb__889 } -> (if dtb__888 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__886; B_dData_dPair.f_Pair_second = dtb__889 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 392 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 417 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 433 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) binderTy) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) binderTy) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__909; B_dData_dPair.f_Pair_second = dtb__910 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__909)), bindTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__910 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 447 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseOfFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (fam : string) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
  | B_dData_dMaybe.C_Maybe_Just (dtb__911) -> ((Base_dCommon.v_bind (((((((((((v_elabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__911) idxs) ((Elab_dTypes.v_evalCtx ctx) scrutTerm)) expected) alts) B_dData_dList.C_List_Nil)) (fun (p : (Core_dTerm.t_CaseAlt B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__912; B_dData_dPair.f_Pair_second = dtb__913 } -> (((((((((Elab_dCase.v_checkCaseDone dtb__913) ctx) dtb__911) idxs) alts) expected) sp) scrutTerm) dtb__912)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 463 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferCaseEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let pmeta = (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__914; B_dData_dPair.f_Pair_second = dtb__915 } -> (let metaTy = ((Elab_dTypes.v_evalCtx ctx) dtb__914) in ((Base_dCommon.v_bind ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) dtb__915) scrut) alts) metaTy) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = dtb__917 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = metaTy; B_dData_dPair.f_Pair_second = dtb__917 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 483 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 757 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 799 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCore = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__940) -> ((Base_dCommon.v_bind (((((v_inferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__940)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__941) -> (Base_dDiag.C_Check_OkC (dtb__941))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) (v_doChainFallback dtb__940))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 817 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((v_inferEFuelCorePlainGo fuel) globals) ctx) ec) expr)))
# 821 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
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
# 1080 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 1106 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 1135 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 1153 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 1217 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = fn in (match nd_uscrut8 with
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
# 1287 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1096, dtb__1097) -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1096)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1098) -> (Base_dDiag.C_Check_OkC (dtb__1098))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1302 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun (pf : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pf in (match nd_uscrut9 with
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
# 1318 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((v_inferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1473 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal ec) ty) in (match forced with
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
  | B_dData_dList.C_List__x58__x58_ (dtb__1166, dtb__1167) -> (let ec0 = (match hint with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1174) -> (if (((((v_remainingExplicitPis 64) ctx) ec) forced) = (B_dData_dList.v_length args)) then (match ((((v_tryUseHint ctx) dtb__1174) ec) forced) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1175) -> dtb__1175
  | _ -> failwith "DT: impossible branch"
) else ec)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec0) sp) dtb__1107) dtb__1109) dtb__1110)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((v_expandArgListLit ec0) dtb__1110) dtb__1166)) (fun (a2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1110)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
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
  | B_dData_dList.C_List__x58__x58_ (dtb__1176, dtb__1177) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_exprSpan dtb__1176)) Base_dDiagnostics_dTc.C_TcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
))))
# 1613 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_deferDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1178; B_dData_dPair.f_Pair_second = dtb__1179 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ((((((Elab_dTypes.v_ecAddConstraint dtb__1179) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__1179) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx))) ((Core_dEval.v_applyClosure clo) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1178))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1180; B_dData_dPair.f_Pair_second = dtb__1181 } -> (match dtb__1181 with
  | { B_dData_dPair.f_Pair_first = dtb__1182; B_dData_dPair.f_Pair_second = dtb__1183 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1178; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1180)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1182; B_dData_dPair.f_Pair_second = dtb__1183 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1631 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dom : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dDict.v_dictClassArg ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1184) -> (match ((Elab_dDict.v_dictArgKind ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1185) -> (let nd_uscrut11 = dtb__1184 in (match nd_uscrut11 with
  | Core_dTerm.C_Value_VMeta (dtb__1186, dtb__1187) -> (match dtb__1187 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1184) dtb__1185) args) sp)) (fun (ecProbe : Elab_dTypes.t_Ec) -> (match ((Core_dTerm.v_metaLookup dtb__1186) (Elab_dTypes.v_ecSolTbl ecProbe)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1188) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) dtb__1186) B_dData_dList.C_List_Nil) dtb__1188) with
  | Base_dDiag.C_Check_OkC (dtb__1189) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__1189))))
  | Base_dDiag.C_Check_ErrC (dtb__1190) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1184) dtb__1185) args) sp)
)
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1184) dtb__1185) args) sp)
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1659 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomGoKFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (argTy : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dList.C_List__x58__x58_ (dtb__1191, dtb__1192) -> (let nd_uscrut11 = (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1191) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__1193) -> (match dtb__1193 with
  | { B_dData_dPair.f_Pair_first = dtb__1194; B_dData_dPair.f_Pair_second = dtb__1195 } -> (match dtb__1195 with
  | { B_dData_dPair.f_Pair_first = dtb__1196; B_dData_dPair.f_Pair_second = dtb__1197 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1197) dtb__1196) in (if (Core_dTerm.v_isTypeValue forced) then ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1197) ctx) argTy) argKind) dtb__1192) sp) else (if (((((Elab_dDict.v_argHeadMatchesKind globals) dtb__1197) ctx) forced) argKind) then (match ((((Elab_dMeta.v_convEc dtb__1197) (Elab_dTypes.v_ctxDepth ctx)) argTy) (Elab_dDict.v_neutralHeadOrSelf forced)) with
  | Base_dDiag.C_Check_OkC (dtb__1198) -> (Base_dDiag.C_Check_OkC (dtb__1198))
  | Base_dDiag.C_Check_ErrC (dtb__1199) -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1197) ctx) argTy) argKind) dtb__1192) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1197) ctx) argTy) argKind) dtb__1192) sp))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1200) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1791 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1201) -> ((((((((v_specializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1201) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1801 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = args in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1202, dtb__1203) -> (match dtb__1203 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1204, dtb__1205) -> (match dtb__1205 with
  | B_dData_dList.C_List_Nil -> (if ((v_isNatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1202) v_natTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1206; B_dData_dPair.f_Pair_second = dtb__1207 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1207) dtb__1204) v_natTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1208; B_dData_dPair.f_Pair_second = dtb__1209 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1206) dtb__1208); B_dData_dPair.f_Pair_second = dtb__1209 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isIntTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1202) v_intTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1210; B_dData_dPair.f_Pair_second = dtb__1211 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1211) dtb__1204) v_intTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1212; B_dData_dPair.f_Pair_second = dtb__1213 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1210) dtb__1212); B_dData_dPair.f_Pair_second = dtb__1213 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isFloatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1202) v_floatTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1214; B_dData_dPair.f_Pair_second = dtb__1215 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1215) dtb__1204) v_floatTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1216; B_dData_dPair.f_Pair_second = dtb__1217 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1214) dtb__1216); B_dData_dPair.f_Pair_second = dtb__1217 }))))
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
# 1847 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1218) -> (((((((v_specializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1218) args) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1857 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1219, dtb__1220) -> (match dtb__1220 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1221, dtb__1222) -> (match dtb__1222 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1219)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1223; B_dData_dPair.f_Pair_second = dtb__1224 } -> (match dtb__1224 with
  | { B_dData_dPair.f_Pair_first = dtb__1225; B_dData_dPair.f_Pair_second = dtb__1226 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1226) dtb__1221)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1227; B_dData_dPair.f_Pair_second = dtb__1228 } -> (match dtb__1228 with
  | { B_dData_dPair.f_Pair_first = dtb__1229; B_dData_dPair.f_Pair_second = dtb__1230 } -> (if (if ((v_isNatTy dtb__1230) dtb__1225) then ((v_isNatTy dtb__1230) dtb__1229) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1223) dtb__1227); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1230 } })))) else (if (if ((v_isIntTy dtb__1230) dtb__1225) then ((v_isIntTy dtb__1230) dtb__1229) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1223) dtb__1227); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1230 } })))) else (if (if ((v_isFloatTy dtb__1230) dtb__1225) then ((v_isFloatTy dtb__1230) dtb__1229) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1223) dtb__1227); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_floatTyValue; B_dData_dPair.f_Pair_second = dtb__1230 } })))) else (if (if ((v_isNatTy dtb__1230) dtb__1225) then ((v_isIntTy dtb__1230) dtb__1229) else false) then (match (v_isEIntExpr dtb__1221) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1231) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1221)) dtb__1231)) (fun (bNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1223) bNat); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1230 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) (v_natToIntTerm dtb__1223)) dtb__1227); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1230 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_isIntTy dtb__1230) dtb__1225) then ((v_isNatTy dtb__1230) dtb__1229) else false) then (match (v_isEIntExpr dtb__1219) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1232) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1219)) dtb__1232)) (fun (aNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) aNat) dtb__1227); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1230 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1223) (v_natToIntTerm dtb__1227)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1230 } }))))
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
# 1897 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1233) -> (let simpleComp = (let nd_uscrut8 = (v_handleOperand expr) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__1240) -> (match dtb__1240 with
  | { B_dData_dPair.f_Pair_first = dtb__1241; B_dData_dPair.f_Pair_second = dtb__1242 } -> (v_isSimpleComp dtb__1241)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let firstCall = (if simpleComp then ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in (let thirdCall = (if simpleComp then ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in ((Base_dCommon.v_bind firstCall) (fun (callExpr : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1234) -> (Base_dDiag.C_Check_OkC (dtb__1234))
  | Base_dDiag.C_Check_ErrC (dtb__1235) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1236) -> (Base_dDiag.C_Check_OkC (dtb__1236))
  | Base_dDiag.C_Check_ErrC (dtb__1237) -> ((Base_dCommon.v_bind thirdCall) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match ((Base_dObs.v_obsCheck "vuna.elab.term.retry-third") (fun (_u : int) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Base_dDiag.C_Check_OkC (dtb__1238) -> (Base_dDiag.C_Check_OkC (dtb__1238))
  | Base_dDiag.C_Check_ErrC (dtb__1239) -> (Base_dDiag.C_Check_ErrC (dtb__1235))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1243) -> ((Base_dObs.v_obsCheck "vuna.elab.term.infer") (fun (_u : int) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1244) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1245) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) expected))) dtb__1245) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dObs.v_obsDefCheckAt 3) "vuna.elab.term.core") (v_exprFormName expr)) (fun (_u : int) -> ((((((v_checkEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1978 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRow = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1246) -> ((Base_dCommon.v_bind ((((((v_checkDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1246) expected)) (fun (r : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1247) -> (Base_dDiag.C_Check_OkC (dtb__1247))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) (v_doChainFallback dtb__1246)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 2059 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuelNoRowPlainGo fuel) globals) ctx) ec) expr) expected)))
# 2063 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EAnn (dtb__1248, dtb__1249, dtb__1250) -> ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1249)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pt in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1251; B_dData_dPair.f_Pair_second = dtb__1252 } -> (match dtb__1252 with
  | { B_dData_dPair.f_Pair_first = dtb__1253; B_dData_dPair.f_Pair_second = dtb__1254 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1254) dtb__1248) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1251))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__1255, dtb__1256) -> (if (v_clausesHaveOverCtor dtb__1255) then ((Base_dCommon.v_bind ((((v_resolveOverFunPats ec) ctx) expected) dtb__1255)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__1257; B_dData_dPair.f_Pair_second = dtb__1258 } -> ((Base_dCommon.v_bind ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable dtb__1258)) dtb__1257)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1258) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__1255, dtb__1256)))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Frontend_dRast.C_Expr_ELet (dtb__1259, dtb__1260, dtb__1261, dtb__1262) -> (((((((((v_checkLetFuel (fuel - 1)) globals) ctx) ec) dtb__1259) dtb__1260) dtb__1261) expected) dtb__1262)
  | Frontend_dRast.C_Expr_ECase (dtb__1263, dtb__1264, dtb__1265) -> ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1263) dtb__1264) expected) dtb__1265)
  | Frontend_dRast.C_Expr_EIf (dtb__1266, dtb__1267, dtb__1268, dtb__1269) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1266) dtb__1269)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__1270; B_dData_dPair.f_Pair_second = dtb__1271 } -> (let attempt = ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1271) dtb__1267) expected)) (fun (pt : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__1274; B_dData_dPair.f_Pair_second = dtb__1275 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1275) dtb__1268) expected)) (fun (pe : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__1276; B_dData_dPair.f_Pair_second = dtb__1277 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1270, dtb__1274, dtb__1276)); B_dData_dPair.f_Pair_second = dtb__1277 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) in (match attempt with
  | Base_dDiag.C_Check_OkC (dtb__1272) -> (Base_dDiag.C_Check_OkC (dtb__1272))
  | Base_dDiag.C_Check_ErrC (dtb__1273) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Expr_EPi (dtb__1278, dtb__1279, dtb__1280, dtb__1281, dtb__1282, dtb__1283) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Frontend_dRast.C_Expr_EApp (dtb__1284, dtb__1285, dtb__1286) -> (match dtb__1284 with
  | Frontend_dRast.C_Expr_EVar (dtb__1287, dtb__1288) -> (match dtb__1287 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1289) -> (if (dtb__1289 = "->") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1289 = "Type") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1287)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1286) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1287, dtb__1288))) dtb__1285) expected) dtb__1286))))
  | _ -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1287)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1286) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1287, dtb__1288))) dtb__1285) expected) dtb__1286))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) dtb__1284) dtb__1285) expected) dtb__1286)
)
  | Frontend_dRast.C_Expr_ELam (dtb__1290, dtb__1291, dtb__1292) -> ((((((((v_checkLamFuel (fuel - 1)) globals) ctx) ec) dtb__1290) dtb__1291) expected) dtb__1292)
  | Frontend_dRast.C_Expr_EFloat (dtb__1293, dtb__1294) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1295, dtb__1296) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1297) -> (match dtb__1297 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1298, dtb__1299) -> (match dtb__1299 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1298 = Base_dIntrinsics.v_floatTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1293)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1294) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1300) -> (match dtb__1300 with
  | { B_dData_dPair.f_Pair_first = dtb__1301; B_dData_dPair.f_Pair_second = dtb__1302 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1302) dtb__1301) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1294) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1303) -> (match dtb__1303 with
  | { B_dData_dPair.f_Pair_first = dtb__1304; B_dData_dPair.f_Pair_second = dtb__1305 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1305) dtb__1304) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1294) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1306) -> (match dtb__1306 with
  | { B_dData_dPair.f_Pair_first = dtb__1307; B_dData_dPair.f_Pair_second = dtb__1308 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1308) dtb__1307) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1294) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1309) -> (match dtb__1309 with
  | { B_dData_dPair.f_Pair_first = dtb__1310; B_dData_dPair.f_Pair_second = dtb__1311 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1311) dtb__1310) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EStr (dtb__1312, dtb__1313) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1314, dtb__1315) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1316) -> (match dtb__1316 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1317, dtb__1318) -> (match dtb__1318 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1317 = Base_dIntrinsics.v_strTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1312)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1313) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1319) -> (match dtb__1319 with
  | { B_dData_dPair.f_Pair_first = dtb__1320; B_dData_dPair.f_Pair_second = dtb__1321 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1321) dtb__1320) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1313) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1322) -> (match dtb__1322 with
  | { B_dData_dPair.f_Pair_first = dtb__1323; B_dData_dPair.f_Pair_second = dtb__1324 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1324) dtb__1323) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1313) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1325) -> (match dtb__1325 with
  | { B_dData_dPair.f_Pair_first = dtb__1326; B_dData_dPair.f_Pair_second = dtb__1327 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1327) dtb__1326) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1313) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1328) -> (match dtb__1328 with
  | { B_dData_dPair.f_Pair_first = dtb__1329; B_dData_dPair.f_Pair_second = dtb__1330 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1330) dtb__1329) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EInt (dtb__1331, dtb__1332) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1333, dtb__1334) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1335) -> (match dtb__1335 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1336, dtb__1337) -> (match dtb__1337 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1336 = Base_dIntrinsics.v_natTypeName) then ((Base_dCommon.v_bind ((v_natLitResult dtb__1332) dtb__1331)) (fun (t : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = ec })))) else (if (dtb__1336 = Base_dIntrinsics.v_intTypeName) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1332) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1338) -> (match dtb__1338 with
  | { B_dData_dPair.f_Pair_first = dtb__1339; B_dData_dPair.f_Pair_second = dtb__1340 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1340) dtb__1339) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1332) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1341) -> (match dtb__1341 with
  | { B_dData_dPair.f_Pair_first = dtb__1342; B_dData_dPair.f_Pair_second = dtb__1343 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1343) dtb__1342) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1332) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1344) -> (match dtb__1344 with
  | { B_dData_dPair.f_Pair_first = dtb__1345; B_dData_dPair.f_Pair_second = dtb__1346 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1346) dtb__1345) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1332) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1347) -> (match dtb__1347 with
  | { B_dData_dPair.f_Pair_first = dtb__1348; B_dData_dPair.f_Pair_second = dtb__1349 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1349) dtb__1348) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EVar (dtb__1350, dtb__1351) -> (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1350)) then (let pmeta = (((((Elab_dMetaSpans.v_newHoleMeta ctx) ec) dtb__1351) expected) (Frontend_dReserved.v_holeNameOf (Frontend_dRast_dName.v_rnameKey dtb__1350))) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__1352; B_dData_dPair.f_Pair_second = dtb__1353 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1352; B_dData_dPair.f_Pair_second = dtb__1353 }))
  | _ -> failwith "DT: impossible branch"
)) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1350)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1351) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1350))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1350)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1351))) B_dData_dList.C_List_Nil) expected) dtb__1351))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1350)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1350))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1350))) expected) dtb__1351)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1351))) B_dData_dList.C_List_Nil) expected) dtb__1351))) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1350, dtb__1351))) B_dData_dList.C_List_Nil) expected) dtb__1351))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
))))
# 2180 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 2282 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 2292 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : bool) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1354, dtb__1355) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((((v_checkLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1354) dtb__1355) mc5) mc6) mc7) mc8))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 2301 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetOneFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bnd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (B_dData_dPair.v_firstOf bnd) with
  | Frontend_dRast.C_Pat_PVar (dtb__1356, dtb__1357) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pv in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__1358; B_dData_dPair.f_Pair_second = dtb__1359 } -> (match dtb__1359 with
  | { B_dData_dPair.f_Pair_first = dtb__1360; B_dData_dPair.f_Pair_second = dtb__1361 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1360) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1356) dtb__1360) ctx) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx2) dtb__1361) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1362; B_dData_dPair.f_Pair_second = dtb__1363 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1363) ctx) dtb__1360) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1362) else dtb__1362) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb__1356, rig, B_dData_dMaybe.C_Maybe_Nothing, ((Base_dSource.v_spanAtName dtb__1356) dtb__1357), bodyTerm2)), dtb__1358, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1363 })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dRast.C_Pat_PWild (dtb__1364) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pv in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1365; B_dData_dPair.f_Pair_second = dtb__1366 } -> (match dtb__1366 with
  | { B_dData_dPair.f_Pair_first = dtb__1367; B_dData_dPair.f_Pair_second = dtb__1368 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1367) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) dtb__1368) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1369; B_dData_dPair.f_Pair_second = dtb__1370 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, dtb__1364, (((Core_dTerm.v_shift 0) 1) dtb__1369))), dtb__1365, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1370 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase ((B_dData_dPair.v_secondOf bnd), (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf bnd); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (rest, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan (B_dData_dPair.v_firstOf bnd))))) expected)
)))
# 2349 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = binds in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1371, dtb__1372) -> (match dtb__1371 with
  | { B_dData_dPair.f_Pair_first = dtb__1373; B_dData_dPair.f_Pair_second = dtb__1374 } -> (match dtb__1373 with
  | Frontend_dRast.C_Pat_PVar (dtb__1375, dtb__1376) -> (((((((((((v_inferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1375) dtb__1374) dtb__1372) body) rec_u) ((Base_dSource.v_spanAtName dtb__1375) dtb__1376)) sp)
  | Frontend_dRast.C_Pat_PWild (dtb__1377) -> ((((((((((v_inferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1374) dtb__1372) body) rec_u) dtb__1377) sp)
  | _ -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase (dtb__1374, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1373; B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (dtb__1372, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan dtb__1373))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
))))
# 2363 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetBoundFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = pv in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__1378; B_dData_dPair.f_Pair_second = dtb__1379 } -> (match dtb__1379 with
  | { B_dData_dPair.f_Pair_first = dtb__1380; B_dData_dPair.f_Pair_second = dtb__1381 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1380) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dtb__1380) ctx) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx2) dtb__1381) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = pb in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1382; B_dData_dPair.f_Pair_second = dtb__1383 } -> (match dtb__1383 with
  | { B_dData_dPair.f_Pair_first = dtb__1384; B_dData_dPair.f_Pair_second = dtb__1385 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1385) ctx) dtb__1380) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1382) else dtb__1382) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, bodyTerm2)), dtb__1378, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1384; B_dData_dPair.f_Pair_second = dtb__1385 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2385 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetIgnoredFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pv in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1386; B_dData_dPair.f_Pair_second = dtb__1387 } -> (match dtb__1387 with
  | { B_dData_dPair.f_Pair_first = dtb__1388; B_dData_dPair.f_Pair_second = dtb__1389 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1388) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) dtb__1389) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pb in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1390; B_dData_dPair.f_Pair_second = dtb__1391 } -> (match dtb__1391 with
  | { B_dData_dPair.f_Pair_first = dtb__1392; B_dData_dPair.f_Pair_second = dtb__1393 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, (((Core_dTerm.v_shift 0) 1) dtb__1390))), dtb__1386, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1392; B_dData_dPair.f_Pair_second = dtb__1393 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2478 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelHint = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1394) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1395) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1396) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match expr with
  | Frontend_dRast.C_Expr_EApp (dtb__1397, dtb__1398, dtb__1399) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1397) dtb__1398) dtb__1399) (B_dData_dMaybe.C_Maybe_Just (expected)))
  | _ -> (((((v_inferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2764 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkByInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((((v_inferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__1400) -> (match dtb__1400 with
  | { B_dData_dPair.f_Pair_first = dtb__1401; B_dData_dPair.f_Pair_second = dtb__1402 } -> (match dtb__1402 with
  | { B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = dtb__1404 } -> (match ((((v_coerceTerm dtb__1404) expected) dtb__1403) dtb__1401) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1405) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1405; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1404) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1404) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1403) with
  | Base_dDiag.C_Check_ErrC (dtb__1406) -> (match ((((((v_tryEffLift ctx) globals) dtb__1404) expected) dtb__1403) dtb__1401) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1407) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__1407); B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) (B_dData_dPair.v_secondOf dtb__1407)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_unhandledEffectLabel dtb__1404) expected) dtb__1403) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1408) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> ((Elab_dTerm_dSupport.v_withEffectLabels dtb__1408) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("actual: " ^ (Core_dEval.v_showValue dtb__1403))))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("expected: " ^ (Core_dEval.v_showValue expected))))) d))))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((v_joinEffectLabels dtb__1408)))) (v_joinEffectLabels dtb__1408)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan (Frontend_dRast.v_exprSpan expr)) dtb__1406)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__1409) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1401; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1409) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1410) -> (Base_dDiag.C_Check_ErrC (dtb__1410))
  | _ -> failwith "DT: impossible branch"
))))
# 2785 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLamFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1411, dtb__1412) -> (match dtb__1411 with
  | { B_dData_dPair.f_Pair_first = dtb__1413; B_dData_dPair.f_Pair_second = dtb__1414 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (let nd_uscrut16 = forced in (match nd_uscrut16 with
  | Core_dTerm.C_Value_VMeta (dtb__1415, dtb__1416) -> (match dtb__1416 with
  | B_dData_dList.C_List_Nil -> (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) mc3) with
  | { B_dData_dPair.f_Pair_first = dtb__1417; B_dData_dPair.f_Pair_second = dtb__1418 } -> (let domVal = ((Elab_dTypes.v_evalCtx mc2) dtb__1417) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) dtb__1418) with
  | { B_dData_dPair.f_Pair_first = dtb__1419; B_dData_dPair.f_Pair_second = dtb__1420 } -> (let piVal = (Core_dTerm.C_Value_VPi ("_", false, Core_dTerm.C_Rig_RigOmega, domVal, { Core_dTerm.f_Closure_closureEnv = B_dData_dList.C_List_Nil; Core_dTerm.f_Closure_closureBody = dtb__1419 })) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__1420)) (Elab_dTypes.v_ecSolsP dtb__1420)) lvl) dtb__1415) B_dData_dList.C_List_Nil) piVal) with
  | Base_dDiag.C_Check_OkC (dtb__1421) -> ((((((((v_checkLamFuel (mc0 - 1)) mc1) mc2) ((Elab_dTypes.v_ecPutSols dtb__1420) (Core_dTerm.v_solsList dtb__1421))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1413; B_dData_dPair.f_Pair_second = dtb__1414 }, dtb__1412))) mc5) piVal) mc7)
  | Base_dDiag.C_Check_ErrC (dtb__1422) -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
)
  | Core_dTerm.C_Value_VPi (dtb__1423, dtb__1424, dtb__1425, dtb__1426, dtb__1427) -> (if dtb__1424 then (if (if ((Elab_dDict.v_isDictDomain mc3) dtb__1426) then true else (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__1426)) then (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1423) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1423) dtb__1426) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1427) v) in ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1413; B_dData_dPair.f_Pair_second = dtb__1414 }, dtb__1412))) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1428; B_dData_dPair.f_Pair_second = dtb__1429 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1423, dtb__1425, ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1426)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))), Base_dSource.v_spanEmpty, dtb__1428)); B_dData_dPair.f_Pair_second = dtb__1429 }))
  | _ -> failwith "DT: impossible branch"
))))))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)) else (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1423) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1413) dtb__1426) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1427) v) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain mc3) mc7) dtb__1413) dtb__1425) dtb__1426)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1412) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1430; B_dData_dPair.f_Pair_second = dtb__1431 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1431) mc2) dtb__1426) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1430) else dtb__1430) in (let slot0 = ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1426)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear mc3) mc2) then (if (((Elab_dMeta.v_termHasOuterLinear mc3) ctx2) dtb__1430) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1413, lamRig, slot, dtb__1414, inner2)); B_dData_dPair.f_Pair_second = dtb__1431 })))))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2874 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EApp (dtb__1432, dtb__1433, dtb__1434) -> (match dtb__1432 with
  | Frontend_dRast.C_Expr_EVar (dtb__1435, dtb__1436) -> (if (if ((Frontend_dRast_dName.v_rnameKey dtb__1435) = "->") then true else ((Frontend_dRast_dName.v_rnameKey dtb__1435) = "Type")) then (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1435)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1437) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1435)) then (match (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1435)) dtb__1433) dtb__1436) with
  | Base_dDiag.C_Check_ErrC (dtb__1438) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dDiag.C_Check_OkC (dtb__1439) -> (Base_dDiag.C_Check_OkC (dtb__1439))
  | _ -> failwith "DT: impossible branch"
) else (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Frontend_dRast.C_Expr_EVar (dtb__1440, dtb__1441) -> (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1440)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1442) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_typeLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1440)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1443) -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1443))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1444) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec) (Frontend_dRast_dName.v_rnameKey dtb__1440)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1444; B_dData_dPair.f_Pair_second = ec } }))
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
# 2907 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = p in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__1445; B_dData_dPair.f_Pair_second = dtb__1446 } -> (match dtb__1446 with
  | { B_dData_dPair.f_Pair_first = dtb__1447; B_dData_dPair.f_Pair_second = dtb__1448 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1448) dtb__1447) in (match (Core_dTerm.v_typeLevelOf forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1449) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1445; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1449; B_dData_dPair.f_Pair_second = dtb__1448 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedType (((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1447)))) ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1447))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2925 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1450, dtb__1451) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1450)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1451) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1450))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1450)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1451))) args) expected) sp))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1450)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueAppTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1450))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1450))) expected) sp)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1451))) args) expected) sp))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1450)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1452) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((Elab_dMeta.v_isSortVal ec) expected) then (match ((Elab_dMeta.v_typeNameOfDualCtor ec) (Frontend_dRast_dName.v_rnameKey dtb__1450)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1453) -> ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1453) args) expected) dtb__1451)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1450)) then ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1450)) args) expected) dtb__1451) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1450)) args) expected) sp) dtb__1451))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1450)) args) expected) sp) dtb__1451))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 2958 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppByValueFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (vsp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut10 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1454) -> (match dtb__1454 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__1455) -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__1456) -> ((((((((v_checkAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
# 2971 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1457; B_dData_dPair.f_Pair_second = dtb__1458 } -> (match dtb__1458 with
  | { B_dData_dPair.f_Pair_first = dtb__1459; B_dData_dPair.f_Pair_second = dtb__1460 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1460) (Elab_dTypes.v_ctxDepth ctx)) expected) (Core_dTerm.C_Value_VType (dtb__1459)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1457; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2982 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (((Elab_dMeta.v_typeHeadLookup globals) ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1461) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1461)) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = pa in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__1462; B_dData_dPair.f_Pair_second = dtb__1463 } -> (match dtb__1463 with
  | { B_dData_dPair.f_Pair_first = dtb__1464; B_dData_dPair.f_Pair_second = dtb__1465 } -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb__1465) dtb__1464)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1466) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1465) name) dtb__1462); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1466; B_dData_dPair.f_Pair_second = dtb__1465 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 3043 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeEqAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isEqMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1467, dtb__1468) -> (match dtb__1468 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1469, dtb__1470) -> (match dtb__1470 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1467)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1471; B_dData_dPair.f_Pair_second = dtb__1472 } -> (match dtb__1472 with
  | { B_dData_dPair.f_Pair_first = dtb__1473; B_dData_dPair.f_Pair_second = dtb__1474 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1474) dtb__1469)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1475; B_dData_dPair.f_Pair_second = dtb__1476 } -> (match dtb__1476 with
  | { B_dData_dPair.f_Pair_first = dtb__1477; B_dData_dPair.f_Pair_second = dtb__1478 } -> (match (((((v_coerceNatOperands dtb__1478) dtb__1473) dtb__1477) dtb__1471) dtb__1475) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1479) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1479))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1479))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1479))) dtb__1478)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1478) (Elab_dTypes.v_ctxDepth ctx)) dtb__1473) dtb__1477)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) dtb__1471) dtb__1475) sp) dtb__1473) ec3)))
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
# 3067 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeCmpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isCmpMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1480, dtb__1481) -> (match dtb__1481 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1482, dtb__1483) -> (match dtb__1483 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1480)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1484; B_dData_dPair.f_Pair_second = dtb__1485 } -> (match dtb__1485 with
  | { B_dData_dPair.f_Pair_first = dtb__1486; B_dData_dPair.f_Pair_second = dtb__1487 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1487) dtb__1482)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1488; B_dData_dPair.f_Pair_second = dtb__1489 } -> (match dtb__1489 with
  | { B_dData_dPair.f_Pair_first = dtb__1490; B_dData_dPair.f_Pair_second = dtb__1491 } -> (match (((((v_coerceNatOperands dtb__1491) dtb__1486) dtb__1490) dtb__1484) dtb__1488) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1492) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1492))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1492))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1492))) dtb__1491)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1491) (Elab_dTypes.v_ctxDepth ctx)) dtb__1486) dtb__1490)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) dtb__1484) dtb__1488) sp) dtb__1486) ec3)))
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
# 3093 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeOpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (name = Base_dIntrinsics.v_interpMethodName) then (((((((v_specializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Base_dCommon.v_bind (((((((v_specializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1493) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1493))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r2 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1494) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1494))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r3 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1495) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1495))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_specializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 3126 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeInterpPrimApp = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1496, dtb__1497) -> (match dtb__1497 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1496)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1498; B_dData_dPair.f_Pair_second = dtb__1499 } -> (match dtb__1499 with
  | { B_dData_dPair.f_Pair_first = dtb__1500; B_dData_dPair.f_Pair_second = dtb__1501 } -> (let tyv = ((Elab_dTypes.v_forceVal dtb__1501) dtb__1500) in (if (v_isStringTyValue tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1498; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyv; B_dData_dPair.f_Pair_second = dtb__1501 } })))) else (if (if ((v_isIntTy dtb__1501) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1501) Base_dIntrinsics.v_intTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm dtb__1498); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1501 } })))) else (if (if ((v_isNatTy dtb__1501) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1501) Base_dIntrinsics.v_natTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm (v_natToIntTerm dtb__1498)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1501 } })))) else (if ((v_isFloatTy dtb__1501) tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromFloatTerm dtb__1498); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1501 } })))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 3166 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeBoolAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1502, dtb__1503) -> (match dtb__1503 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1504, dtb__1505) -> (match dtb__1505 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1502) Elab_dPrelude.v_boolTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1506; B_dData_dPair.f_Pair_second = dtb__1507 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1507) dtb__1504) Elab_dPrelude.v_boolTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1508; B_dData_dPair.f_Pair_second = dtb__1509 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((Elab_dDict.v_boolShortCircuit name) dtb__1506) dtb__1508); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__1509 } }))))
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
# 3187 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1510, dtb__1511) -> ((Base_dCommon.v_bind ((((((((v_specializeArithCheckFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1510)) args) expected) sp)) (fun (arith : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut11 = arith in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_skipArithSpecForExpected ec) (Frontend_dRast_dName.v_rnameKey dtb__1510)) expected) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1510)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut14 = mspec in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1512) -> (match dtb__1512 with
  | { B_dData_dPair.f_Pair_first = dtb__1513; B_dData_dPair.f_Pair_second = dtb__1514 } -> (match dtb__1514 with
  | { B_dData_dPair.f_Pair_first = dtb__1515; B_dData_dPair.f_Pair_second = dtb__1516 } -> (match ((((v_coerceTerm dtb__1516) expected) dtb__1515) dtb__1513) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1517) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1517; B_dData_dPair.f_Pair_second = dtb__1516 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1516) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1515)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1513; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1518) -> (match dtb__1518 with
  | { B_dData_dPair.f_Pair_first = dtb__1519; B_dData_dPair.f_Pair_second = dtb__1520 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1519; B_dData_dPair.f_Pair_second = dtb__1520 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
)))
# 3470 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppCtorFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1521) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs ec) ctx) dtb__1521) expected) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1521))) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1522; B_dData_dPair.f_Pair_second = dtb__1523 } -> (match dtb__1523 with
  | { B_dData_dPair.f_Pair_first = dtb__1524; B_dData_dPair.f_Pair_second = dtb__1525 } -> (let ctorTerm = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1525)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1522) in (match ((((v_coerceTerm dtb__1525) expected) dtb__1524) ctorTerm) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1526) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1526; B_dData_dPair.f_Pair_second = dtb__1525 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1525) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1524) with
  | Base_dDiag.C_Check_OkC (dtb__1527) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1527)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1522); B_dData_dPair.f_Pair_second = dtb__1527 }))
  | Base_dDiag.C_Check_ErrC (dtb__1528) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1528)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1528))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1529) -> (match dtb__1529 with
  | { B_dData_dPair.f_Pair_first = dtb__1530; B_dData_dPair.f_Pair_second = dtb__1531 } -> (match dtb__1531 with
  | { B_dData_dPair.f_Pair_first = dtb__1532; B_dData_dPair.f_Pair_second = dtb__1533 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1533) dtb__1532) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pa in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1534; B_dData_dPair.f_Pair_second = dtb__1535 } -> (match dtb__1535 with
  | { B_dData_dPair.f_Pair_first = dtb__1536; B_dData_dPair.f_Pair_second = dtb__1537 } -> (let allArgs = ((B_dData_dList.v_append dtb__1530) dtb__1534) in (match ((((v_coerceTerm dtb__1537) expected) dtb__1536) (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1537)) (Core_dTerm.C_Term_TGlobal (name))) allArgs)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1538) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1538; B_dData_dPair.f_Pair_second = dtb__1537 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1537) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1536) with
  | Base_dDiag.C_Check_OkC (dtb__1539) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1539)) (Core_dTerm.C_Term_TGlobal (name))) allArgs); B_dData_dPair.f_Pair_second = dtb__1539 }))
  | Base_dDiag.C_Check_ErrC (dtb__1540) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1540)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1540))
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
# 3749 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabDoChain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (plan : t_DoPlan) (steps : t_DoChainStep B_dData_dList.t_List) (last : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = steps in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1541, dtb__1542) -> (match dtb__1541 with
  | C_DoChainStep_DoChainStep (dtb__1543, dtb__1544, dtb__1545, dtb__1546) -> (match (((Elab_dMetaSpans.v_newMetaAt dtb__1545) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1547; B_dData_dPair.f_Pair_second = dtb__1548 } -> (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1547) in (let mArgTy = ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) aVal) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1543) aVal) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1548) dtb__1545) "_") (plan).f_DoPlan_planRigE) mArgTy)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1548) dtb__1544) mArgTy)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1549; B_dData_dPair.f_Pair_second = dtb__1550 } -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1550) dtb__1545) dtb__1543) (plan).f_DoPlan_planInnerRig) aVal)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx2) dtb__1550) plan) dtb__1542) last)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1551; B_dData_dPair.f_Pair_second = dtb__1552 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((((((((v_doBindAppTerm dtb__1550) dtb__1552) ctx) dtb__1545) dtb__1546) plan) dtb__1543) aVal) dtb__1549) argRig) lamRig) dtb__1551); B_dData_dPair.f_Pair_second = dtb__1552 }))
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
# 3783 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1553) -> (match dtb__1553 with
  | { B_dData_dPair.f_Pair_first = dtb__1554; B_dData_dPair.f_Pair_second = dtb__1555 } -> (match dtb__1555 with
  | { B_dData_dPair.f_Pair_first = dtb__1556; B_dData_dPair.f_Pair_second = dtb__1557 } -> (let nd_uscrut17 = ((v_splitDoExpected ec) expected) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1558; B_dData_dPair.f_Pair_second = dtb__1559 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1559) with
  | { B_dData_dPair.f_Pair_first = dtb__1560; B_dData_dPair.f_Pair_second = dtb__1561 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1558) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1560) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1561) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1554) dtb__1556) dtb__1557) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1562) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1562).f_DoPlan_planEc) dtb__1562) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1563; B_dData_dPair.f_Pair_second = dtb__1564 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1564) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_applyValue (dtb__1562).f_DoPlan_planMVal) (dtb__1562).f_DoPlan_planAVal))) (fun (ec4 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1563; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1565) -> (match dtb__1565 with
  | { B_dData_dPair.f_Pair_first = dtb__1566; B_dData_dPair.f_Pair_second = dtb__1567 } -> ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1554) dtb__1556) dtb__1557) dtb__1566) dtb__1567)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1568) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1568).f_DoPlan_planEc) dtb__1568) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1569; B_dData_dPair.f_Pair_second = dtb__1570 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1569; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1570) }))))
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
# 3826 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1571) -> (match dtb__1571 with
  | { B_dData_dPair.f_Pair_first = dtb__1572; B_dData_dPair.f_Pair_second = dtb__1573 } -> (match dtb__1573 with
  | { B_dData_dPair.f_Pair_first = dtb__1574; B_dData_dPair.f_Pair_second = dtb__1575 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1576; B_dData_dPair.f_Pair_second = dtb__1577 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1577) with
  | { B_dData_dPair.f_Pair_first = dtb__1578; B_dData_dPair.f_Pair_second = dtb__1579 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1576) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1578) in (let resultTy = ((Core_dEval.v_applyValue mVal) aVal) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1579) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1572) dtb__1574) dtb__1575) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1580) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1580).f_DoPlan_planEc) dtb__1580) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1581; B_dData_dPair.f_Pair_second = dtb__1582 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1581; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__1582 } }))))
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

# 3006 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_checkTypeAtKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VType (dtb__1583) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) (((((v_checkTypeFuel 256) globals) ctx) ec) expr))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)) }))))
  | _ -> (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EApp (dtb__1584, dtb__1585, dtb__1586) -> (match dtb__1584 with
  | Frontend_dRast.C_Expr_EVar (dtb__1587, dtb__1588) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1587)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1587)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1587)))) (Frontend_dRast_dName.v_rnameKey dtb__1587))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1589) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel 256) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1589)) dtb__1585) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1590; B_dData_dPair.f_Pair_second = dtb__1591 } -> (match dtb__1591 with
  | { B_dData_dPair.f_Pair_first = dtb__1592; B_dData_dPair.f_Pair_second = dtb__1593 } -> (match ((((Elab_dMeta.v_convEc dtb__1593) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1592) with
  | Base_dDiag.C_Check_OkC (dtb__1594) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1594) (Frontend_dRast_dName.v_rnameKey dtb__1587)) dtb__1590); B_dData_dPair.f_Pair_second = dtb__1594 }))
  | Base_dDiag.C_Check_ErrC (dtb__1595) -> (((Base_dDiagnostics_dTc.v_tcTypeMismatch sp) (Core_dEval.v_showValue expected)) (Core_dEval.v_showValue dtb__1592))
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
  | Frontend_dRast.C_Expr_EVar (dtb__1596, dtb__1597) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1596)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1596)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1596)))) (Frontend_dRast_dName.v_rnameKey dtb__1596))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1598) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1598)))) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec1) (Frontend_dRast_dName.v_rnameKey dtb__1596)); B_dData_dPair.f_Pair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected))
))
))
