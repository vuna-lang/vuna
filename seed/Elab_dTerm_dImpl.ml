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

# 356 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 365 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 503 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfShortOf = (fun (last : string) -> (if ((B_dData_dString.v_endsWith "Op") last) then (let n = (bi_strLength last) in (if (n > 2) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring 0) (B_dData_dNat.v_fromIntClamp (n - 2))) last))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))

# 512 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfCanonical = (fun (canon : string) -> (match (v_perfShortOf (Base_dSource.v_lastSeg canon)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dMaybe.C_Maybe_Just ((C_PerfFamily_PerfFamily (canon, (Base_dSource.v_prefixOfName canon), dtb__21))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__22) -> (match dtb__22 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__23, dtb__24) -> (v_perfFamilyOfCanonical dtb__23)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 527 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Frontend_dRast.C_Expr_EVar (dtb__28, dtb__29) -> (match dtb__26 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut10 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__28)) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (match dtb__32 with
  | Frontend_dReserved.C_Reserved_RsPerform -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__27 }))
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

# 535 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_instArgOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__33, dtb__34, dtb__35) -> (match dtb__33 with
  | Frontend_dRast.C_Expr_EVar (dtb__36, dtb__37) -> (match dtb__34 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut10 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__36)) in (match nd_uscrut10 with
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

# 543 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Frontend_dRast.C_Expr_EVar (dtb__44, dtb__45) -> (match dtb__42 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (let nd_uscrut12 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__44)) in (match nd_uscrut12 with
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

# 551 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtCallExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__51, dtb__52, dtb__53) -> (match dtb__51 with
  | Frontend_dRast.C_Expr_EVar (dtb__54, dtb__55) -> (match dtb__52 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (dtb__56, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsInstArg))), dtb__53)), (B_dData_dList.C_List__x58__x58_ (dtb__58, B_dData_dList.C_List_Nil)), dtb__53)), dtb__59)), dtb__53))))
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
))

# 579 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__60, dtb__61, dtb__62) -> (match dtb__60 with
  | Frontend_dRast.C_Expr_EVar (dtb__63, dtb__64) -> (match dtb__61 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__66 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__68 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut16 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__63)) in (match nd_uscrut16 with
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

# 597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleFamilyOfCtor = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_ctorFamilyNameOf ec) cname) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (Base_dDiag.C_Check_OkC (dtb__72))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamily = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify cname) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (match dtb__73 with
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__74, dtb__75) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) sp) B_dData_dMaybe.C_Maybe_Nothing) dtb__74) dtb__75)) (fun (canon : string) -> (((v_handleFamilyOfCtor ec) canon) sp)))
  | _ -> (((v_handleFamilyOfCtor ec) cname) sp)
)
  | _ -> (((v_handleFamilyOfCtor ec) cname) sp)
)))

# 604 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilyOfPat = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Pat) -> (match mc1 with
  | Frontend_dRast.C_Pat_PCon (dtb__76, dtb__77, dtb__78) -> (((v_handleClauseFamily mc0) (Frontend_dRast_dName.v_rnameKey dtb__76)) dtb__78)
  | _ -> (Base_dDiag.v_icInternal "handle mirror case pattern is not a constructor")
))

# 609 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleCheckFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__79 with
  | { B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__82 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__81) with
  | Base_dDiag.C_Check_ErrC (dtb__83) -> (Base_dDiag.C_Check_ErrC (dtb__83))
  | Base_dDiag.C_Check_OkC (dtb__84) -> (if (dtb__84 = mc1) then (((v_handleCheckFamilies mc0) mc1) dtb__80) else ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dRast.v_patSpan dtb__81)) (Base_dDiagnostics_dTc.C_TcErr_HandleClauseFamilyMismatch (mc1, dtb__84))) mc1) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
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

# 653 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isUniverseTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__91) -> true
  | _ -> false
))

# 639 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_countOpArrows = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__92) -> (B_dData_dMaybe.C_Maybe_Just (0))
  | Core_dTerm.C_Term_TPi (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (if dtb__94 then (v_countOpArrows dtb__97) else (if (v_isUniverseTerm dtb__96) then (match (v_countOpArrows dtb__97) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__98 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 633 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArity = (fun (kind : Core_dTerm.t_Term) -> (match (v_countOpArrows kind) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__99) -> (if (dtb__99 >= 1) then (B_dData_dMaybe.C_Maybe_Just ((dtb__99 - 1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleHoleArgs = (fun (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), ((v_handleHoleArgs (k - 1)) sp)))))

# 663 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)) else (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)), ((v_handleHoleArgs k) sp), sp))))

# 672 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effSigFnName), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleSigBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EApp ((((v_handleOpArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (Frontend_dReserved.v_handleSigBinderName)), sp)), B_dData_dList.C_List_Nil)), sp)), sp)), B_dData_dList.C_List_Nil)), sp)))

# 691 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) -> (match ((Elab_dMeta.v_dtDataLookup canon) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__100)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Elab_dMeta.v_globalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 698 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleRetArg = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__101, dtb__102) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__101)) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__103) -> (match dtb__103 with
  | Frontend_dReserved.C_Reserved_RsHandleNoRet -> (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleRetBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal (Frontend_dReserved.v_handleRetBinderName)), dtb__102)), dtb__102))
  | _ -> (Frontend_dRast.C_Expr_EVar (dtb__101, dtb__102))
)
  | _ -> (Frontend_dRast.C_Expr_EVar (dtb__101, dtb__102))
))
  | _ -> mc0
))

# 681 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCall = (fun (headMode : bool) (nameArg : Frontend_dRast.t_Expr) (canon : string) (k : int) (comp : Frontend_dRast.t_Expr) (ret : Frontend_dRast.t_Expr) (opH : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let fnName = (if headMode then Base_dIntrinsics.v_effHandleWithAtName else Base_dIntrinsics.v_effHandleWithName) in (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName fnName), sp)), (B_dData_dList.C_List__x58__x58_ (nameArg, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (canon, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ (comp, (B_dData_dList.C_List__x58__x58_ ((v_handleRetArg ret), (B_dData_dList.C_List__x58__x58_ (opH, B_dData_dList.C_List_Nil)))))))))))), sp))))

# 709 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opFamilyArityOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) (sp : Base_dSource.t_Span) -> (match (((v_handleOpKind globals) ec) canon) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> (match (v_handleOpArity dtb__104) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (Base_dDiag.C_Check_OkC (dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 560 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (opTy : Core_dTerm.t_Value) (op : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let nd_uscrut5 = ((v_perfFamilyOfValue ec) opTy) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (match dtb__106 with
  | C_PerfFamily_PerfFamily (dtb__107, dtb__108, dtb__109) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__107) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effPerformCoreName), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (dtb__107, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg dtb__107) k) sp), (B_dData_dList.C_List__x58__x58_ (op, B_dData_dList.C_List_Nil)))))))), sp))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_EffResFamilyMissing (((Core_dEval.v_showValueAt 6) opTy)))) ((Core_dEval.v_showValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)))

# 720 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprWith = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) (headMode : bool) (nameArg : Frontend_dRast.t_Expr) -> (let nd_uscrut6 = (v_handleOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> (match dtb__110 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (match dtb__112 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> (let nd_uscrut17 = dtb__114 in (match nd_uscrut17 with
  | Frontend_dRast.C_Expr_ELam (dtb__115, dtb__116, dtb__117) -> (match dtb__115 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__116 with
  | Frontend_dRast.C_Expr_ECase (dtb__122, dtb__123, dtb__124) -> ((Base_dCommon.v_bind ((v_handleClauseFamilies ec) dtb__123)) (fun (fam : string) -> (let nd_uscrut31 = (v_perfFamilyOfCanonical fam) in (match nd_uscrut31 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__125) -> (match dtb__125 with
  | C_PerfFamily_PerfFamily (dtb__126, dtb__127, dtb__128) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__126) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC (((((((((v_handleCall headMode) nameArg) dtb__126) k) dtb__111) dtb__113) dtb__114) sp)))))
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

# 736 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) false) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 741 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAt = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))))

# 746 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAtHole = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 888 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordTypeOf = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) ty) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__129) -> (match dtb__129 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__130, dtb__131) -> (match ((Elab_dMeta.v_dtDataLookup dtb__130) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__132) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__132) then (let nd_uscrut8 = (Elab_dTypes.v_dtDataCtors dtb__132) in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (match dtb__134 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__133; B_dData_dPair.f_Pair_second = dtb__131 } }))
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

# 908 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldPatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ((Frontend_dReserved.v_recordProjBinderName i), sp)), (((v_recordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 904 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordFieldPatsFrom 0) n) sp))

# 919 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldLookupGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (if ((dtb__135).Elab_dTypes.f_DtFieldMeta_dtFieldName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__135).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (dtb__135).Elab_dTypes.f_DtFieldMeta_dtFieldType } })) else (((v_recordFieldLookupGo mc0) dtb__136) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 916 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldLookup = (fun (fname : string) (dd : Elab_dTypes.t_DtData) -> (((v_recordFieldLookupGo fname) (Elab_dTypes.v_dtDataFields dd)) (B_dData_dList.v_length (Elab_dTypes.v_dtDataFields dd))))

# 928 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateUnknownGo = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (match dtb__137 with
  | { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 } -> (match ((v_recordFieldLookup dtb__139) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__139))
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> ((v_recordUpdateUnknownGo mc0) dtb__138)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 936 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateUnknown = (fun (dd : Elab_dTypes.t_DtData) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_recordUpdateUnknownGo dd) fields))

# 940 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateValueFor = (fun (mc0 : string) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (match dtb__142 with
  | { B_dData_dPair.f_Pair_first = dtb__144; B_dData_dPair.f_Pair_second = dtb__145 } -> (if (dtb__144 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__145)) else ((v_recordUpdateValueFor mc0) dtb__143))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateArg = (fun (i : int) (f : Elab_dTypes.t_DtFieldMeta) (provided : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match ((v_recordUpdateValueFor (f).Elab_dTypes.f_DtFieldMeta_dtFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> dtb__146
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (Frontend_dReserved.v_recordProjBinderName i)), sp))
  | _ -> failwith "DT: impossible branch"
))

# 953 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (B_dData_dList.C_List__x58__x58_ (((((v_recordUpdateArg mc0) dtb__147) mc2) mc3), ((((v_recordUpdateArgs (mc0 + 1)) dtb__148) mc2) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 959 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdatedIndices = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (match dtb__149 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (let nd_uscrut9 = ((v_recordFieldLookup dtb__151) mc0) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_recordUpdatedIndices mc0) dtb__150)
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = dtb__155 } -> (B_dData_dList.C_List__x58__x58_ (dtb__154, ((v_recordUpdatedIndices mc0) dtb__150)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (match dtb__156 with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> (match dtb__158 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (let nd_uscrut15 = ((v_recordFieldLookup fname) dtb__157) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = dtb__163 } -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 } -> (Base_dDiag.C_Check_OkC ({ f_FieldAccessPlan_planData = dtb__157; f_FieldAccessPlan_planCtor = dtb__159; f_FieldAccessPlan_planIdxs = dtb__160; f_FieldAccessPlan_planRecord = (dtb__157).Elab_dTypes.f_DtData_dtDataName; f_FieldAccessPlan_planField = dtb__162; f_FieldAccessPlan_planFieldCount = dtb__164; f_FieldAccessPlan_planType = ((Core_dEval.v_eval (B_dData_dList.v_reverse dtb__160)) dtb__165) }))
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

# 1002 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdatePlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> (match dtb__166 with
  | { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = dtb__168 } -> (match dtb__168 with
  | { B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__170 } -> (match ((v_recordUpdateUnknown dtb__167) fields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> ((Elab_dTypes.v_errAt sp) ("record type has no field " ^ dtb__171))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let fs = (Elab_dTypes.v_dtDataFields dtb__167) in (let bodyArgs = ((((v_recordUpdateArgs 0) fs) fields) sp) in (Base_dDiag.C_Check_OkC ({ f_UpdateAccessPlan_upData = dtb__167; f_UpdateAccessPlan_upCtor = dtb__169; f_UpdateAccessPlan_upIdxs = dtb__170; f_UpdateAccessPlan_upRecord = (dtb__167).Elab_dTypes.f_DtData_dtDataName; f_UpdateAccessPlan_upFieldCount = (B_dData_dList.v_length fs); f_UpdateAccessPlan_upFieldIndices = ((v_recordUpdatedIndices dtb__167) fields); f_UpdateAccessPlan_upBodyArgs = bodyArgs }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)))

# 1017 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldDictName = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_hasFieldTraitName)

# 1027 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctxHasFieldDictGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : string) (mc5 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> (match dtb__172 with
  | { B_dData_dPair.f_Pair_first = dtb__174; B_dData_dPair.f_Pair_second = dtb__175 } -> (let nd_uscrut13 = ((Elab_dTypes.v_forceVal mc3) (((Elab_dTypes.v_varTypeValue mc2) mc1) dtb__175)) in (match nd_uscrut13 with
  | Core_dTerm.C_Value_VNeutral (dtb__176) -> (match dtb__176 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__177, dtb__178) -> (if (dtb__177 = v_hasFieldDictName) then (let nd_uscrut17 = dtb__178 in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__179, dtb__180) -> (match dtb__180 with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> (match dtb__182 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (let nd_uscrut27 = ((Elab_dTypes.v_forceVal mc3) dtb__179) in (match nd_uscrut27 with
  | Core_dTerm.C_Value_VNeutral (dtb__185) -> (match dtb__185 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__186, dtb__187) -> (match dtb__187 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match dtb__188 with
  | Core_dTerm.C_Value_VStr (dtb__190) -> (if (dtb__190 = mc4) then (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc2)) dtb__181) mc5) with
  | Base_dDiag.C_Check_OkC (dtb__191) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__174, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__191 } }))
  | Base_dDiag.C_Check_ErrC (dtb__192) -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) else ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__173) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1023 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctxHasFieldDict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fname : string) (baseTy : Core_dTerm.t_Value) -> ((((((v_ctxHasFieldDictGo (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ctx) ec) fname) baseTy))

# 1055 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldAccessFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (baseTerm : Core_dTerm.t_Term) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut8 = ((Elab_dTypes.v_forceVal ec) baseTy) in (match nd_uscrut8 with
  | Core_dTerm.C_Value_VNeutral (dtb__193) -> (match dtb__193 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__194, dtb__195) -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["type "; dtb__194; " is not a record"]))
  | _ -> (let nd_uscrut10 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__199), Core_dTerm.C_Rig_Rig0)), dtb__197, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut9 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__201) -> (match dtb__201 with
  | { B_dData_dPair.f_Pair_first = dtb__202; B_dData_dPair.f_Pair_second = dtb__203 } -> (match dtb__203 with
  | { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__204), Core_dTerm.C_Rig_Rig0)), dtb__202, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } })))))
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
  | Frontend_dRast.C_Expr_EApp (dtb__206, dtb__207, dtb__208) -> (match dtb__206 with
  | Frontend_dRast.C_Expr_EVar (dtb__209, dtb__210) -> (match dtb__207 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (match dtb__212 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__214 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut13 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__209)) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__215) -> (match dtb__215 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((v_listLitConsTail dtb__211) dtb__213)
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
  | Frontend_dRast.C_Expr_EVar (dtb__216, dtb__217) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__216)) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__218) -> (match dtb__218 with
  | Frontend_dReserved.C_Reserved_RsListNil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 1337 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_listLitConsTail = (fun (h : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) -> (match (v_listLitElems t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__219) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (h, dtb__219))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1344 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_findCtorByShort = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> (if ((Frontend_dRast.v_ctorShortName (Elab_dTypes.v_dtCtorName dtb__220)) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__220)) else ((v_findCtorByShort mc0) dtb__221))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1350 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCtor = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (short : string) -> (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__222) -> ((v_findCtorByShort short) (Elab_dTypes.v_dtDataCtors dtb__222))
  | _ -> failwith "DT: impossible branch"
))

# 1357 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> ((Base_dCommon.v_bind ((((v_expandListLitGo mc0) mc1) dtb__224) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (B_dData_dList.C_List__x58__x58_ (dtb__223, (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1369 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__225, dtb__226, dtb__227) -> (match dtb__225 with
  | Frontend_dRast.C_Expr_EVar (dtb__228, dtb__229) -> (match dtb__226 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__231 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__233 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut13 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__228)) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (match dtb__234 with
  | Frontend_dReserved.C_Reserved_RsRowAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__232 }))
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

# 1376 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__235, dtb__236, dtb__237) -> (match dtb__235 with
  | Frontend_dRast.C_Expr_EVar (dtb__238, dtb__239) -> (match dtb__236 with
  | B_dData_dList.C_List__x58__x58_ (dtb__240, dtb__241) -> (match dtb__241 with
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> (let nd_uscrut12 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__238)) in (match nd_uscrut12 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> (match dtb__244 with
  | Frontend_dReserved.C_Reserved_RsAppAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = dtb__243 } }))
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

# 1394 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_applyExtra = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dRast.C_Expr_EApp (mc0, mc1, (Frontend_dRast.v_exprSpan mc0)))
))

# 1385 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryParts = (fun (e : Frontend_dRast.t_Expr) -> (match (v_rowAtParts e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__245) -> (B_dData_dMaybe.C_Maybe_Just (dtb__245))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut2 = (v_appAtParts e) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> (match dtb__246 with
  | { B_dData_dPair.f_Pair_first = dtb__247; B_dData_dPair.f_Pair_second = dtb__248 } -> (match dtb__248 with
  | { B_dData_dPair.f_Pair_first = dtb__249; B_dData_dPair.f_Pair_second = dtb__250 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((v_applyExtra dtb__247) dtb__250); B_dData_dPair.f_Pair_second = dtb__249 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1399 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitLabel = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> e
  | B_dData_dMaybe.C_Maybe_Just (dtb__251) -> (match dtb__251 with
  | { B_dData_dPair.f_Pair_first = dtb__252; B_dData_dPair.f_Pair_second = dtb__253 } -> dtb__252
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1405 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameArg = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> (match dtb__254 with
  | { B_dData_dPair.f_Pair_first = dtb__255; B_dData_dPair.f_Pair_second = dtb__256 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__256))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1411 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameExpr = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (match (v_rowLitNameArg e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__257) -> dtb__257
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1435 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_wrapRowEntry = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effNamedName), sp)), (B_dData_dList.C_List__x58__x58_ (((v_rowLitNameExpr e) sp), (B_dData_dList.C_List__x58__x58_ ((v_rowLitLabel e), B_dData_dList.C_List_Nil)))), sp)))

# 1430 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsEntry = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__258, dtb__259, dtb__260) -> (match dtb__258 with
  | Frontend_dRast.C_Expr_EVar (dtb__261, dtb__262) -> (match dtb__259 with
  | B_dData_dList.C_List__x58__x58_ (dtb__263, dtb__264) -> (match dtb__264 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (match dtb__266 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__261) = Base_dIntrinsics.v_effNamedName) then mc0 else ((v_wrapRowEntry mc0) mc1))
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

# 1427 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsArgs = (fun (e : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ (((v_rowConsEntry e) sp), (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))))

# 1417 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandRowListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__268) -> ((Base_dCommon.v_bind ((((v_expandRowListLitGo mc0) mc1) dtb__268) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (((v_rowConsArgs dtb__267) t) mc3), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1443 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_firstCtorOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__269, dtb__270) -> (match (((v_litFamilyCtor mc0) mc1) dtb__269) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (B_dData_dMaybe.C_Maybe_Just (dtb__271))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstCtorOf mc0) mc1) dtb__270)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1440 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCons = (fun (ec : Elab_dTypes.t_Ec) (fam : string) -> (((v_firstCtorOf ec) fam) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", (B_dData_dList.C_List__x58__x58_ ("RCons", (B_dData_dList.C_List__x58__x58_ ("VCons", B_dData_dList.C_List_Nil))))))))))

# 1451 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandListLit = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (elems : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fam = Base_dIntrinsics.v_effRowFamilyName) then (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> ((((v_expandRowListLitGo (Elab_dTypes.v_dtCtorName dtb__272)) (Elab_dTypes.v_dtCtorName dtb__273)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__274) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__275) -> ((((v_expandListLitGo (Elab_dTypes.v_dtCtorName dtb__274)) (Elab_dTypes.v_dtCtorName dtb__275)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1469 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_listLitFamily = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_expectedFamilyOf ec) expected) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> dtb__276
  | B_dData_dMaybe.C_Maybe_Nothing -> Base_dIntrinsics.v_listFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1476 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandArgListLit = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (a : Frontend_dRast.t_Expr) -> (match (v_listLitElems a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__277) -> ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) dom))) dtb__277) (Frontend_dRast.v_exprSpan a))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1695 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitTermGo = (fun (n : int) (acc : Core_dTerm.t_Term) -> (if (n <= 0) then acc else ((v_natLitTermGo (n - 1)) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig1 }, B_dData_dList.C_List_Nil)))))))

# 1698 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitTerm = (fun (n : int) -> ((v_natLitTermGo n) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 1703 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitResult = (fun (sp : Base_dSource.t_Span) (n : int) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC ((v_natLitTerm n)))))

# 1706 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natToIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("natToInt")), t, Core_dTerm.C_Rig_Rig1)))

# 1709 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil))))

# 1712 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_natTypeName, B_dData_dList.C_List_Nil))))

# 1716 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil))))

# 1719 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isIntTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__278) -> (match dtb__278 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__279, dtb__280) -> (match dtb__280 with
  | B_dData_dList.C_List_Nil -> (dtb__279 = Base_dIntrinsics.v_intTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1725 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__281) -> (match dtb__281 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__282, dtb__283) -> (match dtb__283 with
  | B_dData_dList.C_List_Nil -> (dtb__282 = Base_dIntrinsics.v_natTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 352 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitCaseFast = (fun (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((v_isNatTy ec) scrutTy) then (v_natLitCaseAlts alts) else false) then (v_natLitCaseHasCatchAll alts) else false))

# 1732 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isFloatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__284) -> (match dtb__284 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__285, dtb__286) -> (match dtb__286 with
  | B_dData_dList.C_List_Nil -> (dtb__285 = Base_dIntrinsics.v_floatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1192 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForExpected = (fun (ec : Elab_dTypes.t_Ec) (name : string) (expected : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_numMethodOpName ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__287) -> (if ((v_isIntTy ec) expected) then false else (if ((v_isNatTy ec) expected) then false else (if ((v_isFloatTy ec) expected) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VMeta (dtb__288, dtb__289) -> false
  | _ -> true
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1209 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForHint = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__290) -> (((v_skipArithSpecForExpected mc0) mc1) dtb__290)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1739 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceTerm = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (if (if ((v_isIntTy ec) expected) then ((v_isNatTy ec) actual) else false) then (B_dData_dMaybe.C_Maybe_Just ((v_natToIntTerm term))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1744 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceNatOperands = (fun (ec : Elab_dTypes.t_Ec) (aTy : Core_dTerm.t_Value) (bTy : Core_dTerm.t_Value) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) -> (if (if ((v_isNatTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else (if (if ((v_isNatTy ec) aTy) then ((v_isIntTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = bTy }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = bTerm } })) else (if (if ((v_isIntTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = aTy; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = aTerm; B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else B_dData_dMaybe.C_Maybe_Nothing))))

# 1762 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithOpNameOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) -> (if (mc1 = "+") then (B_dData_dMaybe.C_Maybe_Just ("+")) else (if (mc1 = "-") then (B_dData_dMaybe.C_Maybe_Just ("-")) else (if (mc1 = "*") then (B_dData_dMaybe.C_Maybe_Just ("*")) else (if (mc1 = "/") then (B_dData_dMaybe.C_Maybe_Just ("/")) else (if (Base_dSource.v_containsDot mc1) then ((Elab_dDict.v_numMethodOpName mc0) mc1) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1769 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithNatName = (fun (mc0 : string) -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1775 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (name)), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1778 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithNatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1787 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithFloatName = (fun (mc0 : string) -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1783 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithFloatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1793 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isEIntExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EInt (dtb__291, dtb__292) -> (B_dData_dMaybe.C_Maybe_Just (dtb__291))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1902 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isSimpleComp = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__293, dtb__294) -> true
  | _ -> false
))

# 1959 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_literalTraitLower = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (traitName : string) (methodName : string) (lit : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let dictDom = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName traitName), (B_dData_dList.C_List__x58__x58_ (((Elab_dTypes.v_forceVal ec) expected), B_dData_dList.C_List_Nil)))))) in (let nd_uscrut9 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) dictDom) sp) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__295) -> (match dtb__295 with
  | { B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = dtb__297 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName methodName), sp)), (B_dData_dList.C_List__x58__x58_ (lit, B_dData_dList.C_List_Nil)), sp)); B_dData_dPair.f_Pair_second = dtb__297 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__298) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 1968 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_exprFormName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EFloat (dtb__299, dtb__300) -> "EFloat"
  | Frontend_dRast.C_Expr_EInterp (dtb__301, dtb__302) -> "EInterp"
  | Frontend_dRast.C_Expr_EAnn (dtb__303, dtb__304, dtb__305) -> "EAnn"
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

# 2006 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 2042 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPiWithMetasFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec } else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__360; B_dData_dPair.f_Pair_second = dtb__361 } -> ((((v_stripPiWithMetasFuel (fuel - 1)) ctx) dtb__361) ((Core_dEval.v_applyClosure dtb__359) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }
)))

# 2039 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_stripPiWithMetas = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_stripPiWithMetasFuel 64) ctx) ec) v))

# 2031 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppResultMatches = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (v : Core_dTerm.t_Value) -> (match (((v_stripPiWithMetas ctx) ec) v) with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__363)) (Elab_dTypes.v_ecSolsP dtb__363)) (Elab_dTypes.v_ctxDepth ctx)) dtb__362) expected) with
  | Base_dDiag.C_Check_OkC (dtb__364) -> true
  | Base_dDiag.C_Check_ErrC (dtb__365) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2023 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (match dtb__366 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__367) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__367).Elab_dTypes.f_DtCtor_dtCtorType))
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__368) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__368))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2056 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueAppTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueAppCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__369, dtb__370) -> (match dtb__370 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__369))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2062 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__372 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__371))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2210 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_patHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__373, dtb__374, dtb__375) -> (v_anyFieldHasOverCtor dtb__374)
  | Frontend_dRast.C_Pat_PAs (dtb__376, dtb__377, dtb__378) -> (v_patHasOverCtor dtb__377)
  | Frontend_dRast.C_Pat_PCon (dtb__379, dtb__380, dtb__381) -> (if (Frontend_dReserved.v_isInternalSyntaxName (Frontend_dRast_dName.v_rnameKey dtb__379)) then true else (v_anyPatHasOverCtor dtb__380))
  | _ -> false
))
# 2218 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyPatHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__382, dtb__383) -> (if (v_patHasOverCtor dtb__382) then true else (v_anyPatHasOverCtor dtb__383))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 2223 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyFieldHasOverCtor = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__384, dtb__385) -> (match dtb__384 with
  | { B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = dtb__387 } -> (if (v_patHasOverCtor dtb__387) then true else (v_anyFieldHasOverCtor dtb__385))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2228 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_clausesHaveOverCtor = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__388, dtb__389) -> (match dtb__388 with
  | { B_dData_dPair.f_Pair_first = dtb__390; B_dData_dPair.f_Pair_second = dtb__391 } -> (if (v_anyPatHasOverCtor dtb__390) then true else (v_clausesHaveOverCtor dtb__389))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2233 "Vuna/Compiler/Elab/Term/Impl.vuna"
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
# 2283 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBind = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__439; B_dData_dPair.f_Pair_second = dtb__440 } -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__440)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__439; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 2287 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandDoStmt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_DoStmt) -> (match mc1 with
  | Frontend_dRast.C_DoStmt_DLet (dtb__441, dtb__442) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__441)) (fun (b2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DLet (b2, dtb__442))))))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__443, dtb__444) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__443)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DExpr (v2, dtb__444))))))
  | Frontend_dRast.C_DoStmt_DBind (dtb__445, dtb__446, dtb__447) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__446)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DBind (dtb__445, v2, dtb__447))))))
  | _ -> failwith "DT: impossible branch"
))

# 2423 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPisWithMetas = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__448, dtb__449, dtb__450, dtb__451, dtb__452) -> (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__453; B_dData_dPair.f_Pair_second = dtb__454 } -> ((((v_stripPisWithMetas (fuel - 1)) ctx) dtb__454) ((Core_dEval.v_applyClosure dtb__452) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__453)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }))
)))

# 2438 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isMetaHeadedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VMeta (dtb__455, dtb__456) -> true
  | _ -> false
))

# 2445 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isRigidHeadValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VCon (dtb__457, dtb__458) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__459) -> (match dtb__459 with
  | Core_dTerm.C_Neutral_NVar (dtb__460, dtb__461, dtb__462) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb__463, dtb__464) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2456 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_remainingExplicitPis = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then 0 else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469) -> (let v2 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__465, (Elab_dTypes.v_ctxDepth ctx), B_dData_dList.C_List_Nil)))) in (let rest = ((((v_remainingExplicitPis (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__469) v2)) in (if dtb__466 then rest else (rest + 1))))
  | _ -> 0
)))

# 2474 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryUseHint = (fun (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) (piTy : Core_dTerm.t_Value) -> (let nd_uscrut4 = ((((v_stripPisWithMetas 64) ctx) ec) piTy) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__470) -> (match dtb__470 with
  | { B_dData_dPair.f_Pair_first = dtb__471; B_dData_dPair.f_Pair_second = dtb__472 } -> (let forcedRes = ((Elab_dTypes.v_forceVal dtb__472) dtb__471) in (if ((v_isMetaHeadedValue dtb__472) forcedRes) then (if ((v_isRigidHeadValue dtb__472) expected) then (match ((((Elab_dMeta.v_convEc dtb__472) (Elab_dTypes.v_ctxDepth ctx)) expected) forcedRes) with
  | Base_dDiag.C_Check_ErrC (dtb__473) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__474) -> (B_dData_dMaybe.C_Maybe_Just (dtb__474))
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__475) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 2521 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowAndResult = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__476) -> (match dtb__476 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__477, dtb__478) -> (match dtb__478 with
  | B_dData_dList.C_List__x58__x58_ (dtb__479, dtb__480) -> (match dtb__480 with
  | B_dData_dList.C_List__x58__x58_ (dtb__481, dtb__482) -> (if (dtb__477 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__479; B_dData_dPair.f_Pair_second = dtb__481 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2527 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowOfValue = (fun (v : Core_dTerm.t_Value) -> (match (v_effRowAndResult v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__483) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__483)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2534 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNilRowValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VCon (dtb__484, dtb__485) -> (dtb__484 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 2541 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryLabelTail = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__486, dtb__487) -> (if (dtb__486 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__487 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__488, dtb__489) -> (match dtb__489 with
  | B_dData_dList.C_List__x58__x58_ (dtb__490, dtb__491) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__488; B_dData_dPair.f_Pair_second = dtb__490 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2552 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_shortGlobalName = (fun (g : string) -> (Base_dSource.v_lastSeg g))

# 2562 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_labelHeadArgs = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__492, dtb__493) -> ((v_labelHeadArgs (String.concat "" [mc0; " "; ((Core_dEval.v_showValueAt 6) dtb__492)])) dtb__493)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 2556 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLabelText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__494) -> (match dtb__494 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__495, dtb__496) -> ((v_labelHeadArgs (v_shortGlobalName dtb__495)) dtb__496)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 2567 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__497) -> dtb__497
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 2574 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryText = (fun (ec : Elab_dTypes.t_Ec) (n : Core_dTerm.t_Value) (h : Core_dTerm.t_Value) -> (if (((v_rowNameText ec) n) = "default") then ((v_rowLabelText ec) h) else (String.concat "" [((v_rowLabelText ec) h); "@"; ((v_rowNameText ec) n)])))

# 2582 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_namedLabelParts = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__498) -> (match dtb__498 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__499, dtb__500) -> (if (dtb__499 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut6 = dtb__500 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__501, dtb__502) -> (match dtb__502 with
  | B_dData_dList.C_List__x58__x58_ (dtb__503, dtb__504) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__503 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2594 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryTextOf = (fun (ec : Elab_dTypes.t_Ec) (label : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_namedLabelParts ec) label) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_rowLabelText ec) label)
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (match dtb__505 with
  | { B_dData_dPair.f_Pair_first = dtb__506; B_dData_dPair.f_Pair_second = dtb__507 } -> (((v_rowEntryText ec) dtb__506) dtb__507)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2601 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowEffectLabels = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__508, dtb__509) -> (if (dtb__508 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (dtb__508 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__508, dtb__509))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__510) -> (match dtb__510 with
  | { B_dData_dPair.f_Pair_first = dtb__511; B_dData_dPair.f_Pair_second = dtb__512 } -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) dtb__511) then B_dData_dMaybe.C_Maybe_Nothing else (match (((v_rowEffectLabels (fuel - 1)) ec) dtb__512) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__513) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (((v_rowEntryTextOf ec) dtb__511), dtb__513))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2627 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowNonDefaultHostEntries = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__514, dtb__515) -> (if (dtb__514 = Base_dIntrinsics.v_effRowNilCtor) then B_dData_dList.C_List_Nil else (if (dtb__514 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__514, dtb__515))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__516) -> (match dtb__516 with
  | { B_dData_dPair.f_Pair_first = dtb__517; B_dData_dPair.f_Pair_second = dtb__518 } -> (let rest = (((v_rowNonDefaultHostEntries (fuel - 1)) ec) dtb__518) in (let nd_uscrut13 = ((v_namedLabelParts ec) dtb__517) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> rest
  | B_dData_dMaybe.C_Maybe_Just (dtb__519) -> (match dtb__519 with
  | { B_dData_dPair.f_Pair_first = dtb__520; B_dData_dPair.f_Pair_second = dtb__521 } -> (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) dtb__521) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VNeutral (dtb__522) -> (match dtb__522 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__523, dtb__524) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb__523) then (if (((v_rowNameText ec) dtb__520) = "default") then rest else (B_dData_dList.C_List__x58__x58_ ((((v_rowEntryText ec) dtb__520) dtb__521), rest))) else rest)
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

# 2653 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_joinEffectLabels = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__525, dtb__526) -> (match dtb__526 with
  | B_dData_dList.C_List_Nil -> dtb__525
  | _ -> (String.concat "" [dtb__525; ", "; (v_joinEffectLabels dtb__526)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2661 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_unhandledEffectLabel = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) -> (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__527) -> (if ((v_isNilRowValue ec) dtb__527) then (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__528) -> (match (((v_rowEffectLabels 64) ec) dtb__528) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__529) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__529) B_dData_dList.C_List_Nil) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__529)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2683 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_sameLabelValue = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let defs = (Elab_dTypes.v_ecDefTbl ec) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let fa = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) a) in (let fb = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) b) in (let nd_uscrut7 = (((Core_dEval.v_valueEqFuel Core_dTerm.v_defaultFuel) fa) fb) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__530) -> (if dtb__530 then true else false)
  | _ -> false
)))))))

# 2694 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowContainsValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (expected : Core_dTerm.t_Value) (label : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VCon (dtb__531, dtb__532) -> (if (dtb__531 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__531, dtb__532))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__533) -> (match dtb__533 with
  | { B_dData_dPair.f_Pair_first = dtb__534; B_dData_dPair.f_Pair_second = dtb__535 } -> (if (((v_sameLabelValue ec) label) dtb__534) then true else ((((v_rowContainsValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__535)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
)))

# 2709 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowSubValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (actual : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) actual) with
  | Core_dTerm.C_Value_VCon (dtb__536, dtb__537) -> (if (dtb__536 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__536 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__536, dtb__537))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__538) -> (match dtb__538 with
  | { B_dData_dPair.f_Pair_first = dtb__539; B_dData_dPair.f_Pair_second = dtb__540 } -> (if ((((v_rowContainsValue ec) (fuel - 1)) expected) dtb__539) then ((((v_rowSubValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__540)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)))

# 2773 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_weakenLabelTerm = (fun (d : int) (label : Core_dTerm.t_Value) (tailF : Core_dTerm.t_Value) (result : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effWeakenName)), ((Core_dEval.v_quote d) label), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) tailF), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) result), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)))

# 2729 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryEffLift = (fun (ctx : Elab_dTypes.t_Ctx) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (match (((Elab_dMeta.v_globalsLookup Base_dIntrinsics.v_effWeakenName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__541) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__542) -> (let nd_uscrut11 = (v_rowEntryLabelTail ((Elab_dTypes.v_forceVal ec) (B_dData_dPair.v_firstOf dtb__542))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__543) -> (match dtb__543 with
  | { B_dData_dPair.f_Pair_first = dtb__544; B_dData_dPair.f_Pair_second = dtb__545 } -> (let tailF = ((Elab_dTypes.v_forceVal ec) dtb__545) in (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) tailF) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__546) -> (match ((((Elab_dMeta.v_convEc ec) d) (B_dData_dPair.v_secondOf dtb__542)) (B_dData_dPair.v_secondOf dtb__546)) with
  | Base_dDiag.C_Check_ErrC (dtb__547) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__548) -> (let actualRow = (B_dData_dPair.v_firstOf dtb__546) in (if ((((v_rowSubValue dtb__548) 64) actualRow) (B_dData_dPair.v_firstOf dtb__542)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = term; B_dData_dPair.f_Pair_second = dtb__548 })) else (if ((v_isNilRowValue dtb__548) actualRow) then (match (((Elab_dMeta.v_globalsLookup Base_dIntrinsics.v_effRaiseName) globals) dtb__548) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__549) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effRaiseName)), ((Core_dEval.v_quote d) (B_dData_dPair.v_firstOf dtb__542)), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) (B_dData_dPair.v_secondOf dtb__542)), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)); B_dData_dPair.f_Pair_second = dtb__548 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Elab_dMeta.v_convEc dtb__548) d) actualRow) tailF) with
  | Base_dDiag.C_Check_ErrC (dtb__550) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__551) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((((v_weakenLabelTerm d) dtb__544) tailF) (B_dData_dPair.v_secondOf dtb__542)) term); B_dData_dPair.f_Pair_second = dtb__551 }))
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

# 2877 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeHeadTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__552) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__552) then (Core_dTerm.C_Term_TRecord (name, B_dData_dList.C_List_Nil)) else (Core_dTerm.C_Term_TGlobal (name)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2884 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeAppTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__553) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__553) then (Core_dTerm.C_Term_TRecord (name, args)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 3160 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromInt")), t, Core_dTerm.C_Rig_Rig1)))

# 3164 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromFloatTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromFloat")), t, Core_dTerm.C_Rig_Rig1)))

# 3167 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil))))

# 3170 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isStringTyValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__554) -> (match dtb__554 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__555, dtb__556) -> (match dtb__556 with
  | B_dData_dList.C_List_Nil -> (dtb__555 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 3252 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorSpineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__557) -> { B_dData_dPair.f_Pair_first = dtb__557; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__558, dtb__559) -> { B_dData_dPair.f_Pair_first = dtb__558; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__559) }
  | Core_dTerm.C_Term_TApp (dtb__560, dtb__561, dtb__562) -> (match (v_ctorSpineOfType dtb__560) with
  | { B_dData_dPair.f_Pair_first = dtb__563; B_dData_dPair.f_Pair_second = dtb__564 } -> { B_dData_dPair.f_Pair_first = dtb__563; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__564) (B_dData_dList.C_List__x58__x58_ (dtb__561, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 3248 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorResultArgs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> (v_ctorResultArgs dtb__569)
  | _ -> (B_dData_dPair.v_secondOf (v_ctorSpineOfType mc0))
))

# 3260 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__570, dtb__571, dtb__572, dtb__573, dtb__574) -> (v_dropPis dtb__574)
  | _ -> mc0
))

# 3264 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_identityArgs = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__575, dtb__576) -> (match dtb__575 with
  | Core_dTerm.C_Term_TVar (dtb__577, dtb__578, dtb__579) -> (if (dtb__578 = ((mc1 - 1) - mc0)) then (((v_identityArgs (mc0 + 1)) mc1) dtb__576) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 3274 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorIdentitySpine = (fun (fam : string) (ctor : Elab_dTypes.t_DtCtor) -> (let k = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor)) in (let args = (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor)) in (match (v_ctorSpineOfType (v_dropPis (Elab_dTypes.v_dtCtorType ctor))) with
  | { B_dData_dPair.f_Pair_first = dtb__580; B_dData_dPair.f_Pair_second = dtb__581 } -> (if (dtb__580 = fam) then (if ((B_dData_dList.v_length args) > 0) then (if ((B_dData_dList.v_length args) <= k) then (((v_identityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
))))

# 3290 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_takeRigsGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__582, dtb__583) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__582), ((v_takeRigsGo (mc0 - 1)) dtb__583))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 3287 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_takeRigs = (fun (n : int) (bs : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_takeRigsGo n) bs))

# 3308 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorFamilyArgsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc4 : int) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__584, dtb__585) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__586, dtb__587) -> (match ((Elab_dTypes.v_forceVal mc0) mc1) with
  | Core_dTerm.C_Value_VPi (dtb__588, dtb__589, dtb__590, dtb__591, dtb__592) -> (if dtb__589 then ((((((v_ctorFamilyArgsGo mc0) ((Core_dEval.v_applyClosure dtb__592) dtb__584)) dtb__585) dtb__587) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote mc4) dtb__584); B_dData_dPair.f_Pair_second = dtb__586 }, mc5))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 3294 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFamilyArgs = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ctor : Elab_dTypes.t_DtCtor) (expected : Core_dTerm.t_Value) -> (let fam = (Elab_dTypes.v_dtCtorFamily ctor) in (if ((v_ctorIdentitySpine fam) ctor) then (let nd_uscrut5 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__593) -> (match dtb__593 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__594, dtb__595) -> (let arity = (B_dData_dList.v_length (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor))) in (if (dtb__594 = fam) then (if ((B_dData_dList.v_length dtb__595) = arity) then ((((((v_ctorFamilyArgsGo ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType ctor))) dtb__595) ((v_takeRigs arity) (Elab_dTypes.v_dtCtorTelescope ctor))) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 3330 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natPatGo = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n <= 0) then (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natZeroCtor), B_dData_dList.C_List_Nil, sp)) else (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natSuccCtor), (B_dData_dList.C_List__x58__x58_ (((v_natPatGo (n - 1)) sp), B_dData_dList.C_List_Nil)), sp))))

# 3326 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natPatOf = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC (((v_natPatGo n) sp)))))

# 3338 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat) -> (let dtnat__596 = mc0 in (if (dtnat__596 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__597 = (dtnat__596 - 1) in (match mc4 with
  | Frontend_dRast.C_Pat_PCon (dtb__598, dtb__599, dtb__600) -> (let nd_uscrut9 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__598)) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__601) -> (match dtb__601 with
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__602, dtb__603) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor mc1) dtb__600) (B_dData_dMaybe.C_Maybe_Just (mc3))) dtb__602) dtb__603)) (fun (target : string) -> (((((((v_resolveCtorPatFuel dtb__597) mc1) mc2) mc3) target) dtb__599) dtb__600)))
  | Frontend_dReserved.C_Reserved_RsListCons -> (match ((v_litFamilyCons mc1) ((v_listLitFamily mc1) mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__604) -> (((((((v_resolveCtorPatFuel dtb__597) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__604)) dtb__599) dtb__600)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__599, dtb__600)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dReserved.C_Reserved_RsListNil -> (match (((v_litFamilyCtor mc1) ((v_listLitFamily mc1) mc3)) "Nil") with
  | B_dData_dMaybe.C_Maybe_Just (dtb__605) -> (((((((v_resolveCtorPatFuel dtb__597) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__605)) dtb__599) dtb__600)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__599, dtb__600)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_resolveCtorPatFuel dtb__597) mc1) mc2) mc3) (Frontend_dRast_dName.v_rnameKey dtb__598)) dtb__599) dtb__600)
)
  | _ -> (((((((v_resolveCtorPatFuel dtb__597) mc1) mc2) mc3) (Frontend_dRast_dName.v_rnameKey dtb__598)) dtb__599) dtb__600)
))
  | Frontend_dRast.C_Pat_PInt (dtb__606, dtb__607) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__606) dtb__607)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | Frontend_dRast.C_Pat_PAs (dtb__608, dtb__609, dtb__610) -> (match dtb__609 with
  | Frontend_dRast.C_Pat_PInt (dtb__611, dtb__612) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__611) dtb__612)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PAs (dtb__608, p, dtb__610)); B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | Frontend_dRast.C_Pat_PRecord (dtb__613, dtb__614, dtb__615) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)))))
# 3374 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolveCtorPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : string) (mc5 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc6 : Base_dSource.t_Span) -> (let dtnat__616 = mc0 in (if (dtnat__616 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__617 = (dtnat__616 - 1) in (match ((Elab_dMeta.v_dtCtorLookupEc mc1) mc4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), mc5, mc6)); B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__618) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs mc1) mc2) dtb__618) mc3) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__619) -> (match dtb__619 with
  | { B_dData_dPair.f_Pair_first = dtb__620; B_dData_dPair.f_Pair_second = dtb__621 } -> (match dtb__621 with
  | { B_dData_dPair.f_Pair_first = dtb__622; B_dData_dPair.f_Pair_second = dtb__623 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__617) dtb__623) mc2) dtb__622) mc5)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__624; B_dData_dPair.f_Pair_second = dtb__625 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), dtb__624, mc6)); B_dData_dPair.f_Pair_second = dtb__625 }))
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
# 3390 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolvePatArgsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__626 = mc0 in (if (dtnat__626 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__627 = (dtnat__626 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__628, dtb__629) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__630, dtb__631, dtb__632, dtb__633, dtb__634) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__630, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__630) dtb__633) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__634) v) in (if dtb__631 then (((((v_resolvePatArgsFuel dtb__627) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__628, dtb__629))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__627) mc1) mc2) dtb__633) dtb__628)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__635; B_dData_dPair.f_Pair_second = dtb__636 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__627) dtb__636) ctx2) ty2) dtb__629)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__637; B_dData_dPair.f_Pair_second = dtb__638 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__635, dtb__637)); B_dData_dPair.f_Pair_second = dtb__638 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3422 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverAltsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__639 = mc0 in (if (dtnat__639 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__640 = (dtnat__639 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__641, dtb__642) -> (match dtb__641 with
  | { B_dData_dPair.f_Pair_first = dtb__643; B_dData_dPair.f_Pair_second = dtb__644 } -> ((Base_dCommon.v_bind (((((v_resolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__643)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__645; B_dData_dPair.f_Pair_second = dtb__646 } -> ((Base_dCommon.v_bind (((((v_resolveOverAltsGo dtb__640) dtb__646) mc2) mc3) dtb__642)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__647; B_dData_dPair.f_Pair_second = dtb__648 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__645; B_dData_dPair.f_Pair_second = dtb__644 }, dtb__647)); B_dData_dPair.f_Pair_second = dtb__648 }))
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
let v_resolveOverAlts = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 3464 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveClausePatsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__649 = mc0 in (if (dtnat__649 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__650 = (dtnat__649 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__651, dtb__652) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__653, dtb__654, dtb__655, dtb__656, dtb__657) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__653, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__653) dtb__656) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__657) v) in (if dtb__654 then (((((v_resolveClausePatsFuel dtb__650) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__651, dtb__652))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__650) mc1) mc2) dtb__656) dtb__651)) (fun (q : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__658; B_dData_dPair.f_Pair_second = dtb__659 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel dtb__650) dtb__659) ctx2) ty2) dtb__652)) (fun (r : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__660; B_dData_dPair.f_Pair_second = dtb__661 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__658, dtb__660)); B_dData_dPair.f_Pair_second = dtb__661 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3446 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverFunPatsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__662 = mc0 in (if (dtnat__662 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__663 = (dtnat__662 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__664, dtb__665) -> (match dtb__664 with
  | { B_dData_dPair.f_Pair_first = dtb__666; B_dData_dPair.f_Pair_second = dtb__667 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__666)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__668; B_dData_dPair.f_Pair_second = dtb__669 } -> ((Base_dCommon.v_bind (((((v_resolveOverFunPatsGo dtb__663) dtb__669) mc2) mc3) dtb__665)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__670; B_dData_dPair.f_Pair_second = dtb__671 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__668; B_dData_dPair.f_Pair_second = dtb__667 }, dtb__670)); B_dData_dPair.f_Pair_second = dtb__671 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3441 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverFunPats = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 3545 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doMarkerHead = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__672, dtb__673, dtb__674) -> (match dtb__672 with
  | Frontend_dRast.C_Expr_EVar (dtb__675, dtb__676) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__675)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__677) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 3568 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_decodeDoChain = (fun (fuel : int) (canonical : string) (acc : t_DoChainStep B_dData_dList.t_List) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = expr in (match nd_uscrut4 with
  | Frontend_dRast.C_Expr_EApp (dtb__678, dtb__679, dtb__680) -> (match dtb__678 with
  | Frontend_dRast.C_Expr_EVar (dtb__681, dtb__682) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__681)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = expr }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__683) -> (if (canonical <> dtb__683) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut12 = dtb__679 in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__684, dtb__685) -> (match dtb__685 with
  | B_dData_dList.C_List__x58__x58_ (dtb__686, dtb__687) -> (match dtb__686 with
  | Frontend_dRast.C_Expr_ELam (dtb__688, dtb__689, dtb__690) -> (match dtb__688 with
  | B_dData_dList.C_List__x58__x58_ (dtb__691, dtb__692) -> (match dtb__691 with
  | { B_dData_dPair.f_Pair_first = dtb__693; B_dData_dPair.f_Pair_second = dtb__694 } -> (match dtb__692 with
  | B_dData_dList.C_List_Nil -> (match dtb__687 with
  | B_dData_dList.C_List_Nil -> ((((v_decodeDoChain (fuel - 1)) dtb__683) (B_dData_dList.C_List__x58__x58_ ((C_DoChainStep_DoChainStep (dtb__693, dtb__684, dtb__682, dtb__694)), acc))) dtb__689)
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

# 3587 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_decodeDoBlock = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__695, dtb__696, dtb__697) -> (match dtb__695 with
  | Frontend_dRast.C_Expr_EVar (dtb__698, dtb__699) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__698)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__700) -> (let nd_uscrut8 = ((((v_decodeDoChain 4096) dtb__700) B_dData_dList.C_List_Nil) mc0) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__701) -> (match dtb__701 with
  | { B_dData_dPair.f_Pair_first = dtb__702; B_dData_dPair.f_Pair_second = dtb__703 } -> (B_dData_dMaybe.C_Maybe_Just ({ f_DoChain_doChainCanonical = dtb__700; f_DoChain_doChainSteps = dtb__702; f_DoChain_doChainLast = dtb__703; f_DoChain_doChainSpan = dtb__699 }))
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

# 3599 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_doChainBuild = (fun (mc0 : string) (mc1 : t_DoChainStep B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__704, dtb__705) -> (match dtb__704 with
  | C_DoChainStep_DoChainStep (dtb__706, dtb__707, dtb__708, dtb__709) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), dtb__708)), (B_dData_dList.C_List__x58__x58_ (dtb__707, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__706; B_dData_dPair.f_Pair_second = dtb__709 }, B_dData_dList.C_List_Nil)), ((((v_doChainBuild mc0) dtb__705) mc2) mc3), dtb__708)), B_dData_dList.C_List_Nil)))), dtb__708))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 3608 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainFallback = (fun (chain : t_DoChain) -> ((((v_doChainBuild (chain).f_DoChain_doChainCanonical) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast) (chain).f_DoChain_doChainSpan))

# 3615 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_splitDoSpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__710, dtb__711) -> (match ((v_splitDoSpine ((Core_dEval.v_applyValue mc0) dtb__710)) dtb__711) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__710 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__712) -> (B_dData_dMaybe.C_Maybe_Just (dtb__712))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 3623 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_splitDoExpected = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VNeutral (dtb__713) -> (match dtb__713 with
  | Core_dTerm.C_Neutral_NVar (dtb__714, dtb__715, dtb__716) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__714, dtb__715, B_dData_dList.C_List_Nil))))) dtb__716)
  | Core_dTerm.C_Neutral_NGlobal (dtb__717, dtb__718) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__717, B_dData_dList.C_List_Nil))))) dtb__718)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3641 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindShapeOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__719, dtb__720, dtb__721, dtb__722, dtb__723) -> (if dtb__720 then (match dtb__723 with
  | Core_dTerm.C_Term_TPi (dtb__724, dtb__725, dtb__726, dtb__727, dtb__728) -> (if dtb__725 then (match dtb__727 with
  | Core_dTerm.C_Term_TApp (dtb__729, dtb__730, dtb__731) -> (match dtb__729 with
  | Core_dTerm.C_Term_TGlobal (dtb__732) -> (match dtb__730 with
  | Core_dTerm.C_Term_TVar (dtb__733, dtb__734, dtb__735) -> (match dtb__728 with
  | Core_dTerm.C_Term_TPi (dtb__736, dtb__737, dtb__738, dtb__739, dtb__740) -> (if dtb__737 then (match dtb__740 with
  | Core_dTerm.C_Term_TPi (dtb__741, dtb__742, dtb__743, dtb__744, dtb__745) -> (if dtb__742 then (match dtb__745 with
  | Core_dTerm.C_Term_TPi (dtb__746, dtb__747, dtb__748, dtb__749, dtb__750) -> (if dtb__747 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__749 with
  | Core_dTerm.C_Term_TApp (dtb__751, dtb__752, dtb__753) -> (match dtb__751 with
  | Core_dTerm.C_Term_TVar (dtb__754, dtb__755, dtb__756) -> (match dtb__752 with
  | Core_dTerm.C_Term_TVar (dtb__757, dtb__758, dtb__759) -> (match dtb__750 with
  | Core_dTerm.C_Term_TPi (dtb__760, dtb__761, dtb__762, dtb__763, dtb__764) -> (if dtb__761 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__763 with
  | Core_dTerm.C_Term_TPi (dtb__765, dtb__766, dtb__767, dtb__768, dtb__769) -> (if dtb__766 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__768 with
  | Core_dTerm.C_Term_TVar (dtb__770, dtb__771, dtb__772) -> (match dtb__769 with
  | Core_dTerm.C_Term_TApp (dtb__773, dtb__774, dtb__775) -> (match dtb__773 with
  | Core_dTerm.C_Term_TVar (dtb__776, dtb__777, dtb__778) -> (match dtb__774 with
  | Core_dTerm.C_Term_TVar (dtb__779, dtb__780, dtb__781) -> (match dtb__764 with
  | Core_dTerm.C_Term_TApp (dtb__782, dtb__783, dtb__784) -> (match dtb__782 with
  | Core_dTerm.C_Term_TVar (dtb__785, dtb__786, dtb__787) -> (match dtb__783 with
  | Core_dTerm.C_Term_TVar (dtb__788, dtb__789, dtb__790) -> (if (if (if (if (dtb__734 = 0) then (dtb__755 = 3) else false) then (dtb__777 = 5) else false) then (dtb__786 = 5) else false) then (if (if (if (if (dtb__758 = 1) then (dtb__771 = 2) else false) then (dtb__780 = 2) else false) then (dtb__789 = 2) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__748, dtb__762, dtb__767)))) else (if (if (if (if (dtb__758 = 0) then (dtb__771 = 1) else false) then (dtb__780 = 3) else false) then (dtb__789 = 3) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__748, dtb__762, dtb__767)))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 3656 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindHeadOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (match ((Elab_dTypes.v_ctxLookup bindName) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__791) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup bindName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__792) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (bindName)); B_dData_dPair.f_Pair_second = dtb__792 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 3667 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBlockShapeOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (let nd_uscrut4 = ((((v_doBindHeadOf globals) ctx) ec) bindName) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__793) -> (match dtb__793 with
  | { B_dData_dPair.f_Pair_first = dtb__794; B_dData_dPair.f_Pair_second = dtb__795 } -> (match (v_bindShapeOf dtb__795) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__796) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__794; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__795; B_dData_dPair.f_Pair_second = dtb__796 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 3679 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictDefer = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__797; B_dData_dPair.f_Pair_second = dtb__798 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__797; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__798) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__798) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)))

# 3688 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictStep = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dom) then ((((v_doDictDefer ctx) ec) dom) sp) else (let nd_uscrut6 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) ((Elab_dTypes.v_forceVal ec) dom)) sp) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_ErrC (dtb__799) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (if ((Elab_dDict.v_isRigidDictArg ec) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (Base_dDiag.C_Check_ErrC (dtb__799))))
  | Base_dDiag.C_Check_OkC (dtb__800) -> (match dtb__800 with
  | { B_dData_dPair.f_Pair_first = dtb__801; B_dData_dPair.f_Pair_second = dtb__802 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__801; B_dData_dPair.f_Pair_second = dtb__802 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3716 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDoBlock = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (bindName : string) (headTerm : Core_dTerm.t_Term) (bindTyTerm : Core_dTerm.t_Term) (shape : t_DoBindShape) (mVal : Core_dTerm.t_Value) (aVal : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match shape with
  | C_DoBindShape_DoBindShape (dtb__803, dtb__804, dtb__805) -> (let nd_uscrut14 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) bindTyTerm)) in (match nd_uscrut14 with
  | Core_dTerm.C_Value_VPi (dtb__806, dtb__807, dtb__808, dtb__809, dtb__810) -> (if dtb__807 then (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_applyClosure dtb__810) mVal)) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VPi (dtb__811, dtb__812, dtb__813, dtb__814, dtb__815) -> (if dtb__812 then (if ((Elab_dDict.v_isDictDomain ec) dtb__814) then ((Base_dCommon.v_bind ((((((v_doDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__814)) (fun (dp : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dp with
  | { B_dData_dPair.f_Pair_first = dtb__816; B_dData_dPair.f_Pair_second = dtb__817 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ f_DoPlan_planBind = bindName; f_DoPlan_planHead = headTerm; f_DoPlan_planMTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) mVal); f_DoPlan_planMVal = mVal; f_DoPlan_planAVal = aVal; f_DoPlan_planDictTerm = dtb__816; f_DoPlan_planRigE = dtb__803; f_DoPlan_planRigL = dtb__804; f_DoPlan_planInnerRig = dtb__805; f_DoPlan_planEc = dtb__817 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))
  | _ -> failwith "DT: impossible branch"
)))

# 3743 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindAppTerm = (fun (ecLinear : Elab_dTypes.t_Ec) (ecPaper : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (binderSp : Base_dSource.t_Span) (plan : t_DoPlan) (binder : string) (aVal : Core_dTerm.t_Value) (eTerm : Core_dTerm.t_Term) (argRig : Core_dTerm.t_Rig) (lamRig : Core_dTerm.t_Rig) (inner : Core_dTerm.t_Term) -> (let depth = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue binder) aVal) ctx) in (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) inner) else inner) in (let slot0 = ((Core_dTerm.v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) (B_dData_dMaybe.C_Maybe_Just ((((Core_dTerm.v_shift 0) 1) ((Core_dEval.v_quote depth) ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) (plan).f_DoPlan_planAVal)))))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear ecLinear) ctx) then (if (((Elab_dMeta.v_termHasOuterLinear ecLinear) ctx2) inner) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (let lamTerm = (Core_dTerm.C_Term_TLam (binder, lamRig, slot, binderSp, inner2)) in (let args = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planMTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planDictTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) aVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) (plan).f_DoPlan_planAVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = eTerm; B_dData_dPair.f_Pair_second = argRig }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = lamTerm; B_dData_dPair.f_Pair_second = (plan).f_DoPlan_planRigL }, B_dData_dList.C_List_Nil)))))))))))) in ((Elab_dMeta.v_foldAppTerms (plan).f_DoPlan_planHead) args)))))))))

# 57 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_elabConAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (scrutVal : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) (cname : string) (args : Frontend_dRast.t_Pat B_dData_dList.t_List) (psp : Base_dSource.t_Span) (body : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_findCtorIn cname) (Elab_dTypes.v_dtDataCtors dd)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 psp) (Base_dDiagnostics_dTc.C_TcErr_UnknownConstructorInCase ((Frontend_dRast.v_ctorDisplayName cname), (Elab_dTypes.v_dtDataName dd)))) (Frontend_dRast.v_ctorDisplayName cname)) (Elab_dTypes.v_dtDataName dd))
  | B_dData_dMaybe.C_Maybe_Just (dtb__818) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((Elab_dCase.v_bindCtorTele ctx) (Elab_dTypes.v_dtCtorType dtb__818)) args))) (fun (p : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dRast.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__819; B_dData_dPair.f_Pair_second = dtb__820 } -> (match dtb__820 with
  | { B_dData_dPair.f_Pair_first = dtb__821; B_dData_dPair.f_Pair_second = dtb__822 } -> (if (Elab_dMeta.v_nonEmpty dtb__822) then (((Base_dDiagnostics_dTc.v_tcErr1 psp) (Base_dDiagnostics_dTc.C_TcErr_BranchTooManyArgs ((Frontend_dRast.v_ctorDisplayName cname)))) (Frontend_dRast.v_ctorDisplayName cname)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((((Elab_dCase.v_unifyIdxListSized ec) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb__819)) ((Elab_dCase.v_ctorResultValsIn dtb__819) dtb__818)) ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) v))) idxs)))) (fun (refsIdx : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((Elab_dCase.v_branchAfterUnify ec) dtb__819) refsIdx) with
  | Elab_dCase.C_BranchVerdict_BranchImpossibleIndex -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex)
  | Elab_dCase.C_BranchVerdict_BranchImpossibleEmptyCtx -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchEmptyCtx)
  | Elab_dCase.C_BranchVerdict_BranchOk -> ((Base_dCommon.v_bind (((((Elab_dCase.v_reflectScrutinee ec) (Elab_dTypes.v_ctxDepth dtb__819)) refsIdx) ((Elab_dCase.v_ctorValueIn dtb__819) dtb__818)) scrutVal)) (fun (refs2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let refinedExpected = (((Elab_dTypes.v_refineValue refs2) Core_dTerm.v_defaultFuel) expected) in (let branchCtx2 = ((Elab_dTypes.v_ctxRefine dtb__819) refs2) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__823; B_dData_dPair.f_Pair_second = dtb__824 } -> (let n = (B_dData_dList.v_length dtb__821) in (let opaqueIdxs = ((((v_opaqueBranchIndices dtb__824) branchCtx2) n) (Core_dTerm.v_binderPairs dtb__821)) in (let bodyTerm1 = ((Elab_dMeta.v_wrapOpaqueUses opaqueIdxs) dtb__823) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__824) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = cname; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__821; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }; B_dData_dPair.f_Pair_second = dtb__824 }))))))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__825, dtb__826) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__825 with
  | { B_dData_dPair.f_Pair_first = dtb__827; B_dData_dPair.f_Pair_second = dtb__828 } -> (match dtb__827 with
  | Frontend_dRast.C_Pat_PCon (dtb__829, dtb__830, dtb__831) -> ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) (Frontend_dRast_dName.v_rnameKey dtb__829)) dtb__830) dtb__831) dtb__828)) (fun (p : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__832; B_dData_dPair.f_Pair_second = dtb__833 } -> (((((((((((v_elabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__833) mc4) mc5) mc6) mc7) mc8) dtb__826) (B_dData_dList.C_List__x58__x58_ (dtb__832, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PVar (dtb__834, dtb__835) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__826) mc10) dtb__828) dtb__834) dtb__835)
  | Frontend_dRast.C_Pat_PWild (dtb__836) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__826) mc10) dtb__828) "_") dtb__836)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__827)) Base_dDiagnostics_dTc.C_TcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc10); B_dData_dPair.f_Pair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 122 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCatchAllFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (pname : string) (psp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (if (pname = "_") then ctx else (((Elab_dTypes.v_ctxBindValue pname) scrutTy) ctx)) in (if (Elab_dMeta.v_nonEmpty rest) then ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast) else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__837; B_dData_dPair.f_Pair_second = dtb__838 } -> (let binds = (if (pname = "_") then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = pname; Core_dTerm.f_Binder_binderRig = ((Elab_dMeta.v_rigOfLinearValue ec) scrutTy); Core_dTerm.f_Binder_binderSpan = ((Base_dSource.v_spanAtName pname) psp) }, B_dData_dList.C_List_Nil))) in (let bodyTerm1 = (if (pname = "_") then dtb__837 else (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__838) ctx) scrutTy) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__837) else dtb__837)) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__838) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = binds; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }, acc))); B_dData_dPair.f_Pair_second = dtb__838 })))))
  | _ -> failwith "DT: impossible branch"
)))))))
# 152 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun (ps : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = ps in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__839; B_dData_dPair.f_Pair_second = dtb__840 } -> (match dtb__840 with
  | { B_dData_dPair.f_Pair_first = dtb__841; B_dData_dPair.f_Pair_second = dtb__842 } -> (if (((v_natLitCaseFast dtb__842) dtb__841) alts) then ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__842) alts)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> ((((((((((v_checkNatLitCaseFuel (fuel - 1)) globals) ctx) ec3) (v_natToIntTerm dtb__839)) dtb__839) v_natTyValue) alts) expected) sp))) else ((Base_dCommon.v_bind ((((v_resolveOverAlts dtb__842) ctx) dtb__841) alts)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__843; B_dData_dPair.f_Pair_second = dtb__844 } -> (let caseFuel = (((B_dTrait_dOrd.v_max B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (fuel - 1)) (Elab_dCoverage.v_coverageFuelFor ((B_dData_dList.v_map (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)))) dtb__843))) in ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__844) dtb__843)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> (if (v_needsMatrixCase dtb__843) then ((((((((v_checkCaseMatrixFuel caseFuel) globals) ctx) ec3) scrut) dtb__843) expected) sp) else (((((((((v_checkCaseFamFuel caseFuel) globals) ctx) ec3) dtb__839) dtb__841) dtb__843) expected) sp)))))
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
  | Core_dTerm.C_Value_VNeutral (dtb__845) -> (match dtb__845 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__846, dtb__847) -> (if (if (Base_dIntrinsics.v_isBoolCanonical dtb__846) then ((B_dData_dList.v_length dtb__847) = 0) else false) then ((((((((v_checkBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__846 = Base_dIntrinsics.v_intTypeName) then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) Base_dIntrinsics.v_intTypeName) alts) expected) sp) else (if (dtb__846 = Base_dIntrinsics.v_strTypeName) then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) Base_dIntrinsics.v_strTypeName) alts) expected) sp) else (((((((((((v_checkCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__846) dtb__847) alts) expected) sp))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
))))
# 207 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkBoolCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) ec) alts) Base_dIntrinsics.v_boolTrueCtor) expected) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__848; B_dData_dPair.f_Pair_second = dtb__849 } -> (match dtb__849 with
  | { B_dData_dPair.f_Pair_first = dtb__850; B_dData_dPair.f_Pair_second = dtb__851 } -> (match dtb__850 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__852) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__848, dtb__852)); B_dData_dPair.f_Pair_second = dtb__851 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) dtb__851) alts) Base_dIntrinsics.v_boolFalseCtor) expected) sp)) (fun (q : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__853; B_dData_dPair.f_Pair_second = dtb__854 } -> (match dtb__854 with
  | { B_dData_dPair.f_Pair_first = dtb__855; B_dData_dPair.f_Pair_second = dtb__856 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__848, dtb__853)); B_dData_dPair.f_Pair_second = dtb__856 }))
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
# 227 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (target : string) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((((((v_boolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) B_dData_dMaybe.C_Maybe_Nothing)))
# 234 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) (mc8 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__857, dtb__858) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__857 with
  | { B_dData_dPair.f_Pair_first = dtb__859; B_dData_dPair.f_Pair_second = dtb__860 } -> (match dtb__859 with
  | Frontend_dRast.C_Pat_PCon (dtb__861, dtb__862, dtb__863) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__861) = mc5) then ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__860) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__864; B_dData_dPair.f_Pair_second = dtb__865 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__864; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc8; B_dData_dPair.f_Pair_second = dtb__865 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__858) mc5) mc6) mc7) mc8))
  | Frontend_dRast.C_Pat_PVar (dtb__866, dtb__867) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__860) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__868; B_dData_dPair.f_Pair_second = dtb__869 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__869) dtb__858) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__868)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__870) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__860) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__871; B_dData_dPair.f_Pair_second = dtb__872 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__872) dtb__858) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__871)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__859)) Base_dDiagnostics_dTc.C_TcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match mc8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__873) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__873; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc3 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc7) (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive ((Frontend_dRast.v_ctorDisplayName mc5)))) (Frontend_dRast.v_ctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 274 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__874; B_dData_dPair.f_Pair_second = dtb__875 } -> (match dtb__875 with
  | { B_dData_dPair.f_Pair_first = dtb__876; B_dData_dPair.f_Pair_second = dtb__877 } -> (if dtb__876 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__874; B_dData_dPair.f_Pair_second = dtb__877 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 288 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : string) (mc6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__878, dtb__879) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__878 with
  | { B_dData_dPair.f_Pair_first = dtb__880; B_dData_dPair.f_Pair_second = dtb__881 } -> (match dtb__880 with
  | Frontend_dRast.C_Pat_PInt (dtb__882, dtb__883) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TInt (dtb__882))) dtb__881) dtb__879) mc7) mc8)
  | Frontend_dRast.C_Pat_PStr (dtb__884, dtb__885) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TStr (dtb__884))) dtb__881) dtb__879) mc7) mc8)
  | Frontend_dRast.C_Pat_PVar (dtb__886, dtb__887) -> ((Base_dCommon.v_bind (((((((((((v_checkLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__886) dtb__881) mc7) ((Base_dSource.v_spanAtName dtb__886) dtb__887)) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__888; B_dData_dPair.f_Pair_second = dtb__889 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__888; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__889 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__890) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__881) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__891; B_dData_dPair.f_Pair_second = dtb__892 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__891; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__892 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__880)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 315 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_litAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__893; B_dData_dPair.f_Pair_second = dtb__894 } -> ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) dtb__894) scrutTerm) tyName) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = q in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__895; B_dData_dPair.f_Pair_second = dtb__896 } -> (match dtb__896 with
  | { B_dData_dPair.f_Pair_first = dtb__897; B_dData_dPair.f_Pair_second = dtb__898 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_litEqName tyName))), scrutTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__893, dtb__895)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__897; B_dData_dPair.f_Pair_second = dtb__898 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 332 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) ctx) in (let rig = ((Elab_dMeta.v_piBinderRig false) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__899; B_dData_dPair.f_Pair_second = dtb__900 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__899)), scrutTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__900 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 373 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__901; B_dData_dPair.f_Pair_second = dtb__902 } -> (match dtb__902 with
  | { B_dData_dPair.f_Pair_first = dtb__903; B_dData_dPair.f_Pair_second = dtb__904 } -> (if dtb__903 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__901; B_dData_dPair.f_Pair_second = dtb__904 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 385 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : Core_dTerm.t_Term) (mc6 : Core_dTerm.t_Value) (mc7 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc8 : Core_dTerm.t_Value) (mc9 : Base_dSource.t_Span) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__905, dtb__906) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__905 with
  | { B_dData_dPair.f_Pair_first = dtb__907; B_dData_dPair.f_Pair_second = dtb__908 } -> (match dtb__907 with
  | Frontend_dRast.C_Pat_PInt (dtb__909, dtb__910) -> ((((((((((((v_natLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Core_dTerm.C_Term_TInt (dtb__909))) dtb__908) dtb__906) mc8) mc9)
  | Frontend_dRast.C_Pat_PVar (dtb__911, dtb__912) -> ((Base_dCommon.v_bind (((((((((((v_checkNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__911) dtb__908) mc8) ((Base_dSource.v_spanAtName dtb__911) dtb__912)) mc9)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__913; B_dData_dPair.f_Pair_second = dtb__914 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__913; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__914 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__915) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__908) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = dtb__917 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__917 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__907)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 410 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_natLitAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__918; B_dData_dPair.f_Pair_second = dtb__919 } -> ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__919) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = q in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__920; B_dData_dPair.f_Pair_second = dtb__921 } -> (match dtb__921 with
  | { B_dData_dPair.f_Pair_first = dtb__922; B_dData_dPair.f_Pair_second = dtb__923 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("bi_eq_int")), cmpTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__918, dtb__920)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__922; B_dData_dPair.f_Pair_second = dtb__923 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 426 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) binderTy) ctx) in (let rig = ((Elab_dMeta.v_piBinderRig false) binderTy) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__924; B_dData_dPair.f_Pair_second = dtb__925 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__924)), bindTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__925 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 440 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseOfFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (fam : string) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
  | B_dData_dMaybe.C_Maybe_Just (dtb__926) -> ((Base_dCommon.v_bind (((((((((((v_elabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__926) idxs) ((Elab_dTypes.v_evalCtx ctx) scrutTerm)) expected) alts) B_dData_dList.C_List_Nil)) (fun (p : (Core_dTerm.t_CaseAlt B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__927; B_dData_dPair.f_Pair_second = dtb__928 } -> (((((((((Elab_dCase.v_checkCaseDone dtb__928) ctx) dtb__926) idxs) alts) expected) sp) scrutTerm) dtb__927)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 456 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferCaseEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let pmeta = (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__929; B_dData_dPair.f_Pair_second = dtb__930 } -> (let metaTy = ((Elab_dTypes.v_evalCtx ctx) dtb__929) in ((Base_dCommon.v_bind ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) dtb__930) scrut) alts) metaTy) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__931; B_dData_dPair.f_Pair_second = dtb__932 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__931; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = metaTy; B_dData_dPair.f_Pair_second = dtb__932 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 476 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCondBoolFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (c : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) c) Elab_dPrelude.v_boolTyValue) with
  | Base_dDiag.C_Check_OkC (dtb__933) -> (Base_dDiag.C_Check_OkC (dtb__933))
  | Base_dDiag.C_Check_ErrC (dtb__934) -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pc in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__935; B_dData_dPair.f_Pair_second = dtb__936 } -> (match dtb__936 with
  | { B_dData_dPair.f_Pair_first = dtb__937; B_dData_dPair.f_Pair_second = dtb__938 } -> (if (Elab_dMeta.v_isBoolType dtb__937) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__935; B_dData_dPair.f_Pair_second = dtb__938 })) else ((Elab_dTypes.v_errAt sp) (String.concat "" ["if condition must be "; Base_dIntrinsics.v_boolTypeName; " (got "; ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__937); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 750 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__939) -> ((Base_dCommon.v_bind ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr) with
  | Base_dDiag.C_Check_OkC (dtb__940) -> (Base_dDiag.C_Check_OkC (dtb__940))
  | Base_dDiag.C_Check_ErrC (dtb__941) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr2) with
  | Base_dDiag.C_Check_OkC (dtb__942) -> (Base_dDiag.C_Check_OkC (dtb__942))
  | Base_dDiag.C_Check_ErrC (dtb__943) -> ((Base_dCommon.v_bind ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr3) with
  | Base_dDiag.C_Check_OkC (dtb__944) -> (Base_dDiag.C_Check_OkC (dtb__944))
  | Base_dDiag.C_Check_ErrC (dtb__945) -> (Base_dDiag.C_Check_ErrC (dtb__941))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut6 = (v_performOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__946) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__947) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) Base_dIntrinsics.v_listFamilyName) dtb__947) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__948) -> (match dtb__948 with
  | { B_dData_dPair.f_Pair_first = dtb__949; B_dData_dPair.f_Pair_second = dtb__950 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__949)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = p in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__951; B_dData_dPair.f_Pair_second = dtb__952 } -> (match dtb__952 with
  | { B_dData_dPair.f_Pair_first = dtb__953; B_dData_dPair.f_Pair_second = dtb__954 } -> ((Base_dCommon.v_bind (((((v_performCallExpr globals) dtb__954) dtb__953) dtb__949) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__954) callExpr)))
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
# 792 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCore = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__955) -> ((Base_dCommon.v_bind (((((v_inferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__955)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__956) -> (Base_dDiag.C_Check_OkC (dtb__956))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) (v_doChainFallback dtb__955))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 810 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((v_inferEFuelCorePlainGo fuel) globals) ctx) ec) expr)))
# 814 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EAnn (dtb__957, dtb__958, dtb__959) -> (((((((v_inferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__957) dtb__958) dtb__959)
  | Frontend_dRast.C_Expr_EDo (dtb__960, dtb__961) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__961) Base_dDiagnostics_dTc.C_TcErr_DoUnsupported)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__962, dtb__963, dtb__964) -> (((((((v_elabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__962) dtb__963) dtb__964)
  | Frontend_dRast.C_Expr_ERecord (dtb__965, dtb__966, dtb__967) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__967) Base_dDiagnostics_dTc.C_TcErr_RecordsUnsupported)
  | Frontend_dRast.C_Expr_EField (dtb__968, dtb__969, dtb__970) -> (((((((v_elabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__968) dtb__969) dtb__970)
  | Frontend_dRast.C_Expr_ECase (dtb__971, dtb__972, dtb__973) -> (((((((v_inferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__971) dtb__972) dtb__973)
  | Frontend_dRast.C_Expr_ELocalFun (dtb__974, dtb__975) -> (if (v_clausesHaveOverCtor dtb__974) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__975) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__974, dtb__975)))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Frontend_dRast.C_Expr_ELet (dtb__976, dtb__977, dtb__978, dtb__979) -> ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) ec) dtb__976) dtb__977) dtb__978) dtb__979)
  | Frontend_dRast.C_Expr_EIf (dtb__980, dtb__981, dtb__982, dtb__983) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__980) dtb__983)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__984; B_dData_dPair.f_Pair_second = dtb__985 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__985) dtb__981)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pt in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__986; B_dData_dPair.f_Pair_second = dtb__987 } -> (match dtb__987 with
  | { B_dData_dPair.f_Pair_first = dtb__988; B_dData_dPair.f_Pair_second = dtb__989 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__989) dtb__982)) (fun (pe : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pe in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__990; B_dData_dPair.f_Pair_second = dtb__991 } -> (match dtb__991 with
  | { B_dData_dPair.f_Pair_first = dtb__992; B_dData_dPair.f_Pair_second = dtb__993 } -> (if (if ((v_isIntTy dtb__993) dtb__988) then ((v_isNatTy dtb__993) dtb__992) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__984, dtb__986, (v_natToIntTerm dtb__990))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__988; B_dData_dPair.f_Pair_second = dtb__993 } })) else (if (if ((v_isNatTy dtb__993) dtb__988) then ((v_isIntTy dtb__993) dtb__992) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__984, (v_natToIntTerm dtb__986), dtb__990)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__993 } })) else ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__993) (Elab_dTypes.v_ctxDepth ctx)) dtb__988) dtb__992)) (fun (ec4 : Elab_dTypes.t_Ec) -> (let branchOpaque = (((Elab_dMeta.v_isOpaqueRuntimeTyIn ec4) ctx) dtb__988) in (let tTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__986) else dtb__986) in (let eTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__990) else dtb__990) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__984, tTerm2, eTerm2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__988; B_dData_dPair.f_Pair_second = ec4 } })))))))))
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
  | Frontend_dRast.C_Expr_ELam (dtb__994, dtb__995, dtb__996) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__996) Base_dDiagnostics_dTc.C_TcErr_LambdaNoSignature)
  | Frontend_dRast.C_Expr_EApp (dtb__997, dtb__998, dtb__999) -> (match dtb__997 with
  | Frontend_dRast.C_Expr_EVar (dtb__1000, dtb__1001) -> (let nd_uscrut11 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__1000)) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1002) -> (match dtb__1002 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1003, dtb__1004) -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__999) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb__1003, (Frontend_dReserved.v_joinWithAt dtb__1004)))) dtb__1003) (Frontend_dReserved.v_joinWithAt dtb__1004))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__999) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1000, dtb__1001))) dtb__998) dtb__999) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1000, dtb__1001))) dtb__998) dtb__999) B_dData_dMaybe.C_Maybe_Nothing)
))
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__997) dtb__998) dtb__999) B_dData_dMaybe.C_Maybe_Nothing)
)
  | Frontend_dRast.C_Expr_EPi (dtb__1005, dtb__1006, dtb__1007, dtb__1008, dtb__1009, dtb__1010) -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) dtb__1005) dtb__1006) dtb__1007) dtb__1008) dtb__1009) dtb__1010)
  | Frontend_dRast.C_Expr_EFloat (dtb__1011, dtb__1012) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1011)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EStr (dtb__1013, dtb__1014) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1013)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EInt (dtb__1015, dtb__1016) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb__1015)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EVar (dtb__1017, dtb__1018) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__1017) = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc Core_dTerm.v_levelZero))); B_dData_dPair.f_Pair_second = ec } })) else (let nd_uscrut8 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__1017)) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1019) -> (match dtb__1019 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1020, dtb__1021) -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__1018) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb__1020, (Frontend_dReserved.v_joinWithAt dtb__1021)))) dtb__1020) (Frontend_dReserved.v_joinWithAt dtb__1021))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__1022, dtb__1023) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1018) B_dData_dMaybe.C_Maybe_Nothing) dtb__1022) dtb__1023)) (fun (t : string) -> (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) t) dtb__1018)))
  | _ -> (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1017)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1018) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1017)) dtb__1018))
)
  | _ -> (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1017)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1018) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1017)) dtb__1018))
)))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))))
# 1077 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabEFieldFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fname : string) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1024; B_dData_dPair.f_Pair_second = dtb__1025 } -> (match dtb__1025 with
  | { B_dData_dPair.f_Pair_first = dtb__1026; B_dData_dPair.f_Pair_second = dtb__1027 } -> (match ((v_recordTypeOf dtb__1027) dtb__1026) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1028) -> ((Base_dCommon.v_bind ((((v_recordFieldPlan dtb__1027) dtb__1026) fname) sp)) (fun (plan : t_FieldAccessPlan) -> (let arity = (B_dData_dList.v_length ((plan).f_FieldAccessPlan_planData).Elab_dTypes.f_DtData_dtDataParams) in (let tele = ((B_dData_dList.v_drop arity) (Elab_dTypes.v_dtCtorTelescope (plan).f_FieldAccessPlan_planCtor)) in (let proj = (Core_dTerm.C_Term_TProj (dtb__1024, (Elab_dTypes.v_dtCtorName (plan).f_FieldAccessPlan_planCtor), tele, (arity + (plan).f_FieldAccessPlan_planField), (plan).f_FieldAccessPlan_planField)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (plan).f_FieldAccessPlan_planType; B_dData_dPair.f_Pair_second = dtb__1027 } })))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_hasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__1027) dtb__1024) dtb__1026) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1103 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabERecUpdateFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fields with
  | B_dData_dList.C_List_Nil -> ((Elab_dTypes.v_errAt sp) "record update needs at least one field")
  | _ -> (if (Elab_dRecords.v_hasDuplicateFieldNames fields) then ((Elab_dTypes.v_errAt sp) "duplicate field in record update") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1029; B_dData_dPair.f_Pair_second = dtb__1030 } -> (match dtb__1030 with
  | { B_dData_dPair.f_Pair_first = dtb__1031; B_dData_dPair.f_Pair_second = dtb__1032 } -> ((Base_dCommon.v_bind ((((v_recordUpdatePlan dtb__1032) dtb__1031) fields) sp)) (fun (plan : t_UpdateAccessPlan) -> (let body = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)), sp)), (plan).f_UpdateAccessPlan_upBodyArgs, sp)) in ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (fuel - 1)) globals) ctx) dtb__1032) (plan).f_UpdateAccessPlan_upData) (plan).f_UpdateAccessPlan_upIdxs) ((Elab_dTypes.v_evalCtx ctx) dtb__1029)) dtb__1031) (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)) ((v_recordFieldPats (plan).f_UpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun (q : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1033; B_dData_dPair.f_Pair_second = dtb__1034 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb__1029, (dtb__1033).Core_dTerm.f_CaseAlt_caseAltName, (Core_dTerm.v_binderPairs (dtb__1033).Core_dTerm.f_CaseAlt_caseAltBinders), (plan).f_UpdateAccessPlan_upFieldIndices, (dtb__1033).Core_dTerm.f_CaseAlt_caseAltBody)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1031; B_dData_dPair.f_Pair_second = dtb__1034 } }))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
)))
# 1132 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAnnFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pt in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1035; B_dData_dPair.f_Pair_second = dtb__1036 } -> (match dtb__1036 with
  | { B_dData_dPair.f_Pair_first = dtb__1037; B_dData_dPair.f_Pair_second = dtb__1038 } -> (let tyVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1035) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1038) value) tyVal)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1039; B_dData_dPair.f_Pair_second = dtb__1040 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1039; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyVal; B_dData_dPair.f_Pair_second = dtb__1040 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1150 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferPiFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (implicit : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dom : Frontend_dRast.t_Expr) (cod : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun (pd : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pd in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1041; B_dData_dPair.f_Pair_second = dtb__1042 } -> (match dtb__1042 with
  | { B_dData_dPair.f_Pair_first = dtb__1043; B_dData_dPair.f_Pair_second = dtb__1044 } -> (let domVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1041) in (let isTypeDom = (Elab_dMeta.v_isTypeDomain domVal) in (let isLinDom = ((Elab_dMeta.v_isLinearType ec) domVal) in (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__1041) ctx) in (let badQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1050) -> (if implicit then true else isTypeDom)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (let badLinQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1049) -> (if (Frontend_dAst.v_qtyIsZero dtb__1049) then isLinDom else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (if badQty then (if implicit then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityImplicit (name))) name) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearTypeNeedsOne (name))) name) else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx2) dtb__1044) cod)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut28 = pc in (match nd_uscrut28 with
  | { B_dData_dPair.f_Pair_first = dtb__1045; B_dData_dPair.f_Pair_second = dtb__1046 } -> (match dtb__1046 with
  | { B_dData_dPair.f_Pair_first = dtb__1047; B_dData_dPair.f_Pair_second = dtb__1048 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (name, implicit, (if isLinDom then Core_dTerm.C_Rig_Rig1 else (if implicit then ((Elab_dMeta.v_implicitBinderRig ec) domVal) else (((Elab_dMeta.v_rigOfQty false) isTypeDom) qty))), dtb__1041, dtb__1045)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType (((Core_dTerm.v_levelMax dtb__1043) dtb__1047))); B_dData_dPair.f_Pair_second = dtb__1048 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1214 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = fn in (match nd_uscrut8 with
  | Frontend_dRast.C_Expr_EVar (dtb__1051, dtb__1052) -> (match dtb__1051 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1053) -> (if (dtb__1053 = "->") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1054, dtb__1055) -> (match dtb__1055 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1056, dtb__1057) -> (match dtb__1057 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) B_dData_dMaybe.C_Maybe_Nothing) dtb__1054) dtb__1056) sp)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)) else (if (dtb__1053 = "Type") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1058, dtb__1059) -> (match dtb__1058 with
  | Frontend_dRast.C_Expr_EInt (dtb__1060, dtb__1061) -> (match dtb__1059 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1060 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1061) Base_dDiagnostics_dTc.C_TcErr_UniverseLevelNonNegative) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb__1060))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc (Core_dTerm.v_levelOfInt dtb__1060)))); B_dData_dPair.f_Pair_second = ec } })))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1052) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1052) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1052) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)) else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1062, dtb__1063) -> (if (Elab_dTerm_dSupport.v_isFieldSelectorName (Frontend_dRast_dName.v_rnameKey dtb__1062)) then ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1062)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1063) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1062))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1062)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1063))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1062)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1064) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1062)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1065) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1065))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1066; B_dData_dPair.f_Pair_second = dtb__1067 } -> (match dtb__1067 with
  | { B_dData_dPair.f_Pair_first = dtb__1068; B_dData_dPair.f_Pair_second = dtb__1069 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1069) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1062)))) dtb__1066); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1068; B_dData_dPair.f_Pair_second = dtb__1069 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1062)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1070) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1062)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1070)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1071; B_dData_dPair.f_Pair_second = dtb__1072 } -> (match dtb__1072 with
  | { B_dData_dPair.f_Pair_first = dtb__1073; B_dData_dPair.f_Pair_second = dtb__1074 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1074) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1062)))) dtb__1071); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1073; B_dData_dPair.f_Pair_second = dtb__1074 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1062)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1075) -> (Base_dDiag.C_Check_OkC (dtb__1075))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1070)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = pa in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1076; B_dData_dPair.f_Pair_second = dtb__1077 } -> (match dtb__1077 with
  | { B_dData_dPair.f_Pair_first = dtb__1078; B_dData_dPair.f_Pair_second = dtb__1079 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1079) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1062)))) dtb__1076); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1078; B_dData_dPair.f_Pair_second = dtb__1079 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1062)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1080) -> (Base_dDiag.C_Check_OkC (dtb__1080))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1063) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1062)))) (Frontend_dRast_dName.v_rnameKey dtb__1062))
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
  | Frontend_dRast.C_Expr_EVar (dtb__1081, dtb__1082) -> (if (Elab_dTerm_dSupport.v_isFieldSelectorName (Frontend_dRast_dName.v_rnameKey dtb__1081)) then ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1081)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1082) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1081))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1081)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1082))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1081)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1083) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1081)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1084) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1084))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pa in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1085; B_dData_dPair.f_Pair_second = dtb__1086 } -> (match dtb__1086 with
  | { B_dData_dPair.f_Pair_first = dtb__1087; B_dData_dPair.f_Pair_second = dtb__1088 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1088) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1081)))) dtb__1085); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1087; B_dData_dPair.f_Pair_second = dtb__1088 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1081)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1089) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1081)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1089)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1090; B_dData_dPair.f_Pair_second = dtb__1091 } -> (match dtb__1091 with
  | { B_dData_dPair.f_Pair_first = dtb__1092; B_dData_dPair.f_Pair_second = dtb__1093 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1093) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1081)))) dtb__1090); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1092; B_dData_dPair.f_Pair_second = dtb__1093 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1081)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1094) -> (Base_dDiag.C_Check_OkC (dtb__1094))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1089)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = pa in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1095; B_dData_dPair.f_Pair_second = dtb__1096 } -> (match dtb__1096 with
  | { B_dData_dPair.f_Pair_first = dtb__1097; B_dData_dPair.f_Pair_second = dtb__1098 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1098) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1081)))) dtb__1095); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1097; B_dData_dPair.f_Pair_second = dtb__1098 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1081)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1099) -> (Base_dDiag.C_Check_OkC (dtb__1099))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1082) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1081)))) (Frontend_dRast_dName.v_rnameKey dtb__1081))
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
)
  | _ -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1100, dtb__1101) -> (if (Elab_dTerm_dSupport.v_isFieldSelectorName (Frontend_dRast_dName.v_rnameKey dtb__1100)) then ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1100)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1101) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1100))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1100)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1101))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1100)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1102) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1100)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1103) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1103))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1104; B_dData_dPair.f_Pair_second = dtb__1105 } -> (match dtb__1105 with
  | { B_dData_dPair.f_Pair_first = dtb__1106; B_dData_dPair.f_Pair_second = dtb__1107 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1107) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1100)))) dtb__1104); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1106; B_dData_dPair.f_Pair_second = dtb__1107 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1100)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1108) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1100)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1108)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1109; B_dData_dPair.f_Pair_second = dtb__1110 } -> (match dtb__1110 with
  | { B_dData_dPair.f_Pair_first = dtb__1111; B_dData_dPair.f_Pair_second = dtb__1112 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1112) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1100)))) dtb__1109); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1111; B_dData_dPair.f_Pair_second = dtb__1112 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1100)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1113) -> (Base_dDiag.C_Check_OkC (dtb__1113))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1108)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1114; B_dData_dPair.f_Pair_second = dtb__1115 } -> (match dtb__1115 with
  | { B_dData_dPair.f_Pair_first = dtb__1116; B_dData_dPair.f_Pair_second = dtb__1117 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1117) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1100)))) dtb__1114); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1116; B_dData_dPair.f_Pair_second = dtb__1117 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1100)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1118) -> (Base_dDiag.C_Check_OkC (dtb__1118))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1101) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1100)))) (Frontend_dRast_dName.v_rnameKey dtb__1100))
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
# 1287 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1119, dtb__1120) -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1119)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1121) -> (Base_dDiag.C_Check_OkC (dtb__1121))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1302 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun (pf : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pf in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1122; B_dData_dPair.f_Pair_second = dtb__1123 } -> (match dtb__1123 with
  | { B_dData_dPair.f_Pair_first = dtb__1124; B_dData_dPair.f_Pair_second = dtb__1125 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1125) dtb__1124) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1126; B_dData_dPair.f_Pair_second = dtb__1127 } -> (match dtb__1127 with
  | { B_dData_dPair.f_Pair_first = dtb__1128; B_dData_dPair.f_Pair_second = dtb__1129 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1129)) dtb__1122) dtb__1126); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1128; B_dData_dPair.f_Pair_second = dtb__1129 } }))
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
# 1482 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal ec) ty) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__1130, dtb__1131, dtb__1132, dtb__1133, dtb__1134) -> (if dtb__1131 then (if ((Elab_dDict.v_isDictDomain ec) dtb__1133) then (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dtb__1133) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1133) dtb__1134) args) sp) hint) else ((Base_dCommon.v_bind (((((((v_constrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1133) args) sp)) (fun (ec0 : Elab_dTypes.t_Ec) -> (let nd_uscrut15 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1133)) sp) in (match nd_uscrut15 with
  | Base_dDiag.C_Check_ErrC (dtb__1135) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec0)) ((Elab_dTypes.v_forceVal ec0) dtb__1133)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1133) dtb__1134) args) sp) hint) else (if ((Elab_dDict.v_isRigidDictArg ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1133)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1133) dtb__1134) args) sp) hint) else (Base_dDiag.C_Check_ErrC (dtb__1135))))
  | Base_dDiag.C_Check_OkC (dtb__1136) -> (match dtb__1136 with
  | { B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = dtb__1138 } -> (let ty2 = ((Core_dEval.v_applyClosure dtb__1134) ((Elab_dTypes.v_evalCtx ctx) dtb__1137)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1138) ty2) args) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = q in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1139; B_dData_dPair.f_Pair_second = dtb__1140 } -> (match dtb__1140 with
  | { B_dData_dPair.f_Pair_first = dtb__1141; B_dData_dPair.f_Pair_second = dtb__1142 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1139)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1141; B_dData_dPair.f_Pair_second = dtb__1142 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) else (if ((Elab_dDict.v_isMemberDomain ec) dtb__1133) then (match ((((Elab_dDict.v_memberLookup 64) (Elab_dTypes.v_ctxDepth ctx)) ec) dtb__1133) with
  | Elab_dDict.C_MemberLookup_MemberFound (dtb__1143, dtb__1144) -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1144) ((Core_dEval.v_applyClosure dtb__1134) dtb__1143)) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = p in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1145; B_dData_dPair.f_Pair_second = dtb__1146 } -> (match dtb__1146 with
  | { B_dData_dPair.f_Pair_first = dtb__1147; B_dData_dPair.f_Pair_second = dtb__1148 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) dtb__1143); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1145)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1147; B_dData_dPair.f_Pair_second = dtb__1148 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Elab_dDict.C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | Elab_dDict.C_MemberLookup_MemberAmbiguous (dtb__1149) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1150; B_dData_dPair.f_Pair_second = dtb__1151 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1151) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1133) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1134) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1150))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = p in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1152; B_dData_dPair.f_Pair_second = dtb__1153 } -> (match dtb__1153 with
  | { B_dData_dPair.f_Pair_first = dtb__1154; B_dData_dPair.f_Pair_second = dtb__1155 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1150; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1152)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1154; B_dData_dPair.f_Pair_second = dtb__1155 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | Elab_dDict.C_MemberLookup_MemberStuck -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1156; B_dData_dPair.f_Pair_second = dtb__1157 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1157) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1133) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1134) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1156))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = p in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1158; B_dData_dPair.f_Pair_second = dtb__1159 } -> (match dtb__1159 with
  | { B_dData_dPair.f_Pair_first = dtb__1160; B_dData_dPair.f_Pair_second = dtb__1161 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1156; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1158)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1160; B_dData_dPair.f_Pair_second = dtb__1161 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__1133) then (if ((Elab_dMeta.v_isStringImplicitDomain ec) dtb__1133) then (match args with
  | B_dData_dList.C_List__x58__x58_ (dtb__1162, dtb__1163) -> (match (v_instArgOperand dtb__1162) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1164) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1164) dtb__1133)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1165; B_dData_dPair.f_Pair_second = dtb__1166 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1166) ((Core_dEval.v_applyClosure dtb__1134) ((Elab_dTypes.v_evalCtx ctx) dtb__1165))) dtb__1163) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut25 = q in (match nd_uscrut25 with
  | { B_dData_dPair.f_Pair_first = dtb__1167; B_dData_dPair.f_Pair_second = dtb__1168 } -> (match dtb__1168 with
  | { B_dData_dPair.f_Pair_first = dtb__1169; B_dData_dPair.f_Pair_second = dtb__1170 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1165; B_dData_dPair.f_Pair_second = dtb__1132 }, dtb__1167)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1169; B_dData_dPair.f_Pair_second = dtb__1170 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1171; B_dData_dPair.f_Pair_second = dtb__1172 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1172) ((Core_dEval.v_applyClosure dtb__1134) ((Elab_dTypes.v_evalCtx ctx) dtb__1171))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut23 = p in (match nd_uscrut23 with
  | { B_dData_dPair.f_Pair_first = dtb__1173; B_dData_dPair.f_Pair_second = dtb__1174 } -> (match dtb__1174 with
  | { B_dData_dPair.f_Pair_first = dtb__1175; B_dData_dPair.f_Pair_second = dtb__1176 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1171; B_dData_dPair.f_Pair_second = dtb__1132 }, dtb__1173)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1175; B_dData_dPair.f_Pair_second = dtb__1176 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1177; B_dData_dPair.f_Pair_second = dtb__1178 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1178) ((Core_dEval.v_applyClosure dtb__1134) ((Elab_dTypes.v_evalCtx ctx) dtb__1177))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = p in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1179; B_dData_dPair.f_Pair_second = dtb__1180 } -> (match dtb__1180 with
  | { B_dData_dPair.f_Pair_first = dtb__1181; B_dData_dPair.f_Pair_second = dtb__1182 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1177; B_dData_dPair.f_Pair_second = dtb__1132 }, dtb__1179)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1181; B_dData_dPair.f_Pair_second = dtb__1182 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1183; B_dData_dPair.f_Pair_second = dtb__1184 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1184) ((Core_dEval.v_applyClosure dtb__1134) ((Elab_dTypes.v_evalCtx ctx) dtb__1183))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = p in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1185; B_dData_dPair.f_Pair_second = dtb__1186 } -> (match dtb__1186 with
  | { B_dData_dPair.f_Pair_first = dtb__1187; B_dData_dPair.f_Pair_second = dtb__1188 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1183; B_dData_dPair.f_Pair_second = dtb__1132 }, dtb__1185)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1187; B_dData_dPair.f_Pair_second = dtb__1188 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)))) else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = forced; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__1189, dtb__1190) -> (let ec0 = (match hint with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1197) -> (if (((((v_remainingExplicitPis 64) ctx) ec) forced) = (B_dData_dList.v_length args)) then (match ((((v_tryUseHint ctx) dtb__1197) ec) forced) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1198) -> dtb__1198
  | _ -> failwith "DT: impossible branch"
) else ec)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec0) sp) dtb__1130) dtb__1132) dtb__1133)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((v_expandArgListLit ec0) dtb__1133) dtb__1189)) (fun (a2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1133)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1191; B_dData_dPair.f_Pair_second = dtb__1192 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1192) ((Core_dEval.v_applyClosure dtb__1134) ((Elab_dTypes.v_evalCtx ctx) dtb__1191))) dtb__1190) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = q in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1193; B_dData_dPair.f_Pair_second = dtb__1194 } -> (match dtb__1194 with
  | { B_dData_dPair.f_Pair_first = dtb__1195; B_dData_dPair.f_Pair_second = dtb__1196 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1191; B_dData_dPair.f_Pair_second = argRig }, dtb__1193)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1195; B_dData_dPair.f_Pair_second = dtb__1196 } }))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__1199, dtb__1200) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_exprSpan dtb__1199)) Base_dDiagnostics_dTc.C_TcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
))))
# 1622 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_deferDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1201; B_dData_dPair.f_Pair_second = dtb__1202 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ((((((Elab_dTypes.v_ecAddConstraint dtb__1202) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__1202) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx))) ((Core_dEval.v_applyClosure clo) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1201))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1203; B_dData_dPair.f_Pair_second = dtb__1204 } -> (match dtb__1204 with
  | { B_dData_dPair.f_Pair_first = dtb__1205; B_dData_dPair.f_Pair_second = dtb__1206 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1201; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1203)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1205; B_dData_dPair.f_Pair_second = dtb__1206 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1640 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dom : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dDict.v_dictClassArg ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1207) -> (match ((Elab_dDict.v_dictArgKind ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1208) -> (let nd_uscrut11 = dtb__1207 in (match nd_uscrut11 with
  | Core_dTerm.C_Value_VMeta (dtb__1209, dtb__1210) -> (match dtb__1210 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1207) dtb__1208) args) sp)) (fun (ecProbe : Elab_dTypes.t_Ec) -> (match ((Core_dTerm.v_metaLookup dtb__1209) (Elab_dTypes.v_ecSolTbl ecProbe)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1211) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) dtb__1209) B_dData_dList.C_List_Nil) dtb__1211) with
  | Base_dDiag.C_Check_OkC (dtb__1212) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__1212))))
  | Base_dDiag.C_Check_ErrC (dtb__1213) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1207) dtb__1208) args) sp)
)
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1207) dtb__1208) args) sp)
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1668 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomGoKFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (argTy : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dList.C_List__x58__x58_ (dtb__1214, dtb__1215) -> (let nd_uscrut11 = (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1214) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__1216) -> (match dtb__1216 with
  | { B_dData_dPair.f_Pair_first = dtb__1217; B_dData_dPair.f_Pair_second = dtb__1218 } -> (match dtb__1218 with
  | { B_dData_dPair.f_Pair_first = dtb__1219; B_dData_dPair.f_Pair_second = dtb__1220 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1220) dtb__1219) in (if (Core_dTerm.v_isTypeValue forced) then ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1220) ctx) argTy) argKind) dtb__1215) sp) else (if (((((Elab_dDict.v_argHeadMatchesKind globals) dtb__1220) ctx) forced) argKind) then (match ((((Elab_dMeta.v_convEc dtb__1220) (Elab_dTypes.v_ctxDepth ctx)) argTy) (Elab_dDict.v_neutralHeadOrSelf forced)) with
  | Base_dDiag.C_Check_OkC (dtb__1221) -> (Base_dDiag.C_Check_OkC (dtb__1221))
  | Base_dDiag.C_Check_ErrC (dtb__1222) -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1220) ctx) argTy) argKind) dtb__1215) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1220) ctx) argTy) argKind) dtb__1215) sp))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1223) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1800 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1224) -> ((((((((v_specializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1224) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1810 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = args in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1225, dtb__1226) -> (match dtb__1226 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1227, dtb__1228) -> (match dtb__1228 with
  | B_dData_dList.C_List_Nil -> (if ((v_isNatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1225) v_natTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1229; B_dData_dPair.f_Pair_second = dtb__1230 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1230) dtb__1227) v_natTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1231; B_dData_dPair.f_Pair_second = dtb__1232 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1229) dtb__1231); B_dData_dPair.f_Pair_second = dtb__1232 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isIntTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1225) v_intTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1233; B_dData_dPair.f_Pair_second = dtb__1234 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1234) dtb__1227) v_intTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1235; B_dData_dPair.f_Pair_second = dtb__1236 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1233) dtb__1235); B_dData_dPair.f_Pair_second = dtb__1236 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isFloatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1225) v_floatTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1237; B_dData_dPair.f_Pair_second = dtb__1238 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1238) dtb__1227) v_floatTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1239; B_dData_dPair.f_Pair_second = dtb__1240 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1237) dtb__1239); B_dData_dPair.f_Pair_second = dtb__1240 }))))
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
# 1856 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1241) -> (((((((v_specializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1241) args) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1866 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1242, dtb__1243) -> (match dtb__1243 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1244, dtb__1245) -> (match dtb__1245 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1242)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1246; B_dData_dPair.f_Pair_second = dtb__1247 } -> (match dtb__1247 with
  | { B_dData_dPair.f_Pair_first = dtb__1248; B_dData_dPair.f_Pair_second = dtb__1249 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1249) dtb__1244)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1250; B_dData_dPair.f_Pair_second = dtb__1251 } -> (match dtb__1251 with
  | { B_dData_dPair.f_Pair_first = dtb__1252; B_dData_dPair.f_Pair_second = dtb__1253 } -> (if (if ((v_isNatTy dtb__1253) dtb__1248) then ((v_isNatTy dtb__1253) dtb__1252) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1246) dtb__1250); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1253 } })))) else (if (if ((v_isIntTy dtb__1253) dtb__1248) then ((v_isIntTy dtb__1253) dtb__1252) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1246) dtb__1250); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1253 } })))) else (if (if ((v_isFloatTy dtb__1253) dtb__1248) then ((v_isFloatTy dtb__1253) dtb__1252) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1246) dtb__1250); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_floatTyValue; B_dData_dPair.f_Pair_second = dtb__1253 } })))) else (if (if ((v_isNatTy dtb__1253) dtb__1248) then ((v_isIntTy dtb__1253) dtb__1252) else false) then (match (v_isEIntExpr dtb__1244) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1254) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1244)) dtb__1254)) (fun (bNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1246) bNat); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1253 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) (v_natToIntTerm dtb__1246)) dtb__1250); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1253 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_isIntTy dtb__1253) dtb__1248) then ((v_isNatTy dtb__1253) dtb__1252) else false) then (match (v_isEIntExpr dtb__1242) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1255) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1242)) dtb__1255)) (fun (aNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) aNat) dtb__1250); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1253 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1246) (v_natToIntTerm dtb__1250)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1253 } }))))
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
# 1906 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1256) -> (let simpleComp = (let nd_uscrut8 = (v_handleOperand expr) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__1263) -> (match dtb__1263 with
  | { B_dData_dPair.f_Pair_first = dtb__1264; B_dData_dPair.f_Pair_second = dtb__1265 } -> (v_isSimpleComp dtb__1264)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let firstCall = (if simpleComp then ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in (let thirdCall = (if simpleComp then ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in ((Base_dCommon.v_bind firstCall) (fun (callExpr : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1257) -> (Base_dDiag.C_Check_OkC (dtb__1257))
  | Base_dDiag.C_Check_ErrC (dtb__1258) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1259) -> (Base_dDiag.C_Check_OkC (dtb__1259))
  | Base_dDiag.C_Check_ErrC (dtb__1260) -> ((Base_dCommon.v_bind thirdCall) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match ((Base_dObs.v_obsCheck "vuna.elab.term.retry-third") (fun (_u : int) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Base_dDiag.C_Check_OkC (dtb__1261) -> (Base_dDiag.C_Check_OkC (dtb__1261))
  | Base_dDiag.C_Check_ErrC (dtb__1262) -> (Base_dDiag.C_Check_ErrC (dtb__1258))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1266) -> ((Base_dObs.v_obsCheck "vuna.elab.term.infer") (fun (_u : int) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1267) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1268) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) expected))) dtb__1268) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dObs.v_obsDefCheckAt 3) "vuna.elab.term.core") (v_exprFormName expr)) (fun (_u : int) -> ((((((v_checkEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1987 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRow = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1269) -> ((Base_dCommon.v_bind ((((((v_checkDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1269) expected)) (fun (r : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1270) -> (Base_dDiag.C_Check_OkC (dtb__1270))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) (v_doChainFallback dtb__1269)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 2068 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuelNoRowPlainGo fuel) globals) ctx) ec) expr) expected)))
# 2072 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EAnn (dtb__1271, dtb__1272, dtb__1273) -> ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1272)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pt in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1274; B_dData_dPair.f_Pair_second = dtb__1275 } -> (match dtb__1275 with
  | { B_dData_dPair.f_Pair_first = dtb__1276; B_dData_dPair.f_Pair_second = dtb__1277 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1277) dtb__1271) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1274))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__1278, dtb__1279) -> (if (v_clausesHaveOverCtor dtb__1278) then ((Base_dCommon.v_bind ((((v_resolveOverFunPats ec) ctx) expected) dtb__1278)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__1280; B_dData_dPair.f_Pair_second = dtb__1281 } -> ((Base_dCommon.v_bind ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable dtb__1281)) dtb__1280)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1281) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__1278, dtb__1279)))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Frontend_dRast.C_Expr_ELet (dtb__1282, dtb__1283, dtb__1284, dtb__1285) -> (((((((((v_checkLetFuel (fuel - 1)) globals) ctx) ec) dtb__1282) dtb__1283) dtb__1284) expected) dtb__1285)
  | Frontend_dRast.C_Expr_ECase (dtb__1286, dtb__1287, dtb__1288) -> ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1286) dtb__1287) expected) dtb__1288)
  | Frontend_dRast.C_Expr_EIf (dtb__1289, dtb__1290, dtb__1291, dtb__1292) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1289) dtb__1292)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__1293; B_dData_dPair.f_Pair_second = dtb__1294 } -> (let attempt = ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1294) dtb__1290) expected)) (fun (pt : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__1297; B_dData_dPair.f_Pair_second = dtb__1298 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1298) dtb__1291) expected)) (fun (pe : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__1299; B_dData_dPair.f_Pair_second = dtb__1300 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1293, dtb__1297, dtb__1299)); B_dData_dPair.f_Pair_second = dtb__1300 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) in (match attempt with
  | Base_dDiag.C_Check_OkC (dtb__1295) -> (Base_dDiag.C_Check_OkC (dtb__1295))
  | Base_dDiag.C_Check_ErrC (dtb__1296) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Expr_EPi (dtb__1301, dtb__1302, dtb__1303, dtb__1304, dtb__1305, dtb__1306) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Frontend_dRast.C_Expr_EApp (dtb__1307, dtb__1308, dtb__1309) -> (match dtb__1307 with
  | Frontend_dRast.C_Expr_EVar (dtb__1310, dtb__1311) -> (match dtb__1310 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1312) -> (if (dtb__1312 = "->") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1312 = "Type") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (let nd_uscrut13 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__1310)) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1313) -> (match dtb__1313 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1309) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1310, dtb__1311))) dtb__1308) expected) dtb__1309)
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1310, dtb__1311))) dtb__1308) expected) dtb__1309)
))))
  | _ -> (let nd_uscrut12 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__1310)) in (match nd_uscrut12 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1314) -> (match dtb__1314 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1309) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1310, dtb__1311))) dtb__1308) expected) dtb__1309)
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1310, dtb__1311))) dtb__1308) expected) dtb__1309)
))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) dtb__1307) dtb__1308) expected) dtb__1309)
)
  | Frontend_dRast.C_Expr_ELam (dtb__1315, dtb__1316, dtb__1317) -> ((((((((v_checkLamFuel (fuel - 1)) globals) ctx) ec) dtb__1315) dtb__1316) expected) dtb__1317)
  | Frontend_dRast.C_Expr_EFloat (dtb__1318, dtb__1319) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1320, dtb__1321) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1322) -> (match dtb__1322 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1323, dtb__1324) -> (match dtb__1324 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1323 = Base_dIntrinsics.v_floatTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1318)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1319) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1325) -> (match dtb__1325 with
  | { B_dData_dPair.f_Pair_first = dtb__1326; B_dData_dPair.f_Pair_second = dtb__1327 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1327) dtb__1326) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1319) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1328) -> (match dtb__1328 with
  | { B_dData_dPair.f_Pair_first = dtb__1329; B_dData_dPair.f_Pair_second = dtb__1330 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1330) dtb__1329) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1319) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1331) -> (match dtb__1331 with
  | { B_dData_dPair.f_Pair_first = dtb__1332; B_dData_dPair.f_Pair_second = dtb__1333 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1333) dtb__1332) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1319) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1334) -> (match dtb__1334 with
  | { B_dData_dPair.f_Pair_first = dtb__1335; B_dData_dPair.f_Pair_second = dtb__1336 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1336) dtb__1335) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EStr (dtb__1337, dtb__1338) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1339, dtb__1340) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1341) -> (match dtb__1341 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1342, dtb__1343) -> (match dtb__1343 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1342 = Base_dIntrinsics.v_strTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1337)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1338) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1344) -> (match dtb__1344 with
  | { B_dData_dPair.f_Pair_first = dtb__1345; B_dData_dPair.f_Pair_second = dtb__1346 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1346) dtb__1345) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1338) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1347) -> (match dtb__1347 with
  | { B_dData_dPair.f_Pair_first = dtb__1348; B_dData_dPair.f_Pair_second = dtb__1349 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1349) dtb__1348) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1338) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1350) -> (match dtb__1350 with
  | { B_dData_dPair.f_Pair_first = dtb__1351; B_dData_dPair.f_Pair_second = dtb__1352 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1352) dtb__1351) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1338) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1353) -> (match dtb__1353 with
  | { B_dData_dPair.f_Pair_first = dtb__1354; B_dData_dPair.f_Pair_second = dtb__1355 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1355) dtb__1354) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EInt (dtb__1356, dtb__1357) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1358, dtb__1359) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1360) -> (match dtb__1360 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1361, dtb__1362) -> (match dtb__1362 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1361 = Base_dIntrinsics.v_natTypeName) then ((Base_dCommon.v_bind ((v_natLitResult dtb__1357) dtb__1356)) (fun (t : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = ec })))) else (if (dtb__1361 = Base_dIntrinsics.v_intTypeName) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1357) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1363) -> (match dtb__1363 with
  | { B_dData_dPair.f_Pair_first = dtb__1364; B_dData_dPair.f_Pair_second = dtb__1365 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1365) dtb__1364) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1357) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1366) -> (match dtb__1366 with
  | { B_dData_dPair.f_Pair_first = dtb__1367; B_dData_dPair.f_Pair_second = dtb__1368 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1368) dtb__1367) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1357) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1369) -> (match dtb__1369 with
  | { B_dData_dPair.f_Pair_first = dtb__1370; B_dData_dPair.f_Pair_second = dtb__1371 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1371) dtb__1370) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1357) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1372) -> (match dtb__1372 with
  | { B_dData_dPair.f_Pair_first = dtb__1373; B_dData_dPair.f_Pair_second = dtb__1374 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1374) dtb__1373) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EVar (dtb__1375, dtb__1376) -> (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1375)) then (let pmeta = (((((Elab_dMetaSpans.v_newHoleMeta ctx) ec) dtb__1376) expected) (Frontend_dReserved.v_holeNameOf (Frontend_dRast_dName.v_rnameKey dtb__1375))) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__1377; B_dData_dPair.f_Pair_second = dtb__1378 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1377; B_dData_dPair.f_Pair_second = dtb__1378 }))
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = (Frontend_dReserved.v_classify (Frontend_dRast_dName.v_rnameKey dtb__1375)) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1379) -> (match dtb__1379 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb__1380, dtb__1381) -> ((Base_dCommon.v_bind (((((((v_resolveOverValueTarget globals) ctx) ec) dtb__1380) dtb__1381) expected) dtb__1376)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1376))) B_dData_dList.C_List_Nil) expected) dtb__1376)))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__1382, dtb__1383) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1376) (B_dData_dMaybe.C_Maybe_Just (expected))) dtb__1382) dtb__1383)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1376))) B_dData_dList.C_List_Nil) expected) dtb__1376)))
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1375, dtb__1376))) B_dData_dList.C_List_Nil) expected) dtb__1376)
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1375, dtb__1376))) B_dData_dList.C_List_Nil) expected) dtb__1376)
)))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
))))
# 2196 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 2298 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 2308 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : bool) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1384, dtb__1385) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((((v_checkLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1384) dtb__1385) mc5) mc6) mc7) mc8))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 2317 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetOneFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bnd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (B_dData_dPair.v_firstOf bnd) with
  | Frontend_dRast.C_Pat_PVar (dtb__1386, dtb__1387) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pv in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__1388; B_dData_dPair.f_Pair_second = dtb__1389 } -> (match dtb__1389 with
  | { B_dData_dPair.f_Pair_first = dtb__1390; B_dData_dPair.f_Pair_second = dtb__1391 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1390) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1386) dtb__1390) ctx) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx2) dtb__1391) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1392; B_dData_dPair.f_Pair_second = dtb__1393 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1393) ctx) dtb__1390) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1392) else dtb__1392) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb__1386, rig, B_dData_dMaybe.C_Maybe_Nothing, ((Base_dSource.v_spanAtName dtb__1386) dtb__1387), bodyTerm2)), dtb__1388, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1393 })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dRast.C_Pat_PWild (dtb__1394) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pv in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1395; B_dData_dPair.f_Pair_second = dtb__1396 } -> (match dtb__1396 with
  | { B_dData_dPair.f_Pair_first = dtb__1397; B_dData_dPair.f_Pair_second = dtb__1398 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1397) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) dtb__1398) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1399; B_dData_dPair.f_Pair_second = dtb__1400 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, dtb__1394, (((Core_dTerm.v_shift 0) 1) dtb__1399))), dtb__1395, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1400 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase ((B_dData_dPair.v_secondOf bnd), (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf bnd); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (rest, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan (B_dData_dPair.v_firstOf bnd))))) expected)
)))
# 2365 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = binds in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1401, dtb__1402) -> (match dtb__1401 with
  | { B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = dtb__1404 } -> (match dtb__1403 with
  | Frontend_dRast.C_Pat_PVar (dtb__1405, dtb__1406) -> (((((((((((v_inferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1405) dtb__1404) dtb__1402) body) rec_u) ((Base_dSource.v_spanAtName dtb__1405) dtb__1406)) sp)
  | Frontend_dRast.C_Pat_PWild (dtb__1407) -> ((((((((((v_inferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1404) dtb__1402) body) rec_u) dtb__1407) sp)
  | _ -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase (dtb__1404, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (dtb__1402, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan dtb__1403))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
))))
# 2379 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetBoundFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = pv in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__1408; B_dData_dPair.f_Pair_second = dtb__1409 } -> (match dtb__1409 with
  | { B_dData_dPair.f_Pair_first = dtb__1410; B_dData_dPair.f_Pair_second = dtb__1411 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1410) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dtb__1410) ctx) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx2) dtb__1411) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = pb in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1412; B_dData_dPair.f_Pair_second = dtb__1413 } -> (match dtb__1413 with
  | { B_dData_dPair.f_Pair_first = dtb__1414; B_dData_dPair.f_Pair_second = dtb__1415 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1415) ctx) dtb__1410) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1412) else dtb__1412) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, bodyTerm2)), dtb__1408, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1414; B_dData_dPair.f_Pair_second = dtb__1415 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2401 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetIgnoredFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pv in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1416; B_dData_dPair.f_Pair_second = dtb__1417 } -> (match dtb__1417 with
  | { B_dData_dPair.f_Pair_first = dtb__1418; B_dData_dPair.f_Pair_second = dtb__1419 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1418) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) dtb__1419) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pb in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1420; B_dData_dPair.f_Pair_second = dtb__1421 } -> (match dtb__1421 with
  | { B_dData_dPair.f_Pair_first = dtb__1422; B_dData_dPair.f_Pair_second = dtb__1423 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, (((Core_dTerm.v_shift 0) 1) dtb__1420))), dtb__1416, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1422; B_dData_dPair.f_Pair_second = dtb__1423 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2494 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelHint = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1424) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1425) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1426) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match expr with
  | Frontend_dRast.C_Expr_EApp (dtb__1427, dtb__1428, dtb__1429) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1427) dtb__1428) dtb__1429) (B_dData_dMaybe.C_Maybe_Just (expected)))
  | _ -> (((((v_inferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2780 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkByInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((((v_inferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__1430) -> (match dtb__1430 with
  | { B_dData_dPair.f_Pair_first = dtb__1431; B_dData_dPair.f_Pair_second = dtb__1432 } -> (match dtb__1432 with
  | { B_dData_dPair.f_Pair_first = dtb__1433; B_dData_dPair.f_Pair_second = dtb__1434 } -> (match ((((v_coerceTerm dtb__1434) expected) dtb__1433) dtb__1431) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1435) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1435; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1434) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1434) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1433) with
  | Base_dDiag.C_Check_ErrC (dtb__1436) -> (match ((((((v_tryEffLift ctx) globals) dtb__1434) expected) dtb__1433) dtb__1431) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1437) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__1437); B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) (B_dData_dPair.v_secondOf dtb__1437)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_unhandledEffectLabel dtb__1434) expected) dtb__1433) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1438) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> ((Elab_dTerm_dSupport.v_withEffectLabels dtb__1438) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("actual: " ^ (Core_dEval.v_showValue dtb__1433))))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("expected: " ^ (Core_dEval.v_showValue expected))))) d))))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((v_joinEffectLabels dtb__1438)))) (v_joinEffectLabels dtb__1438)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan (Frontend_dRast.v_exprSpan expr)) dtb__1436)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__1439) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1431; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1439) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1440) -> (Base_dDiag.C_Check_ErrC (dtb__1440))
  | _ -> failwith "DT: impossible branch"
))))
# 2801 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLamFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1441, dtb__1442) -> (match dtb__1441 with
  | { B_dData_dPair.f_Pair_first = dtb__1443; B_dData_dPair.f_Pair_second = dtb__1444 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (let nd_uscrut16 = forced in (match nd_uscrut16 with
  | Core_dTerm.C_Value_VMeta (dtb__1445, dtb__1446) -> (match dtb__1446 with
  | B_dData_dList.C_List_Nil -> (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) mc3) with
  | { B_dData_dPair.f_Pair_first = dtb__1447; B_dData_dPair.f_Pair_second = dtb__1448 } -> (let domVal = ((Elab_dTypes.v_evalCtx mc2) dtb__1447) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) dtb__1448) with
  | { B_dData_dPair.f_Pair_first = dtb__1449; B_dData_dPair.f_Pair_second = dtb__1450 } -> (let piVal = (Core_dTerm.C_Value_VPi ("_", false, Core_dTerm.C_Rig_RigOmega, domVal, { Core_dTerm.f_Closure_closureEnv = B_dData_dList.C_List_Nil; Core_dTerm.f_Closure_closureBody = dtb__1449 })) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__1450)) (Elab_dTypes.v_ecSolsP dtb__1450)) lvl) dtb__1445) B_dData_dList.C_List_Nil) piVal) with
  | Base_dDiag.C_Check_OkC (dtb__1451) -> ((((((((v_checkLamFuel (mc0 - 1)) mc1) mc2) ((Elab_dTypes.v_ecPutSols dtb__1450) (Core_dTerm.v_solsList dtb__1451))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1443; B_dData_dPair.f_Pair_second = dtb__1444 }, dtb__1442))) mc5) piVal) mc7)
  | Base_dDiag.C_Check_ErrC (dtb__1452) -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
)
  | Core_dTerm.C_Value_VPi (dtb__1453, dtb__1454, dtb__1455, dtb__1456, dtb__1457) -> (if dtb__1454 then (if (if ((Elab_dDict.v_isDictDomain mc3) dtb__1456) then true else (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__1456)) then (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1453) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1453) dtb__1456) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1457) v) in ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1443; B_dData_dPair.f_Pair_second = dtb__1444 }, dtb__1442))) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1458; B_dData_dPair.f_Pair_second = dtb__1459 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1453, dtb__1455, ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1456)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))), Base_dSource.v_spanEmpty, dtb__1458)); B_dData_dPair.f_Pair_second = dtb__1459 }))
  | _ -> failwith "DT: impossible branch"
))))))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)) else (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1453) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1443) dtb__1456) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1457) v) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain mc3) mc7) dtb__1443) dtb__1455) dtb__1456)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1442) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1460; B_dData_dPair.f_Pair_second = dtb__1461 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1461) mc2) dtb__1456) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1460) else dtb__1460) in (let slot0 = ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1456)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear mc3) mc2) then (if (((Elab_dMeta.v_termHasOuterLinear mc3) ctx2) dtb__1460) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1443, lamRig, slot, dtb__1444, inner2)); B_dData_dPair.f_Pair_second = dtb__1461 })))))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2890 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EApp (dtb__1462, dtb__1463, dtb__1464) -> (match dtb__1462 with
  | Frontend_dRast.C_Expr_EVar (dtb__1465, dtb__1466) -> (if (if ((Frontend_dRast_dName.v_rnameKey dtb__1465) = "->") then true else ((Frontend_dRast_dName.v_rnameKey dtb__1465) = "Type")) then (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1465)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1467) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1465)) then (match (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1465)) dtb__1463) dtb__1466) with
  | Base_dDiag.C_Check_ErrC (dtb__1468) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dDiag.C_Check_OkC (dtb__1469) -> (Base_dDiag.C_Check_OkC (dtb__1469))
  | _ -> failwith "DT: impossible branch"
) else (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Frontend_dRast.C_Expr_EVar (dtb__1470, dtb__1471) -> (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1470)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1472) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_typeLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1470)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1473) -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1473))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1474) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec) (Frontend_dRast_dName.v_rnameKey dtb__1470)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1474; B_dData_dPair.f_Pair_second = ec } }))
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
# 2923 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = p in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__1475; B_dData_dPair.f_Pair_second = dtb__1476 } -> (match dtb__1476 with
  | { B_dData_dPair.f_Pair_first = dtb__1477; B_dData_dPair.f_Pair_second = dtb__1478 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1478) dtb__1477) in (match (Core_dTerm.v_typeLevelOf forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1479) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1475; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1479; B_dData_dPair.f_Pair_second = dtb__1478 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedType (((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1477)))) ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1477))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2941 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1480, dtb__1481) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1480)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1481) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1480))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1480)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1481))) args) expected) sp))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1480)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueAppTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1480))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1480))) expected) sp)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1481))) args) expected) sp))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1480)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1482) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((Elab_dMeta.v_isSortVal ec) expected) then (match ((Elab_dMeta.v_typeNameOfDualCtor ec) (Frontend_dRast_dName.v_rnameKey dtb__1480)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1483) -> ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1483) args) expected) dtb__1481)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1480)) then ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1480)) args) expected) dtb__1481) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1480)) args) expected) sp) dtb__1481))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1480)) args) expected) sp) dtb__1481))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 2974 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppByValueFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (vsp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut10 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1484) -> (match dtb__1484 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__1485) -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__1486) -> ((((((((v_checkAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
# 2987 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1487; B_dData_dPair.f_Pair_second = dtb__1488 } -> (match dtb__1488 with
  | { B_dData_dPair.f_Pair_first = dtb__1489; B_dData_dPair.f_Pair_second = dtb__1490 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1490) (Elab_dTypes.v_ctxDepth ctx)) expected) (Core_dTerm.C_Value_VType (dtb__1489)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1487; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2998 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (((Elab_dMeta.v_typeHeadLookup globals) ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1491) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1491)) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = pa in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__1492; B_dData_dPair.f_Pair_second = dtb__1493 } -> (match dtb__1493 with
  | { B_dData_dPair.f_Pair_first = dtb__1494; B_dData_dPair.f_Pair_second = dtb__1495 } -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb__1495) dtb__1494)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1496) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1495) name) dtb__1492); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1496; B_dData_dPair.f_Pair_second = dtb__1495 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 3059 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeEqAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isEqMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1497, dtb__1498) -> (match dtb__1498 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1499, dtb__1500) -> (match dtb__1500 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1497)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1501; B_dData_dPair.f_Pair_second = dtb__1502 } -> (match dtb__1502 with
  | { B_dData_dPair.f_Pair_first = dtb__1503; B_dData_dPair.f_Pair_second = dtb__1504 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1504) dtb__1499)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1505; B_dData_dPair.f_Pair_second = dtb__1506 } -> (match dtb__1506 with
  | { B_dData_dPair.f_Pair_first = dtb__1507; B_dData_dPair.f_Pair_second = dtb__1508 } -> (match (((((v_coerceNatOperands dtb__1508) dtb__1503) dtb__1507) dtb__1501) dtb__1505) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1509) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1509))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1509))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1509))) dtb__1508)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1508) (Elab_dTypes.v_ctxDepth ctx)) dtb__1503) dtb__1507)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) dtb__1501) dtb__1505) sp) dtb__1503) ec3)))
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
# 3083 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeCmpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isCmpMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1510, dtb__1511) -> (match dtb__1511 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1512, dtb__1513) -> (match dtb__1513 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1510)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1514; B_dData_dPair.f_Pair_second = dtb__1515 } -> (match dtb__1515 with
  | { B_dData_dPair.f_Pair_first = dtb__1516; B_dData_dPair.f_Pair_second = dtb__1517 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1517) dtb__1512)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1518; B_dData_dPair.f_Pair_second = dtb__1519 } -> (match dtb__1519 with
  | { B_dData_dPair.f_Pair_first = dtb__1520; B_dData_dPair.f_Pair_second = dtb__1521 } -> (match (((((v_coerceNatOperands dtb__1521) dtb__1516) dtb__1520) dtb__1514) dtb__1518) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1522) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1522))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1522))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1522))) dtb__1521)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1521) (Elab_dTypes.v_ctxDepth ctx)) dtb__1516) dtb__1520)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) dtb__1514) dtb__1518) sp) dtb__1516) ec3)))
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
# 3109 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeOpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (name = Base_dIntrinsics.v_interpMethodName) then (((((((v_specializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Base_dCommon.v_bind (((((((v_specializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1523) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1523))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r2 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1524) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1524))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r3 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1525) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1525))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_specializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 3142 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeInterpPrimApp = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1526, dtb__1527) -> (match dtb__1527 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1526)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1528; B_dData_dPair.f_Pair_second = dtb__1529 } -> (match dtb__1529 with
  | { B_dData_dPair.f_Pair_first = dtb__1530; B_dData_dPair.f_Pair_second = dtb__1531 } -> (let tyv = ((Elab_dTypes.v_forceVal dtb__1531) dtb__1530) in (if (v_isStringTyValue tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1528; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyv; B_dData_dPair.f_Pair_second = dtb__1531 } })))) else (if (if ((v_isIntTy dtb__1531) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1531) Base_dIntrinsics.v_intTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm dtb__1528); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1531 } })))) else (if (if ((v_isNatTy dtb__1531) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1531) Base_dIntrinsics.v_natTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm (v_natToIntTerm dtb__1528)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1531 } })))) else (if ((v_isFloatTy dtb__1531) tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromFloatTerm dtb__1528); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1531 } })))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 3182 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeBoolAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1532, dtb__1533) -> (match dtb__1533 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1534, dtb__1535) -> (match dtb__1535 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1532) Elab_dPrelude.v_boolTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1536; B_dData_dPair.f_Pair_second = dtb__1537 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1537) dtb__1534) Elab_dPrelude.v_boolTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1538; B_dData_dPair.f_Pair_second = dtb__1539 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((Elab_dDict.v_boolShortCircuit name) dtb__1536) dtb__1538); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__1539 } }))))
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
# 3203 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1540, dtb__1541) -> ((Base_dCommon.v_bind ((((((((v_specializeArithCheckFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1540)) args) expected) sp)) (fun (arith : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut11 = arith in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_skipArithSpecForExpected ec) (Frontend_dRast_dName.v_rnameKey dtb__1540)) expected) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1540)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut14 = mspec in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1542) -> (match dtb__1542 with
  | { B_dData_dPair.f_Pair_first = dtb__1543; B_dData_dPair.f_Pair_second = dtb__1544 } -> (match dtb__1544 with
  | { B_dData_dPair.f_Pair_first = dtb__1545; B_dData_dPair.f_Pair_second = dtb__1546 } -> (match ((((v_coerceTerm dtb__1546) expected) dtb__1545) dtb__1543) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1547) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1547; B_dData_dPair.f_Pair_second = dtb__1546 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1546) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1545)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1543; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1548) -> (match dtb__1548 with
  | { B_dData_dPair.f_Pair_first = dtb__1549; B_dData_dPair.f_Pair_second = dtb__1550 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1549; B_dData_dPair.f_Pair_second = dtb__1550 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
)))
# 3491 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppCtorFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1551) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs ec) ctx) dtb__1551) expected) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1551))) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1552; B_dData_dPair.f_Pair_second = dtb__1553 } -> (match dtb__1553 with
  | { B_dData_dPair.f_Pair_first = dtb__1554; B_dData_dPair.f_Pair_second = dtb__1555 } -> (let ctorTerm = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1555)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1552) in (match ((((v_coerceTerm dtb__1555) expected) dtb__1554) ctorTerm) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1556) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1556; B_dData_dPair.f_Pair_second = dtb__1555 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1555) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1554) with
  | Base_dDiag.C_Check_OkC (dtb__1557) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1557)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1552); B_dData_dPair.f_Pair_second = dtb__1557 }))
  | Base_dDiag.C_Check_ErrC (dtb__1558) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1558)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1558))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1559) -> (match dtb__1559 with
  | { B_dData_dPair.f_Pair_first = dtb__1560; B_dData_dPair.f_Pair_second = dtb__1561 } -> (match dtb__1561 with
  | { B_dData_dPair.f_Pair_first = dtb__1562; B_dData_dPair.f_Pair_second = dtb__1563 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1563) dtb__1562) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pa in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1564; B_dData_dPair.f_Pair_second = dtb__1565 } -> (match dtb__1565 with
  | { B_dData_dPair.f_Pair_first = dtb__1566; B_dData_dPair.f_Pair_second = dtb__1567 } -> (let allArgs = ((B_dData_dList.v_append dtb__1560) dtb__1564) in (match ((((v_coerceTerm dtb__1567) expected) dtb__1566) (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1567)) (Core_dTerm.C_Term_TGlobal (name))) allArgs)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1568) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1568; B_dData_dPair.f_Pair_second = dtb__1567 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1567) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1566) with
  | Base_dDiag.C_Check_OkC (dtb__1569) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1569)) (Core_dTerm.C_Term_TGlobal (name))) allArgs); B_dData_dPair.f_Pair_second = dtb__1569 }))
  | Base_dDiag.C_Check_ErrC (dtb__1570) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1570)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1570))
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
# 3770 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabDoChain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (plan : t_DoPlan) (steps : t_DoChainStep B_dData_dList.t_List) (last : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = steps in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1571, dtb__1572) -> (match dtb__1571 with
  | C_DoChainStep_DoChainStep (dtb__1573, dtb__1574, dtb__1575, dtb__1576) -> (match (((Elab_dMetaSpans.v_newMetaAt dtb__1575) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1577; B_dData_dPair.f_Pair_second = dtb__1578 } -> (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1577) in (let mArgTy = ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) aVal) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1573) aVal) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1578) dtb__1575) "_") (plan).f_DoPlan_planRigE) mArgTy)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1578) dtb__1574) mArgTy)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1579; B_dData_dPair.f_Pair_second = dtb__1580 } -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1580) dtb__1575) dtb__1573) (plan).f_DoPlan_planInnerRig) aVal)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx2) dtb__1580) plan) dtb__1572) last)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1581; B_dData_dPair.f_Pair_second = dtb__1582 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((((((((v_doBindAppTerm dtb__1580) dtb__1582) ctx) dtb__1575) dtb__1576) plan) dtb__1573) aVal) dtb__1579) argRig) lamRig) dtb__1581); B_dData_dPair.f_Pair_second = dtb__1582 }))
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
# 3804 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1583) -> (match dtb__1583 with
  | { B_dData_dPair.f_Pair_first = dtb__1584; B_dData_dPair.f_Pair_second = dtb__1585 } -> (match dtb__1585 with
  | { B_dData_dPair.f_Pair_first = dtb__1586; B_dData_dPair.f_Pair_second = dtb__1587 } -> (let nd_uscrut17 = ((v_splitDoExpected ec) expected) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1588; B_dData_dPair.f_Pair_second = dtb__1589 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1589) with
  | { B_dData_dPair.f_Pair_first = dtb__1590; B_dData_dPair.f_Pair_second = dtb__1591 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1588) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1590) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1591) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1584) dtb__1586) dtb__1587) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1592) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1592).f_DoPlan_planEc) dtb__1592) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1593; B_dData_dPair.f_Pair_second = dtb__1594 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1594) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_applyValue (dtb__1592).f_DoPlan_planMVal) (dtb__1592).f_DoPlan_planAVal))) (fun (ec4 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1593; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1595) -> (match dtb__1595 with
  | { B_dData_dPair.f_Pair_first = dtb__1596; B_dData_dPair.f_Pair_second = dtb__1597 } -> ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1584) dtb__1586) dtb__1587) dtb__1596) dtb__1597)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1598) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1598).f_DoPlan_planEc) dtb__1598) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1599; B_dData_dPair.f_Pair_second = dtb__1600 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1599; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1600) }))))
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
# 3847 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1601) -> (match dtb__1601 with
  | { B_dData_dPair.f_Pair_first = dtb__1602; B_dData_dPair.f_Pair_second = dtb__1603 } -> (match dtb__1603 with
  | { B_dData_dPair.f_Pair_first = dtb__1604; B_dData_dPair.f_Pair_second = dtb__1605 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1606; B_dData_dPair.f_Pair_second = dtb__1607 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1607) with
  | { B_dData_dPair.f_Pair_first = dtb__1608; B_dData_dPair.f_Pair_second = dtb__1609 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1606) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1608) in (let resultTy = ((Core_dEval.v_applyValue mVal) aVal) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1609) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1602) dtb__1604) dtb__1605) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1610) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1610).f_DoPlan_planEc) dtb__1610) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1611; B_dData_dPair.f_Pair_second = dtb__1612 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1611; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__1612 } }))))
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

# 3022 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_checkTypeAtKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VType (dtb__1613) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) (((((v_checkTypeFuel 256) globals) ctx) ec) expr))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)) }))))
  | _ -> (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EApp (dtb__1614, dtb__1615, dtb__1616) -> (match dtb__1614 with
  | Frontend_dRast.C_Expr_EVar (dtb__1617, dtb__1618) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1617)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1617)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1617)))) (Frontend_dRast_dName.v_rnameKey dtb__1617))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1619) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel 256) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1619)) dtb__1615) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1620; B_dData_dPair.f_Pair_second = dtb__1621 } -> (match dtb__1621 with
  | { B_dData_dPair.f_Pair_first = dtb__1622; B_dData_dPair.f_Pair_second = dtb__1623 } -> (match ((((Elab_dMeta.v_convEc dtb__1623) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1622) with
  | Base_dDiag.C_Check_OkC (dtb__1624) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1624) (Frontend_dRast_dName.v_rnameKey dtb__1617)) dtb__1620); B_dData_dPair.f_Pair_second = dtb__1624 }))
  | Base_dDiag.C_Check_ErrC (dtb__1625) -> (((Base_dDiagnostics_dTc.v_tcTypeMismatch sp) (Core_dEval.v_showValue expected)) (Core_dEval.v_showValue dtb__1622))
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
  | Frontend_dRast.C_Expr_EVar (dtb__1626, dtb__1627) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1626)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1626)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1626)))) (Frontend_dRast_dName.v_rnameKey dtb__1626))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1628) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1628)))) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec1) (Frontend_dRast_dName.v_rnameKey dtb__1626)); B_dData_dPair.f_Pair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected))
))
))

# 971 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planData = (fun (p : t_FieldAccessPlan) -> (p).f_FieldAccessPlan_planData)

# 972 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planCtor = (fun (p : t_FieldAccessPlan) -> (p).f_FieldAccessPlan_planCtor)

# 973 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planIdxs = (fun (p : t_FieldAccessPlan) -> (p).f_FieldAccessPlan_planIdxs)

# 974 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRecord = (fun (p : t_FieldAccessPlan) -> (p).f_FieldAccessPlan_planRecord)

# 975 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planField = (fun (p : t_FieldAccessPlan) -> (p).f_FieldAccessPlan_planField)

# 976 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planFieldCount = (fun (p : t_FieldAccessPlan) -> (p).f_FieldAccessPlan_planFieldCount)

# 977 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planType = (fun (p : t_FieldAccessPlan) -> (p).f_FieldAccessPlan_planType)

# 981 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upData = (fun (p : t_UpdateAccessPlan) -> (p).f_UpdateAccessPlan_upData)

# 982 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upCtor = (fun (p : t_UpdateAccessPlan) -> (p).f_UpdateAccessPlan_upCtor)

# 983 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upIdxs = (fun (p : t_UpdateAccessPlan) -> (p).f_UpdateAccessPlan_upIdxs)

# 984 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upRecord = (fun (p : t_UpdateAccessPlan) -> (p).f_UpdateAccessPlan_upRecord)

# 985 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upFieldCount = (fun (p : t_UpdateAccessPlan) -> (p).f_UpdateAccessPlan_upFieldCount)

# 986 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upFieldIndices = (fun (p : t_UpdateAccessPlan) -> (p).f_UpdateAccessPlan_upFieldIndices)

# 987 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upBodyArgs = (fun (p : t_UpdateAccessPlan) -> (p).f_UpdateAccessPlan_upBodyArgs)

# 3559 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainCanonical = (fun (p : t_DoChain) -> (p).f_DoChain_doChainCanonical)

# 3560 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainSteps = (fun (p : t_DoChain) -> (p).f_DoChain_doChainSteps)

# 3561 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainLast = (fun (p : t_DoChain) -> (p).f_DoChain_doChainLast)

# 3562 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainSpan = (fun (p : t_DoChain) -> (p).f_DoChain_doChainSpan)

# 3702 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planBind = (fun (p : t_DoPlan) -> (p).f_DoPlan_planBind)

# 3703 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planHead = (fun (p : t_DoPlan) -> (p).f_DoPlan_planHead)

# 3704 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planMTerm = (fun (p : t_DoPlan) -> (p).f_DoPlan_planMTerm)

# 3705 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planMVal = (fun (p : t_DoPlan) -> (p).f_DoPlan_planMVal)

# 3706 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planAVal = (fun (p : t_DoPlan) -> (p).f_DoPlan_planAVal)

# 3707 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDictTerm = (fun (p : t_DoPlan) -> (p).f_DoPlan_planDictTerm)

# 3708 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRigE = (fun (p : t_DoPlan) -> (p).f_DoPlan_planRigE)

# 3709 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRigL = (fun (p : t_DoPlan) -> (p).f_DoPlan_planRigL)

# 3710 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planInnerRig = (fun (p : t_DoPlan) -> (p).f_DoPlan_planInnerRig)

# 3711 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planEc = (fun (p : t_DoPlan) -> (p).f_DoPlan_planEc)
