open Vuna_runtime
type t_PerfFamily = C_PerfFamily_PerfFamily of (string) * (string) * (string)
and t_FieldAccessPlan = { f_FieldAccessPlan_planData : Elab_dTypes.t_DtData; f_FieldAccessPlan_planCtor : Elab_dTypes.t_DtCtor; f_FieldAccessPlan_planIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_FieldAccessPlan_planRecord : string; f_FieldAccessPlan_planField : int; f_FieldAccessPlan_planFieldCount : int; f_FieldAccessPlan_planType : Core_dTerm.t_Value }
and t_UpdateAccessPlan = { f_UpdateAccessPlan_upData : Elab_dTypes.t_DtData; f_UpdateAccessPlan_upCtor : Elab_dTypes.t_DtCtor; f_UpdateAccessPlan_upIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_UpdateAccessPlan_upRecord : string; f_UpdateAccessPlan_upFieldCount : int; f_UpdateAccessPlan_upFieldIndices : int B_dData_dList.t_List; f_UpdateAccessPlan_upBodyArgs : Frontend_dRast.t_Expr B_dData_dList.t_List }
and t_DoChainStep = C_DoChainStep_DoChainStep of (string) * (Frontend_dRast.t_Expr) * (Base_dSource.t_Span) * (Base_dSource.t_Span)
and t_DoChain = { f_DoChain_doChainCanonical : string; f_DoChain_doChainSteps : t_DoChainStep B_dData_dList.t_List; f_DoChain_doChainLast : Frontend_dRast.t_Expr; f_DoChain_doChainSpan : Base_dSource.t_Span }
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

# 179 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_needsMatrixCase = (fun (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (Elab_dCase.v_anyNestedPat alts) then true else (B_dData_dList.v_hasDupNames (Elab_dCase.v_altNames alts))))

# 364 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 373 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 511 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfShortOf = (fun (last : string) -> (if ((B_dData_dString.v_endsWith "Op") last) then (let n = (bi_strLength last) in (if (n > 2) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring 0) (B_dData_dNat.v_fromInt (n - 2))) last))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))

# 520 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfCanonical = (fun (canon : string) -> (match (v_perfShortOf (Base_dSource.v_lastSeg canon)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (B_dData_dMaybe.C_Maybe_Just ((C_PerfFamily_PerfFamily (canon, (Base_dSource.v_prefixOfName canon), dtb__21))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__22) -> (match dtb__22 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__23, dtb__24) -> (v_perfFamilyOfCanonical dtb__23)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 535 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 541 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 547 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 553 "Vuna/Compiler/Elab/Term/Impl.vuna"
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

# 565 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_mrefCellNamesGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__57 with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (match (Elab_dMutRef.v_mrefCellNameOf dtb__59) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (B_dData_dList.C_List__x58__x58_ (dtb__61, (v_mrefCellNamesGo dtb__58)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_mrefCellNamesGo dtb__58)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_mrefCellNames = (fun (ctx : Elab_dTypes.t_Ctx) -> (v_mrefCellNamesGo (ctx).Elab_dTypes.f_Ctx_ctxItems))

# 573 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_mrefResolveCell = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut4 = (v_mrefCellNames mc0) in (match nd_uscrut4 with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_CellNotInScope ("any"))) "any")
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__62))
  | _ -> (let text = ((B_dData_dString.v_join ", ") nd_uscrut4) in ((((Base_dDiagnostics_dTc.v_tcErr2 mc2) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousInstance ("mutable ref", text))) "mutable ref") text))
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (match ((Elab_dTypes.v_ctxLookup (Elab_dMutRef.v_mrefCellBinder dtb__64)) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (Base_dDiag.C_Check_OkC (dtb__64))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_CellNotInScope (dtb__64))) dtb__64)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_mrefWithOf = (fun (head : string) (sp : Base_dSource.t_Span) (nExpr : Frontend_dRast.t_Expr) (init : Frontend_dRast.t_Expr) (body : Frontend_dRast.t_Expr) (n : string) -> (if (head = Elab_dMutRef.v_mrefWithPureName) then (((((Elab_dMutRef.v_mrefWithPureExpr sp) nExpr) init) body) n) else (((((Elab_dMutRef.v_mrefWithExpr sp) nExpr) init) body) n)))

# 593 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_mrefRewriteCall = (fun (ctx : Elab_dTypes.t_Ctx) (head : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (head = Elab_dMutRef.v_mrefReadName) then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__67 with
  | B_dData_dList.C_List_Nil -> (match (v_instArgOperand dtb__66) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (match (Elab_dMutRef.v_stringLitOf dtb__68) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (B_dData_dMaybe.C_Maybe_Just (((Base_dCommon.v_bind (((v_mrefResolveCell ctx) (B_dData_dMaybe.C_Maybe_Just (dtb__69))) sp)) (fun (n2 : string) -> (Base_dDiag.C_Check_OkC (((Elab_dMutRef.v_mrefReadExpr sp) n2)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (((Base_dCommon.v_bind (((v_mrefResolveCell ctx) B_dData_dMaybe.C_Maybe_Nothing) sp)) (fun (n : string) -> (Base_dDiag.C_Check_OkC (((Elab_dMutRef.v_mrefReadExpr sp) n)))))))
  | _ -> failwith "DT: impossible branch"
)) else (if (head = Elab_dMutRef.v_mrefWriteName) then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__71 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__73 with
  | B_dData_dList.C_List_Nil -> (match (v_instArgOperand dtb__70) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (match (Elab_dMutRef.v_stringLitOf dtb__74) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (B_dData_dMaybe.C_Maybe_Just (((Base_dCommon.v_bind (((v_mrefResolveCell ctx) (B_dData_dMaybe.C_Maybe_Just (dtb__75))) sp)) (fun (n2 : string) -> (Base_dDiag.C_Check_OkC ((((Elab_dMutRef.v_mrefWriteExpr sp) n2) dtb__72)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (((Base_dCommon.v_bind (((v_mrefResolveCell ctx) B_dData_dMaybe.C_Maybe_Nothing) sp)) (fun (n : string) -> (Base_dDiag.C_Check_OkC ((((Elab_dMutRef.v_mrefWriteExpr sp) n) dtb__70)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (if (head = Elab_dMutRef.v_mrefWithName) then true else (head = Elab_dMutRef.v_mrefWithPureName)) then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__79 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | B_dData_dList.C_List_Nil -> (match (Elab_dMutRef.v_stringLitOf dtb__76) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (match ((Elab_dTypes.v_ctxLookup (Elab_dMutRef.v_mrefCellBinder dtb__82)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> (B_dData_dMaybe.C_Maybe_Just ((((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan dtb__76)) (Base_dDiagnostics_dTc.C_TcErr_DuplicateInstance ((String.concat "" [Elab_dMutRef.v_mrefOpName; " "; dtb__82])))) (String.concat "" [Elab_dMutRef.v_mrefOpName; " "; dtb__82]))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ((Base_dDiag.C_Check_OkC (((((((v_mrefWithOf head) sp) dtb__76) dtb__78) dtb__80) dtb__82)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ((((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan dtb__76)) (Base_dDiagnostics_dTc.C_TcErr_CellNameNotLiteral (""))) "")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))))

# 588 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_mrefRewriteExpr = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EApp (dtb__84, dtb__85, dtb__86) -> (match dtb__84 with
  | Frontend_dRast.C_Expr_EVar (dtb__87, dtb__88) -> ((((v_mrefRewriteCall mc0) (Frontend_dRast_dName.v_rnameKey dtb__87)) dtb__85) dtb__86)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__89, dtb__90) -> ((((v_mrefRewriteCall mc0) (Frontend_dRast_dName.v_rnameKey dtb__89)) B_dData_dList.C_List_Nil) dtb__90)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 660 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOperand = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__91, dtb__92, dtb__93) -> (match dtb__91 with
  | Frontend_dRast.C_Expr_EVar (dtb__94, dtb__95) -> (match dtb__92 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__97 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__99 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__101 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isHandleSyntax (Frontend_dRast_dName.v_rnameKey dtb__94)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__100 } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 676 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleFamilyOfCtor = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_ctorFamilyNameOf ec) cname) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (Base_dDiag.C_Check_OkC (dtb__102))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 666 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamily = (fun (ec : Elab_dTypes.t_Ec) (cname : string) (sp : Base_dSource.t_Span) -> (if (Frontend_dReserved.v_isOverCtorName cname) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) sp) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort cname)) (Frontend_dReserved.v_overCtorTargets cname))) (fun (canon : string) -> (((v_handleFamilyOfCtor ec) canon) sp))) else (((v_handleFamilyOfCtor ec) cname) sp)))

# 683 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilyOfPat = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Pat) -> (match mc1 with
  | Frontend_dRast.C_Pat_PCon (dtb__103, dtb__104, dtb__105) -> (((v_handleClauseFamily mc0) (Frontend_dRast_dName.v_rnameKey dtb__103)) dtb__105)
  | _ -> (Base_dDiag.v_icInternal "handle mirror case pattern is not a constructor")
))

# 688 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleCheckFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (match dtb__106 with
  | { B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = dtb__109 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__108) with
  | Base_dDiag.C_Check_ErrC (dtb__110) -> (Base_dDiag.C_Check_ErrC (dtb__110))
  | Base_dDiag.C_Check_OkC (dtb__111) -> (if (dtb__111 = mc1) then (((v_handleCheckFamilies mc0) mc1) dtb__107) else ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dRast.v_patSpan dtb__108)) (Base_dDiagnostics_dTc.C_TcErr_HandleClauseFamilyMismatch (mc1, dtb__111))) mc1) dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 700 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilies = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (match dtb__112 with
  | { B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = dtb__115 } -> (match ((v_handleClauseFamilyOfPat mc0) dtb__114) with
  | Base_dDiag.C_Check_ErrC (dtb__116) -> (Base_dDiag.C_Check_ErrC (dtb__116))
  | Base_dDiag.C_Check_OkC (dtb__117) -> (((v_handleCheckFamilies mc0) dtb__117) dtb__113)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 732 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isUniverseTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__118) -> true
  | _ -> false
))

# 718 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_countOpArrows = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TType (dtb__119) -> (B_dData_dMaybe.C_Maybe_Just (0))
  | Core_dTerm.C_Term_TPi (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (if dtb__121 then (v_countOpArrows dtb__124) else (if (v_isUniverseTerm dtb__123) then (match (v_countOpArrows dtb__124) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__125) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__125 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 712 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArity = (fun (kind : Core_dTerm.t_Term) -> (match (v_countOpArrows kind) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (if (dtb__126 >= 1) then (B_dData_dMaybe.C_Maybe_Just ((dtb__126 - 1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 737 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleHoleArgs = (fun (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), ((v_handleHoleArgs (k - 1)) sp)))))

# 742 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)) else (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName canon), sp)), ((v_handleHoleArgs k) sp), sp))))

# 750 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigBinder = "@vuna@handle@sig"

# 755 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigArg = (fun (canon : string) (k : int) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Base.Effect.Core.sigFn"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleSigBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EApp ((((v_handleOpArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (v_handleSigBinder)), sp)), B_dData_dList.C_List_Nil)), sp)), sp)), B_dData_dList.C_List_Nil)), sp)))

# 774 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) -> (match ((Elab_dMeta.v_dtDataLookup canon) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb__127)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Elab_dMeta.v_globalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleDefaultRetBinder = "@vuna@handle@ret"

# 785 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleRetArg = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__128, dtb__129) -> (if (Frontend_dReserved.v_isHandleNoRetSyntax (Frontend_dRast_dName.v_rnameKey dtb__128)) then (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_handleDefaultRetBinder; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal (v_handleDefaultRetBinder)), dtb__129)), dtb__129)) else (Frontend_dRast.C_Expr_EVar (dtb__128, dtb__129)))
  | _ -> mc0
))

# 764 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCall = (fun (headMode : bool) (nameArg : Frontend_dRast.t_Expr) (canon : string) (k : int) (comp : Frontend_dRast.t_Expr) (ret : Frontend_dRast.t_Expr) (opH : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let fnName = (if headMode then "Base.Effect.Core.handleWithAt" else "Base.Effect.Core.handleWith") in (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName fnName), sp)), (B_dData_dList.C_List__x58__x58_ (nameArg, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (canon, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg canon) k) sp), (B_dData_dList.C_List__x58__x58_ (comp, (B_dData_dList.C_List__x58__x58_ ((v_handleRetArg ret), (B_dData_dList.C_List__x58__x58_ (opH, B_dData_dList.C_List_Nil)))))))))))), sp))))

# 796 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opFamilyArityOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (canon : string) (sp : Base_dSource.t_Span) -> (match (((v_handleOpKind globals) ec) canon) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (match (v_handleOpArity dtb__130) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (canon))) canon)
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> (Base_dDiag.C_Check_OkC (dtb__131))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (opTy : Core_dTerm.t_Value) (op : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let nd_uscrut5 = ((v_perfFamilyOfValue ec) opTy) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__132) -> (match dtb__132 with
  | C_PerfFamily_PerfFamily (dtb__133, dtb__134, dtb__135) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__133) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Base.Effect.Core.performCore"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (dtb__133, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg dtb__133) k) sp), (B_dData_dList.C_List__x58__x58_ (op, B_dData_dList.C_List_Nil)))))))), sp))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_EffResFamilyMissing (((Core_dEval.v_showValueAt 6) opTy)))) ((Core_dEval.v_showValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)))

# 807 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprWith = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) (headMode : bool) (nameArg : Frontend_dRast.t_Expr) -> (let nd_uscrut6 = (v_handleOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (match dtb__136 with
  | { B_dData_dPair.f_Pair_first = dtb__137; B_dData_dPair.f_Pair_second = dtb__138 } -> (match dtb__138 with
  | { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 } -> (let nd_uscrut17 = dtb__140 in (match nd_uscrut17 with
  | Frontend_dRast.C_Expr_ELam (dtb__141, dtb__142, dtb__143) -> (match dtb__141 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (match dtb__142 with
  | Frontend_dRast.C_Expr_ECase (dtb__148, dtb__149, dtb__150) -> ((Base_dCommon.v_bind ((v_handleClauseFamilies ec) dtb__149)) (fun (fam : string) -> (let nd_uscrut31 = (v_perfFamilyOfCanonical fam) in (match nd_uscrut31 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (match dtb__151 with
  | C_PerfFamily_PerfFamily (dtb__152, dtb__153, dtb__154) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf globals) ec) dtb__152) sp)) (fun (k : int) -> (Base_dDiag.C_Check_OkC (((((((((v_handleCall headMode) nameArg) dtb__152) k) dtb__137) dtb__139) dtb__140) sp)))))
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

# 823 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExpr = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) false) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 828 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAt = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))))

# 833 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAtHole = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((((v_handleCallExprWith globals) ec) expr) sp) true) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "_"), sp))))

# 972 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordTypeOf = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) ty) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__155) -> (match dtb__155 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__156, dtb__157) -> (match ((Elab_dMeta.v_dtDataLookup dtb__156) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__158) then (let nd_uscrut8 = (Elab_dTypes.v_dtDataCtors dtb__158) in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match dtb__160 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__158; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__157 } }))
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

# 988 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldVarName = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 996 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldPatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ((v_recordFieldVarName i), sp)), (((v_recordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 992 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordFieldPatsFrom 0) n) sp))

# 1007 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldLookupGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (if ((dtb__161).Elab_dTypes.f_DtFieldMeta_dtFieldName = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__161).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = (dtb__161).Elab_dTypes.f_DtFieldMeta_dtFieldType } })) else (((v_recordFieldLookupGo mc0) dtb__162) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1004 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldLookup = (fun (fname : string) (dd : Elab_dTypes.t_DtData) -> (((v_recordFieldLookupGo fname) (Elab_dTypes.v_dtDataFields dd)) (B_dData_dList.v_length (Elab_dTypes.v_dtDataFields dd))))

# 1016 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateUnknownGo = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (match ((v_recordFieldLookup dtb__165) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__165))
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> ((v_recordUpdateUnknownGo mc0) dtb__164)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1024 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateUnknown = (fun (dd : Elab_dTypes.t_DtData) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_recordUpdateUnknownGo dd) fields))

# 1028 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateValueFor = (fun (mc0 : string) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (match dtb__168 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (if (dtb__170 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__171)) else ((v_recordUpdateValueFor mc0) dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateArg = (fun (i : int) (f : Elab_dTypes.t_DtFieldMeta) (provided : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match ((v_recordUpdateValueFor (f).Elab_dTypes.f_DtFieldMeta_dtFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> dtb__172
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (v_recordFieldVarName i)), sp))
  | _ -> failwith "DT: impossible branch"
))

# 1041 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (B_dData_dList.C_List__x58__x58_ (((((v_recordUpdateArg mc0) dtb__173) mc2) mc3), ((((v_recordUpdateArgs (mc0 + 1)) dtb__174) mc2) mc3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1047 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdatedIndices = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | { B_dData_dPair.f_Pair_first = dtb__177; B_dData_dPair.f_Pair_second = dtb__178 } -> (let nd_uscrut9 = ((v_recordFieldLookup dtb__177) mc0) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_recordUpdatedIndices mc0) dtb__176)
  | B_dData_dMaybe.C_Maybe_Just (dtb__179) -> (match dtb__179 with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> (B_dData_dList.C_List__x58__x58_ (dtb__180, ((v_recordUpdatedIndices mc0) dtb__176)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1079 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (match dtb__182 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (match dtb__184 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (let nd_uscrut15 = ((v_recordFieldLookup fname) dtb__183) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> (match dtb__189 with
  | { B_dData_dPair.f_Pair_first = dtb__190; B_dData_dPair.f_Pair_second = dtb__191 } -> (Base_dDiag.C_Check_OkC ({ f_FieldAccessPlan_planData = dtb__183; f_FieldAccessPlan_planCtor = dtb__185; f_FieldAccessPlan_planIdxs = dtb__186; f_FieldAccessPlan_planRecord = (dtb__183).Elab_dTypes.f_DtData_dtDataName; f_FieldAccessPlan_planField = dtb__188; f_FieldAccessPlan_planFieldCount = dtb__190; f_FieldAccessPlan_planType = ((Core_dEval.v_eval (B_dData_dList.v_reverse dtb__186)) dtb__191) }))
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

# 1090 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdatePlan = (fun (ec : Elab_dTypes.t_Ec) (baseTy : Core_dTerm.t_Value) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let nd_uscrut4 = ((v_recordTypeOf ec) baseTy) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (match dtb__192 with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> (match dtb__194 with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> (match ((v_recordUpdateUnknown dtb__193) fields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> ((Elab_dTypes.v_errAt sp) ("record type has no field " ^ dtb__197))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let fs = (Elab_dTypes.v_dtDataFields dtb__193) in (let bodyArgs = ((((v_recordUpdateArgs 0) fs) fields) sp) in (Base_dDiag.C_Check_OkC ({ f_UpdateAccessPlan_upData = dtb__193; f_UpdateAccessPlan_upCtor = dtb__195; f_UpdateAccessPlan_upIdxs = dtb__196; f_UpdateAccessPlan_upRecord = (dtb__193).Elab_dTypes.f_DtData_dtDataName; f_UpdateAccessPlan_upFieldCount = (B_dData_dList.v_length fs); f_UpdateAccessPlan_upFieldIndices = ((v_recordUpdatedIndices dtb__193) fields); f_UpdateAccessPlan_upBodyArgs = bodyArgs }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)))

# 1105 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldDictName = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_hasFieldTraitName)

# 1115 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctxHasFieldDictGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : string) (mc5 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (let nd_uscrut13 = ((Elab_dTypes.v_forceVal mc3) (((Elab_dTypes.v_varTypeValue mc2) mc1) dtb__201)) in (match nd_uscrut13 with
  | Core_dTerm.C_Value_VNeutral (dtb__202) -> (match dtb__202 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__203, dtb__204) -> (if (dtb__203 = v_hasFieldDictName) then (let nd_uscrut17 = dtb__204 in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__206 with
  | B_dData_dList.C_List__x58__x58_ (dtb__207, dtb__208) -> (match dtb__208 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (let nd_uscrut27 = ((Elab_dTypes.v_forceVal mc3) dtb__205) in (match nd_uscrut27 with
  | Core_dTerm.C_Value_VNeutral (dtb__211) -> (match dtb__211 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__212, dtb__213) -> (match dtb__213 with
  | B_dData_dList.C_List__x58__x58_ (dtb__214, dtb__215) -> (match dtb__214 with
  | Core_dTerm.C_Value_VStr (dtb__216) -> (if (dtb__216 = mc4) then (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc2)) dtb__207) mc5) with
  | Base_dDiag.C_Check_OkC (dtb__217) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__200, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = dtb__217 } }))
  | Base_dDiag.C_Check_ErrC (dtb__218) -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) else ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb__199) (mc1 + 1)) mc2) mc3) mc4) mc5)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1111 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctxHasFieldDict = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fname : string) (baseTy : Core_dTerm.t_Value) -> ((((((v_ctxHasFieldDictGo (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ctx) ec) fname) baseTy))

# 1143 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldAccessFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (baseTerm : Core_dTerm.t_Term) (baseTy : Core_dTerm.t_Value) (fname : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut8 = ((Elab_dTypes.v_forceVal ec) baseTy) in (match nd_uscrut8 with
  | Core_dTerm.C_Value_VNeutral (dtb__219) -> (match dtb__219 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__220, dtb__221) -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["type "; dtb__220; " is not a record"]))
  | _ -> (let nd_uscrut10 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__222) -> (match dtb__222 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> (match dtb__224 with
  | { B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__226 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__225), Core_dTerm.C_Rig_Rig0)), dtb__223, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__226 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut9 = ((((v_ctxHasFieldDict ctx) ec) fname) baseTy) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> (match dtb__227 with
  | { B_dData_dPair.f_Pair_first = dtb__228; B_dData_dPair.f_Pair_second = dtb__229 } -> (match dtb__229 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (let labelTerm = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (fname)), Core_dTerm.C_Rig_Rig0)) in (let proj = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), labelTerm, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) baseTy), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) dtb__230), Core_dTerm.C_Rig_Rig0)), dtb__228, Core_dTerm.C_Rig_RigOmega)), baseTerm, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)))

# 1410 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_listLitElems = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__232, dtb__233, dtb__234) -> (match dtb__232 with
  | Frontend_dRast.C_Expr_EVar (dtb__235, dtb__236) -> (match dtb__233 with
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> (match dtb__238 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (match dtb__240 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isListConsSyntax (Frontend_dRast_dName.v_rnameKey dtb__235)) then ((v_listLitConsTail dtb__237) dtb__239) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dRast.C_Expr_EVar (dtb__241, dtb__242) -> (if (Frontend_dReserved.v_isListNilSyntax (Frontend_dRast_dName.v_rnameKey dtb__241)) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 1417 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_listLitConsTail = (fun (h : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) -> (match (v_listLitElems t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (h, dtb__243))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1424 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_findCtorByShort = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (if ((Frontend_dRast.v_ctorShortName (Elab_dTypes.v_dtCtorName dtb__244)) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__244)) else ((v_findCtorByShort mc0) dtb__245))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1430 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCtor = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (short : string) -> (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> ((v_findCtorByShort short) (Elab_dTypes.v_dtDataCtors dtb__246))
  | _ -> failwith "DT: impossible branch"
))

# 1437 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__247, dtb__248) -> ((Base_dCommon.v_bind ((((v_expandListLitGo mc0) mc1) dtb__248) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (B_dData_dList.C_List__x58__x58_ (dtb__247, (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1449 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__249, dtb__250, dtb__251) -> (match dtb__249 with
  | Frontend_dRast.C_Expr_EVar (dtb__252, dtb__253) -> (match dtb__250 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> (match dtb__255 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (match dtb__257 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isRowAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__252)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = dtb__256 })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 1454 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_appAtParts = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__258, dtb__259, dtb__260) -> (match dtb__258 with
  | Frontend_dRast.C_Expr_EVar (dtb__261, dtb__262) -> (match dtb__259 with
  | B_dData_dList.C_List__x58__x58_ (dtb__263, dtb__264) -> (match dtb__264 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (if (Frontend_dReserved.v_isAppAtSyntax (Frontend_dRast_dName.v_rnameKey dtb__261)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__266 } })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1470 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_applyExtra = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dRast.C_Expr_EApp (mc0, mc1, (Frontend_dRast.v_exprSpan mc0)))
))

# 1461 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryParts = (fun (e : Frontend_dRast.t_Expr) -> (match (v_rowAtParts e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__267) -> (B_dData_dMaybe.C_Maybe_Just (dtb__267))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut2 = (v_appAtParts e) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (match dtb__268 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (match dtb__270 with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((v_applyExtra dtb__269) dtb__272); B_dData_dPair.f_Pair_second = dtb__271 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1475 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitLabel = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> e
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (match dtb__273 with
  | { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = dtb__275 } -> dtb__274
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1481 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameArg = (fun (e : Frontend_dRast.t_Expr) -> (let nd_uscrut1 = (v_rowEntryParts e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> (match dtb__276 with
  | { B_dData_dPair.f_Pair_first = dtb__277; B_dData_dPair.f_Pair_second = dtb__278 } -> (B_dData_dMaybe.C_Maybe_Just (dtb__278))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1487 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameExpr = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (match (v_rowLitNameArg e) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> dtb__279
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dRast.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1511 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_wrapRowEntry = (fun (e : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effNamedName), sp)), (B_dData_dList.C_List__x58__x58_ (((v_rowLitNameExpr e) sp), (B_dData_dList.C_List__x58__x58_ ((v_rowLitLabel e), B_dData_dList.C_List_Nil)))), sp)))

# 1506 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsEntry = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__280, dtb__281, dtb__282) -> (match dtb__280 with
  | Frontend_dRast.C_Expr_EVar (dtb__283, dtb__284) -> (match dtb__281 with
  | B_dData_dList.C_List__x58__x58_ (dtb__285, dtb__286) -> (match dtb__286 with
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> (match dtb__288 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__283) = Base_dIntrinsics.v_effNamedName) then mc0 else ((v_wrapRowEntry mc0) mc1))
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

# 1503 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsArgs = (fun (e : Frontend_dRast.t_Expr) (t : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ (((v_rowConsEntry e) sp), (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil)))))

# 1493 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandRowListLitGo = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> ((Base_dCommon.v_bind ((((v_expandRowListLitGo mc0) mc1) dtb__290) mc3)) (fun (t : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc3)), (((v_rowConsArgs dtb__289) t) mc3), mc3))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1519 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_firstCtorOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__291, dtb__292) -> (match (((v_litFamilyCtor mc0) mc1) dtb__291) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__293) -> (B_dData_dMaybe.C_Maybe_Just (dtb__293))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstCtorOf mc0) mc1) dtb__292)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1516 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCons = (fun (ec : Elab_dTypes.t_Ec) (fam : string) -> (((v_firstCtorOf ec) fam) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", (B_dData_dList.C_List__x58__x58_ ("RCons", (B_dData_dList.C_List__x58__x58_ ("VCons", B_dData_dList.C_List_Nil))))))))))

# 1527 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandListLit = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (elems : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fam = Base_dIntrinsics.v_effRowFamilyName) then (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__294) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> ((((v_expandRowListLitGo (Elab_dTypes.v_dtCtorName dtb__294)) (Elab_dTypes.v_dtCtorName dtb__295)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_litFamilyCtor ec) fam) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__296) -> (match ((v_litFamilyCons ec) fam) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (fam))) fam)
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> ((((v_expandListLitGo (Elab_dTypes.v_dtCtorName dtb__296)) (Elab_dTypes.v_dtCtorName dtb__297)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1545 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_listLitFamily = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_expectedFamilyOf ec) expected) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> dtb__298
  | B_dData_dMaybe.C_Maybe_Nothing -> Base_dIntrinsics.v_listFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1552 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandArgListLit = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (a : Frontend_dRast.t_Expr) -> (match (v_listLitElems a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) dom))) dtb__299) (Frontend_dRast.v_exprSpan a))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1781 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitTermGo = (fun (n : int) (acc : Core_dTerm.t_Term) -> (if (n <= 0) then acc else ((v_natLitTermGo (n - 1)) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig1 }, B_dData_dList.C_List_Nil)))))))

# 1784 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitTerm = (fun (n : int) -> ((v_natLitTermGo n) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 1789 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitResult = (fun (sp : Base_dSource.t_Span) (n : int) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC ((v_natLitTerm n)))))

# 1792 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natToIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("natToInt")), t, Core_dTerm.C_Rig_Rig1)))

# 1795 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil))))

# 1798 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_natTypeName, B_dData_dList.C_List_Nil))))

# 1802 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil))))

# 1805 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isIntTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__300) -> (match dtb__300 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__301, dtb__302) -> (match dtb__302 with
  | B_dData_dList.C_List_Nil -> (dtb__301 = Base_dIntrinsics.v_intTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1811 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__303) -> (match dtb__303 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__304, dtb__305) -> (match dtb__305 with
  | B_dData_dList.C_List_Nil -> (dtb__304 = Base_dIntrinsics.v_natTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 360 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitCaseFast = (fun (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((v_isNatTy ec) scrutTy) then (v_natLitCaseAlts alts) else false) then (v_natLitCaseHasCatchAll alts) else false))

# 1818 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isFloatTy = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__306) -> (match dtb__306 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__307, dtb__308) -> (match dtb__308 with
  | B_dData_dList.C_List_Nil -> (dtb__307 = Base_dIntrinsics.v_floatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1280 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForExpected = (fun (ec : Elab_dTypes.t_Ec) (name : string) (expected : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_numMethodOpName ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__309) -> (if ((v_isIntTy ec) expected) then false else (if ((v_isNatTy ec) expected) then false else (if ((v_isFloatTy ec) expected) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VMeta (dtb__310, dtb__311) -> false
  | _ -> true
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1297 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForHint = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__312) -> (((v_skipArithSpecForExpected mc0) mc1) dtb__312)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1825 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceTerm = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (if (if ((v_isIntTy ec) expected) then ((v_isNatTy ec) actual) else false) then (B_dData_dMaybe.C_Maybe_Just ((v_natToIntTerm term))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1830 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceNatOperands = (fun (ec : Elab_dTypes.t_Ec) (aTy : Core_dTerm.t_Value) (bTy : Core_dTerm.t_Value) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) -> (if (if ((v_isNatTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else (if (if ((v_isNatTy ec) aTy) then ((v_isIntTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = bTy }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm aTerm); B_dData_dPair.f_Pair_second = bTerm } })) else (if (if ((v_isIntTy ec) aTy) then ((v_isNatTy ec) bTy) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = aTy; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = aTerm; B_dData_dPair.f_Pair_second = (v_natToIntTerm bTerm) } })) else B_dData_dMaybe.C_Maybe_Nothing))))

# 1848 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithOpNameOf = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) -> (if (mc1 = "+") then (B_dData_dMaybe.C_Maybe_Just ("+")) else (if (mc1 = "-") then (B_dData_dMaybe.C_Maybe_Just ("-")) else (if (mc1 = "*") then (B_dData_dMaybe.C_Maybe_Just ("*")) else (if (mc1 = "/") then (B_dData_dMaybe.C_Maybe_Just ("/")) else (if (Base_dSource.v_containsDot mc1) then ((Elab_dDict.v_numMethodOpName mc0) mc1) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1855 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithNatName = (fun (mc0 : string) -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1861 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (name)), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1864 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithNatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1873 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithFloatName = (fun (mc0 : string) -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1869 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatApp2 = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithFloatName name))), a, Core_dTerm.C_Rig_Rig1)), b, Core_dTerm.C_Rig_Rig1)))

# 1879 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isEIntExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EInt (dtb__313, dtb__314) -> (B_dData_dMaybe.C_Maybe_Just (dtb__313))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1988 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isSimpleComp = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EVar (dtb__315, dtb__316) -> true
  | _ -> false
))

# 2045 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_literalTraitLower = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (traitName : string) (methodName : string) (lit : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let dictDom = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName traitName), (B_dData_dList.C_List__x58__x58_ (((Elab_dTypes.v_forceVal ec) expected), B_dData_dList.C_List_Nil)))))) in (let nd_uscrut9 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) dictDom) sp) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__317) -> (match dtb__317 with
  | { B_dData_dPair.f_Pair_first = dtb__318; B_dData_dPair.f_Pair_second = dtb__319 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName methodName), sp)), (B_dData_dList.C_List__x58__x58_ (lit, B_dData_dList.C_List_Nil)), sp)); B_dData_dPair.f_Pair_second = dtb__319 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__320) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 2054 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_exprFormName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EFloat (dtb__321, dtb__322) -> "EFloat"
  | Frontend_dRast.C_Expr_EInterp (dtb__323, dtb__324) -> "EInterp"
  | Frontend_dRast.C_Expr_EAnn (dtb__325, dtb__326, dtb__327) -> "EAnn"
  | Frontend_dRast.C_Expr_EDo (dtb__328, dtb__329) -> "EDo"
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__330, dtb__331, dtb__332) -> "ERecUpdate"
  | Frontend_dRast.C_Expr_ERecord (dtb__333, dtb__334, dtb__335) -> "ERecord"
  | Frontend_dRast.C_Expr_EField (dtb__336, dtb__337, dtb__338) -> "EField"
  | Frontend_dRast.C_Expr_ELocalFun (dtb__339, dtb__340) -> "ELocalFun"
  | Frontend_dRast.C_Expr_ELet (dtb__341, dtb__342, dtb__343, dtb__344) -> "ELet"
  | Frontend_dRast.C_Expr_ECase (dtb__345, dtb__346, dtb__347) -> "ECase"
  | Frontend_dRast.C_Expr_EIf (dtb__348, dtb__349, dtb__350, dtb__351) -> "EIf"
  | Frontend_dRast.C_Expr_EPi (dtb__352, dtb__353, dtb__354, dtb__355, dtb__356, dtb__357) -> "EPi"
  | Frontend_dRast.C_Expr_EApp (dtb__358, dtb__359, dtb__360) -> "EApp"
  | Frontend_dRast.C_Expr_ELam (dtb__361, dtb__362, dtb__363) -> "ELam"
  | Frontend_dRast.C_Expr_EStr (dtb__364, dtb__365) -> "EStr"
  | Frontend_dRast.C_Expr_EInt (dtb__366, dtb__367) -> "EInt"
  | Frontend_dRast.C_Expr_EVar (dtb__368, dtb__369) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 2092 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__370) -> (match dtb__370 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__371) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__371).Elab_dTypes.f_DtCtor_dtCtorType)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__372) -> true
  | Base_dDiag.C_Check_ErrC (dtb__373) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__374) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__374)) expected) with
  | Base_dDiag.C_Check_OkC (dtb__375) -> true
  | Base_dDiag.C_Check_ErrC (dtb__376) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2128 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPiWithMetasFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec } else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381) -> (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__382; B_dData_dPair.f_Pair_second = dtb__383 } -> ((((v_stripPiWithMetasFuel (fuel - 1)) ctx) dtb__383) ((Core_dEval.v_applyClosure dtb__381) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> { B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }
)))

# 2125 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_stripPiWithMetas = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> ((((v_stripPiWithMetasFuel 64) ctx) ec) v))

# 2117 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppResultMatches = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (v : Core_dTerm.t_Value) -> (match (((v_stripPiWithMetas ctx) ec) v) with
  | { B_dData_dPair.f_Pair_first = dtb__384; B_dData_dPair.f_Pair_second = dtb__385 } -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__385)) (Elab_dTypes.v_ecSolsP dtb__385)) (Elab_dTypes.v_ctxDepth ctx)) dtb__384) expected) with
  | Base_dDiag.C_Check_OkC (dtb__386) -> true
  | Base_dDiag.C_Check_ErrC (dtb__387) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2109 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppCandidateMatches = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (target : string) -> (let nd_uscrut5 = (((Elab_dMeta.v_valueLookup globals) ec) target) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__388) -> (match dtb__388 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__389) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) (dtb__389).Elab_dTypes.f_DtCtor_dtCtorType))
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__390) -> ((((v_overValueAppResultMatches ctx) ec) expected) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__390))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2142 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueAppTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueAppCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__391, dtb__392) -> (match dtb__392 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__391))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2148 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueTarget = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (short : string) (targets : string B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut7 = ((B_dData_dList.v_filter ((((v_overValueCandidateMatches globals) ctx) ec) expected)) targets) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__393, dtb__394) -> (match dtb__394 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__393))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (short, (Frontend_dReserved.v_joinWithAt targets)))) short) (Frontend_dReserved.v_joinWithAt targets))
)))

# 2294 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_patHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__395, dtb__396, dtb__397) -> (v_anyFieldHasOverCtor dtb__396)
  | Frontend_dRast.C_Pat_PAs (dtb__398, dtb__399, dtb__400) -> (v_patHasOverCtor dtb__399)
  | Frontend_dRast.C_Pat_PCon (dtb__401, dtb__402, dtb__403) -> (if (Frontend_dReserved.v_isInternalSyntaxName (Frontend_dRast_dName.v_rnameKey dtb__401)) then true else (v_anyPatHasOverCtor dtb__402))
  | _ -> false
))
# 2302 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyPatHasOverCtor = (fun (mc0 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__404, dtb__405) -> (if (v_patHasOverCtor dtb__404) then true else (v_anyPatHasOverCtor dtb__405))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 2307 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyFieldHasOverCtor = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__406, dtb__407) -> (match dtb__406 with
  | { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } -> (if (v_patHasOverCtor dtb__409) then true else (v_anyFieldHasOverCtor dtb__407))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2312 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_clausesHaveOverCtor = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__410, dtb__411) -> (match dtb__410 with
  | { B_dData_dPair.f_Pair_first = dtb__412; B_dData_dPair.f_Pair_second = dtb__413 } -> (if (v_anyPatHasOverCtor dtb__412) then true else (v_clausesHaveOverCtor dtb__411))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2317 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandLocalFuns = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EAnn (dtb__414, dtb__415, dtb__416) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__414)) (fun (value2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EAnn (value2, dtb__415, dtb__416))))))
  | Frontend_dRast.C_Expr_EDo (dtb__417, dtb__418) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandDoStmt mc0)) dtb__417)) (fun (stmts2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EDo (stmts2, dtb__418))))))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__419, dtb__420, dtb__421) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__419)) (fun (base2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__420)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecUpdate (base2, fields2, dtb__421))))))))
  | Frontend_dRast.C_Expr_ERecord (dtb__422, dtb__423, dtb__424) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (fv : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) (B_dData_dPair.v_secondOf fv))) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf fv); B_dData_dPair.f_Pair_second = v2 })))))) dtb__423)) (fun (fields2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecord (dtb__422, fields2, dtb__424))))))
  | Frontend_dRast.C_Expr_EField (dtb__425, dtb__426, dtb__427) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__425)) (fun (base2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EField (base2, dtb__426, dtb__427))))))
  | Frontend_dRast.C_Expr_EIf (dtb__428, dtb__429, dtb__430, dtb__431) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__428)) (fun (c2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__429)) (fun (t2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__430)) (fun (el2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EIf (c2, t2, el2, dtb__431))))))))))
  | Frontend_dRast.C_Expr_ECase (dtb__432, dtb__433, dtb__434) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__432)) (fun (scrut2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__433)) (fun (alts2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase (scrut2, alts2, dtb__434))))))))
  | Frontend_dRast.C_Expr_ELet (dtb__435, dtb__436, dtb__437, dtb__438) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__435)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__436)) (fun (body2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELet (binds2, body2, dtb__437, dtb__438))))))))
  | Frontend_dRast.C_Expr_EPi (dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__442)) (fun (dom2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__443)) (fun (cod2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EPi (dtb__439, dtb__440, dtb__441, dom2, cod2, dtb__444))))))))
  | Frontend_dRast.C_Expr_EApp (dtb__445, dtb__446, dtb__447) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__445)) (fun (fn2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandLocalFuns mc0)) dtb__446)) (fun (args2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (fn2, args2, dtb__447))))))))
  | Frontend_dRast.C_Expr_ELam (dtb__448, dtb__449, dtb__450) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__449)) (fun (b2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELam (dtb__448, b2, dtb__450))))))
  | Frontend_dRast.C_Expr_EFloat (dtb__451, dtb__452) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EFloat (dtb__451, dtb__452))))
  | Frontend_dRast.C_Expr_EStr (dtb__453, dtb__454) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EStr (dtb__453, dtb__454))))
  | Frontend_dRast.C_Expr_EInt (dtb__455, dtb__456) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EInt (dtb__455, dtb__456))))
  | Frontend_dRast.C_Expr_EVar (dtb__457, dtb__458) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EVar (dtb__457, dtb__458))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__459, dtb__460) -> (if (v_clausesHaveOverCtor dtb__459) then (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELocalFun (dtb__459, dtb__460)))) else ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable mc0)) dtb__459))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))
# 2367 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBind = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__461; B_dData_dPair.f_Pair_second = dtb__462 } -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__462)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__461; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 2371 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandDoStmt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_DoStmt) -> (match mc1 with
  | Frontend_dRast.C_DoStmt_DLet (dtb__463, dtb__464) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind mc0)) dtb__463)) (fun (b2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DLet (b2, dtb__464))))))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__465, dtb__466) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__465)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DExpr (v2, dtb__466))))))
  | Frontend_dRast.C_DoStmt_DBind (dtb__467, dtb__468, dtb__469) -> ((Base_dCommon.v_bind ((v_expandLocalFuns mc0) dtb__468)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DBind (dtb__467, v2, dtb__469))))))
  | _ -> failwith "DT: impossible branch"
))

# 2507 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPisWithMetas = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__470, dtb__471, dtb__472, dtb__473, dtb__474) -> (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__475; B_dData_dPair.f_Pair_second = dtb__476 } -> ((((v_stripPisWithMetas (fuel - 1)) ctx) dtb__476) ((Core_dEval.v_applyClosure dtb__474) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__475)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = ec }))
)))

# 2522 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isMetaHeadedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VMeta (dtb__477, dtb__478) -> true
  | _ -> false
))

# 2529 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isRigidHeadValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VCon (dtb__479, dtb__480) -> true
  | Core_dTerm.C_Value_VNeutral (dtb__481) -> (match dtb__481 with
  | Core_dTerm.C_Neutral_NVar (dtb__482, dtb__483, dtb__484) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb__485, dtb__486) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2540 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_remainingExplicitPis = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then 0 else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__487, dtb__488, dtb__489, dtb__490, dtb__491) -> (let v2 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__487, (Elab_dTypes.v_ctxDepth ctx), B_dData_dList.C_List_Nil)))) in (let rest = ((((v_remainingExplicitPis (fuel - 1)) ctx) ec) ((Core_dEval.v_applyClosure dtb__491) v2)) in (if dtb__488 then rest else (rest + 1))))
  | _ -> 0
)))

# 2558 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryUseHint = (fun (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) (piTy : Core_dTerm.t_Value) -> (let nd_uscrut4 = ((((v_stripPisWithMetas 64) ctx) ec) piTy) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__492) -> (match dtb__492 with
  | { B_dData_dPair.f_Pair_first = dtb__493; B_dData_dPair.f_Pair_second = dtb__494 } -> (let forcedRes = ((Elab_dTypes.v_forceVal dtb__494) dtb__493) in (if ((v_isMetaHeadedValue dtb__494) forcedRes) then (if ((v_isRigidHeadValue dtb__494) expected) then (match ((((Elab_dMeta.v_convEc dtb__494) (Elab_dTypes.v_ctxDepth ctx)) expected) forcedRes) with
  | Base_dDiag.C_Check_ErrC (dtb__495) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__496) -> (B_dData_dMaybe.C_Maybe_Just (dtb__496))
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__497) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 2605 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowAndResult = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__498) -> (match dtb__498 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__499, dtb__500) -> (match dtb__500 with
  | B_dData_dList.C_List__x58__x58_ (dtb__501, dtb__502) -> (match dtb__502 with
  | B_dData_dList.C_List__x58__x58_ (dtb__503, dtb__504) -> (if (dtb__499 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__503 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2611 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowOfValue = (fun (v : Core_dTerm.t_Value) -> (match (v_effRowAndResult v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb__505)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2618 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNilRowValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VCon (dtb__506, dtb__507) -> (dtb__506 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 2625 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryLabelTail = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__508, dtb__509) -> (if (dtb__508 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__509 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__510, dtb__511) -> (match dtb__511 with
  | B_dData_dList.C_List__x58__x58_ (dtb__512, dtb__513) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__510; B_dData_dPair.f_Pair_second = dtb__512 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2636 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_shortGlobalName = (fun (g : string) -> (Base_dSource.v_lastSeg g))

# 2646 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_labelHeadArgs = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__514, dtb__515) -> ((v_labelHeadArgs (String.concat "" [mc0; " "; ((Core_dEval.v_showValueAt 6) dtb__514)])) dtb__515)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 2640 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLabelText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__516) -> (match dtb__516 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__517, dtb__518) -> ((v_labelHeadArgs (v_shortGlobalName dtb__517)) dtb__518)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 2651 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__519) -> dtb__519
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 2658 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryText = (fun (ec : Elab_dTypes.t_Ec) (n : Core_dTerm.t_Value) (h : Core_dTerm.t_Value) -> (if (((v_rowNameText ec) n) = "default") then ((v_rowLabelText ec) h) else (String.concat "" [((v_rowLabelText ec) h); "@"; ((v_rowNameText ec) n)])))

# 2666 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_namedLabelParts = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__520) -> (match dtb__520 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__521, dtb__522) -> (if (dtb__521 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut6 = dtb__522 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__523, dtb__524) -> (match dtb__524 with
  | B_dData_dList.C_List__x58__x58_ (dtb__525, dtb__526) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__523; B_dData_dPair.f_Pair_second = dtb__525 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryTextOf = (fun (ec : Elab_dTypes.t_Ec) (label : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_namedLabelParts ec) label) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_rowLabelText ec) label)
  | B_dData_dMaybe.C_Maybe_Just (dtb__527) -> (match dtb__527 with
  | { B_dData_dPair.f_Pair_first = dtb__528; B_dData_dPair.f_Pair_second = dtb__529 } -> (((v_rowEntryText ec) dtb__528) dtb__529)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2685 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowEffectLabels = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__530, dtb__531) -> (if (dtb__530 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (dtb__530 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__530, dtb__531))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__532) -> (match dtb__532 with
  | { B_dData_dPair.f_Pair_first = dtb__533; B_dData_dPair.f_Pair_second = dtb__534 } -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) dtb__533) then B_dData_dMaybe.C_Maybe_Nothing else (match (((v_rowEffectLabels (fuel - 1)) ec) dtb__534) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__535) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (((v_rowEntryTextOf ec) dtb__533), dtb__535))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2711 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowNonDefaultHostEntries = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (row : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match ((Elab_dTypes.v_forceVal ec) row) with
  | Core_dTerm.C_Value_VCon (dtb__536, dtb__537) -> (if (dtb__536 = Base_dIntrinsics.v_effRowNilCtor) then B_dData_dList.C_List_Nil else (if (dtb__536 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut5 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__536, dtb__537))) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__538) -> (match dtb__538 with
  | { B_dData_dPair.f_Pair_first = dtb__539; B_dData_dPair.f_Pair_second = dtb__540 } -> (let rest = (((v_rowNonDefaultHostEntries (fuel - 1)) ec) dtb__540) in (let nd_uscrut13 = ((v_namedLabelParts ec) dtb__539) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> rest
  | B_dData_dMaybe.C_Maybe_Just (dtb__541) -> (match dtb__541 with
  | { B_dData_dPair.f_Pair_first = dtb__542; B_dData_dPair.f_Pair_second = dtb__543 } -> (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) dtb__543) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VNeutral (dtb__544) -> (match dtb__544 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__545, dtb__546) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb__545) then (if (((v_rowNameText ec) dtb__542) = "default") then rest else (B_dData_dList.C_List__x58__x58_ ((((v_rowEntryText ec) dtb__542) dtb__543), rest))) else rest)
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

# 2737 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_joinEffectLabels = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__547, dtb__548) -> (match dtb__548 with
  | B_dData_dList.C_List_Nil -> dtb__547
  | _ -> (String.concat "" [dtb__547; ", "; (v_joinEffectLabels dtb__548)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2745 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_unhandledEffectLabel = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) -> (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__549) -> (if ((v_isNilRowValue ec) dtb__549) then (match (v_effRowOfValue ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__550) -> (match (((v_rowEffectLabels 64) ec) dtb__550) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__551) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__551) B_dData_dList.C_List_Nil) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__551)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2767 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_sameLabelValue = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let defs = (Elab_dTypes.v_ecDefTbl ec) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let fa = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) a) in (let fb = ((((Core_dEval.v_forceLabelArgs defs) sols) Core_dTerm.v_defaultFuel) b) in (let nd_uscrut7 = (((Core_dEval.v_valueEqFuel Core_dTerm.v_defaultFuel) fa) fb) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__552) -> (if dtb__552 then true else false)
  | _ -> false
)))))))

# 2778 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowContainsValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (expected : Core_dTerm.t_Value) (label : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VCon (dtb__553, dtb__554) -> (if (dtb__553 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__553, dtb__554))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__555) -> (match dtb__555 with
  | { B_dData_dPair.f_Pair_first = dtb__556; B_dData_dPair.f_Pair_second = dtb__557 } -> (if (((v_sameLabelValue ec) label) dtb__556) then true else ((((v_rowContainsValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__557)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
)))

# 2793 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowSubValue = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (actual : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) actual) with
  | Core_dTerm.C_Value_VCon (dtb__558, dtb__559) -> (if (dtb__558 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__558 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut6 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb__558, dtb__559))) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__560) -> (match dtb__560 with
  | { B_dData_dPair.f_Pair_first = dtb__561; B_dData_dPair.f_Pair_second = dtb__562 } -> (if ((((v_rowContainsValue ec) (fuel - 1)) expected) dtb__561) then ((((v_rowSubValue ec) (fuel - 1)) ((Elab_dTypes.v_forceVal ec) dtb__562)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)))

# 2857 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_weakenLabelTerm = (fun (d : int) (label : Core_dTerm.t_Value) (tailF : Core_dTerm.t_Value) (result : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.weaken")), ((Core_dEval.v_quote d) label), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) tailF), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) result), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)))

# 2813 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryEffLift = (fun (ctx : Elab_dTypes.t_Ctx) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) (actual : Core_dTerm.t_Value) (term : Core_dTerm.t_Term) -> (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.weaken") globals) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__563) -> (let d = (Elab_dTypes.v_ctxDepth ctx) in (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) expected)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__564) -> (let nd_uscrut11 = (v_rowEntryLabelTail ((Elab_dTypes.v_forceVal ec) (B_dData_dPair.v_firstOf dtb__564))) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__565) -> (match dtb__565 with
  | { B_dData_dPair.f_Pair_first = dtb__566; B_dData_dPair.f_Pair_second = dtb__567 } -> (let tailF = ((Elab_dTypes.v_forceVal ec) dtb__567) in (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) tailF) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_effRowAndResult ((Elab_dTypes.v_forceVal ec) actual)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__568) -> (match ((((Elab_dMeta.v_convEc ec) d) (B_dData_dPair.v_secondOf dtb__564)) (B_dData_dPair.v_secondOf dtb__568)) with
  | Base_dDiag.C_Check_ErrC (dtb__569) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__570) -> (let actualRow = (B_dData_dPair.v_firstOf dtb__568) in (if ((((v_rowSubValue dtb__570) 64) actualRow) (B_dData_dPair.v_firstOf dtb__564)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = term; B_dData_dPair.f_Pair_second = dtb__570 })) else (if ((v_isNilRowValue dtb__570) actualRow) then (match (((Elab_dMeta.v_globalsLookup "Base.Effect.Core.raise") globals) dtb__570) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__571) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Base.Effect.Core.raise")), ((Core_dEval.v_quote d) (B_dData_dPair.v_firstOf dtb__564)), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote d) (B_dData_dPair.v_secondOf dtb__564)), Core_dTerm.C_Rig_Rig0)), term, Core_dTerm.C_Rig_RigOmega)); B_dData_dPair.f_Pair_second = dtb__570 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Elab_dMeta.v_convEc dtb__570) d) actualRow) tailF) with
  | Base_dDiag.C_Check_ErrC (dtb__572) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__573) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((((v_weakenLabelTerm d) dtb__566) tailF) (B_dData_dPair.v_secondOf dtb__564)) term); B_dData_dPair.f_Pair_second = dtb__573 }))
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

# 2961 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeHeadTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__574) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__574) then (Core_dTerm.C_Term_TRecord (name, B_dData_dList.C_List_Nil)) else (Core_dTerm.C_Term_TGlobal (name)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2968 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeAppTerm = (fun (ec : Elab_dTypes.t_Ec) (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtDataLookup name) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__575) -> (if (Elab_dTypes.v_dtDataIsRecord dtb__575) then (Core_dTerm.C_Term_TRecord (name, args)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 3244 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromIntTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromInt")), t, Core_dTerm.C_Rig_Rig1)))

# 3248 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromFloatTerm = (fun (t : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromFloat")), t, Core_dTerm.C_Rig_Rig1)))

# 3251 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil))))

# 3254 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isStringTyValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__576) -> (match dtb__576 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__577, dtb__578) -> (match dtb__578 with
  | B_dData_dList.C_List_Nil -> (dtb__577 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 3336 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorSpineOfType = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__579) -> { B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb__580, dtb__581) -> { B_dData_dPair.f_Pair_first = dtb__580; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__581) }
  | Core_dTerm.C_Term_TApp (dtb__582, dtb__583, dtb__584) -> (match (v_ctorSpineOfType dtb__582) with
  | { B_dData_dPair.f_Pair_first = dtb__585; B_dData_dPair.f_Pair_second = dtb__586 } -> { B_dData_dPair.f_Pair_first = dtb__585; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__586) (B_dData_dList.C_List__x58__x58_ (dtb__583, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 3332 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorResultArgs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__587, dtb__588, dtb__589, dtb__590, dtb__591) -> (v_ctorResultArgs dtb__591)
  | _ -> (B_dData_dPair.v_secondOf (v_ctorSpineOfType mc0))
))

# 3344 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_dropPis = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__592, dtb__593, dtb__594, dtb__595, dtb__596) -> (v_dropPis dtb__596)
  | _ -> mc0
))

# 3348 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_identityArgs = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__597, dtb__598) -> (match dtb__597 with
  | Core_dTerm.C_Term_TVar (dtb__599, dtb__600, dtb__601) -> (if (dtb__600 = ((mc1 - 1) - mc0)) then (((v_identityArgs (mc0 + 1)) mc1) dtb__598) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 3358 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorIdentitySpine = (fun (fam : string) (ctor : Elab_dTypes.t_DtCtor) -> (let k = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope ctor)) in (let args = (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor)) in (match (v_ctorSpineOfType (v_dropPis (Elab_dTypes.v_dtCtorType ctor))) with
  | { B_dData_dPair.f_Pair_first = dtb__602; B_dData_dPair.f_Pair_second = dtb__603 } -> (if (dtb__602 = fam) then (if ((B_dData_dList.v_length args) > 0) then (if ((B_dData_dList.v_length args) <= k) then (((v_identityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
))))

# 3374 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_takeRigsGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__604, dtb__605) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__604), ((v_takeRigsGo (mc0 - 1)) dtb__605))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 3371 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_takeRigs = (fun (n : int) (bs : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_takeRigsGo n) bs))

# 3392 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorFamilyArgsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) (mc3 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc4 : int) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__606, dtb__607) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__608, dtb__609) -> (match ((Elab_dTypes.v_forceVal mc0) mc1) with
  | Core_dTerm.C_Value_VPi (dtb__610, dtb__611, dtb__612, dtb__613, dtb__614) -> (if dtb__611 then ((((((v_ctorFamilyArgsGo mc0) ((Core_dEval.v_applyClosure dtb__614) dtb__606)) dtb__607) dtb__609) mc4) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote mc4) dtb__606); B_dData_dPair.f_Pair_second = dtb__608 }, mc5))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc5); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 3378 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFamilyArgs = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ctor : Elab_dTypes.t_DtCtor) (expected : Core_dTerm.t_Value) -> (let fam = (Elab_dTypes.v_dtCtorFamily ctor) in (if ((v_ctorIdentitySpine fam) ctor) then (let nd_uscrut5 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__615) -> (match dtb__615 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__616, dtb__617) -> (let arity = (B_dData_dList.v_length (v_ctorResultArgs (Elab_dTypes.v_dtCtorType ctor))) in (if (dtb__616 = fam) then (if ((B_dData_dList.v_length dtb__617) = arity) then ((((((v_ctorFamilyArgsGo ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType ctor))) dtb__617) ((v_takeRigs arity) (Elab_dTypes.v_dtCtorTelescope ctor))) (Elab_dTypes.v_ctxDepth ctx)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 3414 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natPatGo = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n <= 0) then (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natZeroCtor), B_dData_dList.C_List_Nil, sp)) else (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_natSuccCtor), (B_dData_dList.C_List__x58__x58_ (((v_natPatGo (n - 1)) sp), B_dData_dList.C_List_Nil)), sp))))

# 3410 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natPatOf = (fun (n : int) (sp : Base_dSource.t_Span) -> (if (n < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC (((v_natPatGo n) sp)))))

# 3422 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat) -> (let dtnat__618 = mc0 in (if (dtnat__618 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__619 = (dtnat__618 - 1) in (match mc4 with
  | Frontend_dRast.C_Pat_PCon (dtb__620, dtb__621, dtb__622) -> (if (Frontend_dReserved.v_isListNilSyntax (Frontend_dRast_dName.v_rnameKey dtb__620)) then (match (((v_litFamilyCtor mc1) ((v_listLitFamily mc1) mc3)) "Nil") with
  | B_dData_dMaybe.C_Maybe_Just (dtb__623) -> (((((((v_resolveCtorPatFuel dtb__619) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__623)) dtb__621) dtb__622)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__621, dtb__622)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isListConsSyntax (Frontend_dRast_dName.v_rnameKey dtb__620)) then (match ((v_litFamilyCons mc1) ((v_listLitFamily mc1) mc3)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__624) -> (((((((v_resolveCtorPatFuel dtb__619) mc1) mc2) mc3) (Elab_dTypes.v_dtCtorName dtb__624)) dtb__621) dtb__622)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName "__list_literal__"), dtb__621, dtb__622)); B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__620)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor mc1) dtb__622) (B_dData_dMaybe.C_Maybe_Just (mc3))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__620))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__620)))) (fun (target : string) -> (((((((v_resolveCtorPatFuel dtb__619) mc1) mc2) mc3) target) dtb__621) dtb__622))) else (((((((v_resolveCtorPatFuel dtb__619) mc1) mc2) mc3) (Frontend_dRast_dName.v_rnameKey dtb__620)) dtb__621) dtb__622))))
  | Frontend_dRast.C_Pat_PInt (dtb__625, dtb__626) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__625) dtb__626)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | Frontend_dRast.C_Pat_PAs (dtb__627, dtb__628, dtb__629) -> (match dtb__628 with
  | Frontend_dRast.C_Pat_PInt (dtb__630, dtb__631) -> (if ((v_isNatTy mc1) mc3) then ((Base_dCommon.v_bind ((v_natPatOf dtb__630) dtb__631)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PAs (dtb__627, p, dtb__629)); B_dData_dPair.f_Pair_second = mc1 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | Frontend_dRast.C_Pat_PRecord (dtb__632, dtb__633, dtb__634) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)))))
# 3453 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolveCtorPatFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : string) (mc5 : Frontend_dRast.t_Pat B_dData_dList.t_List) (mc6 : Base_dSource.t_Span) -> (let dtnat__635 = mc0 in (if (dtnat__635 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__636 = (dtnat__635 - 1) in (match ((Elab_dMeta.v_dtCtorLookupEc mc1) mc4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), mc5, mc6)); B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__637) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs mc1) mc2) dtb__637) mc3) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__638) -> (match dtb__638 with
  | { B_dData_dPair.f_Pair_first = dtb__639; B_dData_dPair.f_Pair_second = dtb__640 } -> (match dtb__640 with
  | { B_dData_dPair.f_Pair_first = dtb__641; B_dData_dPair.f_Pair_second = dtb__642 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__636) dtb__642) mc2) dtb__641) mc5)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__643; B_dData_dPair.f_Pair_second = dtb__644 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName mc4), dtb__643, mc6)); B_dData_dPair.f_Pair_second = dtb__644 }))
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
# 3469 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolvePatArgsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__645 = mc0 in (if (dtnat__645 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__646 = (dtnat__645 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__647, dtb__648) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__649, dtb__650, dtb__651, dtb__652, dtb__653) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__649, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__649) dtb__652) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__653) v) in (if dtb__650 then (((((v_resolvePatArgsFuel dtb__646) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__647, dtb__648))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__646) mc1) mc2) dtb__652) dtb__647)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__654; B_dData_dPair.f_Pair_second = dtb__655 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb__646) dtb__655) ctx2) ty2) dtb__648)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__656; B_dData_dPair.f_Pair_second = dtb__657 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__654, dtb__656)); B_dData_dPair.f_Pair_second = dtb__657 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3501 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverAltsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__658 = mc0 in (if (dtnat__658 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__659 = (dtnat__658 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__660, dtb__661) -> (match dtb__660 with
  | { B_dData_dPair.f_Pair_first = dtb__662; B_dData_dPair.f_Pair_second = dtb__663 } -> ((Base_dCommon.v_bind (((((v_resolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__662)) (fun (p : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__664; B_dData_dPair.f_Pair_second = dtb__665 } -> ((Base_dCommon.v_bind (((((v_resolveOverAltsGo dtb__659) dtb__665) mc2) mc3) dtb__661)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__666; B_dData_dPair.f_Pair_second = dtb__667 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__664; B_dData_dPair.f_Pair_second = dtb__663 }, dtb__666)); B_dData_dPair.f_Pair_second = dtb__667 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3497 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverAlts = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (ty : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 3543 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveClausePatsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (let dtnat__668 = mc0 in (if (dtnat__668 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__669 = (dtnat__668 - 1) in (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__670, dtb__671) -> (match ((Elab_dTypes.v_forceVal mc1) mc3) with
  | Core_dTerm.C_Value_VPi (dtb__672, dtb__673, dtb__674, dtb__675, dtb__676) -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__672, (Elab_dTypes.v_ctxDepth mc2), B_dData_dList.C_List_Nil)))) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__672) dtb__675) mc2) in (let ty2 = ((Core_dEval.v_applyClosure dtb__676) v) in (if dtb__673 then (((((v_resolveClausePatsFuel dtb__669) mc1) ctx2) ty2) (B_dData_dList.C_List__x58__x58_ (dtb__670, dtb__671))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb__669) mc1) mc2) dtb__675) dtb__670)) (fun (q : (Frontend_dRast.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__677; B_dData_dPair.f_Pair_second = dtb__678 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel dtb__669) dtb__678) ctx2) ty2) dtb__671)) (fun (r : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__679; B_dData_dPair.f_Pair_second = dtb__680 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__677, dtb__679)); B_dData_dPair.f_Pair_second = dtb__680 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3525 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverFunPatsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Core_dTerm.t_Value) (mc4 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__681 = mc0 in (if (dtnat__681 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb__682 = (dtnat__681 - 1) in (let nd_uscrut6 = mc4 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__683, dtb__684) -> (match dtb__683 with
  | { B_dData_dPair.f_Pair_first = dtb__685; B_dData_dPair.f_Pair_second = dtb__686 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__685)) (fun (q : (Frontend_dRast.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__687; B_dData_dPair.f_Pair_second = dtb__688 } -> ((Base_dCommon.v_bind (((((v_resolveOverFunPatsGo dtb__682) dtb__688) mc2) mc3) dtb__684)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__689; B_dData_dPair.f_Pair_second = dtb__690 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__687; B_dData_dPair.f_Pair_second = dtb__686 }, dtb__689)); B_dData_dPair.f_Pair_second = dtb__690 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3520 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverFunPats = (fun (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (expected : Core_dTerm.t_Value) (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 3624 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doMarkerHead = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__691, dtb__692, dtb__693) -> (match dtb__691 with
  | Frontend_dRast.C_Expr_EVar (dtb__694, dtb__695) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__694)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__696) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 3647 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_decodeDoChain = (fun (fuel : int) (canonical : string) (acc : t_DoChainStep B_dData_dList.t_List) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = expr in (match nd_uscrut4 with
  | Frontend_dRast.C_Expr_EApp (dtb__697, dtb__698, dtb__699) -> (match dtb__697 with
  | Frontend_dRast.C_Expr_EVar (dtb__700, dtb__701) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__700)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = expr }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__702) -> (if (canonical <> dtb__702) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut12 = dtb__698 in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__703, dtb__704) -> (match dtb__704 with
  | B_dData_dList.C_List__x58__x58_ (dtb__705, dtb__706) -> (match dtb__705 with
  | Frontend_dRast.C_Expr_ELam (dtb__707, dtb__708, dtb__709) -> (match dtb__707 with
  | B_dData_dList.C_List__x58__x58_ (dtb__710, dtb__711) -> (match dtb__710 with
  | { B_dData_dPair.f_Pair_first = dtb__712; B_dData_dPair.f_Pair_second = dtb__713 } -> (match dtb__711 with
  | B_dData_dList.C_List_Nil -> (match dtb__706 with
  | B_dData_dList.C_List_Nil -> ((((v_decodeDoChain (fuel - 1)) dtb__702) (B_dData_dList.C_List__x58__x58_ ((C_DoChainStep_DoChainStep (dtb__712, dtb__703, dtb__701, dtb__713)), acc))) dtb__708)
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

# 3666 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_decodeDoBlock = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__714, dtb__715, dtb__716) -> (match dtb__714 with
  | Frontend_dRast.C_Expr_EVar (dtb__717, dtb__718) -> (match (Frontend_dReserved.v_doSyntaxCanonical (Frontend_dRast_dName.v_rnameKey dtb__717)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__719) -> (let nd_uscrut8 = ((((v_decodeDoChain 4096) dtb__719) B_dData_dList.C_List_Nil) mc0) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__720) -> (match dtb__720 with
  | { B_dData_dPair.f_Pair_first = dtb__721; B_dData_dPair.f_Pair_second = dtb__722 } -> (B_dData_dMaybe.C_Maybe_Just ({ f_DoChain_doChainCanonical = dtb__719; f_DoChain_doChainSteps = dtb__721; f_DoChain_doChainLast = dtb__722; f_DoChain_doChainSpan = dtb__718 }))
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

# 3678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_doChainBuild = (fun (mc0 : string) (mc1 : t_DoChainStep B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__723, dtb__724) -> (match dtb__723 with
  | C_DoChainStep_DoChainStep (dtb__725, dtb__726, dtb__727, dtb__728) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), dtb__727)), (B_dData_dList.C_List__x58__x58_ (dtb__726, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__725; B_dData_dPair.f_Pair_second = dtb__728 }, B_dData_dList.C_List_Nil)), ((((v_doChainBuild mc0) dtb__724) mc2) mc3), dtb__727)), B_dData_dList.C_List_Nil)))), dtb__727))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 3687 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainFallback = (fun (chain : t_DoChain) -> ((((v_doChainBuild (chain).f_DoChain_doChainCanonical) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast) (chain).f_DoChain_doChainSpan))

# 3694 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_splitDoSpine = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__729, dtb__730) -> (match ((v_splitDoSpine ((Core_dEval.v_applyValue mc0) dtb__729)) dtb__730) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__729 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb__731) -> (B_dData_dMaybe.C_Maybe_Just (dtb__731))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 3702 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_splitDoExpected = (fun (ec : Elab_dTypes.t_Ec) (expected : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VNeutral (dtb__732) -> (match dtb__732 with
  | Core_dTerm.C_Neutral_NVar (dtb__733, dtb__734, dtb__735) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__733, dtb__734, B_dData_dList.C_List_Nil))))) dtb__735)
  | Core_dTerm.C_Neutral_NGlobal (dtb__736, dtb__737) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__736, B_dData_dList.C_List_Nil))))) dtb__737)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3720 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindShapeOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__738, dtb__739, dtb__740, dtb__741, dtb__742) -> (if dtb__739 then (match dtb__742 with
  | Core_dTerm.C_Term_TPi (dtb__743, dtb__744, dtb__745, dtb__746, dtb__747) -> (if dtb__744 then (match dtb__746 with
  | Core_dTerm.C_Term_TApp (dtb__748, dtb__749, dtb__750) -> (match dtb__748 with
  | Core_dTerm.C_Term_TGlobal (dtb__751) -> (match dtb__749 with
  | Core_dTerm.C_Term_TVar (dtb__752, dtb__753, dtb__754) -> (match dtb__747 with
  | Core_dTerm.C_Term_TPi (dtb__755, dtb__756, dtb__757, dtb__758, dtb__759) -> (if dtb__756 then (match dtb__759 with
  | Core_dTerm.C_Term_TPi (dtb__760, dtb__761, dtb__762, dtb__763, dtb__764) -> (if dtb__761 then (match dtb__764 with
  | Core_dTerm.C_Term_TPi (dtb__765, dtb__766, dtb__767, dtb__768, dtb__769) -> (if dtb__766 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__768 with
  | Core_dTerm.C_Term_TApp (dtb__770, dtb__771, dtb__772) -> (match dtb__770 with
  | Core_dTerm.C_Term_TVar (dtb__773, dtb__774, dtb__775) -> (match dtb__771 with
  | Core_dTerm.C_Term_TVar (dtb__776, dtb__777, dtb__778) -> (match dtb__769 with
  | Core_dTerm.C_Term_TPi (dtb__779, dtb__780, dtb__781, dtb__782, dtb__783) -> (if dtb__780 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__782 with
  | Core_dTerm.C_Term_TPi (dtb__784, dtb__785, dtb__786, dtb__787, dtb__788) -> (if dtb__785 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__787 with
  | Core_dTerm.C_Term_TVar (dtb__789, dtb__790, dtb__791) -> (match dtb__788 with
  | Core_dTerm.C_Term_TApp (dtb__792, dtb__793, dtb__794) -> (match dtb__792 with
  | Core_dTerm.C_Term_TVar (dtb__795, dtb__796, dtb__797) -> (match dtb__793 with
  | Core_dTerm.C_Term_TVar (dtb__798, dtb__799, dtb__800) -> (match dtb__783 with
  | Core_dTerm.C_Term_TApp (dtb__801, dtb__802, dtb__803) -> (match dtb__801 with
  | Core_dTerm.C_Term_TVar (dtb__804, dtb__805, dtb__806) -> (match dtb__802 with
  | Core_dTerm.C_Term_TVar (dtb__807, dtb__808, dtb__809) -> (if (if (if (if (dtb__753 = 0) then (dtb__774 = 3) else false) then (dtb__796 = 5) else false) then (dtb__805 = 5) else false) then (if (if (if (if (dtb__777 = 1) then (dtb__790 = 2) else false) then (dtb__799 = 2) else false) then (dtb__808 = 2) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__767, dtb__781, dtb__786)))) else (if (if (if (if (dtb__777 = 0) then (dtb__790 = 1) else false) then (dtb__799 = 3) else false) then (dtb__808 = 3) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb__767, dtb__781, dtb__786)))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 3735 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindHeadOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (match ((Elab_dTypes.v_ctxLookup bindName) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__810) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup bindName) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__811) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (bindName)); B_dData_dPair.f_Pair_second = dtb__811 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 3746 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBlockShapeOf = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindName : string) -> (let nd_uscrut4 = ((((v_doBindHeadOf globals) ctx) ec) bindName) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__812) -> (match dtb__812 with
  | { B_dData_dPair.f_Pair_first = dtb__813; B_dData_dPair.f_Pair_second = dtb__814 } -> (match (v_bindShapeOf dtb__814) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__815) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__813; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__814; B_dData_dPair.f_Pair_second = dtb__815 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 3758 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictDefer = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__816; B_dData_dPair.f_Pair_second = dtb__817 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__816; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__817) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__817) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)))

# 3767 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictStep = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dom) then ((((v_doDictDefer ctx) ec) dom) sp) else (let nd_uscrut6 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec) ((Elab_dTypes.v_forceVal ec) dom)) sp) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_ErrC (dtb__818) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec)) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (if ((Elab_dDict.v_isRigidDictArg ec) ((Elab_dTypes.v_forceVal ec) dom)) then ((((v_doDictDefer ctx) ec) dom) sp) else (Base_dDiag.C_Check_ErrC (dtb__818))))
  | Base_dDiag.C_Check_OkC (dtb__819) -> (match dtb__819 with
  | { B_dData_dPair.f_Pair_first = dtb__820; B_dData_dPair.f_Pair_second = dtb__821 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__820; B_dData_dPair.f_Pair_second = dtb__821 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3795 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDoBlock = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (bindName : string) (headTerm : Core_dTerm.t_Term) (bindTyTerm : Core_dTerm.t_Term) (shape : t_DoBindShape) (mVal : Core_dTerm.t_Value) (aVal : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match shape with
  | C_DoBindShape_DoBindShape (dtb__822, dtb__823, dtb__824) -> (let nd_uscrut14 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) bindTyTerm)) in (match nd_uscrut14 with
  | Core_dTerm.C_Value_VPi (dtb__825, dtb__826, dtb__827, dtb__828, dtb__829) -> (if dtb__826 then (let nd_uscrut20 = ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_applyClosure dtb__829) mVal)) in (match nd_uscrut20 with
  | Core_dTerm.C_Value_VPi (dtb__830, dtb__831, dtb__832, dtb__833, dtb__834) -> (if dtb__831 then (if ((Elab_dDict.v_isDictDomain ec) dtb__833) then ((Base_dCommon.v_bind ((((((v_doDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__833)) (fun (dp : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dp with
  | { B_dData_dPair.f_Pair_first = dtb__835; B_dData_dPair.f_Pair_second = dtb__836 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ f_DoPlan_planBind = bindName; f_DoPlan_planHead = headTerm; f_DoPlan_planMTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) mVal); f_DoPlan_planMVal = mVal; f_DoPlan_planAVal = aVal; f_DoPlan_planDictTerm = dtb__835; f_DoPlan_planRigE = dtb__822; f_DoPlan_planRigL = dtb__823; f_DoPlan_planInnerRig = dtb__824; f_DoPlan_planEc = dtb__836 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))
  | _ -> failwith "DT: impossible branch"
)))

# 3822 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindAppTerm = (fun (ecLinear : Elab_dTypes.t_Ec) (ecPaper : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (sp : Base_dSource.t_Span) (binderSp : Base_dSource.t_Span) (plan : t_DoPlan) (binder : string) (aVal : Core_dTerm.t_Value) (eTerm : Core_dTerm.t_Term) (argRig : Core_dTerm.t_Rig) (lamRig : Core_dTerm.t_Rig) (inner : Core_dTerm.t_Term) -> (let depth = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue binder) aVal) ctx) in (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) inner) else inner) in (let slot0 = ((Core_dTerm.v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) (B_dData_dMaybe.C_Maybe_Just ((((Core_dTerm.v_shift 0) 1) ((Core_dEval.v_quote depth) ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) (plan).f_DoPlan_planAVal)))))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear ecLinear) ctx) then (if (((Elab_dMeta.v_termHasOuterLinear ecLinear) ctx2) inner) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (let lamTerm = (Core_dTerm.C_Term_TLam (binder, lamRig, slot, binderSp, inner2)) in (let args = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planMTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (plan).f_DoPlan_planDictTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) aVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote depth) (plan).f_DoPlan_planAVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = eTerm; B_dData_dPair.f_Pair_second = argRig }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = lamTerm; B_dData_dPair.f_Pair_second = (plan).f_DoPlan_planRigL }, B_dData_dList.C_List_Nil)))))))))))) in ((Elab_dMeta.v_foldAppTerms (plan).f_DoPlan_planHead) args)))))))))

# 58 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_elabConAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (scrutVal : Core_dTerm.t_Value) (expected : Core_dTerm.t_Value) (cname : string) (args : Frontend_dRast.t_Pat B_dData_dList.t_List) (psp : Base_dSource.t_Span) (body : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_findCtorIn cname) (Elab_dTypes.v_dtDataCtors dd)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 psp) (Base_dDiagnostics_dTc.C_TcErr_UnknownConstructorInCase ((Frontend_dRast.v_ctorDisplayName cname), (Elab_dTypes.v_dtDataName dd)))) (Frontend_dRast.v_ctorDisplayName cname)) (Elab_dTypes.v_dtDataName dd))
  | B_dData_dMaybe.C_Maybe_Just (dtb__837) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((Elab_dCase.v_bindCtorTele ctx) (Elab_dTypes.v_dtCtorType dtb__837)) args))) (fun (p : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dRast.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__838; B_dData_dPair.f_Pair_second = dtb__839 } -> (match dtb__839 with
  | { B_dData_dPair.f_Pair_first = dtb__840; B_dData_dPair.f_Pair_second = dtb__841 } -> (if (Elab_dMeta.v_nonEmpty dtb__841) then (((Base_dDiagnostics_dTc.v_tcErr1 psp) (Base_dDiagnostics_dTc.C_TcErr_BranchTooManyArgs ((Frontend_dRast.v_ctorDisplayName cname)))) (Frontend_dRast.v_ctorDisplayName cname)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan psp)) (((((Elab_dCase.v_unifyIdxListSized ec) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb__838)) ((Elab_dCase.v_ctorResultValsIn dtb__838) dtb__837)) ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) v))) idxs)))) (fun (refsIdx : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((Elab_dCase.v_branchAfterUnify ec) dtb__838) refsIdx) with
  | Elab_dCase.C_BranchVerdict_BranchImpossibleIndex -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex)
  | Elab_dCase.C_BranchVerdict_BranchImpossibleEmptyCtx -> ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchEmptyCtx)
  | Elab_dCase.C_BranchVerdict_BranchOk -> ((Base_dCommon.v_bind (((((Elab_dCase.v_reflectScrutinee ec) (Elab_dTypes.v_ctxDepth dtb__838)) refsIdx) ((Elab_dCase.v_ctorValueIn dtb__838) dtb__837)) scrutVal)) (fun (refs2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let refinedExpected = (((Elab_dTypes.v_refineValue refs2) Core_dTerm.v_defaultFuel) expected) in (let branchCtx2 = ((Elab_dTypes.v_ctxRefine dtb__838) refs2) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__842; B_dData_dPair.f_Pair_second = dtb__843 } -> (let n = (B_dData_dList.v_length dtb__840) in (let opaqueIdxs = ((((v_opaqueBranchIndices dtb__843) branchCtx2) n) (Core_dTerm.v_binderPairs dtb__840)) in (let bodyTerm1 = ((Elab_dMeta.v_wrapOpaqueUses opaqueIdxs) dtb__842) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__843) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = cname; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__840; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }; B_dData_dPair.f_Pair_second = dtb__843 }))))))
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
# 99 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCaseAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) (mc5 : Elab_dTypes.t_DtData) (mc6 : Core_dTerm.t_Value B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Core_dTerm.t_Value) (mc9 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__844, dtb__845) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__844 with
  | { B_dData_dPair.f_Pair_first = dtb__846; B_dData_dPair.f_Pair_second = dtb__847 } -> (match dtb__846 with
  | Frontend_dRast.C_Pat_PCon (dtb__848, dtb__849, dtb__850) -> ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) (Frontend_dRast_dName.v_rnameKey dtb__848)) dtb__849) dtb__850) dtb__847)) (fun (p : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__851; B_dData_dPair.f_Pair_second = dtb__852 } -> (((((((((((v_elabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__852) mc4) mc5) mc6) mc7) mc8) dtb__845) (B_dData_dList.C_List__x58__x58_ (dtb__851, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PVar (dtb__853, dtb__854) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__845) mc10) dtb__847) dtb__853) dtb__854)
  | Frontend_dRast.C_Pat_PWild (dtb__855) -> (((((((((((((v_elabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__845) mc10) dtb__847) "_") dtb__855)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__846)) Base_dDiagnostics_dTc.C_TcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc10); B_dData_dPair.f_Pair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 123 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCatchAllFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTy : Core_dTerm.t_Value) (dd : Elab_dTypes.t_DtData) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (pname : string) (psp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (if (pname = "_") then ctx else (((Elab_dTypes.v_ctxBindValue pname) scrutTy) ctx)) in (if (Elab_dMeta.v_nonEmpty rest) then ((Base_dDiagnostics_dTc.v_tcErr0 psp) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast) else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__856; B_dData_dPair.f_Pair_second = dtb__857 } -> (let binds = (if (pname = "_") then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = pname; Core_dTerm.f_Binder_binderRig = ((Elab_dMeta.v_rigOfLinearValue ec) scrutTy); Core_dTerm.f_Binder_binderSpan = ((Base_dSource.v_spanAtName pname) psp) }, B_dData_dList.C_List_Nil))) in (let bodyTerm1 = (if (pname = "_") then dtb__856 else (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__857) ctx) scrutTy) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__856) else dtb__856)) in (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__857) ctx) expected) then (Elab_dMeta.v_castErased bodyTerm1) else bodyTerm1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = binds; Core_dTerm.f_CaseAlt_caseAltBody = bodyTerm2 }, acc))); B_dData_dPair.f_Pair_second = dtb__857 })))))
  | _ -> failwith "DT: impossible branch"
)))))))
# 153 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun (ps : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = ps in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__858; B_dData_dPair.f_Pair_second = dtb__859 } -> (match dtb__859 with
  | { B_dData_dPair.f_Pair_first = dtb__860; B_dData_dPair.f_Pair_second = dtb__861 } -> (if (((v_natLitCaseFast dtb__861) dtb__860) alts) then ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__861) alts)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> ((((((((((v_checkNatLitCaseFuel (fuel - 1)) globals) ctx) ec3) (v_natToIntTerm dtb__858)) dtb__858) v_natTyValue) alts) expected) sp))) else ((Base_dCommon.v_bind ((((v_resolveOverAlts dtb__861) ctx) dtb__860) alts)) (fun (q : ((Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__862; B_dData_dPair.f_Pair_second = dtb__863 } -> (let caseFuel = (((B_dTrait_dOrd.v_max B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (fuel - 1)) (Elab_dCoverage.v_coverageFuelFor ((B_dData_dList.v_map (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)))) dtb__862))) in ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb__863) dtb__862)) (fun (_u : int) (ec3 : Elab_dTypes.t_Ec) -> (if (v_needsMatrixCase dtb__862) then ((((((((v_checkCaseMatrixFuel caseFuel) globals) ctx) ec3) scrut) dtb__862) expected) sp) else (((((((((v_checkCaseFamFuel caseFuel) globals) ctx) ec3) dtb__858) dtb__860) dtb__862) expected) sp)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 187 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseMatrixFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let name = ("nd_scrut" ^ (bi_strFromInt (Elab_dTypes.v_ctxDepth ctx))) in (let clauses = ((B_dData_dList.v_map (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf alt), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf alt) })) alts) in (let table = (Elab_dMeta.v_ctorFamilyTable ec) in ((Base_dCommon.v_bind (((Elab_dMatch.v_multiToCaseExpr table) clauses) name)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((Elab_dCoverage.v_improveExhaustive table) (fun (_u : int) -> (Elab_dMatch.v_matrixOf clauses))) sp) ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PVar (name, sp)); B_dData_dPair.f_Pair_second = scrut }, B_dData_dList.C_List_Nil)), bodyExpr, false, sp))) expected)))))))))
# 198 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFamFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) scrutTy) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VNeutral (dtb__864) -> (match dtb__864 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__865, dtb__866) -> (if (if (Base_dIntrinsics.v_isBoolCanonical dtb__865) then ((B_dData_dList.v_length dtb__866) = 0) else false) then ((((((((v_checkBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__865 = "Int") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__865 = "String") then (((((((((v_checkLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_checkCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__865) dtb__866) alts) expected) sp))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
))))
# 215 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkBoolCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) ec) alts) Base_dIntrinsics.v_boolTrueCtor) expected) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__867; B_dData_dPair.f_Pair_second = dtb__868 } -> (match dtb__868 with
  | { B_dData_dPair.f_Pair_first = dtb__869; B_dData_dPair.f_Pair_second = dtb__870 } -> (match dtb__869 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__871) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__867, dtb__871)); B_dData_dPair.f_Pair_second = dtb__870 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_boolAltFuel (fuel - 1)) globals) ctx) dtb__870) alts) Base_dIntrinsics.v_boolFalseCtor) expected) sp)) (fun (q : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__872; B_dData_dPair.f_Pair_second = dtb__873 } -> (match dtb__873 with
  | { B_dData_dPair.f_Pair_first = dtb__874; B_dData_dPair.f_Pair_second = dtb__875 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (scrutTerm, dtb__867, dtb__872)); B_dData_dPair.f_Pair_second = dtb__875 }))
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
# 235 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (target : string) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (((((((((v_boolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) B_dData_dMaybe.C_Maybe_Nothing)))
# 242 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : string) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) (mc8 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__876, dtb__877) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__876 with
  | { B_dData_dPair.f_Pair_first = dtb__878; B_dData_dPair.f_Pair_second = dtb__879 } -> (match dtb__878 with
  | Frontend_dRast.C_Pat_PCon (dtb__880, dtb__881, dtb__882) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__880) = mc5) then ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__879) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__883; B_dData_dPair.f_Pair_second = dtb__884 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__883; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc8; B_dData_dPair.f_Pair_second = dtb__884 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__877) mc5) mc6) mc7) mc8))
  | Frontend_dRast.C_Pat_PVar (dtb__885, dtb__886) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__879) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__887; B_dData_dPair.f_Pair_second = dtb__888 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__888) dtb__877) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__887)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__889) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__879) mc6)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__890; B_dData_dPair.f_Pair_second = dtb__891 } -> (((((((((v_boolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__891) dtb__877) mc5) mc6) mc7) (B_dData_dMaybe.C_Maybe_Just (dtb__890)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__878)) Base_dDiagnostics_dTc.C_TcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match mc8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__892) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__892; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc3 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc7) (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive ((Frontend_dRast.v_ctorDisplayName mc5)))) (Frontend_dRast.v_ctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 282 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__893; B_dData_dPair.f_Pair_second = dtb__894 } -> (match dtb__894 with
  | { B_dData_dPair.f_Pair_first = dtb__895; B_dData_dPair.f_Pair_second = dtb__896 } -> (if dtb__895 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__893; B_dData_dPair.f_Pair_second = dtb__896 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 296 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : string) (mc6 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__897, dtb__898) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__897 with
  | { B_dData_dPair.f_Pair_first = dtb__899; B_dData_dPair.f_Pair_second = dtb__900 } -> (match dtb__899 with
  | Frontend_dRast.C_Pat_PInt (dtb__901, dtb__902) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TInt (dtb__901))) dtb__900) dtb__898) mc7) mc8)
  | Frontend_dRast.C_Pat_PStr (dtb__903, dtb__904) -> (((((((((((v_litAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Core_dTerm.C_Term_TStr (dtb__903))) dtb__900) dtb__898) mc7) mc8)
  | Frontend_dRast.C_Pat_PVar (dtb__905, dtb__906) -> ((Base_dCommon.v_bind (((((((((((v_checkLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__905) dtb__900) mc7) ((Base_dSource.v_spanAtName dtb__905) dtb__906)) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__907; B_dData_dPair.f_Pair_second = dtb__908 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__907; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__908 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__909) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__900) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__910; B_dData_dPair.f_Pair_second = dtb__911 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__910; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__911 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__899)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 323 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_litAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__912; B_dData_dPair.f_Pair_second = dtb__913 } -> ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (fuel - 1)) globals) ctx) dtb__913) scrutTerm) tyName) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = q in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__914; B_dData_dPair.f_Pair_second = dtb__915 } -> (match dtb__915 with
  | { B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = dtb__917 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_litEqName tyName))), scrutTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__912, dtb__914)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__916; B_dData_dPair.f_Pair_second = dtb__917 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 340 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (tyName : string) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (tyName, B_dData_dList.C_List_Nil))))) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__918; B_dData_dPair.f_Pair_second = dtb__919 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__918)), scrutTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__919 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 381 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitCaseFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun (p : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = p in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__920; B_dData_dPair.f_Pair_second = dtb__921 } -> (match dtb__921 with
  | { B_dData_dPair.f_Pair_first = dtb__922; B_dData_dPair.f_Pair_second = dtb__923 } -> (if dtb__922 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__920; B_dData_dPair.f_Pair_second = dtb__923 })) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 393 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Term) (mc5 : Core_dTerm.t_Term) (mc6 : Core_dTerm.t_Value) (mc7 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc8 : Core_dTerm.t_Value) (mc9 : Base_dSource.t_Span) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__924, dtb__925) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb__924 with
  | { B_dData_dPair.f_Pair_first = dtb__926; B_dData_dPair.f_Pair_second = dtb__927 } -> (match dtb__926 with
  | Frontend_dRast.C_Pat_PInt (dtb__928, dtb__929) -> ((((((((((((v_natLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Core_dTerm.C_Term_TInt (dtb__928))) dtb__927) dtb__925) mc8) mc9)
  | Frontend_dRast.C_Pat_PVar (dtb__930, dtb__931) -> ((Base_dCommon.v_bind (((((((((((v_checkNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__930) dtb__927) mc8) ((Base_dSource.v_spanAtName dtb__930) dtb__931)) mc9)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__932; B_dData_dPair.f_Pair_second = dtb__933 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__932; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__933 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Pat_PWild (dtb__934) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__927) mc8)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__935; B_dData_dPair.f_Pair_second = dtb__936 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__935; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__936 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_patSpan dtb__926)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 418 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_natLitAltStepFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (cmpTerm : Core_dTerm.t_Term) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (litTerm : Core_dTerm.t_Term) (body : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__937; B_dData_dPair.f_Pair_second = dtb__938 } -> ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__938) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun (q : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = q in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__939; B_dData_dPair.f_Pair_second = dtb__940 } -> (match dtb__940 with
  | { B_dData_dPair.f_Pair_first = dtb__941; B_dData_dPair.f_Pair_second = dtb__942 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("bi_eq_int")), cmpTerm, Core_dTerm.C_Rig_Rig1)), litTerm, Core_dTerm.C_Rig_Rig1)), dtb__937, dtb__939)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__941; B_dData_dPair.f_Pair_second = dtb__942 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 434 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitBoundVarFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bindTerm : Core_dTerm.t_Term) (binderTy : Core_dTerm.t_Value) (name : string) (body : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) binderTy) ctx) in (let rig = ((Elab_dMeta.v_binderRig false) binderTy) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__943; B_dData_dPair.f_Pair_second = dtb__944 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, dtb__943)), bindTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__944 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 448 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseOfFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrutTerm : Core_dTerm.t_Term) (scrutTy : Core_dTerm.t_Value) (fam : string) (idxs : Core_dTerm.t_Value B_dData_dList.t_List) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtDataLookup fam) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
  | B_dData_dMaybe.C_Maybe_Just (dtb__945) -> ((Base_dCommon.v_bind (((((((((((v_elabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__945) idxs) ((Elab_dTypes.v_evalCtx ctx) scrutTerm)) expected) alts) B_dData_dList.C_List_Nil)) (fun (p : (Core_dTerm.t_CaseAlt B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__946; B_dData_dPair.f_Pair_second = dtb__947 } -> (((((((((Elab_dCase.v_checkCaseDone dtb__947) ctx) dtb__945) idxs) alts) expected) sp) scrutTerm) dtb__946)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 464 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferCaseEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (scrut : Frontend_dRast.t_Expr) (alts : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let pmeta = (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__948; B_dData_dPair.f_Pair_second = dtb__949 } -> (let metaTy = ((Elab_dTypes.v_evalCtx ctx) dtb__948) in ((Base_dCommon.v_bind ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) dtb__949) scrut) alts) metaTy) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__950; B_dData_dPair.f_Pair_second = dtb__951 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__950; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = metaTy; B_dData_dPair.f_Pair_second = dtb__951 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 484 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCondBoolFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (c : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) c) Elab_dPrelude.v_boolTyValue) with
  | Base_dDiag.C_Check_OkC (dtb__952) -> (Base_dDiag.C_Check_OkC (dtb__952))
  | Base_dDiag.C_Check_ErrC (dtb__953) -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pc in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__954; B_dData_dPair.f_Pair_second = dtb__955 } -> (match dtb__955 with
  | { B_dData_dPair.f_Pair_first = dtb__956; B_dData_dPair.f_Pair_second = dtb__957 } -> (if (Elab_dMeta.v_isBoolType dtb__956) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__954; B_dData_dPair.f_Pair_second = dtb__957 })) else ((Elab_dTypes.v_errAt sp) (String.concat "" ["if condition must be "; Base_dIntrinsics.v_boolTypeName; " (got "; ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__956); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 837 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__958) -> ((Base_dCommon.v_bind ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr) with
  | Base_dDiag.C_Check_OkC (dtb__959) -> (Base_dDiag.C_Check_OkC (dtb__959))
  | Base_dDiag.C_Check_ErrC (dtb__960) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr2) with
  | Base_dDiag.C_Check_OkC (dtb__961) -> (Base_dDiag.C_Check_OkC (dtb__961))
  | Base_dDiag.C_Check_ErrC (dtb__962) -> ((Base_dCommon.v_bind ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr3) with
  | Base_dDiag.C_Check_OkC (dtb__963) -> (Base_dDiag.C_Check_OkC (dtb__963))
  | Base_dDiag.C_Check_ErrC (dtb__964) -> (Base_dDiag.C_Check_ErrC (dtb__960))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut6 = (v_performOperand expr) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__965) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__966) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) Base_dIntrinsics.v_listFamilyName) dtb__966) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__967) -> (match dtb__967 with
  | { B_dData_dPair.f_Pair_first = dtb__968; B_dData_dPair.f_Pair_second = dtb__969 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__968)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = p in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__970; B_dData_dPair.f_Pair_second = dtb__971 } -> (match dtb__971 with
  | { B_dData_dPair.f_Pair_first = dtb__972; B_dData_dPair.f_Pair_second = dtb__973 } -> ((Base_dCommon.v_bind (((((v_performCallExpr globals) dtb__973) dtb__972) dtb__968) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__973) callExpr)))
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
# 879 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCore = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__974) -> ((Base_dCommon.v_bind (((((v_inferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__974)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__975) -> (Base_dDiag.C_Check_OkC (dtb__975))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) (v_doChainFallback dtb__974))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_inferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 897 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_mrefRewriteExpr ctx) expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__976) -> ((Base_dCommon.v_bind dtb__976) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlainGo fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)))
# 906 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EAnn (dtb__977, dtb__978, dtb__979) -> (((((((v_inferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__977) dtb__978) dtb__979)
  | Frontend_dRast.C_Expr_EDo (dtb__980, dtb__981) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__981) Base_dDiagnostics_dTc.C_TcErr_DoUnsupported)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__982, dtb__983, dtb__984) -> (((((((v_elabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__982) dtb__983) dtb__984)
  | Frontend_dRast.C_Expr_ERecord (dtb__985, dtb__986, dtb__987) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__987) Base_dDiagnostics_dTc.C_TcErr_RecordsUnsupported)
  | Frontend_dRast.C_Expr_EField (dtb__988, dtb__989, dtb__990) -> (((((((v_elabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__988) dtb__989) dtb__990)
  | Frontend_dRast.C_Expr_ECase (dtb__991, dtb__992, dtb__993) -> (((((((v_inferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__991) dtb__992) dtb__993)
  | Frontend_dRast.C_Expr_ELocalFun (dtb__994, dtb__995) -> (if (v_clausesHaveOverCtor dtb__994) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__995) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__994, dtb__995)))) (fun (e2 : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Frontend_dRast.C_Expr_ELet (dtb__996, dtb__997, dtb__998, dtb__999) -> ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) ec) dtb__996) dtb__997) dtb__998) dtb__999)
  | Frontend_dRast.C_Expr_EIf (dtb__1000, dtb__1001, dtb__1002, dtb__1003) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1000) dtb__1003)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__1004; B_dData_dPair.f_Pair_second = dtb__1005 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1005) dtb__1001)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pt in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1006; B_dData_dPair.f_Pair_second = dtb__1007 } -> (match dtb__1007 with
  | { B_dData_dPair.f_Pair_first = dtb__1008; B_dData_dPair.f_Pair_second = dtb__1009 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1009) dtb__1002)) (fun (pe : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pe in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1010; B_dData_dPair.f_Pair_second = dtb__1011 } -> (match dtb__1011 with
  | { B_dData_dPair.f_Pair_first = dtb__1012; B_dData_dPair.f_Pair_second = dtb__1013 } -> (if (if ((v_isIntTy dtb__1013) dtb__1008) then ((v_isNatTy dtb__1013) dtb__1012) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1004, dtb__1006, (v_natToIntTerm dtb__1010))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1008; B_dData_dPair.f_Pair_second = dtb__1013 } })) else (if (if ((v_isNatTy dtb__1013) dtb__1008) then ((v_isIntTy dtb__1013) dtb__1012) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1004, (v_natToIntTerm dtb__1006), dtb__1010)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1013 } })) else ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1013) (Elab_dTypes.v_ctxDepth ctx)) dtb__1008) dtb__1012)) (fun (ec4 : Elab_dTypes.t_Ec) -> (let branchOpaque = (((Elab_dMeta.v_isOpaqueRuntimeTyIn ec4) ctx) dtb__1008) in (let tTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__1006) else dtb__1006) in (let eTerm2 = (if branchOpaque then (Elab_dMeta.v_castErased dtb__1010) else dtb__1010) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1004, tTerm2, eTerm2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1008; B_dData_dPair.f_Pair_second = ec4 } })))))))))
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
  | Frontend_dRast.C_Expr_ELam (dtb__1014, dtb__1015, dtb__1016) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1016) Base_dDiagnostics_dTc.C_TcErr_LambdaNoSignature)
  | Frontend_dRast.C_Expr_EApp (dtb__1017, dtb__1018, dtb__1019) -> (match dtb__1017 with
  | Frontend_dRast.C_Expr_EVar (dtb__1020, dtb__1021) -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1020)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1019) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1020)) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__1019) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName ((Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1020)), (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1020)))))) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1020))) (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1020)))) else ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1020, dtb__1021))) dtb__1018) dtb__1019) B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1017) dtb__1018) dtb__1019) B_dData_dMaybe.C_Maybe_Nothing)
)
  | Frontend_dRast.C_Expr_EPi (dtb__1022, dtb__1023, dtb__1024, dtb__1025, dtb__1026, dtb__1027) -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) dtb__1022) dtb__1023) dtb__1024) dtb__1025) dtb__1026) dtb__1027)
  | Frontend_dRast.C_Expr_EFloat (dtb__1028, dtb__1029) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1028)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EStr (dtb__1030, dtb__1031) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1030)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("String", B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EInt (dtb__1032, dtb__1033) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb__1032)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("Int", B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = ec } }))
  | Frontend_dRast.C_Expr_EVar (dtb__1034, dtb__1035) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__1034) = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc Core_dTerm.v_levelZero))); B_dData_dPair.f_Pair_second = ec } })) else (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1034)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1035) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1034)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1035) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1034))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1034)))) (fun (t : string) -> (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) t) dtb__1035))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1034)) then ((((Base_dDiagnostics_dTc.v_tcErr2 dtb__1035) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName ((Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1034)), (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1034)))))) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1034))) (Frontend_dReserved.v_joinWithAt (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1034)))) else (((((Elab_dTerm_dSupport.v_inferVarRef globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1034)) dtb__1035)))))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))))
# 1165 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabEFieldFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fname : string) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1036; B_dData_dPair.f_Pair_second = dtb__1037 } -> (match dtb__1037 with
  | { B_dData_dPair.f_Pair_first = dtb__1038; B_dData_dPair.f_Pair_second = dtb__1039 } -> (match ((v_recordTypeOf dtb__1039) dtb__1038) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1040) -> ((Base_dCommon.v_bind ((((v_recordFieldPlan dtb__1039) dtb__1038) fname) sp)) (fun (plan : t_FieldAccessPlan) -> (let arity = (B_dData_dList.v_length ((plan).f_FieldAccessPlan_planData).Elab_dTypes.f_DtData_dtDataParams) in (let tele = ((B_dData_dList.v_drop arity) (Elab_dTypes.v_dtCtorTelescope (plan).f_FieldAccessPlan_planCtor)) in (let proj = (Core_dTerm.C_Term_TProj (dtb__1036, (Elab_dTypes.v_dtCtorName (plan).f_FieldAccessPlan_planCtor), tele, (arity + (plan).f_FieldAccessPlan_planField), (plan).f_FieldAccessPlan_planField)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = proj; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (plan).f_FieldAccessPlan_planType; B_dData_dPair.f_Pair_second = dtb__1039 } })))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_hasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__1039) dtb__1036) dtb__1038) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1191 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabERecUpdateFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (base : Frontend_dRast.t_Expr) (fields : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fields with
  | B_dData_dList.C_List_Nil -> ((Elab_dTypes.v_errAt sp) "record update needs at least one field")
  | _ -> (if (Elab_dRecords.v_hasDuplicateFieldNames fields) then ((Elab_dTypes.v_errAt sp) "duplicate field in record update") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pb in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1041; B_dData_dPair.f_Pair_second = dtb__1042 } -> (match dtb__1042 with
  | { B_dData_dPair.f_Pair_first = dtb__1043; B_dData_dPair.f_Pair_second = dtb__1044 } -> ((Base_dCommon.v_bind ((((v_recordUpdatePlan dtb__1044) dtb__1043) fields) sp)) (fun (plan : t_UpdateAccessPlan) -> (let body = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)), sp)), (plan).f_UpdateAccessPlan_upBodyArgs, sp)) in ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (fuel - 1)) globals) ctx) dtb__1044) (plan).f_UpdateAccessPlan_upData) (plan).f_UpdateAccessPlan_upIdxs) ((Elab_dTypes.v_evalCtx ctx) dtb__1041)) dtb__1043) (Elab_dTypes.v_dtCtorName (plan).f_UpdateAccessPlan_upCtor)) ((v_recordFieldPats (plan).f_UpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun (q : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1045; B_dData_dPair.f_Pair_second = dtb__1046 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb__1041, (dtb__1045).Core_dTerm.f_CaseAlt_caseAltName, (Core_dTerm.v_binderPairs (dtb__1045).Core_dTerm.f_CaseAlt_caseAltBinders), (plan).f_UpdateAccessPlan_upFieldIndices, (dtb__1045).Core_dTerm.f_CaseAlt_caseAltBody)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1043; B_dData_dPair.f_Pair_second = dtb__1046 } }))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
)))
# 1220 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAnnFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut8 = pt in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__1047; B_dData_dPair.f_Pair_second = dtb__1048 } -> (match dtb__1048 with
  | { B_dData_dPair.f_Pair_first = dtb__1049; B_dData_dPair.f_Pair_second = dtb__1050 } -> (let tyVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1047) in ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1050) value) tyVal)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1051; B_dData_dPair.f_Pair_second = dtb__1052 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1051; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyVal; B_dData_dPair.f_Pair_second = dtb__1052 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1238 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferPiFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (implicit : bool) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dom : Frontend_dRast.t_Expr) (cod : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun (pd : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pd in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1053; B_dData_dPair.f_Pair_second = dtb__1054 } -> (match dtb__1054 with
  | { B_dData_dPair.f_Pair_first = dtb__1055; B_dData_dPair.f_Pair_second = dtb__1056 } -> (let domVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1053) in (let isTypeDom = (Elab_dMeta.v_isTypeDomain domVal) in (let isLinDom = ((Elab_dMeta.v_isLinearType ec) domVal) in (let lvl = (Elab_dTypes.v_ctxDepth ctx) in (let ctx2 = (((Elab_dTypes.v_ctxBind name) dtb__1053) ctx) in (let badQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1062) -> (if implicit then true else isTypeDom)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (let badLinQty = (match qty with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1061) -> (if (Frontend_dAst.v_qtyIsZero dtb__1061) then isLinDom else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (if badQty then (if implicit then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityImplicit (name))) name) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearTypeNeedsOne (name))) name) else ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx2) dtb__1056) cod)) (fun (pc : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut28 = pc in (match nd_uscrut28 with
  | { B_dData_dPair.f_Pair_first = dtb__1057; B_dData_dPair.f_Pair_second = dtb__1058 } -> (match dtb__1058 with
  | { B_dData_dPair.f_Pair_first = dtb__1059; B_dData_dPair.f_Pair_second = dtb__1060 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (name, implicit, (if isLinDom then Core_dTerm.C_Rig_Rig1 else (if implicit then ((Elab_dMeta.v_implicitBinderRig ec) domVal) else (((Elab_dMeta.v_rigOfQty false) isTypeDom) qty))), dtb__1053, dtb__1057)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType (((Core_dTerm.v_levelMax dtb__1055) dtb__1059))); B_dData_dPair.f_Pair_second = dtb__1060 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1302 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = fn in (match nd_uscrut8 with
  | Frontend_dRast.C_Expr_EVar (dtb__1063, dtb__1064) -> (match dtb__1063 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1065) -> (if (dtb__1065 = "->") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1066, dtb__1067) -> (match dtb__1067 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1068, dtb__1069) -> (match dtb__1069 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_inferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) B_dData_dMaybe.C_Maybe_Nothing) dtb__1066) dtb__1068) sp)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)) else (if (dtb__1065 = "Type") then (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1070, dtb__1071) -> (match dtb__1070 with
  | Frontend_dRast.C_Expr_EInt (dtb__1072, dtb__1073) -> (match dtb__1071 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1072 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1073) Base_dDiagnostics_dTc.C_TcErr_UniverseLevelNonNegative) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb__1072))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc (Core_dTerm.v_levelOfInt dtb__1072)))); B_dData_dPair.f_Pair_second = ec } })))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1064) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1064) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1064) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)) else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1074, dtb__1075) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1074)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1075) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1074))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1074)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1075))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1074)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1076) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1074)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1077) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1077))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1078; B_dData_dPair.f_Pair_second = dtb__1079 } -> (match dtb__1079 with
  | { B_dData_dPair.f_Pair_first = dtb__1080; B_dData_dPair.f_Pair_second = dtb__1081 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1081) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1074)))) dtb__1078); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1080; B_dData_dPair.f_Pair_second = dtb__1081 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1074)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1082) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1074)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1082)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1083; B_dData_dPair.f_Pair_second = dtb__1084 } -> (match dtb__1084 with
  | { B_dData_dPair.f_Pair_first = dtb__1085; B_dData_dPair.f_Pair_second = dtb__1086 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1086) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1074)))) dtb__1083); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1085; B_dData_dPair.f_Pair_second = dtb__1086 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1074)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1087) -> (Base_dDiag.C_Check_OkC (dtb__1087))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1082)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = pa in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1088; B_dData_dPair.f_Pair_second = dtb__1089 } -> (match dtb__1089 with
  | { B_dData_dPair.f_Pair_first = dtb__1090; B_dData_dPair.f_Pair_second = dtb__1091 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1091) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1074)))) dtb__1088); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1090; B_dData_dPair.f_Pair_second = dtb__1091 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1074)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1092) -> (Base_dDiag.C_Check_OkC (dtb__1092))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1075) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1074)))) (Frontend_dRast_dName.v_rnameKey dtb__1074))
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
  | Frontend_dRast.C_Expr_EVar (dtb__1093, dtb__1094) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1093)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1094) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1093))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1093)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1094))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1093)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1095) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1093)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1096) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1096))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = pa in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1097; B_dData_dPair.f_Pair_second = dtb__1098 } -> (match dtb__1098 with
  | { B_dData_dPair.f_Pair_first = dtb__1099; B_dData_dPair.f_Pair_second = dtb__1100 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1100) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1093)))) dtb__1097); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1099; B_dData_dPair.f_Pair_second = dtb__1100 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1093)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1101) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1093)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1101)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1102; B_dData_dPair.f_Pair_second = dtb__1103 } -> (match dtb__1103 with
  | { B_dData_dPair.f_Pair_first = dtb__1104; B_dData_dPair.f_Pair_second = dtb__1105 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1105) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1093)))) dtb__1102); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1104; B_dData_dPair.f_Pair_second = dtb__1105 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1093)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1106) -> (Base_dDiag.C_Check_OkC (dtb__1106))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1101)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = pa in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1107; B_dData_dPair.f_Pair_second = dtb__1108 } -> (match dtb__1108 with
  | { B_dData_dPair.f_Pair_first = dtb__1109; B_dData_dPair.f_Pair_second = dtb__1110 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1110) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1093)))) dtb__1107); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1109; B_dData_dPair.f_Pair_second = dtb__1110 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1093)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1111) -> (Base_dDiag.C_Check_OkC (dtb__1111))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1094) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1093)))) (Frontend_dRast_dName.v_rnameKey dtb__1093))
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
  | Frontend_dRast.C_Expr_EVar (dtb__1112, dtb__1113) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1112)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1113) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1112))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1112)))) (fun (t : string) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1113))) args) sp) hint))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1112)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1114) -> ((((((((v_inferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) (Frontend_dRast_dName.v_rnameKey dtb__1112)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1115) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1115))) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1116; B_dData_dPair.f_Pair_second = dtb__1117 } -> (match dtb__1117 with
  | { B_dData_dPair.f_Pair_first = dtb__1118; B_dData_dPair.f_Pair_second = dtb__1119 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1119) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1112)))) dtb__1116); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1118; B_dData_dPair.f_Pair_second = dtb__1119 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup (Frontend_dRast_dName.v_rnameKey dtb__1112)) globals) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1120) -> (if (((v_skipArithSpecForHint ec) (Frontend_dRast_dName.v_rnameKey dtb__1112)) hint) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1120)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1121; B_dData_dPair.f_Pair_second = dtb__1122 } -> (match dtb__1122 with
  | { B_dData_dPair.f_Pair_first = dtb__1123; B_dData_dPair.f_Pair_second = dtb__1124 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1124) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1112)))) dtb__1121); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1123; B_dData_dPair.f_Pair_second = dtb__1124 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1112)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1125) -> (Base_dDiag.C_Check_OkC (dtb__1125))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1120)) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pa in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__1126; B_dData_dPair.f_Pair_second = dtb__1127 } -> (match dtb__1127 with
  | { B_dData_dPair.f_Pair_first = dtb__1128; B_dData_dPair.f_Pair_second = dtb__1129 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb__1129) (Core_dTerm.C_Term_TGlobal ((Frontend_dRast_dName.v_rnameKey dtb__1112)))) dtb__1126); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1128; B_dData_dPair.f_Pair_second = dtb__1129 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1112)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1130) -> (Base_dDiag.C_Check_OkC (dtb__1130))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__1113) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1112)))) (Frontend_dRast_dName.v_rnameKey dtb__1112))
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
# 1372 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1131, dtb__1132) -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1131)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mspec with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1133) -> (Base_dDiag.C_Check_OkC (dtb__1133))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1387 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun (pf : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = pf in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1134; B_dData_dPair.f_Pair_second = dtb__1135 } -> (match dtb__1135 with
  | { B_dData_dPair.f_Pair_first = dtb__1136; B_dData_dPair.f_Pair_second = dtb__1137 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1137) dtb__1136) args) sp) hint)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = pa in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1138; B_dData_dPair.f_Pair_second = dtb__1139 } -> (match dtb__1139 with
  | { B_dData_dPair.f_Pair_first = dtb__1140; B_dData_dPair.f_Pair_second = dtb__1141 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1141)) dtb__1134) dtb__1138); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1140; B_dData_dPair.f_Pair_second = dtb__1141 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1403 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((v_inferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1558 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal ec) ty) in (match forced with
  | Core_dTerm.C_Value_VPi (dtb__1142, dtb__1143, dtb__1144, dtb__1145, dtb__1146) -> (if dtb__1143 then (if ((Elab_dDict.v_isDictDomain ec) dtb__1145) then (if ((Elab_dDict.v_dictArgUnsolvedMeta ec) dtb__1145) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1145) dtb__1146) args) sp) hint) else ((Base_dCommon.v_bind (((((((v_constrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1145) args) sp)) (fun (ec0 : Elab_dTypes.t_Ec) -> (let nd_uscrut15 = (((((Elab_dDict.v_searchInstanceIn globals) ctx) ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1145)) sp) in (match nd_uscrut15 with
  | Base_dDiag.C_Check_ErrC (dtb__1147) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP ec0)) ((Elab_dTypes.v_forceVal ec0) dtb__1145)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1145) dtb__1146) args) sp) hint) else (if ((Elab_dDict.v_isRigidDictArg ec0) ((Elab_dTypes.v_forceVal ec0) dtb__1145)) then (((((((((v_deferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1145) dtb__1146) args) sp) hint) else (Base_dDiag.C_Check_ErrC (dtb__1147))))
  | Base_dDiag.C_Check_OkC (dtb__1148) -> (match dtb__1148 with
  | { B_dData_dPair.f_Pair_first = dtb__1149; B_dData_dPair.f_Pair_second = dtb__1150 } -> (let ty2 = ((Core_dEval.v_applyClosure dtb__1146) ((Elab_dTypes.v_evalCtx ctx) dtb__1149)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1150) ty2) args) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = q in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1151; B_dData_dPair.f_Pair_second = dtb__1152 } -> (match dtb__1152 with
  | { B_dData_dPair.f_Pair_first = dtb__1153; B_dData_dPair.f_Pair_second = dtb__1154 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1149; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1151)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1153; B_dData_dPair.f_Pair_second = dtb__1154 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) else (if ((Elab_dDict.v_isMemberDomain ec) dtb__1145) then (match ((((Elab_dDict.v_memberLookup 64) (Elab_dTypes.v_ctxDepth ctx)) ec) dtb__1145) with
  | Elab_dDict.C_MemberLookup_MemberFound (dtb__1155, dtb__1156) -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1156) ((Core_dEval.v_applyClosure dtb__1146) dtb__1155)) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut17 = p in (match nd_uscrut17 with
  | { B_dData_dPair.f_Pair_first = dtb__1157; B_dData_dPair.f_Pair_second = dtb__1158 } -> (match dtb__1158 with
  | { B_dData_dPair.f_Pair_first = dtb__1159; B_dData_dPair.f_Pair_second = dtb__1160 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) dtb__1155); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1157)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1159; B_dData_dPair.f_Pair_second = dtb__1160 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Elab_dDict.C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | Elab_dDict.C_MemberLookup_MemberAmbiguous (dtb__1161) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1162; B_dData_dPair.f_Pair_second = dtb__1163 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1163) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1145) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1146) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1162))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = p in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1164; B_dData_dPair.f_Pair_second = dtb__1165 } -> (match dtb__1165 with
  | { B_dData_dPair.f_Pair_first = dtb__1166; B_dData_dPair.f_Pair_second = dtb__1167 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1162; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1164)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1166; B_dData_dPair.f_Pair_second = dtb__1167 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | Elab_dDict.C_MemberLookup_MemberStuck -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1168; B_dData_dPair.f_Pair_second = dtb__1169 } -> (let ec2 = ((((((Elab_dTypes.v_ecAddConstraint dtb__1169) Elab_dTypes.C_ConstraintKind_CkRow) m) dtb__1145) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec2) ((Core_dEval.v_applyClosure dtb__1146) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1168))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut21 = p in (match nd_uscrut21 with
  | { B_dData_dPair.f_Pair_first = dtb__1170; B_dData_dPair.f_Pair_second = dtb__1171 } -> (match dtb__1171 with
  | { B_dData_dPair.f_Pair_first = dtb__1172; B_dData_dPair.f_Pair_second = dtb__1173 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1168; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb__1170)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1172; B_dData_dPair.f_Pair_second = dtb__1173 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (if (((Elab_dMeta.v_isImplicitDomain ctx) ec) dtb__1145) then (if ((Elab_dMeta.v_isCellDomain ec) dtb__1145) then (let nd_uscrut14 = ((Elab_dTypes.v_ctxLookup dtb__1142) ctx) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_CellNotInScope (dtb__1142))) dtb__1142)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1174) -> (match dtb__1174 with
  | { B_dData_dPair.f_Pair_first = dtb__1175; B_dData_dPair.f_Pair_second = dtb__1176 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_applyClosure dtb__1146) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__1142, dtb__1175, B_dData_dList.C_List_Nil)))))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = p in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1177; B_dData_dPair.f_Pair_second = dtb__1178 } -> (match dtb__1178 with
  | { B_dData_dPair.f_Pair_first = dtb__1179; B_dData_dPair.f_Pair_second = dtb__1180 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__1142, dtb__1175, sp)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1177)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1179; B_dData_dPair.f_Pair_second = dtb__1180 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (if ((Elab_dMeta.v_isStringImplicitDomain ec) dtb__1145) then (match args with
  | B_dData_dList.C_List__x58__x58_ (dtb__1181, dtb__1182) -> (match (v_instArgOperand dtb__1181) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1183) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1183) dtb__1145)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1184; B_dData_dPair.f_Pair_second = dtb__1185 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1185) ((Core_dEval.v_applyClosure dtb__1146) ((Elab_dTypes.v_evalCtx ctx) dtb__1184))) dtb__1182) sp) hint)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut25 = q in (match nd_uscrut25 with
  | { B_dData_dPair.f_Pair_first = dtb__1186; B_dData_dPair.f_Pair_second = dtb__1187 } -> (match dtb__1187 with
  | { B_dData_dPair.f_Pair_first = dtb__1188; B_dData_dPair.f_Pair_second = dtb__1189 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1184; B_dData_dPair.f_Pair_second = dtb__1144 }, dtb__1186)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1188; B_dData_dPair.f_Pair_second = dtb__1189 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1190; B_dData_dPair.f_Pair_second = dtb__1191 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1191) ((Core_dEval.v_applyClosure dtb__1146) ((Elab_dTypes.v_evalCtx ctx) dtb__1190))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut23 = p in (match nd_uscrut23 with
  | { B_dData_dPair.f_Pair_first = dtb__1192; B_dData_dPair.f_Pair_second = dtb__1193 } -> (match dtb__1193 with
  | { B_dData_dPair.f_Pair_first = dtb__1194; B_dData_dPair.f_Pair_second = dtb__1195 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1190; B_dData_dPair.f_Pair_second = dtb__1144 }, dtb__1192)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1194; B_dData_dPair.f_Pair_second = dtb__1195 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1196; B_dData_dPair.f_Pair_second = dtb__1197 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1197) ((Core_dEval.v_applyClosure dtb__1146) ((Elab_dTypes.v_evalCtx ctx) dtb__1196))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = p in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__1198; B_dData_dPair.f_Pair_second = dtb__1199 } -> (match dtb__1199 with
  | { B_dData_dPair.f_Pair_first = dtb__1200; B_dData_dPair.f_Pair_second = dtb__1201 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1196; B_dData_dPair.f_Pair_second = dtb__1144 }, dtb__1198)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1200; B_dData_dPair.f_Pair_second = dtb__1201 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1202; B_dData_dPair.f_Pair_second = dtb__1203 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1203) ((Core_dEval.v_applyClosure dtb__1146) ((Elab_dTypes.v_evalCtx ctx) dtb__1202))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut19 = p in (match nd_uscrut19 with
  | { B_dData_dPair.f_Pair_first = dtb__1204; B_dData_dPair.f_Pair_second = dtb__1205 } -> (match dtb__1205 with
  | { B_dData_dPair.f_Pair_first = dtb__1206; B_dData_dPair.f_Pair_second = dtb__1207 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1202; B_dData_dPair.f_Pair_second = dtb__1144 }, dtb__1204)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1206; B_dData_dPair.f_Pair_second = dtb__1207 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)))) else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = forced; B_dData_dPair.f_Pair_second = ec } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__1208, dtb__1209) -> (let ec0 = (match hint with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1216) -> (if (((((v_remainingExplicitPis 64) ctx) ec) forced) = (B_dData_dList.v_length args)) then (match ((((v_tryUseHint ctx) dtb__1216) ec) forced) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ec
  | B_dData_dMaybe.C_Maybe_Just (dtb__1217) -> dtb__1217
  | _ -> failwith "DT: impossible branch"
) else ec)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain ec0) sp) dtb__1142) dtb__1144) dtb__1145)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((v_expandArgListLit ec0) dtb__1145) dtb__1208)) (fun (a2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1145)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1210; B_dData_dPair.f_Pair_second = dtb__1211 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) dtb__1211) ((Core_dEval.v_applyClosure dtb__1146) ((Elab_dTypes.v_evalCtx ctx) dtb__1210))) dtb__1209) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (q : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = q in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1212; B_dData_dPair.f_Pair_second = dtb__1213 } -> (match dtb__1213 with
  | { B_dData_dPair.f_Pair_first = dtb__1214; B_dData_dPair.f_Pair_second = dtb__1215 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1210; B_dData_dPair.f_Pair_second = argRig }, dtb__1212)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1214; B_dData_dPair.f_Pair_second = dtb__1215 } }))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__1218, dtb__1219) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dRast.v_exprSpan dtb__1218)) Base_dDiagnostics_dTc.C_TcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
))))
# 1708 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_deferDictBinderFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (clo : Core_dTerm.t_Closure) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (hint : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1220; B_dData_dPair.f_Pair_second = dtb__1221 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (fuel - 1)) globals) ctx) ((((((Elab_dTypes.v_ecAddConstraint dtb__1221) Elab_dTypes.C_ConstraintKind_CkDict) m) ((Elab_dTypes.v_forceVal dtb__1221) dom)) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx))) ((Core_dEval.v_applyClosure clo) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1220))) args) sp) hint)) (fun (p : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1222; B_dData_dPair.f_Pair_second = dtb__1223 } -> (match dtb__1223 with
  | { B_dData_dPair.f_Pair_first = dtb__1224; B_dData_dPair.f_Pair_second = dtb__1225 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1220; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb__1222)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1224; B_dData_dPair.f_Pair_second = dtb__1225 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1726 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (dom : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dDict.v_dictClassArg ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1226) -> (match ((Elab_dDict.v_dictArgKind ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1227) -> (let nd_uscrut11 = dtb__1226 in (match nd_uscrut11 with
  | Core_dTerm.C_Value_VMeta (dtb__1228, dtb__1229) -> (match dtb__1229 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1226) dtb__1227) args) sp)) (fun (ecProbe : Elab_dTypes.t_Ec) -> (match ((Core_dTerm.v_metaLookup dtb__1228) (Elab_dTypes.v_ecSolTbl ecProbe)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1230) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) (Elab_dTypes.v_ctxDepth ctx)) dtb__1228) B_dData_dList.C_List_Nil) dtb__1230) with
  | Base_dDiag.C_Check_OkC (dtb__1231) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__1231))))
  | Base_dDiag.C_Check_ErrC (dtb__1232) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1226) dtb__1227) args) sp)
)
  | _ -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1226) dtb__1227) args) sp)
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1754 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomGoKFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (argTy : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (ec))
  | B_dData_dList.C_List__x58__x58_ (dtb__1233, dtb__1234) -> (let nd_uscrut11 = (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1233) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__1235) -> (match dtb__1235 with
  | { B_dData_dPair.f_Pair_first = dtb__1236; B_dData_dPair.f_Pair_second = dtb__1237 } -> (match dtb__1237 with
  | { B_dData_dPair.f_Pair_first = dtb__1238; B_dData_dPair.f_Pair_second = dtb__1239 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1239) dtb__1238) in (if (Core_dTerm.v_isTypeValue forced) then ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1239) ctx) argTy) argKind) dtb__1234) sp) else (if (((((Elab_dDict.v_argHeadMatchesKind globals) dtb__1239) ctx) forced) argKind) then (match ((((Elab_dMeta.v_convEc dtb__1239) (Elab_dTypes.v_ctxDepth ctx)) argTy) (Elab_dDict.v_neutralHeadOrSelf forced)) with
  | Base_dDiag.C_Check_OkC (dtb__1240) -> (Base_dDiag.C_Check_OkC (dtb__1240))
  | Base_dDiag.C_Check_ErrC (dtb__1241) -> ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1239) ctx) argTy) argKind) dtb__1234) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_constrainDictDomGoKFuel (fuel - 1)) globals) dtb__1239) ctx) argTy) argKind) dtb__1234) sp))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1242) -> (Base_dDiag.C_Check_OkC (ec))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1886 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1243) -> ((((((((v_specializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1243) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1896 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = args in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1244, dtb__1245) -> (match dtb__1245 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1246, dtb__1247) -> (match dtb__1247 with
  | B_dData_dList.C_List_Nil -> (if ((v_isNatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1244) v_natTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1248; B_dData_dPair.f_Pair_second = dtb__1249 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1249) dtb__1246) v_natTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1250; B_dData_dPair.f_Pair_second = dtb__1251 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1248) dtb__1250); B_dData_dPair.f_Pair_second = dtb__1251 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isIntTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1244) v_intTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1252; B_dData_dPair.f_Pair_second = dtb__1253 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1253) dtb__1246) v_intTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1254; B_dData_dPair.f_Pair_second = dtb__1255 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1252) dtb__1254); B_dData_dPair.f_Pair_second = dtb__1255 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isFloatTy ec) expected) then ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1244) v_floatTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1256; B_dData_dPair.f_Pair_second = dtb__1257 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1257) dtb__1246) v_floatTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1258; B_dData_dPair.f_Pair_second = dtb__1259 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1256) dtb__1258); B_dData_dPair.f_Pair_second = dtb__1259 }))))
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
# 1942 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1260) -> (((((((v_specializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1260) args) sp)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1952 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppOpFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (op : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1261, dtb__1262) -> (match dtb__1262 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1263, dtb__1264) -> (match dtb__1264 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1261)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1265; B_dData_dPair.f_Pair_second = dtb__1266 } -> (match dtb__1266 with
  | { B_dData_dPair.f_Pair_first = dtb__1267; B_dData_dPair.f_Pair_second = dtb__1268 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1268) dtb__1263)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1269; B_dData_dPair.f_Pair_second = dtb__1270 } -> (match dtb__1270 with
  | { B_dData_dPair.f_Pair_first = dtb__1271; B_dData_dPair.f_Pair_second = dtb__1272 } -> (if (if ((v_isNatTy dtb__1272) dtb__1267) then ((v_isNatTy dtb__1272) dtb__1271) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1265) dtb__1269); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1272 } })))) else (if (if ((v_isIntTy dtb__1272) dtb__1267) then ((v_isIntTy dtb__1272) dtb__1271) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1265) dtb__1269); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1272 } })))) else (if (if ((v_isFloatTy dtb__1272) dtb__1267) then ((v_isFloatTy dtb__1272) dtb__1271) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 op) dtb__1265) dtb__1269); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_floatTyValue; B_dData_dPair.f_Pair_second = dtb__1272 } })))) else (if (if ((v_isNatTy dtb__1272) dtb__1267) then ((v_isIntTy dtb__1272) dtb__1271) else false) then (match (v_isEIntExpr dtb__1263) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1273) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1263)) dtb__1273)) (fun (bNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) dtb__1265) bNat); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1272 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) (v_natToIntTerm dtb__1265)) dtb__1269); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1272 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_isIntTy dtb__1272) dtb__1267) then ((v_isNatTy dtb__1272) dtb__1271) else false) then (match (v_isEIntExpr dtb__1261) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1274) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dRast.v_exprSpan dtb__1261)) dtb__1274)) (fun (aNat : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 op) aNat) dtb__1269); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb__1272 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 op) dtb__1265) (v_natToIntTerm dtb__1269)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb__1272 } }))))
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
# 1992 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1275) -> (let simpleComp = (let nd_uscrut8 = (v_handleOperand expr) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__1282) -> (match dtb__1282 with
  | { B_dData_dPair.f_Pair_first = dtb__1283; B_dData_dPair.f_Pair_second = dtb__1284 } -> (v_isSimpleComp dtb__1283)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let firstCall = (if simpleComp then ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in (let thirdCall = (if simpleComp then ((((v_handleCallExprAt globals) ec) expr) (Frontend_dRast.v_exprSpan expr)) else ((((v_handleCallExpr globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) in ((Base_dCommon.v_bind firstCall) (fun (callExpr : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1276) -> (Base_dDiag.C_Check_OkC (dtb__1276))
  | Base_dDiag.C_Check_ErrC (dtb__1277) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole globals) ec) expr) (Frontend_dRast.v_exprSpan expr))) (fun (callExpr2 : Frontend_dRast.t_Expr) -> (match ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Base_dDiag.C_Check_OkC (dtb__1278) -> (Base_dDiag.C_Check_OkC (dtb__1278))
  | Base_dDiag.C_Check_ErrC (dtb__1279) -> ((Base_dCommon.v_bind thirdCall) (fun (callExpr3 : Frontend_dRast.t_Expr) -> (match ((Base_dObs.v_obsCheck "vuna.elab.term.retry-third") (fun (_u : int) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Base_dDiag.C_Check_OkC (dtb__1280) -> (Base_dDiag.C_Check_OkC (dtb__1280))
  | Base_dDiag.C_Check_ErrC (dtb__1281) -> (Base_dDiag.C_Check_ErrC (dtb__1277))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1285) -> ((Base_dObs.v_obsCheck "vuna.elab.term.infer") (fun (_u : int) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1286) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1287) -> ((Base_dCommon.v_bind ((((v_expandListLit ec) ((v_listLitFamily ec) ((Elab_dTypes.v_forceVal ec) expected))) dtb__1287) (Frontend_dRast.v_exprSpan expr))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dObs.v_obsDefCheckAt 3) "vuna.elab.term.core") (v_exprFormName expr)) (fun (_u : int) -> ((((((v_checkEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2073 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRow = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead expr) then (match (v_decodeDoBlock expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1288) -> ((Base_dCommon.v_bind ((((((v_checkDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1288) expected)) (fun (r : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1289) -> (Base_dDiag.C_Check_OkC (dtb__1289))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) (v_doChainFallback dtb__1288)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_checkEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 2154 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_mrefRewriteExpr ctx) expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1290) -> ((Base_dCommon.v_bind dtb__1290) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlainGo fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
)))
# 2163 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlainGo = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EAnn (dtb__1291, dtb__1292, dtb__1293) -> ((Base_dCommon.v_bind (((((v_checkTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1292)) (fun (pt : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pt in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1294; B_dData_dPair.f_Pair_second = dtb__1295 } -> (match dtb__1295 with
  | { B_dData_dPair.f_Pair_first = dtb__1296; B_dData_dPair.f_Pair_second = dtb__1297 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1297) dtb__1291) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) dtb__1294))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__1298, dtb__1299) -> (if (v_clausesHaveOverCtor dtb__1298) then ((Base_dCommon.v_bind ((((v_resolveOverFunPats ec) ctx) expected) dtb__1298)) (fun (r : ((Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__1300; B_dData_dPair.f_Pair_second = dtb__1301 } -> ((Base_dCommon.v_bind ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable dtb__1301)) dtb__1300)) (fun (bodyExpr : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1301) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((v_expandLocalFuns ec) (Frontend_dRast.C_Expr_ELocalFun (dtb__1298, dtb__1299)))) (fun (e2 : Frontend_dRast.t_Expr) -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Frontend_dRast.C_Expr_ELet (dtb__1302, dtb__1303, dtb__1304, dtb__1305) -> (((((((((v_checkLetFuel (fuel - 1)) globals) ctx) ec) dtb__1302) dtb__1303) dtb__1304) expected) dtb__1305)
  | Frontend_dRast.C_Expr_ECase (dtb__1306, dtb__1307, dtb__1308) -> ((((((((v_checkCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1306) dtb__1307) expected) dtb__1308)
  | Frontend_dRast.C_Expr_EIf (dtb__1309, dtb__1310, dtb__1311, dtb__1312) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1309) dtb__1312)) (fun (pc : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__1313; B_dData_dPair.f_Pair_second = dtb__1314 } -> (let attempt = ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1314) dtb__1310) expected)) (fun (pt : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__1317; B_dData_dPair.f_Pair_second = dtb__1318 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1318) dtb__1311) expected)) (fun (pe : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__1319; B_dData_dPair.f_Pair_second = dtb__1320 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__1313, dtb__1317, dtb__1319)); B_dData_dPair.f_Pair_second = dtb__1320 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) in (match attempt with
  | Base_dDiag.C_Check_OkC (dtb__1315) -> (Base_dDiag.C_Check_OkC (dtb__1315))
  | Base_dDiag.C_Check_ErrC (dtb__1316) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dRast.C_Expr_EPi (dtb__1321, dtb__1322, dtb__1323, dtb__1324, dtb__1325, dtb__1326) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Frontend_dRast.C_Expr_EApp (dtb__1327, dtb__1328, dtb__1329) -> (match dtb__1327 with
  | Frontend_dRast.C_Expr_EVar (dtb__1330, dtb__1331) -> (match dtb__1330 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__1332) -> (if (dtb__1332 = "->") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1332 = "Type") then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1330)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1329) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1330, dtb__1331))) dtb__1328) expected) dtb__1329))))
  | _ -> (if (Frontend_dReserved.v_isInstArgSyntax (Frontend_dRast_dName.v_rnameKey dtb__1330)) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb__1329) Base_dDiagnostics_dTc.C_TcErr_NoInstParam) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1330, dtb__1331))) dtb__1328) expected) dtb__1329))
)
  | _ -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) dtb__1327) dtb__1328) expected) dtb__1329)
)
  | Frontend_dRast.C_Expr_ELam (dtb__1333, dtb__1334, dtb__1335) -> ((((((((v_checkLamFuel (fuel - 1)) globals) ctx) ec) dtb__1333) dtb__1334) expected) dtb__1335)
  | Frontend_dRast.C_Expr_EFloat (dtb__1336, dtb__1337) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1338, dtb__1339) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1340) -> (match dtb__1340 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1341, dtb__1342) -> (match dtb__1342 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1341 = Base_dIntrinsics.v_floatTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__1336)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1337) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1343) -> (match dtb__1343 with
  | { B_dData_dPair.f_Pair_first = dtb__1344; B_dData_dPair.f_Pair_second = dtb__1345 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1345) dtb__1344) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1337) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1346) -> (match dtb__1346 with
  | { B_dData_dPair.f_Pair_first = dtb__1347; B_dData_dPair.f_Pair_second = dtb__1348 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1348) dtb__1347) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1337) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1349) -> (match dtb__1349 with
  | { B_dData_dPair.f_Pair_first = dtb__1350; B_dData_dPair.f_Pair_second = dtb__1351 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1351) dtb__1350) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) expr) expected) dtb__1337) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1352) -> (match dtb__1352 with
  | { B_dData_dPair.f_Pair_first = dtb__1353; B_dData_dPair.f_Pair_second = dtb__1354 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1354) dtb__1353) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EStr (dtb__1355, dtb__1356) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1357, dtb__1358) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1359) -> (match dtb__1359 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1360, dtb__1361) -> (match dtb__1361 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1360 = Base_dIntrinsics.v_strTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__1355)); B_dData_dPair.f_Pair_second = ec })) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1356) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1362) -> (match dtb__1362 with
  | { B_dData_dPair.f_Pair_first = dtb__1363; B_dData_dPair.f_Pair_second = dtb__1364 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1364) dtb__1363) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1356) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1365) -> (match dtb__1365 with
  | { B_dData_dPair.f_Pair_first = dtb__1366; B_dData_dPair.f_Pair_second = dtb__1367 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1367) dtb__1366) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1356) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1368) -> (match dtb__1368 with
  | { B_dData_dPair.f_Pair_first = dtb__1369; B_dData_dPair.f_Pair_second = dtb__1370 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1370) dtb__1369) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) expr) expected) dtb__1356) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1371) -> (match dtb__1371 with
  | { B_dData_dPair.f_Pair_first = dtb__1372; B_dData_dPair.f_Pair_second = dtb__1373 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1373) dtb__1372) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EInt (dtb__1374, dtb__1375) -> (let nd_uscrut9 = ((Elab_dTypes.v_forceVal ec) expected) in (match nd_uscrut9 with
  | Core_dTerm.C_Value_VMeta (dtb__1376, dtb__1377) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Core_dTerm.C_Value_VNeutral (dtb__1378) -> (match dtb__1378 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1379, dtb__1380) -> (match dtb__1380 with
  | B_dData_dList.C_List_Nil -> (if (dtb__1379 = Base_dIntrinsics.v_natTypeName) then ((Base_dCommon.v_bind ((v_natLitResult dtb__1375) dtb__1374)) (fun (t : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = t; B_dData_dPair.f_Pair_second = ec })))) else (if (dtb__1379 = Base_dIntrinsics.v_intTypeName) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (let nd_uscrut14 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1375) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1381) -> (match dtb__1381 with
  | { B_dData_dPair.f_Pair_first = dtb__1382; B_dData_dPair.f_Pair_second = dtb__1383 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1383) dtb__1382) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (let nd_uscrut13 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1375) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1384) -> (match dtb__1384 with
  | { B_dData_dPair.f_Pair_first = dtb__1385; B_dData_dPair.f_Pair_second = dtb__1386 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1386) dtb__1385) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut11 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1375) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1387) -> (match dtb__1387 with
  | { B_dData_dPair.f_Pair_first = dtb__1388; B_dData_dPair.f_Pair_second = dtb__1389 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1389) dtb__1388) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let nd_uscrut10 = ((((((((v_literalTraitLower globals) ctx) ec) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) expr) expected) dtb__1375) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1390) -> (match dtb__1390 with
  | { B_dData_dPair.f_Pair_first = dtb__1391; B_dData_dPair.f_Pair_second = dtb__1392 } -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1392) dtb__1391) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dRast.C_Expr_EVar (dtb__1393, dtb__1394) -> (if (Frontend_dReserved.v_isHoleName (Frontend_dRast_dName.v_rnameKey dtb__1393)) then (let pmeta = (((((Elab_dMetaSpans.v_newHoleMeta ctx) ec) dtb__1394) expected) (Frontend_dReserved.v_holeNameOf (Frontend_dRast_dName.v_rnameKey dtb__1393))) in (match pmeta with
  | { B_dData_dPair.f_Pair_first = dtb__1395; B_dData_dPair.f_Pair_second = dtb__1396 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1395; B_dData_dPair.f_Pair_second = dtb__1396 }))
  | _ -> failwith "DT: impossible branch"
)) else (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1393)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1394) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1393))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1393)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1394))) B_dData_dList.C_List_Nil) expected) dtb__1394))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1393)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1393))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1393))) expected) dtb__1394)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1394))) B_dData_dList.C_List_Nil) expected) dtb__1394))) else ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar (dtb__1393, dtb__1394))) B_dData_dList.C_List_Nil) expected) dtb__1394))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
))))
# 2280 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 2382 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_expandBind ec)) binds)) (fun (binds2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs rec_u) binds2)) (fun (_u : int) -> ((((((((v_inferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 2392 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetGoFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : bool) (mc7 : Core_dTerm.t_Value) (mc8 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1397, dtb__1398) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((((v_checkLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1397) dtb__1398) mc5) mc6) mc7) mc8))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 2401 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetOneFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (bnd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (B_dData_dPair.v_firstOf bnd) with
  | Frontend_dRast.C_Pat_PVar (dtb__1399, dtb__1400) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut14 = pv in (match nd_uscrut14 with
  | { B_dData_dPair.f_Pair_first = dtb__1401; B_dData_dPair.f_Pair_second = dtb__1402 } -> (match dtb__1402 with
  | { B_dData_dPair.f_Pair_first = dtb__1403; B_dData_dPair.f_Pair_second = dtb__1404 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1403) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1399) dtb__1403) ctx) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx2) dtb__1404) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1405; B_dData_dPair.f_Pair_second = dtb__1406 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1406) ctx) dtb__1403) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1405) else dtb__1405) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb__1399, rig, B_dData_dMaybe.C_Maybe_Nothing, ((Base_dSource.v_spanAtName dtb__1399) dtb__1400), bodyTerm2)), dtb__1401, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1406 })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dRast.C_Pat_PWild (dtb__1407) -> (let value = (B_dData_dPair.v_secondOf bnd) in ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pv in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1408; B_dData_dPair.f_Pair_second = dtb__1409 } -> (match dtb__1409 with
  | { B_dData_dPair.f_Pair_first = dtb__1410; B_dData_dPair.f_Pair_second = dtb__1411 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1410) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (fuel - 1)) globals) ctx) dtb__1411) rest) body) rec_u) expected) sp)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1412; B_dData_dPair.f_Pair_second = dtb__1413 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, dtb__1407, (((Core_dTerm.v_shift 0) 1) dtb__1412))), dtb__1408, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb__1413 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase ((B_dData_dPair.v_secondOf bnd), (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf bnd); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (rest, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan (B_dData_dPair.v_firstOf bnd))))) expected)
)))
# 2449 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetGoFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (binds : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut8 = binds in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1414, dtb__1415) -> (match dtb__1414 with
  | { B_dData_dPair.f_Pair_first = dtb__1416; B_dData_dPair.f_Pair_second = dtb__1417 } -> (match dtb__1416 with
  | Frontend_dRast.C_Pat_PVar (dtb__1418, dtb__1419) -> (((((((((((v_inferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1418) dtb__1417) dtb__1415) body) rec_u) ((Base_dSource.v_spanAtName dtb__1418) dtb__1419)) sp)
  | Frontend_dRast.C_Pat_PWild (dtb__1420) -> ((((((((((v_inferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1417) dtb__1415) body) rec_u) dtb__1420) sp)
  | _ -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_ECase (dtb__1417, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1416; B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_ELet (dtb__1415, body, rec_u, sp)) }, B_dData_dList.C_List_Nil)), (Frontend_dRast.v_patSpan dtb__1416))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
))))
# 2463 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetBoundFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut12 = pv in (match nd_uscrut12 with
  | { B_dData_dPair.f_Pair_first = dtb__1421; B_dData_dPair.f_Pair_second = dtb__1422 } -> (match dtb__1422 with
  | { B_dData_dPair.f_Pair_first = dtb__1423; B_dData_dPair.f_Pair_second = dtb__1424 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1423) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue name) dtb__1423) ctx) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx2) dtb__1424) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut24 = pb in (match nd_uscrut24 with
  | { B_dData_dPair.f_Pair_first = dtb__1425; B_dData_dPair.f_Pair_second = dtb__1426 } -> (match dtb__1426 with
  | { B_dData_dPair.f_Pair_first = dtb__1427; B_dData_dPair.f_Pair_second = dtb__1428 } -> (let bodyTerm2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1428) ctx) dtb__1423) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1425) else dtb__1425) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (name, rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, bodyTerm2)), dtb__1421, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1427; B_dData_dPair.f_Pair_second = dtb__1428 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2485 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetIgnoredFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (value : Frontend_dRast.t_Expr) (rest : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (rec_u : bool) (binderSp : Base_dSource.t_Span) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun (pv : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut11 = pv in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__1429; B_dData_dPair.f_Pair_second = dtb__1430 } -> (match dtb__1430 with
  | { B_dData_dPair.f_Pair_first = dtb__1431; B_dData_dPair.f_Pair_second = dtb__1432 } -> (let rig = ((Elab_dMeta.v_rigOfLinearValue ec) dtb__1431) in ((Base_dCommon.v_bind ((((((((v_inferLetFuel (fuel - 1)) globals) ctx) dtb__1432) rest) body) rec_u) sp)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pb in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1433; B_dData_dPair.f_Pair_second = dtb__1434 } -> (match dtb__1434 with
  | { B_dData_dPair.f_Pair_first = dtb__1435; B_dData_dPair.f_Pair_second = dtb__1436 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", rig, B_dData_dMaybe.C_Maybe_Nothing, binderSp, (((Core_dTerm.v_shift 0) 1) dtb__1433))), dtb__1429, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1435; B_dData_dPair.f_Pair_second = dtb__1436 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2578 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelHint = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1437) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1438) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1439) -> ((Base_dCommon.v_bind (v_appAtCallExpr expr)) (fun (callExpr : Frontend_dRast.t_Expr) -> (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match expr with
  | Frontend_dRast.C_Expr_EApp (dtb__1440, dtb__1441, dtb__1442) -> ((((((((v_inferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1440) dtb__1441) dtb__1442) (B_dData_dMaybe.C_Maybe_Just (expected)))
  | _ -> (((((v_inferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2864 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkByInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((((v_inferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__1443) -> (match dtb__1443 with
  | { B_dData_dPair.f_Pair_first = dtb__1444; B_dData_dPair.f_Pair_second = dtb__1445 } -> (match dtb__1445 with
  | { B_dData_dPair.f_Pair_first = dtb__1446; B_dData_dPair.f_Pair_second = dtb__1447 } -> (match ((((v_coerceTerm dtb__1447) expected) dtb__1446) dtb__1444) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1448) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1448; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1447) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1447) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1446) with
  | Base_dDiag.C_Check_ErrC (dtb__1449) -> (match ((((((v_tryEffLift ctx) globals) dtb__1447) expected) dtb__1446) dtb__1444) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1450) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__1450); B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) (B_dData_dPair.v_secondOf dtb__1450)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_unhandledEffectLabel dtb__1447) expected) dtb__1446) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1451) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> ((Elab_dTerm_dSupport.v_withEffectLabels dtb__1451) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("actual: " ^ (Core_dEval.v_showValue dtb__1446))))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("expected: " ^ (Core_dEval.v_showValue expected))))) d))))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((v_joinEffectLabels dtb__1451)))) (v_joinEffectLabels dtb__1451)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan (Frontend_dRast.v_exprSpan expr)) dtb__1449)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__1452) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1444; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1452) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__1453) -> (Base_dDiag.C_Check_ErrC (dtb__1453))
  | _ -> failwith "DT: impossible branch"
))))
# 2885 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLamFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ctx) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : Frontend_dRast.t_Expr) (mc6 : Core_dTerm.t_Value) (mc7 : Base_dSource.t_Span) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1454, dtb__1455) -> (match dtb__1454 with
  | { B_dData_dPair.f_Pair_first = dtb__1456; B_dData_dPair.f_Pair_second = dtb__1457 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else (let forced = ((Elab_dTypes.v_forceVal mc3) mc6) in (let nd_uscrut16 = forced in (match nd_uscrut16 with
  | Core_dTerm.C_Value_VMeta (dtb__1458, dtb__1459) -> (match dtb__1459 with
  | B_dData_dList.C_List_Nil -> (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) mc3) with
  | { B_dData_dPair.f_Pair_first = dtb__1460; B_dData_dPair.f_Pair_second = dtb__1461 } -> (let domVal = ((Elab_dTypes.v_evalCtx mc2) dtb__1460) in (match (((Elab_dMetaSpans.v_newMetaAt mc7) mc2) dtb__1461) with
  | { B_dData_dPair.f_Pair_first = dtb__1462; B_dData_dPair.f_Pair_second = dtb__1463 } -> (let piVal = (Core_dTerm.C_Value_VPi ("_", false, Core_dTerm.C_Rig_RigOmega, domVal, { Core_dTerm.f_Closure_closureEnv = B_dData_dList.C_List_Nil; Core_dTerm.f_Closure_closureBody = dtb__1462 })) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__1463)) (Elab_dTypes.v_ecSolsP dtb__1463)) lvl) dtb__1458) B_dData_dList.C_List_Nil) piVal) with
  | Base_dDiag.C_Check_OkC (dtb__1464) -> ((((((((v_checkLamFuel (mc0 - 1)) mc1) mc2) ((Elab_dTypes.v_ecPutSols dtb__1463) (Core_dTerm.v_solsList dtb__1464))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1456; B_dData_dPair.f_Pair_second = dtb__1457 }, dtb__1455))) mc5) piVal) mc7)
  | Base_dDiag.C_Check_ErrC (dtb__1465) -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
)
  | Core_dTerm.C_Value_VPi (dtb__1466, dtb__1467, dtb__1468, dtb__1469, dtb__1470) -> (if dtb__1467 then (if (if ((Elab_dDict.v_isDictDomain mc3) dtb__1469) then true else (((Elab_dMeta.v_isImplicitDomain mc2) mc3) dtb__1469)) then (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1466) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1466) dtb__1469) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1470) v) in ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1456; B_dData_dPair.f_Pair_second = dtb__1457 }, dtb__1455))) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1471; B_dData_dPair.f_Pair_second = dtb__1472 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1466, dtb__1468, ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1469)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))), Base_dSource.v_spanEmpty, dtb__1471)); B_dData_dPair.f_Pair_second = dtb__1472 }))
  | _ -> failwith "DT: impossible branch"
))))))) else ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)) else (let lvl = (Elab_dTypes.v_ctxDepth mc2) in (let v = ((Elab_dMeta.v_freshVarValue dtb__1466) lvl) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1456) dtb__1469) mc2) in (let expected2 = ((Core_dEval.v_applyClosure dtb__1470) v) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain mc3) mc7) dtb__1456) dtb__1468) dtb__1469)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1455) mc5) expected2) mc7)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1473; B_dData_dPair.f_Pair_second = dtb__1474 } -> (let inner2 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb__1474) mc2) dtb__1469) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb__1473) else dtb__1473) in (let slot0 = ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote lvl) dtb__1469)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (lvl + 1)) expected2)))) in (let slot = (if ((Elab_dMeta.v_ctxHasLinear mc3) mc2) then (if (((Elab_dMeta.v_termHasOuterLinear mc3) ctx2) dtb__1473) then (Core_dTerm.v_markLamLinear slot0) else slot0) else slot0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__1456, lamRig, slot, dtb__1457, inner2)); B_dData_dPair.f_Pair_second = dtb__1474 })))))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 mc7) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2974 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = expr in (match nd_uscrut5 with
  | Frontend_dRast.C_Expr_EApp (dtb__1475, dtb__1476, dtb__1477) -> (match dtb__1475 with
  | Frontend_dRast.C_Expr_EVar (dtb__1478, dtb__1479) -> (if (if ((Frontend_dRast_dName.v_rnameKey dtb__1478) = "->") then true else ((Frontend_dRast_dName.v_rnameKey dtb__1478) = "Type")) then (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1478)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1480) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1478)) then (match (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1478)) dtb__1476) dtb__1479) with
  | Base_dDiag.C_Check_ErrC (dtb__1481) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dDiag.C_Check_OkC (dtb__1482) -> (Base_dDiag.C_Check_OkC (dtb__1482))
  | _ -> failwith "DT: impossible branch"
) else (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Frontend_dRast.C_Expr_EVar (dtb__1483, dtb__1484) -> (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1483)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1485) -> (((((v_checkTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_typeLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1483)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1486) -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1486))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1487) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec) (Frontend_dRast_dName.v_rnameKey dtb__1483)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1487; B_dData_dPair.f_Pair_second = ec } }))
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
# 3007 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeInferFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut6 = p in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__1488; B_dData_dPair.f_Pair_second = dtb__1489 } -> (match dtb__1489 with
  | { B_dData_dPair.f_Pair_first = dtb__1490; B_dData_dPair.f_Pair_second = dtb__1491 } -> (let forced = ((Elab_dTypes.v_forceVal dtb__1491) dtb__1490) in (match (Core_dTerm.v_typeLevelOf forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1492) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1488; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1492; B_dData_dPair.f_Pair_second = dtb__1491 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedType (((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1490)))) ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth ctx)) dtb__1490))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 3025 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1493, dtb__1494) -> (if (Frontend_dReserved.v_isOverCtorName (Frontend_dRast_dName.v_rnameKey dtb__1493)) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor ec) dtb__1494) (B_dData_dMaybe.C_Maybe_Just (expected))) (Frontend_dReserved.v_overCtorShort (Frontend_dRast_dName.v_rnameKey dtb__1493))) (Frontend_dReserved.v_overCtorTargets (Frontend_dRast_dName.v_rnameKey dtb__1493)))) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1494))) args) expected) sp))) else (if (Frontend_dReserved.v_isOverValueName (Frontend_dRast_dName.v_rnameKey dtb__1493)) then ((Base_dCommon.v_bind (((((((v_resolveOverValueAppTarget globals) ctx) ec) (Frontend_dReserved.v_overValueShort (Frontend_dRast_dName.v_rnameKey dtb__1493))) (Frontend_dReserved.v_overValueTargets (Frontend_dRast_dName.v_rnameKey dtb__1493))) expected) sp)) (fun (t : string) -> ((((((((v_checkAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName t), dtb__1494))) args) expected) sp))) else (match ((Elab_dTypes.v_ctxLookup (Frontend_dRast_dName.v_rnameKey dtb__1493)) ctx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1495) -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((Elab_dMeta.v_isSortVal ec) expected) then (match ((Elab_dMeta.v_typeNameOfDualCtor ec) (Frontend_dRast_dName.v_rnameKey dtb__1493)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1496) -> ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1496) args) expected) dtb__1494)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1493)) then ((((((((v_checkAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1493)) args) expected) dtb__1494) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1493)) args) expected) sp) dtb__1494))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_checkAppByValueFuel fuel) globals) ctx) ec) fn) (Frontend_dRast_dName.v_rnameKey dtb__1493)) args) expected) sp) dtb__1494))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 3058 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppByValueFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (vsp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut10 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1497) -> (match dtb__1497 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__1498) -> ((((((((v_checkAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__1499) -> ((((((((v_checkAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
# 3071 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((v_inferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__1500; B_dData_dPair.f_Pair_second = dtb__1501 } -> (match dtb__1501 with
  | { B_dData_dPair.f_Pair_first = dtb__1502; B_dData_dPair.f_Pair_second = dtb__1503 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1503) (Elab_dTypes.v_ctxDepth ctx)) expected) (Core_dTerm.C_Value_VType (dtb__1502)))) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1500; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 3082 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppUnderTypeFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match (((Elab_dMeta.v_typeHeadLookup globals) ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1504) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1504)) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = pa in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__1505; B_dData_dPair.f_Pair_second = dtb__1506 } -> (match dtb__1506 with
  | { B_dData_dPair.f_Pair_first = dtb__1507; B_dData_dPair.f_Pair_second = dtb__1508 } -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb__1508) dtb__1507)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1509) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1508) name) dtb__1505); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__1509; B_dData_dPair.f_Pair_second = dtb__1508 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 3143 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeEqAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isEqMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1510, dtb__1511) -> (match dtb__1511 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1512, dtb__1513) -> (match dtb__1513 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1510)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1514; B_dData_dPair.f_Pair_second = dtb__1515 } -> (match dtb__1515 with
  | { B_dData_dPair.f_Pair_first = dtb__1516; B_dData_dPair.f_Pair_second = dtb__1517 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1517) dtb__1512)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1518; B_dData_dPair.f_Pair_second = dtb__1519 } -> (match dtb__1519 with
  | { B_dData_dPair.f_Pair_first = dtb__1520; B_dData_dPair.f_Pair_second = dtb__1521 } -> (match (((((v_coerceNatOperands dtb__1521) dtb__1516) dtb__1520) dtb__1514) dtb__1518) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1522) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1522))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1522))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1522))) dtb__1521)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1521) (Elab_dTypes.v_ctxDepth ctx)) dtb__1516) dtb__1520)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeEqTy globals) ctx) name) dtb__1514) dtb__1518) sp) dtb__1516) ec3)))
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
# 3167 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeCmpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isCmpMethod ec) name) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1523, dtb__1524) -> (match dtb__1524 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1525, dtb__1526) -> (match dtb__1526 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1523)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut16 = pa in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__1527; B_dData_dPair.f_Pair_second = dtb__1528 } -> (match dtb__1528 with
  | { B_dData_dPair.f_Pair_first = dtb__1529; B_dData_dPair.f_Pair_second = dtb__1530 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) dtb__1530) dtb__1525)) (fun (pb : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut26 = pb in (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__1531; B_dData_dPair.f_Pair_second = dtb__1532 } -> (match dtb__1532 with
  | { B_dData_dPair.f_Pair_first = dtb__1533; B_dData_dPair.f_Pair_second = dtb__1534 } -> (match (((((v_coerceNatOperands dtb__1534) dtb__1529) dtb__1533) dtb__1527) dtb__1531) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1535) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__1535))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__1535))) sp) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1535))) dtb__1534)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1534) (Elab_dTypes.v_ctxDepth ctx)) dtb__1529) dtb__1533)) (fun (ec3 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeCmpTy globals) ctx) name) dtb__1527) dtb__1531) sp) dtb__1529) ec3)))
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
# 3193 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeOpAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (name = Base_dIntrinsics.v_interpMethodName) then (((((((v_specializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Base_dCommon.v_bind (((((((v_specializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1536) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1536))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r2 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1537) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1537))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun (r3 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match r3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1538) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__1538))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_specializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 3226 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeInterpPrimApp = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1539, dtb__1540) -> (match dtb__1540 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (fuel - 1)) globals) ctx) ec) dtb__1539)) (fun (pa : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1541; B_dData_dPair.f_Pair_second = dtb__1542 } -> (match dtb__1542 with
  | { B_dData_dPair.f_Pair_first = dtb__1543; B_dData_dPair.f_Pair_second = dtb__1544 } -> (let tyv = ((Elab_dTypes.v_forceVal dtb__1544) dtb__1543) in (if (v_isStringTyValue tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1541; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = tyv; B_dData_dPair.f_Pair_second = dtb__1544 } })))) else (if (if ((v_isIntTy dtb__1544) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1544) Base_dIntrinsics.v_intTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm dtb__1541); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1544 } })))) else (if (if ((v_isNatTy dtb__1544) tyv) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb__1544) Base_dIntrinsics.v_natTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm (v_natToIntTerm dtb__1541)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1544 } })))) else (if ((v_isFloatTy dtb__1544) tyv) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromFloatTerm dtb__1541); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb__1544 } })))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 3266 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeBoolAppFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then (let nd_uscrut7 = args in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1545, dtb__1546) -> (match dtb__1546 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1547, dtb__1548) -> (match dtb__1548 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) ec) dtb__1545) Elab_dPrelude.v_boolTyValue)) (fun (pa : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__1549; B_dData_dPair.f_Pair_second = dtb__1550 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1550) dtb__1547) Elab_dPrelude.v_boolTyValue)) (fun (pb : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pb with
  | { B_dData_dPair.f_Pair_first = dtb__1551; B_dData_dPair.f_Pair_second = dtb__1552 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((Elab_dDict.v_boolShortCircuit name) dtb__1549) dtb__1551); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__1552 } }))))
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
# 3287 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppGeneralFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__1553, dtb__1554) -> ((Base_dCommon.v_bind ((((((((v_specializeArithCheckFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1553)) args) expected) sp)) (fun (arith : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut11 = arith in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_skipArithSpecForExpected ec) (Frontend_dRast_dName.v_rnameKey dtb__1553)) expected) then ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast_dName.v_rnameKey dtb__1553)) args) sp)) (fun (mspec : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let nd_uscrut14 = mspec in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1555) -> (match dtb__1555 with
  | { B_dData_dPair.f_Pair_first = dtb__1556; B_dData_dPair.f_Pair_second = dtb__1557 } -> (match dtb__1557 with
  | { B_dData_dPair.f_Pair_first = dtb__1558; B_dData_dPair.f_Pair_second = dtb__1559 } -> (match ((((v_coerceTerm dtb__1559) expected) dtb__1558) dtb__1556) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1560) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1560; B_dData_dPair.f_Pair_second = dtb__1559 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1559) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1558)) (fun (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1556; B_dData_dPair.f_Pair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1561) -> (match dtb__1561 with
  | { B_dData_dPair.f_Pair_first = dtb__1562; B_dData_dPair.f_Pair_second = dtb__1563 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1562; B_dData_dPair.f_Pair_second = dtb__1563 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((v_checkByInferFuel (fuel - 1)) globals) ctx) ec) (Frontend_dRast.C_Expr_EApp (fn, args, sp))) expected)
)))
# 3570 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppCtorFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1564) -> (let nd_uscrut10 = ((((v_ctorFamilyArgs ec) ctx) dtb__1564) expected) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__1564))) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = pa in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__1565; B_dData_dPair.f_Pair_second = dtb__1566 } -> (match dtb__1566 with
  | { B_dData_dPair.f_Pair_first = dtb__1567; B_dData_dPair.f_Pair_second = dtb__1568 } -> (let ctorTerm = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1568)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1565) in (match ((((v_coerceTerm dtb__1568) expected) dtb__1567) ctorTerm) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1569) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1569; B_dData_dPair.f_Pair_second = dtb__1568 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1568) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1567) with
  | Base_dDiag.C_Check_OkC (dtb__1570) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1570)) (Core_dTerm.C_Term_TGlobal (name))) dtb__1565); B_dData_dPair.f_Pair_second = dtb__1570 }))
  | Base_dDiag.C_Check_ErrC (dtb__1571) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1571)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1571))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1572) -> (match dtb__1572 with
  | { B_dData_dPair.f_Pair_first = dtb__1573; B_dData_dPair.f_Pair_second = dtb__1574 } -> (match dtb__1574 with
  | { B_dData_dPair.f_Pair_first = dtb__1575; B_dData_dPair.f_Pair_second = dtb__1576 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (fuel - 1)) globals) ctx) dtb__1576) dtb__1575) args) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut22 = pa in (match nd_uscrut22 with
  | { B_dData_dPair.f_Pair_first = dtb__1577; B_dData_dPair.f_Pair_second = dtb__1578 } -> (match dtb__1578 with
  | { B_dData_dPair.f_Pair_first = dtb__1579; B_dData_dPair.f_Pair_second = dtb__1580 } -> (let allArgs = ((B_dData_dList.v_append dtb__1573) dtb__1577) in (match ((((v_coerceTerm dtb__1580) expected) dtb__1579) (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1580)) (Core_dTerm.C_Term_TGlobal (name))) allArgs)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1581) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__1581; B_dData_dPair.f_Pair_second = dtb__1580 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb__1580) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1579) with
  | Base_dDiag.C_Check_OkC (dtb__1582) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb__1582)) (Core_dTerm.C_Term_TGlobal (name))) allArgs); B_dData_dPair.f_Pair_second = dtb__1582 }))
  | Base_dDiag.C_Check_ErrC (dtb__1583) -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dRast.v_ctorDisplayName name), (Base_dDiag.v_diagText dtb__1583)))) (Frontend_dRast.v_ctorDisplayName name)) (Base_dDiag.v_diagText dtb__1583))
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
# 3849 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabDoChain = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (plan : t_DoPlan) (steps : t_DoChainStep B_dData_dList.t_List) (last : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut7 = steps in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1584, dtb__1585) -> (match dtb__1584 with
  | C_DoChainStep_DoChainStep (dtb__1586, dtb__1587, dtb__1588, dtb__1589) -> (match (((Elab_dMetaSpans.v_newMetaAt dtb__1588) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1590; B_dData_dPair.f_Pair_second = dtb__1591 } -> (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1590) in (let mArgTy = ((Core_dEval.v_applyValue (plan).f_DoPlan_planMVal) aVal) in (let ctx2 = (((Elab_dTypes.v_ctxBindValue dtb__1586) aVal) ctx) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1591) dtb__1588) "_") (plan).f_DoPlan_planRigE) mArgTy)) (fun (argRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (fuel - 1)) globals) ctx) dtb__1591) dtb__1587) mArgTy)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__1592; B_dData_dPair.f_Pair_second = dtb__1593 } -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb__1593) dtb__1588) dtb__1586) (plan).f_DoPlan_planInnerRig) aVal)) (fun (lamRig : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx2) dtb__1593) plan) dtb__1585) last)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1594; B_dData_dPair.f_Pair_second = dtb__1595 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((((((((v_doBindAppTerm dtb__1593) dtb__1595) ctx) dtb__1588) dtb__1589) plan) dtb__1586) aVal) dtb__1592) argRig) lamRig) dtb__1594); B_dData_dPair.f_Pair_second = dtb__1595 }))
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
# 3883 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) (expected : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut6 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1596) -> (match dtb__1596 with
  | { B_dData_dPair.f_Pair_first = dtb__1597; B_dData_dPair.f_Pair_second = dtb__1598 } -> (match dtb__1598 with
  | { B_dData_dPair.f_Pair_first = dtb__1599; B_dData_dPair.f_Pair_second = dtb__1600 } -> (let nd_uscrut17 = ((v_splitDoExpected ec) expected) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1601; B_dData_dPair.f_Pair_second = dtb__1602 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1602) with
  | { B_dData_dPair.f_Pair_first = dtb__1603; B_dData_dPair.f_Pair_second = dtb__1604 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1601) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1603) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1604) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1597) dtb__1599) dtb__1600) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1605) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1605).f_DoPlan_planEc) dtb__1605) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1606; B_dData_dPair.f_Pair_second = dtb__1607 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb__1607) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_applyValue (dtb__1605).f_DoPlan_planMVal) (dtb__1605).f_DoPlan_planAVal))) (fun (ec4 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1606; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__1608) -> (match dtb__1608 with
  | { B_dData_dPair.f_Pair_first = dtb__1609; B_dData_dPair.f_Pair_second = dtb__1610 } -> ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1597) dtb__1599) dtb__1600) dtb__1609) dtb__1610)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1611) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1611).f_DoPlan_planEc) dtb__1611) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1612; B_dData_dPair.f_Pair_second = dtb__1613 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1612; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals globals) dtb__1613) }))))
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
# 3926 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferDoBlockFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (chain : t_DoChain) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "inference") else (let nd_uscrut5 = ((((v_doBlockShapeOf globals) ctx) ec) (chain).f_DoChain_doChainCanonical) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1614) -> (match dtb__1614 with
  | { B_dData_dPair.f_Pair_first = dtb__1615; B_dData_dPair.f_Pair_second = dtb__1616 } -> (match dtb__1616 with
  | { B_dData_dPair.f_Pair_first = dtb__1617; B_dData_dPair.f_Pair_second = dtb__1618 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__1619; B_dData_dPair.f_Pair_second = dtb__1620 } -> (match (((Elab_dMetaSpans.v_newMetaAt (chain).f_DoChain_doChainSpan) ctx) dtb__1620) with
  | { B_dData_dPair.f_Pair_first = dtb__1621; B_dData_dPair.f_Pair_second = dtb__1622 } -> (let mVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1619) in (let aVal = ((Elab_dTypes.v_evalCtx ctx) dtb__1621) in (let resultTy = ((Core_dEval.v_applyValue mVal) aVal) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (fuel - 1)) globals) ctx) dtb__1622) (chain).f_DoChain_doChainSpan) (chain).f_DoChain_doChainCanonical) dtb__1615) dtb__1617) dtb__1618) mVal) aVal)) (fun (mp : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match mp with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1623) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (fuel - 1)) globals) ctx) (dtb__1623).f_DoPlan_planEc) dtb__1623) (chain).f_DoChain_doChainSteps) (chain).f_DoChain_doChainLast)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__1624; B_dData_dPair.f_Pair_second = dtb__1625 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1624; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__1625 } }))))
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

# 3106 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_checkTypeAtKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (expr : Frontend_dRast.t_Expr) (expected : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (match ((Elab_dTypes.v_forceVal ec) expected) with
  | Core_dTerm.C_Value_VType (dtb__1626) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) (((((v_checkTypeFuel 256) globals) ctx) ec) expr))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)) }))))
  | _ -> (let nd_uscrut6 = expr in (match nd_uscrut6 with
  | Frontend_dRast.C_Expr_EApp (dtb__1627, dtb__1628, dtb__1629) -> (match dtb__1627 with
  | Frontend_dRast.C_Expr_EVar (dtb__1630, dtb__1631) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1630)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1630)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1630)))) (Frontend_dRast_dName.v_rnameKey dtb__1630))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1632) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel 256) globals) ctx) ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1632)) dtb__1628) sp) B_dData_dMaybe.C_Maybe_Nothing)) (fun (pa : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = pa in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__1633; B_dData_dPair.f_Pair_second = dtb__1634 } -> (match dtb__1634 with
  | { B_dData_dPair.f_Pair_first = dtb__1635; B_dData_dPair.f_Pair_second = dtb__1636 } -> (match ((((Elab_dMeta.v_convEc dtb__1636) (Elab_dTypes.v_ctxDepth ctx)) expected) dtb__1635) with
  | Base_dDiag.C_Check_OkC (dtb__1637) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb__1637) (Frontend_dRast_dName.v_rnameKey dtb__1630)) dtb__1633); B_dData_dPair.f_Pair_second = dtb__1637 }))
  | Base_dDiag.C_Check_ErrC (dtb__1638) -> (((Base_dDiagnostics_dTc.v_tcTypeMismatch sp) (Core_dEval.v_showValue expected)) (Core_dEval.v_showValue dtb__1635))
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
  | Frontend_dRast.C_Expr_EVar (dtb__1639, dtb__1640) -> (if (((Elab_dMeta.v_isTypeName globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1639)) then (match (((Elab_dMeta.v_typeHeadLookup globals) ec) (Frontend_dRast_dName.v_rnameKey dtb__1639)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName ((Frontend_dRast_dName.v_rnameKey dtb__1639)))) (Frontend_dRast_dName.v_rnameKey dtb__1639))
  | B_dData_dMaybe.C_Maybe_Just (dtb__1641) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) expected) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__1641)))) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm ec1) (Frontend_dRast_dName.v_rnameKey dtb__1639)); B_dData_dPair.f_Pair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_checkEFuel 256) globals) ctx) ec) expr) expected))
))
))
