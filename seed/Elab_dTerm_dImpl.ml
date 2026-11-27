open Vuna_runtime
type t_PerfFamily = C_PerfFamily_PerfFamily of (string) * (string) * (string)
and t_FieldAccessPlan = { f_FieldAccessPlan_planData : Elab_dTypes.t_DtData; f_FieldAccessPlan_planCtor : Elab_dTypes.t_DtCtor; f_FieldAccessPlan_planIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_FieldAccessPlan_planRecord : string; f_FieldAccessPlan_planField : int; f_FieldAccessPlan_planFieldCount : int; f_FieldAccessPlan_planType : Core_dTerm.t_Value }
and t_UpdateAccessPlan = { f_UpdateAccessPlan_upData : Elab_dTypes.t_DtData; f_UpdateAccessPlan_upCtor : Elab_dTypes.t_DtCtor; f_UpdateAccessPlan_upIdxs : Core_dTerm.t_Value B_dData_dList.t_List; f_UpdateAccessPlan_upRecord : string; f_UpdateAccessPlan_upFieldCount : int; f_UpdateAccessPlan_upFieldIndices : int B_dData_dList.t_List; f_UpdateAccessPlan_upBodyArgs : Frontend_dAst.t_Expr B_dData_dList.t_List }
and t_DoChainStep = C_DoChainStep_DoChainStep of (string) * (Frontend_dAst.t_Expr) * (Base_dSource.t_Span) * (Base_dSource.t_Span)
and t_DoChain = { f_DoChain_doChainCanonical : string; f_DoChain_doChainSteps : t_DoChainStep B_dData_dList.t_List; f_DoChain_doChainLast : Frontend_dAst.t_Expr; f_DoChain_doChainSpan : Base_dSource.t_Span }
and t_DoBindShape = C_DoBindShape_DoBindShape of (Core_dTerm.t_Rig) * (Core_dTerm.t_Rig) * (Core_dTerm.t_Rig)
and t_DoPlan = { f_DoPlan_planBind : string; f_DoPlan_planHead : Core_dTerm.t_Term; f_DoPlan_planMTerm : Core_dTerm.t_Term; f_DoPlan_planMVal : Core_dTerm.t_Value; f_DoPlan_planAVal : Core_dTerm.t_Value; f_DoPlan_planDictTerm : Core_dTerm.t_Term; f_DoPlan_planRigE : Core_dTerm.t_Rig; f_DoPlan_planRigL : Core_dTerm.t_Rig; f_DoPlan_planInnerRig : Core_dTerm.t_Rig; f_DoPlan_planEc : Elab_dTypes.t_Ec }

# 45 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_branchBinderOpaque = (fun (dtb_u_u1 : Elab_dTypes.t_Ec) (dtb_u_u2 : Elab_dTypes.t_Ctx) (dtb_u_u3 : int) -> (let dtb_u_u4 = ((Elab_dMeta.v_ctxItemAt dtb_u_u3) (dtb_u_u2).Elab_dTypes.f_Ctx_ctxItems) in (match dtb_u_u4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u5) -> (match dtb_u_u5 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u6; B_dData_dPair.f_Pair_second = dtb_u_u7 } -> (let dtb_u_u8 = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u2)) (((Core_dTerm.v_shift 0) (dtb_u_u3 + 1)) dtb_u_u7)) in (let dtb_u_u9 = (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u1) dtb_u_u2) dtb_u_u8) in dtb_u_u9))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 37 "Vuna/Compiler/Elab/Term/Impl.vuna"
let[@tail_mod_cons] rec v_opaqueBranchIndicesGo = (fun (dtb_u_u10 : Elab_dTypes.t_Ec) (dtb_u_u11 : Elab_dTypes.t_Ctx) (dtb_u_u12 : int) (dtb_u_u13 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u14 : int) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u16) -> (if (((v_branchBinderOpaque dtb_u_u10) dtb_u_u11) ((dtb_u_u12 - 1) - dtb_u_u14)) then (B_dData_dList.C_List__x58__x58_ (((dtb_u_u12 - 1) - dtb_u_u14), (((((v_opaqueBranchIndicesGo dtb_u_u10) dtb_u_u11) dtb_u_u12) dtb_u_u16) (dtb_u_u14 + 1)))) else (((((v_opaqueBranchIndicesGo dtb_u_u10) dtb_u_u11) dtb_u_u12) dtb_u_u16) (dtb_u_u14 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opaqueBranchIndices = (fun (dtb_u_u17 : Elab_dTypes.t_Ec) (dtb_u_u18 : Elab_dTypes.t_Ctx) (dtb_u_u19 : int) (dtb_u_u20 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_opaqueBranchIndicesGo dtb_u_u17) dtb_u_u18) dtb_u_u19) dtb_u_u20) 0))

# 60 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFieldLabels = (fun (dtb_u_u21 : Elab_dTypes.t_DtData) (dtb_u_u22 : Elab_dTypes.t_DtCtor) -> (if (Elab_dTypes.v_dtDataIsRecord dtb_u_u21) then ((B_dData_dList.v_map Elab_dTypes.v_dtFieldName) (Elab_dTypes.v_dtDataFields dtb_u_u21)) else (Elab_dCase.v_ctorExplicitNames (Elab_dTypes.v_dtCtorType dtb_u_u22))))

# 188 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_needsMatrixCase = (fun (dtb_u_u23 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (Elab_dCase.v_anyNestedPat dtb_u_u23) then true else (B_dData_dList.v_hasDupNames (Elab_dCase.v_altNames dtb_u_u23))))

# 366 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitCaseAlts = (fun (dtb_u_u24 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u24 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u25, dtb_u_u26) -> (match dtb_u_u25 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u27; B_dData_dPair.f_Pair_second = dtb_u_u28 } -> (match dtb_u_u27 with
  | Frontend_dAst.C_Pat_PInt (dtb_u_u29, dtb_u_u30) -> (v_natLitCaseAlts dtb_u_u26)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u31, dtb_u_u32) -> (v_natLitCaseAlts dtb_u_u26)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u33) -> (v_natLitCaseAlts dtb_u_u26)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitCaseHasCatchAll = (fun (dtb_u_u34 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u34 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> (match dtb_u_u35 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u37; B_dData_dPair.f_Pair_second = dtb_u_u38 } -> (match dtb_u_u37 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u39, dtb_u_u40) -> true
  | Frontend_dAst.C_Pat_PWild (dtb_u_u41) -> true
  | _ -> (v_natLitCaseHasCatchAll dtb_u_u36)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfShortOf = (fun (dtb_u_u42 : string) -> (if ((B_dData_dString.v_endsWith "Op") dtb_u_u42) then (let dtb_u_u43 = (String.length dtb_u_u42) in (if (dtb_u_u43 > 2) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring 0) (B_dData_dNat.v_fromIntClamp (dtb_u_u43 - 2))) dtb_u_u42))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing))

# 522 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfCanonical = (fun (dtb_u_u44 : string) -> (match (v_perfShortOf (Base_dSource.v_lastSeg dtb_u_u44)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u45) -> (B_dData_dMaybe.C_Maybe_Just ((C_PerfFamily_PerfFamily (dtb_u_u44, (Base_dSource.v_prefixOfName dtb_u_u44), dtb_u_u45))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_perfFamilyOfValue = (fun (dtb_u_u46 : Elab_dTypes.t_Ec) (dtb_u_u47 : Core_dTerm.t_Value) -> (let dtb_u_u48 = ((Elab_dTypes.v_forceVal dtb_u_u46) dtb_u_u47) in (match dtb_u_u48 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u49) -> (match dtb_u_u49 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u50, dtb_u_u51) -> (v_perfFamilyOfCanonical dtb_u_u50)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 537 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performOperand = (fun (dtb_u_u52 : Frontend_dAst.t_Expr) -> (match dtb_u_u52 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u53, dtb_u_u54, dtb_u_u55) -> (match dtb_u_u53 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u56, dtb_u_u57) -> (match dtb_u_u54 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u58, dtb_u_u59) -> (match dtb_u_u59 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u60 = (Frontend_dReserved.v_classify dtb_u_u56) in (match dtb_u_u60 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u61) -> (match dtb_u_u61 with
  | Frontend_dReserved.C_Reserved_RsPerform -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u58; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u55) }))
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
let v_instArgOperand = (fun (dtb_u_u62 : Frontend_dAst.t_Expr) -> (match dtb_u_u62 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u63, dtb_u_u64, dtb_u_u65) -> (match dtb_u_u63 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u66, dtb_u_u67) -> (match dtb_u_u64 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u68, dtb_u_u69) -> (match dtb_u_u69 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u70 = (Frontend_dReserved.v_classify dtb_u_u66) in (match dtb_u_u70 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u71) -> (match dtb_u_u71 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u68))
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
let v_appAtOperand = (fun (dtb_u_u72 : Frontend_dAst.t_Expr) -> (match dtb_u_u72 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u73, dtb_u_u74, dtb_u_u75) -> (match dtb_u_u73 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u76, dtb_u_u77) -> (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (let dtb_u_u82 = (Frontend_dReserved.v_classify dtb_u_u76) in (match dtb_u_u82 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u83) -> (match dtb_u_u83 with
  | Frontend_dReserved.C_Reserved_RsAppAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u78; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u80; B_dData_dPair.f_Pair_second = dtb_u_u81 } }))
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
let v_appAtCallExpr = (fun (dtb_u_u84 : Frontend_dAst.t_Expr) -> (match dtb_u_u84 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u85, dtb_u_u86, dtb_u_u87) -> (match dtb_u_u85 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u88, dtb_u_u89) -> (match dtb_u_u86 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u91) -> (match dtb_u_u91 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u92, dtb_u_u93) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb_u_u90, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsInstArg), dtb_u_u87)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u92, B_dData_dList.C_List_Nil)), dtb_u_u87)), dtb_u_u93)), dtb_u_u87))))
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
)
  | _ -> (Base_dDiag.v_icInternal "malformed @ marker")
))

# 589 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOperand = (fun (dtb_u_u94 : Frontend_dAst.t_Expr) -> (match dtb_u_u94 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u95, dtb_u_u96, dtb_u_u97) -> (match dtb_u_u95 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u98, dtb_u_u99) -> (match dtb_u_u96 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u100, dtb_u_u101) -> (match dtb_u_u101 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u102, dtb_u_u103) -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (match dtb_u_u105 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u106 = (Frontend_dReserved.v_classify dtb_u_u98) in (match dtb_u_u106 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> (match dtb_u_u107 with
  | Frontend_dReserved.C_Reserved_RsHandle -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u100; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u102; B_dData_dPair.f_Pair_second = dtb_u_u104 } }))
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
let v_handleFamilyOfCtor = (fun (dtb_u_u108 : Elab_dTypes.t_Ec) (dtb_u_u109 : string) (dtb_u_u110 : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_ctorFamilyNameOf dtb_u_u108) dtb_u_u109) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u111) -> (Base_dDiag.C_Check_OkC (dtb_u_u111))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u110) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u109))) dtb_u_u109)
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamily = (fun (dtb_u_u112 : Elab_dTypes.t_Ec) (dtb_u_u113 : string) (dtb_u_u114 : Base_dSource.t_Span) -> (let dtb_u_u115 = (Frontend_dReserved.v_classify dtb_u_u113) in (match dtb_u_u115 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u116) -> (match dtb_u_u116 with
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u117, dtb_u_u118) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor dtb_u_u112) dtb_u_u114) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u117) dtb_u_u118)) (fun (dtb_u_u119 : string) -> (((v_handleFamilyOfCtor dtb_u_u112) dtb_u_u119) dtb_u_u114)))
  | _ -> (((v_handleFamilyOfCtor dtb_u_u112) dtb_u_u113) dtb_u_u114)
)
  | _ -> (((v_handleFamilyOfCtor dtb_u_u112) dtb_u_u113) dtb_u_u114)
)))

# 614 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilyOfPat = (fun (dtb_u_u120 : Elab_dTypes.t_Ec) (dtb_u_u121 : Frontend_dAst.t_Pat) -> (match dtb_u_u121 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u122, dtb_u_u123, dtb_u_u124) -> (((v_handleClauseFamily dtb_u_u120) dtb_u_u122) (Frontend_dAst.v_nodeRefSpan dtb_u_u124))
  | _ -> (Base_dDiag.v_icInternal "handle mirror case pattern is not a constructor")
))

# 619 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_handleCheckFamilies = (fun (dtb_u_u125 : Elab_dTypes.t_Ec) (dtb_u_u126 : string) (dtb_u_u127 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u127 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u128, dtb_u_u129) -> (match dtb_u_u128 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u130; B_dData_dPair.f_Pair_second = dtb_u_u131 } -> (match ((v_handleClauseFamilyOfPat dtb_u_u125) dtb_u_u130) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u132) -> (Base_dDiag.C_Check_ErrC (dtb_u_u132))
  | Base_dDiag.C_Check_OkC (dtb_u_u133) -> (if (dtb_u_u133 = dtb_u_u126) then (((v_handleCheckFamilies dtb_u_u125) dtb_u_u126) dtb_u_u129) else ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_patSpan dtb_u_u130)) (Base_dDiagnostics_dTc.C_TcErr_HandleClauseFamilyMismatch (dtb_u_u126, dtb_u_u133))) dtb_u_u126) dtb_u_u133))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u126))
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleClauseFamilies = (fun (dtb_u_u134 : Elab_dTypes.t_Ec) (dtb_u_u135 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u135 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u136, dtb_u_u137) -> (match dtb_u_u136 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u138; B_dData_dPair.f_Pair_second = dtb_u_u139 } -> (match ((v_handleClauseFamilyOfPat dtb_u_u134) dtb_u_u138) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u140) -> (Base_dDiag.C_Check_ErrC (dtb_u_u140))
  | Base_dDiag.C_Check_OkC (dtb_u_u141) -> (((v_handleCheckFamilies dtb_u_u134) dtb_u_u141) dtb_u_u137)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isUniverseTerm = (fun (dtb_u_u142 : Core_dTerm.t_Term) -> (match dtb_u_u142 with
  | Core_dTerm.C_Term_TType (dtb_u_u143) -> true
  | _ -> false
))

# 649 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_countOpArrows = (fun (dtb_u_u144 : Core_dTerm.t_Term) -> (match dtb_u_u144 with
  | Core_dTerm.C_Term_TType (dtb_u_u145) -> (B_dData_dMaybe.C_Maybe_Just (0))
  | Core_dTerm.C_Term_TPi (dtb_u_u146, dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150) -> (if dtb_u_u147 then (v_countOpArrows dtb_u_u150) else (if (v_isUniverseTerm dtb_u_u149) then (match (v_countOpArrows dtb_u_u150) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u151) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u151 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 643 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArity = (fun (dtb_u_u152 : Core_dTerm.t_Term) -> (match (v_countOpArrows dtb_u_u152) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u153) -> (if (dtb_u_u153 >= 1) then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u153 - 1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 668 "Vuna/Compiler/Elab/Term/Impl.vuna"
let[@tail_mod_cons] rec v_handleHoleArgs = (fun (dtb_u_u154 : int) (dtb_u_u155 : Frontend_dAst.t_NodeRef) -> (if (dtb_u_u154 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("_", dtb_u_u155)), ((v_handleHoleArgs (dtb_u_u154 - 1)) dtb_u_u155)))))

# 672 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpArg = (fun (dtb_u_u156 : string) (dtb_u_u157 : int) (dtb_u_u158 : Frontend_dAst.t_NodeRef) -> (if (dtb_u_u157 <= 0) then (Frontend_dAst.C_Expr_EVar (dtb_u_u156, dtb_u_u158)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u156, dtb_u_u158)), ((v_handleHoleArgs dtb_u_u157) dtb_u_u158), dtb_u_u158))))

# 678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleSigArg = (fun (dtb_u_u159 : string) (dtb_u_u160 : int) (dtb_u_u161 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effSigFnName, dtb_u_u161)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleSigBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((((v_handleOpArg dtb_u_u159) dtb_u_u160) dtb_u_u161), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleSigBinderName, dtb_u_u161)), B_dData_dList.C_List_Nil)), dtb_u_u161)), dtb_u_u161)), B_dData_dList.C_List_Nil)), dtb_u_u161)))

# 697 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleOpKind = (fun (dtb_u_u162 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u163 : Elab_dTypes.t_Ec) (dtb_u_u164 : string) -> (match ((Elab_dMeta.v_dtDataLookup dtb_u_u164) (Elab_dTypes.v_ecDatas dtb_u_u163)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u165) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDataKind dtb_u_u165)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Elab_dMeta.v_globalsLookup dtb_u_u164) dtb_u_u162) dtb_u_u163)
  | _ -> failwith "DT: impossible branch"
))

# 704 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleRetArg = (fun (dtb_u_u166 : Frontend_dAst.t_Expr) -> (match dtb_u_u166 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u167, dtb_u_u168) -> (let dtb_u_u169 = (Frontend_dReserved.v_classify dtb_u_u167) in (match dtb_u_u169 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u170) -> (match dtb_u_u170 with
  | Frontend_dReserved.C_Reserved_RsHandleNoRet -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleRetBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleRetBinderName, dtb_u_u168)), dtb_u_u168))
  | _ -> (Frontend_dAst.C_Expr_EVar (dtb_u_u167, dtb_u_u168))
)
  | _ -> (Frontend_dAst.C_Expr_EVar (dtb_u_u167, dtb_u_u168))
))
  | _ -> dtb_u_u166
))

# 687 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCall = (fun (dtb_u_u171 : bool) (dtb_u_u172 : Frontend_dAst.t_Expr) (dtb_u_u173 : string) (dtb_u_u174 : int) (dtb_u_u175 : Frontend_dAst.t_Expr) (dtb_u_u176 : Frontend_dAst.t_Expr) (dtb_u_u177 : Frontend_dAst.t_Expr) (dtb_u_u178 : Frontend_dAst.t_NodeRef) -> (let dtb_u_u179 = (if dtb_u_u171 then Base_dIntrinsics.v_effHandleWithAtName else Base_dIntrinsics.v_effHandleWithName) in (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u179, dtb_u_u178)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u172, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb_u_u173, dtb_u_u178)), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg dtb_u_u173) dtb_u_u174) dtb_u_u178), (B_dData_dList.C_List__x58__x58_ (dtb_u_u175, (B_dData_dList.C_List__x58__x58_ ((v_handleRetArg dtb_u_u176), (B_dData_dList.C_List__x58__x58_ (dtb_u_u177, B_dData_dList.C_List_Nil)))))))))))), dtb_u_u178))))

# 715 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_opFamilyArityOf = (fun (dtb_u_u180 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u181 : Elab_dTypes.t_Ec) (dtb_u_u182 : string) (dtb_u_u183 : Base_dSource.t_Span) -> (match (((v_handleOpKind dtb_u_u180) dtb_u_u181) dtb_u_u182) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u183) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (dtb_u_u182))) dtb_u_u182)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u184) -> (match (v_handleOpArity dtb_u_u184) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u183) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (dtb_u_u182))) dtb_u_u182)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u185) -> (Base_dDiag.C_Check_OkC (dtb_u_u185))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_performCallExpr = (fun (dtb_u_u186 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u187 : Elab_dTypes.t_Ec) (dtb_u_u188 : Core_dTerm.t_Value) (dtb_u_u189 : Frontend_dAst.t_Expr) (dtb_u_u190 : Base_dSource.t_Span) -> (let dtb_u_u191 = ((v_perfFamilyOfValue dtb_u_u187) dtb_u_u188) in (match dtb_u_u191 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u192) -> (match dtb_u_u192 with
  | C_PerfFamily_PerfFamily (dtb_u_u193, dtb_u_u194, dtb_u_u195) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf dtb_u_u186) dtb_u_u187) dtb_u_u193) dtb_u_u190)) (fun (dtb_u_u196 : int) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effPerformCoreName, (Frontend_dAst.v_detachedNodeRef dtb_u_u190))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("_", (Frontend_dAst.v_detachedNodeRef dtb_u_u190))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb_u_u193, (Frontend_dAst.v_detachedNodeRef dtb_u_u190))), (B_dData_dList.C_List__x58__x58_ ((((v_handleSigArg dtb_u_u193) dtb_u_u196) (Frontend_dAst.v_detachedNodeRef dtb_u_u190)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u189, B_dData_dList.C_List_Nil)))))))), (Frontend_dAst.v_detachedNodeRef dtb_u_u190)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u190) (Base_dDiagnostics_dTc.C_TcErr_EffResFamilyMissing (((Core_dEval.v_showValueAt 6) dtb_u_u188)))) ((Core_dEval.v_showValueAt 6) dtb_u_u188))
  | _ -> failwith "DT: impossible branch"
)))

# 896 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordTypeOf = (fun (dtb_u_u197 : Elab_dTypes.t_Ec) (dtb_u_u198 : Core_dTerm.t_Value) -> (let dtb_u_u199 = ((Elab_dTypes.v_forceVal dtb_u_u197) dtb_u_u198) in (match dtb_u_u199 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u200) -> (match dtb_u_u200 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u201, dtb_u_u202) -> (match ((Elab_dMeta.v_dtDataLookup dtb_u_u201) (Elab_dTypes.v_ecDatas dtb_u_u197)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u203) -> (if (Elab_dTypes.v_dtDataIsRecord dtb_u_u203) then (let dtb_u_u204 = (Elab_dTypes.v_dtDataCtors dtb_u_u203) in (match dtb_u_u204 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u205, dtb_u_u206) -> (match dtb_u_u206 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u203; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u205; B_dData_dPair.f_Pair_second = dtb_u_u202 } }))
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
let[@tail_mod_cons] rec v_recordFieldPatsFrom = (fun (dtb_u_u207 : int) (dtb_u_u208 : int) (dtb_u_u209 : Base_dSource.t_Span) -> (if (dtb_u_u208 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ((Frontend_dReserved.v_recordProjBinderName dtb_u_u207), (Frontend_dAst.v_detachedNodeRef dtb_u_u209))), (((v_recordFieldPatsFrom (dtb_u_u207 + 1)) (dtb_u_u208 - 1)) dtb_u_u209)))))

# 912 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldPats = (fun (dtb_u_u210 : int) (dtb_u_u211 : Base_dSource.t_Span) -> (((v_recordFieldPatsFrom 0) dtb_u_u210) dtb_u_u211))

# 929 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordFieldLookupGo = (fun (dtb_u_u212 : string) (dtb_u_u213 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (dtb_u_u214 : int) -> (match dtb_u_u213 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u215, dtb_u_u216) -> (if ((dtb_u_u215).Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u212) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb_u_u215).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u214; B_dData_dPair.f_Pair_second = (dtb_u_u215).Elab_dTypes.f_DtFieldMeta_dtFieldType } })) else (((v_recordFieldLookupGo dtb_u_u212) dtb_u_u216) dtb_u_u214))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordFieldLookup = (fun (dtb_u_u217 : string) (dtb_u_u218 : Elab_dTypes.t_DtData) -> (((v_recordFieldLookupGo dtb_u_u217) (Elab_dTypes.v_dtDataFields dtb_u_u218)) (B_dData_dList.v_length (Elab_dTypes.v_dtDataFields dtb_u_u218))))

# 938 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateUnknownGo = (fun (dtb_u_u219 : Elab_dTypes.t_DtData) (dtb_u_u220 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u220 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u221, dtb_u_u222) -> (match dtb_u_u221 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u223; B_dData_dPair.f_Pair_second = dtb_u_u224 } -> (match ((v_recordFieldLookup dtb_u_u223) dtb_u_u219) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u223))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u225) -> ((v_recordUpdateUnknownGo dtb_u_u219) dtb_u_u222)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateUnknown = (fun (dtb_u_u226 : Elab_dTypes.t_DtData) (dtb_u_u227 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_recordUpdateUnknownGo dtb_u_u226) dtb_u_u227))

# 950 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdateValueFor = (fun (dtb_u_u228 : string) (dtb_u_u229 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u229 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u230, dtb_u_u231) -> (match dtb_u_u230 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u232; B_dData_dPair.f_Pair_second = dtb_u_u233 } -> (if (dtb_u_u232 = dtb_u_u228) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u233)) else ((v_recordUpdateValueFor dtb_u_u228) dtb_u_u231))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 956 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdateArg = (fun (dtb_u_u234 : int) (dtb_u_u235 : Elab_dTypes.t_DtFieldMeta) (dtb_u_u236 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u237 : Base_dSource.t_Span) -> (match ((v_recordUpdateValueFor (dtb_u_u235).Elab_dTypes.f_DtFieldMeta_dtFieldName) dtb_u_u236) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> dtb_u_u238
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_recordProjBinderName dtb_u_u234), (Frontend_dAst.v_detachedNodeRef dtb_u_u237)))
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Elab/Term/Impl.vuna"
let[@tail_mod_cons] rec v_recordUpdateArgs = (fun (dtb_u_u239 : int) (dtb_u_u240 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) (dtb_u_u241 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u242 : Base_dSource.t_Span) -> (match dtb_u_u240 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u243, dtb_u_u244) -> (B_dData_dList.C_List__x58__x58_ (((((v_recordUpdateArg dtb_u_u239) dtb_u_u243) dtb_u_u241) dtb_u_u242), ((((v_recordUpdateArgs (dtb_u_u239 + 1)) dtb_u_u244) dtb_u_u241) dtb_u_u242)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_recordUpdatedIndices = (fun (dtb_u_u245 : Elab_dTypes.t_DtData) (dtb_u_u246 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u246 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u247, dtb_u_u248) -> (match dtb_u_u247 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u249; B_dData_dPair.f_Pair_second = dtb_u_u250 } -> (let dtb_u_u251 = ((v_recordFieldLookup dtb_u_u249) dtb_u_u245) in (match dtb_u_u251 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_recordUpdatedIndices dtb_u_u245) dtb_u_u248)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u252) -> (match dtb_u_u252 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u253; B_dData_dPair.f_Pair_second = dtb_u_u254 } -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u253, ((v_recordUpdatedIndices dtb_u_u245) dtb_u_u248)))
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
let v_recordFieldPlan = (fun (dtb_u_u255 : Elab_dTypes.t_Ec) (dtb_u_u256 : Core_dTerm.t_Value) (dtb_u_u257 : string) (dtb_u_u258 : Base_dSource.t_Span) -> (let dtb_u_u259 = ((v_recordTypeOf dtb_u_u255) dtb_u_u256) in (match dtb_u_u259 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u260) -> (match dtb_u_u260 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u261; B_dData_dPair.f_Pair_second = dtb_u_u262 } -> (match dtb_u_u262 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u263; B_dData_dPair.f_Pair_second = dtb_u_u264 } -> (let dtb_u_u265 = ((v_recordFieldLookup dtb_u_u257) dtb_u_u261) in (match dtb_u_u265 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u266) -> (match dtb_u_u266 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u267; B_dData_dPair.f_Pair_second = dtb_u_u268 } -> (match dtb_u_u268 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u269; B_dData_dPair.f_Pair_second = dtb_u_u270 } -> (Base_dDiag.C_Check_OkC ({ f_FieldAccessPlan_planData = dtb_u_u261; f_FieldAccessPlan_planCtor = dtb_u_u263; f_FieldAccessPlan_planIdxs = dtb_u_u264; f_FieldAccessPlan_planRecord = (dtb_u_u261).Elab_dTypes.f_DtData_dtDataName; f_FieldAccessPlan_planField = dtb_u_u267; f_FieldAccessPlan_planFieldCount = dtb_u_u269; f_FieldAccessPlan_planType = ((Core_dEval.v_eval (B_dData_dList.v_reverse dtb_u_u264)) dtb_u_u270) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb_u_u258) ("record type has no field " ^ dtb_u_u257))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb_u_u258) (String.concat "" ["cannot resolve record type for field "; dtb_u_u257; "; add a type signature"]))
  | _ -> failwith "DT: impossible branch"
)))

# 1012 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_recordUpdatePlan = (fun (dtb_u_u271 : Elab_dTypes.t_Ec) (dtb_u_u272 : Core_dTerm.t_Value) (dtb_u_u273 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u274 : Base_dSource.t_Span) -> (let dtb_u_u275 = ((v_recordTypeOf dtb_u_u271) dtb_u_u272) in (match dtb_u_u275 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u276) -> (match dtb_u_u276 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u277; B_dData_dPair.f_Pair_second = dtb_u_u278 } -> (match dtb_u_u278 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u279; B_dData_dPair.f_Pair_second = dtb_u_u280 } -> (match ((v_recordUpdateUnknown dtb_u_u277) dtb_u_u273) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u281) -> ((Elab_dTypes.v_errAt dtb_u_u274) ("record type has no field " ^ dtb_u_u281))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u282 = (Elab_dTypes.v_dtDataFields dtb_u_u277) in (let dtb_u_u283 = ((((v_recordUpdateArgs 0) dtb_u_u282) dtb_u_u273) dtb_u_u274) in (Base_dDiag.C_Check_OkC ({ f_UpdateAccessPlan_upData = dtb_u_u277; f_UpdateAccessPlan_upCtor = dtb_u_u279; f_UpdateAccessPlan_upIdxs = dtb_u_u280; f_UpdateAccessPlan_upRecord = (dtb_u_u277).Elab_dTypes.f_DtData_dtDataName; f_UpdateAccessPlan_upFieldCount = (B_dData_dList.v_length dtb_u_u282); f_UpdateAccessPlan_upFieldIndices = ((v_recordUpdatedIndices dtb_u_u277) dtb_u_u273); f_UpdateAccessPlan_upBodyArgs = dtb_u_u283 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb_u_u274) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)))

# 1027 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldDictName = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_hasFieldTraitName)

# 1037 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctxHasFieldDictGo = (fun (dtb_u_u284 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u285 : int) (dtb_u_u286 : Elab_dTypes.t_Ctx) (dtb_u_u287 : Elab_dTypes.t_Ec) (dtb_u_u288 : string) (dtb_u_u289 : Core_dTerm.t_Value) -> (match dtb_u_u284 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u290, dtb_u_u291) -> (match dtb_u_u290 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u292; B_dData_dPair.f_Pair_second = dtb_u_u293 } -> (let dtb_u_u294 = ((Elab_dTypes.v_forceVal dtb_u_u287) (((Elab_dTypes.v_varTypeValue dtb_u_u286) dtb_u_u285) dtb_u_u293)) in (match dtb_u_u294 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u295) -> (match dtb_u_u295 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u296, dtb_u_u297) -> (if (dtb_u_u296 = v_hasFieldDictName) then (let dtb_u_u298 = dtb_u_u297 in (match dtb_u_u298 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u299, dtb_u_u300) -> (match dtb_u_u300 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u301, dtb_u_u302) -> (match dtb_u_u302 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u303, dtb_u_u304) -> (let dtb_u_u305 = ((Elab_dTypes.v_forceVal dtb_u_u287) dtb_u_u299) in (match dtb_u_u305 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u306) -> (match dtb_u_u306 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u307, dtb_u_u308) -> (match dtb_u_u308 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u309, dtb_u_u310) -> (match dtb_u_u309 with
  | Core_dTerm.C_Value_VStr (dtb_u_u311) -> (if (dtb_u_u311 = dtb_u_u288) then (match ((((Elab_dMeta.v_convEc dtb_u_u287) (Elab_dTypes.v_ctxDepth dtb_u_u286)) dtb_u_u301) dtb_u_u289) with
  | Base_dDiag.C_Check_OkC (dtb_u_u312) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u292, dtb_u_u285, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u303; B_dData_dPair.f_Pair_second = dtb_u_u312 } }))
  | Base_dDiag.C_Check_ErrC (dtb_u_u313) -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289))
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
))
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
)) else ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289))
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
)
  | _ -> ((((((v_ctxHasFieldDictGo dtb_u_u291) (dtb_u_u285 + 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctxHasFieldDict = (fun (dtb_u_u314 : Elab_dTypes.t_Ctx) (dtb_u_u315 : Elab_dTypes.t_Ec) (dtb_u_u316 : string) (dtb_u_u317 : Core_dTerm.t_Value) -> ((((((v_ctxHasFieldDictGo (dtb_u_u314).Elab_dTypes.f_Ctx_ctxItems) 0) dtb_u_u314) dtb_u_u315) dtb_u_u316) dtb_u_u317))

# 1065 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_hasFieldAccessFuel = (fun (dtb_u_u318 : int) (dtb_u_u319 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u320 : Elab_dTypes.t_Ctx) (dtb_u_u321 : Elab_dTypes.t_Ec) (dtb_u_u322 : Core_dTerm.t_Term) (dtb_u_u323 : Core_dTerm.t_Value) (dtb_u_u324 : string) (dtb_u_u325 : Base_dSource.t_Span) -> (let dtb_u_u326 = ((Elab_dTypes.v_forceVal dtb_u_u321) dtb_u_u323) in (match dtb_u_u326 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u327) -> (match dtb_u_u327 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u328, dtb_u_u329) -> ((Elab_dTypes.v_errAt dtb_u_u325) (String.concat "" ["type "; dtb_u_u328; " is not a record"]))
  | _ -> (let dtb_u_u330 = ((((v_ctxHasFieldDict dtb_u_u320) dtb_u_u321) dtb_u_u324) dtb_u_u323) in (match dtb_u_u330 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u331) -> (match dtb_u_u331 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u332; B_dData_dPair.f_Pair_second = dtb_u_u333 } -> (match dtb_u_u333 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u334; B_dData_dPair.f_Pair_second = dtb_u_u335 } -> (let dtb_u_u336 = (Elab_dTypes.v_ctxDepth dtb_u_u320) in (let dtb_u_u337 = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (dtb_u_u324)), Core_dTerm.C_Rig_Rig0)) in (let dtb_u_u338 = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), dtb_u_u337, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote dtb_u_u336) dtb_u_u323), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote dtb_u_u336) dtb_u_u334), Core_dTerm.C_Rig_Rig0)), dtb_u_u332, Core_dTerm.C_Rig_RigOmega)), dtb_u_u322, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u338; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u334; B_dData_dPair.f_Pair_second = dtb_u_u335 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb_u_u325) (String.concat "" ["cannot resolve field "; dtb_u_u324; "; add a HasField (Field \""; dtb_u_u324; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let dtb_u_u339 = ((((v_ctxHasFieldDict dtb_u_u320) dtb_u_u321) dtb_u_u324) dtb_u_u323) in (match dtb_u_u339 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u340) -> (match dtb_u_u340 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u341; B_dData_dPair.f_Pair_second = dtb_u_u342 } -> (match dtb_u_u342 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u343; B_dData_dPair.f_Pair_second = dtb_u_u344 } -> (let dtb_u_u345 = (Elab_dTypes.v_ctxDepth dtb_u_u320) in (let dtb_u_u346 = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldLabelName)), (Core_dTerm.C_Term_TStr (dtb_u_u324)), Core_dTerm.C_Rig_Rig0)) in (let dtb_u_u347 = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_hasFieldGetFieldName)), dtb_u_u346, Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote dtb_u_u345) dtb_u_u323), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote dtb_u_u345) dtb_u_u343), Core_dTerm.C_Rig_Rig0)), dtb_u_u341, Core_dTerm.C_Rig_RigOmega)), dtb_u_u322, Core_dTerm.C_Rig_RigOmega)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u347; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u343; B_dData_dPair.f_Pair_second = dtb_u_u344 } })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb_u_u325) (String.concat "" ["cannot resolve field "; dtb_u_u324; "; add a HasField (Field \""; dtb_u_u324; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
))
)))

# 1335 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_listLitElems = (fun (dtb_u_u348 : Frontend_dAst.t_Expr) -> (match dtb_u_u348 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u349, dtb_u_u350, dtb_u_u351) -> (match dtb_u_u349 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u352, dtb_u_u353) -> (match dtb_u_u350 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u354, dtb_u_u355) -> (match dtb_u_u355 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u356, dtb_u_u357) -> (match dtb_u_u357 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u358 = (Frontend_dReserved.v_classify dtb_u_u352) in (match dtb_u_u358 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u359) -> (match dtb_u_u359 with
  | Frontend_dReserved.C_Reserved_RsListCons -> ((v_listLitConsTail dtb_u_u354) dtb_u_u356)
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
  | Frontend_dAst.C_Expr_EVar (dtb_u_u360, dtb_u_u361) -> (let dtb_u_u362 = (Frontend_dReserved.v_classify dtb_u_u360) in (match dtb_u_u362 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u363) -> (match dtb_u_u363 with
  | Frontend_dReserved.C_Reserved_RsListNil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 1347 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_listLitConsTail = (fun (dtb_u_u364 : Frontend_dAst.t_Expr) (dtb_u_u365 : Frontend_dAst.t_Expr) -> (match (v_listLitElems dtb_u_u365) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u366) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u364, dtb_u_u366))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_findCtorByShort = (fun (dtb_u_u367 : string) (dtb_u_u368 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u368 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u369, dtb_u_u370) -> (if ((Frontend_dAst.v_ctorShortName (Elab_dTypes.v_dtCtorName dtb_u_u369)) = dtb_u_u367) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u369)) else ((v_findCtorByShort dtb_u_u367) dtb_u_u370))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1360 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCtor = (fun (dtb_u_u371 : Elab_dTypes.t_Ec) (dtb_u_u372 : string) (dtb_u_u373 : string) -> (match ((Elab_dMeta.v_dtDataLookup dtb_u_u372) (Elab_dTypes.v_ecDatas dtb_u_u371)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u374) -> ((v_findCtorByShort dtb_u_u373) (Elab_dTypes.v_dtDataCtors dtb_u_u374))
  | _ -> failwith "DT: impossible branch"
))

# 1367 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandListLitGo = (fun (dtb_u_u375 : string) (dtb_u_u376 : string) (dtb_u_u377 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u378 : Base_dSource.t_Span) -> (match dtb_u_u377 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u379, dtb_u_u380) -> ((Base_dCommon.v_bind ((((v_expandListLitGo dtb_u_u375) dtb_u_u376) dtb_u_u380) dtb_u_u378)) (fun (dtb_u_u381 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u376, (Frontend_dAst.v_detachedNodeRef dtb_u_u378))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u379, (B_dData_dList.C_List__x58__x58_ (dtb_u_u381, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef dtb_u_u378)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u375, (Frontend_dAst.v_detachedNodeRef dtb_u_u378)))))
  | _ -> failwith "DT: impossible branch"
))

# 1378 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowAtParts = (fun (dtb_u_u382 : Frontend_dAst.t_Expr) -> (match dtb_u_u382 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u383, dtb_u_u384, dtb_u_u385) -> (match dtb_u_u383 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u386, dtb_u_u387) -> (match dtb_u_u384 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u388, dtb_u_u389) -> (match dtb_u_u389 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u390, dtb_u_u391) -> (match dtb_u_u391 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u392 = (Frontend_dReserved.v_classify dtb_u_u386) in (match dtb_u_u392 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u393) -> (match dtb_u_u393 with
  | Frontend_dReserved.C_Reserved_RsRowAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u388; B_dData_dPair.f_Pair_second = dtb_u_u390 }))
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
let v_appAtParts = (fun (dtb_u_u394 : Frontend_dAst.t_Expr) -> (match dtb_u_u394 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u395, dtb_u_u396, dtb_u_u397) -> (match dtb_u_u395 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u398, dtb_u_u399) -> (match dtb_u_u396 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u400, dtb_u_u401) -> (match dtb_u_u401 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u402, dtb_u_u403) -> (let dtb_u_u404 = (Frontend_dReserved.v_classify dtb_u_u398) in (match dtb_u_u404 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u405) -> (match dtb_u_u405 with
  | Frontend_dReserved.C_Reserved_RsAppAt -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u400; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u402; B_dData_dPair.f_Pair_second = dtb_u_u403 } }))
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
let v_applyExtra = (fun (dtb_u_u406 : Frontend_dAst.t_Expr) (dtb_u_u407 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u407 with
  | B_dData_dList.C_List_Nil -> dtb_u_u406
  | _ -> (Frontend_dAst.C_Expr_EApp (dtb_u_u406, dtb_u_u407, (Frontend_dAst.v_exprRef dtb_u_u406)))
))

# 1394 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryParts = (fun (dtb_u_u408 : Frontend_dAst.t_Expr) -> (match (v_rowAtParts dtb_u_u408) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u409) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u409))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u410 = (v_appAtParts dtb_u_u408) in (match dtb_u_u410 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u411) -> (match dtb_u_u411 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u412; B_dData_dPair.f_Pair_second = dtb_u_u413 } -> (match dtb_u_u413 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u414; B_dData_dPair.f_Pair_second = dtb_u_u415 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((v_applyExtra dtb_u_u412) dtb_u_u415); B_dData_dPair.f_Pair_second = dtb_u_u414 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1408 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitLabel = (fun (dtb_u_u416 : Frontend_dAst.t_Expr) -> (let dtb_u_u417 = (v_rowEntryParts dtb_u_u416) in (match dtb_u_u417 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u416
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u418) -> (match dtb_u_u418 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u419; B_dData_dPair.f_Pair_second = dtb_u_u420 } -> dtb_u_u419
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1414 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameArg = (fun (dtb_u_u421 : Frontend_dAst.t_Expr) -> (let dtb_u_u422 = (v_rowEntryParts dtb_u_u421) in (match dtb_u_u422 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u423) -> (match dtb_u_u423 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u424; B_dData_dPair.f_Pair_second = dtb_u_u425 } -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u425))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1420 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLitNameExpr = (fun (dtb_u_u426 : Frontend_dAst.t_Expr) (dtb_u_u427 : Base_dSource.t_Span) -> (match (v_rowLitNameArg dtb_u_u426) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u428) -> dtb_u_u428
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, (Frontend_dAst.v_detachedNodeRef dtb_u_u427)))
  | _ -> failwith "DT: impossible branch"
))

# 1443 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_wrapRowEntry = (fun (dtb_u_u429 : Frontend_dAst.t_Expr) (dtb_u_u430 : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effNamedName, (Frontend_dAst.v_detachedNodeRef dtb_u_u430))), (B_dData_dList.C_List__x58__x58_ (((v_rowLitNameExpr dtb_u_u429) dtb_u_u430), (B_dData_dList.C_List__x58__x58_ ((v_rowLitLabel dtb_u_u429), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef dtb_u_u430))))

# 1439 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsEntry = (fun (dtb_u_u431 : Frontend_dAst.t_Expr) (dtb_u_u432 : Base_dSource.t_Span) -> (match dtb_u_u431 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u433, dtb_u_u434, dtb_u_u435) -> (match dtb_u_u433 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u436, dtb_u_u437) -> (match dtb_u_u434 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u438, dtb_u_u439) -> (match dtb_u_u439 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u440, dtb_u_u441) -> (match dtb_u_u441 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u436 = Base_dIntrinsics.v_effNamedName) then dtb_u_u431 else ((v_wrapRowEntry dtb_u_u431) dtb_u_u432))
  | _ -> ((v_wrapRowEntry dtb_u_u431) dtb_u_u432)
)
  | _ -> ((v_wrapRowEntry dtb_u_u431) dtb_u_u432)
)
  | _ -> ((v_wrapRowEntry dtb_u_u431) dtb_u_u432)
)
  | _ -> ((v_wrapRowEntry dtb_u_u431) dtb_u_u432)
)
  | _ -> ((v_wrapRowEntry dtb_u_u431) dtb_u_u432)
))

# 1436 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowConsArgs = (fun (dtb_u_u442 : Frontend_dAst.t_Expr) (dtb_u_u443 : Frontend_dAst.t_Expr) (dtb_u_u444 : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ (((v_rowConsEntry dtb_u_u442) dtb_u_u444), (B_dData_dList.C_List__x58__x58_ (dtb_u_u443, B_dData_dList.C_List_Nil)))))

# 1426 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandRowListLitGo = (fun (dtb_u_u445 : string) (dtb_u_u446 : string) (dtb_u_u447 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u448 : Base_dSource.t_Span) -> (match dtb_u_u447 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u449, dtb_u_u450) -> ((Base_dCommon.v_bind ((((v_expandRowListLitGo dtb_u_u445) dtb_u_u446) dtb_u_u450) dtb_u_u448)) (fun (dtb_u_u451 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u446, (Frontend_dAst.v_detachedNodeRef dtb_u_u448))), (((v_rowConsArgs dtb_u_u449) dtb_u_u451) dtb_u_u448), (Frontend_dAst.v_detachedNodeRef dtb_u_u448)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u445, (Frontend_dAst.v_detachedNodeRef dtb_u_u448)))))
  | _ -> failwith "DT: impossible branch"
))

# 1454 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_firstCtorOf = (fun (dtb_u_u452 : Elab_dTypes.t_Ec) (dtb_u_u453 : string) (dtb_u_u454 : string B_dData_dList.t_List) -> (match dtb_u_u454 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u455, dtb_u_u456) -> (match (((v_litFamilyCtor dtb_u_u452) dtb_u_u453) dtb_u_u455) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u457) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u457))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstCtorOf dtb_u_u452) dtb_u_u453) dtb_u_u456)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1451 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_litFamilyCons = (fun (dtb_u_u458 : Elab_dTypes.t_Ec) (dtb_u_u459 : string) -> (((v_firstCtorOf dtb_u_u458) dtb_u_u459) (B_dData_dList.C_List__x58__x58_ ("::", (B_dData_dList.C_List__x58__x58_ ("Cons", B_dData_dList.C_List_Nil))))))

# 1462 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandListLit = (fun (dtb_u_u460 : Elab_dTypes.t_Ec) (dtb_u_u461 : string) (dtb_u_u462 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u463 : Base_dSource.t_Span) -> (if (dtb_u_u461 = Base_dIntrinsics.v_effRowFamilyName) then (match (((v_litFamilyCtor dtb_u_u460) dtb_u_u461) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u463) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u461))) dtb_u_u461)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u464) -> (match ((v_litFamilyCons dtb_u_u460) dtb_u_u461) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u463) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u461))) dtb_u_u461)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u465) -> ((((v_expandRowListLitGo (Elab_dTypes.v_dtCtorName dtb_u_u464)) (Elab_dTypes.v_dtCtorName dtb_u_u465)) dtb_u_u462) dtb_u_u463)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_litFamilyCtor dtb_u_u460) dtb_u_u461) "Nil") with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u463) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u461))) dtb_u_u461)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u466) -> (match ((v_litFamilyCons dtb_u_u460) dtb_u_u461) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u463) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u461))) dtb_u_u461)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u467) -> ((((v_expandListLitGo (Elab_dTypes.v_dtCtorName dtb_u_u466)) (Elab_dTypes.v_dtCtorName dtb_u_u467)) dtb_u_u462) dtb_u_u463)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1480 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_listLitFamily = (fun (dtb_u_u468 : Elab_dTypes.t_Ec) (dtb_u_u469 : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_expectedFamilyOf dtb_u_u468) dtb_u_u469) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u470) -> dtb_u_u470
  | B_dData_dMaybe.C_Maybe_Nothing -> Base_dIntrinsics.v_listFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1487 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandArgListLit = (fun (dtb_u_u471 : Elab_dTypes.t_Ec) (dtb_u_u472 : Core_dTerm.t_Value) (dtb_u_u473 : Frontend_dAst.t_Expr) -> (match (v_listLitElems dtb_u_u473) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u474) -> ((((v_expandListLit dtb_u_u471) ((v_listLitFamily dtb_u_u471) ((Elab_dTypes.v_forceVal dtb_u_u471) dtb_u_u472))) dtb_u_u474) (Frontend_dAst.v_exprSpan dtb_u_u473))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u473))
  | _ -> failwith "DT: impossible branch"
))

# 1706 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natLitTermGo = (fun (dtb_u_u475 : int) (dtb_u_u476 : Core_dTerm.t_Term) -> (if (dtb_u_u475 <= 0) then dtb_u_u476 else ((v_natLitTermGo (dtb_u_u475 - 1)) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u476; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig1 }, B_dData_dList.C_List_Nil)))))))

# 1709 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitTerm = (fun (dtb_u_u477 : int) -> ((v_natLitTermGo dtb_u_u477) (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil))))

# 1714 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitResult = (fun (dtb_u_u478 : Base_dSource.t_Span) (dtb_u_u479 : int) -> (if (dtb_u_u479 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u478) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC ((v_natLitTerm dtb_u_u479)))))

# 1717 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natToIntTerm = (fun (dtb_u_u480 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("natToInt")), dtb_u_u480, Core_dTerm.C_Rig_Rig1)))

# 1720 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil))))

# 1723 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_natTypeName, B_dData_dList.C_List_Nil))))

# 1727 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil))))

# 1730 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isIntTy = (fun (dtb_u_u481 : Elab_dTypes.t_Ec) (dtb_u_u482 : Core_dTerm.t_Value) -> (let dtb_u_u483 = ((Elab_dTypes.v_forceVal dtb_u_u481) dtb_u_u482) in (match dtb_u_u483 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u484) -> (match dtb_u_u484 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u485, dtb_u_u486) -> (match dtb_u_u486 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u485 = Base_dIntrinsics.v_intTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1736 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNatTy = (fun (dtb_u_u487 : Elab_dTypes.t_Ec) (dtb_u_u488 : Core_dTerm.t_Value) -> (let dtb_u_u489 = ((Elab_dTypes.v_forceVal dtb_u_u487) dtb_u_u488) in (match dtb_u_u489 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u490) -> (match dtb_u_u490 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u491, dtb_u_u492) -> (match dtb_u_u492 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u491 = Base_dIntrinsics.v_natTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 362 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natLitCaseFast = (fun (dtb_u_u493 : Elab_dTypes.t_Ec) (dtb_u_u494 : Core_dTerm.t_Value) (dtb_u_u495 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (if ((v_isNatTy dtb_u_u493) dtb_u_u494) then (v_natLitCaseAlts dtb_u_u495) else false) then (v_natLitCaseHasCatchAll dtb_u_u495) else false))

# 1743 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isFloatTy = (fun (dtb_u_u496 : Elab_dTypes.t_Ec) (dtb_u_u497 : Core_dTerm.t_Value) -> (let dtb_u_u498 = ((Elab_dTypes.v_forceVal dtb_u_u496) dtb_u_u497) in (match dtb_u_u498 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u499) -> (match dtb_u_u499 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u500, dtb_u_u501) -> (match dtb_u_u501 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u500 = Base_dIntrinsics.v_floatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1202 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForExpected = (fun (dtb_u_u502 : Elab_dTypes.t_Ec) (dtb_u_u503 : string) (dtb_u_u504 : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_numMethodOpName dtb_u_u502) dtb_u_u503) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u505) -> (if ((v_isIntTy dtb_u_u502) dtb_u_u504) then false else (if ((v_isNatTy dtb_u_u502) dtb_u_u504) then false else (if ((v_isFloatTy dtb_u_u502) dtb_u_u504) then false else (match ((Elab_dTypes.v_forceVal dtb_u_u502) dtb_u_u504) with
  | Core_dTerm.C_Value_VMeta (dtb_u_u506, dtb_u_u507) -> false
  | _ -> true
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1219 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_skipArithSpecForHint = (fun (dtb_u_u508 : Elab_dTypes.t_Ec) (dtb_u_u509 : string) (dtb_u_u510 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (match dtb_u_u510 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u511) -> (((v_skipArithSpecForExpected dtb_u_u508) dtb_u_u509) dtb_u_u511)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1750 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceTerm = (fun (dtb_u_u512 : Elab_dTypes.t_Ec) (dtb_u_u513 : Core_dTerm.t_Value) (dtb_u_u514 : Core_dTerm.t_Value) (dtb_u_u515 : Core_dTerm.t_Term) -> (if (if ((v_isIntTy dtb_u_u512) dtb_u_u513) then ((v_isNatTy dtb_u_u512) dtb_u_u514) else false) then (B_dData_dMaybe.C_Maybe_Just ((v_natToIntTerm dtb_u_u515))) else B_dData_dMaybe.C_Maybe_Nothing))

# 1755 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_coerceNatOperands = (fun (dtb_u_u516 : Elab_dTypes.t_Ec) (dtb_u_u517 : Core_dTerm.t_Value) (dtb_u_u518 : Core_dTerm.t_Value) (dtb_u_u519 : Core_dTerm.t_Term) (dtb_u_u520 : Core_dTerm.t_Term) -> (if (if ((v_isNatTy dtb_u_u516) dtb_u_u517) then ((v_isNatTy dtb_u_u516) dtb_u_u518) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm dtb_u_u519); B_dData_dPair.f_Pair_second = (v_natToIntTerm dtb_u_u520) } })) else (if (if ((v_isNatTy dtb_u_u516) dtb_u_u517) then ((v_isIntTy dtb_u_u516) dtb_u_u518) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb_u_u518 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_natToIntTerm dtb_u_u519); B_dData_dPair.f_Pair_second = dtb_u_u520 } })) else (if (if ((v_isIntTy dtb_u_u516) dtb_u_u517) then ((v_isNatTy dtb_u_u516) dtb_u_u518) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u517; B_dData_dPair.f_Pair_second = v_intTyValue }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u519; B_dData_dPair.f_Pair_second = (v_natToIntTerm dtb_u_u520) } })) else B_dData_dMaybe.C_Maybe_Nothing))))

# 1773 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithOpNameOf = (fun (dtb_u_u521 : Elab_dTypes.t_Ec) (dtb_u_u522 : string) -> (if (dtb_u_u522 = "+") then (B_dData_dMaybe.C_Maybe_Just ("+")) else (if (dtb_u_u522 = "-") then (B_dData_dMaybe.C_Maybe_Just ("-")) else (if (dtb_u_u522 = "*") then (B_dData_dMaybe.C_Maybe_Just ("*")) else (if (dtb_u_u522 = "/") then (B_dData_dMaybe.C_Maybe_Just ("/")) else (if (Base_dSource.v_containsDot dtb_u_u522) then ((Elab_dDict.v_numMethodOpName dtb_u_u521) dtb_u_u522) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 1780 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithNatName = (fun (dtb_u_u523 : string) -> (if (dtb_u_u523 = "+") then "natAdd" else (if (dtb_u_u523 = "-") then "natSub" else (if (dtb_u_u523 = "*") then "natMul" else "natDiv"))))

# 1786 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_intApp2 = (fun (dtb_u_u524 : string) (dtb_u_u525 : Core_dTerm.t_Term) (dtb_u_u526 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u524)), dtb_u_u525, Core_dTerm.C_Rig_Rig1)), dtb_u_u526, Core_dTerm.C_Rig_Rig1)))

# 1789 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natApp2 = (fun (dtb_u_u527 : string) (dtb_u_u528 : Core_dTerm.t_Term) (dtb_u_u529 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithNatName dtb_u_u527))), dtb_u_u528, Core_dTerm.C_Rig_Rig1)), dtb_u_u529, Core_dTerm.C_Rig_Rig1)))

# 1798 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_arithFloatName = (fun (dtb_u_u530 : string) -> (if (dtb_u_u530 = "+") then "bi_add_float" else (if (dtb_u_u530 = "-") then "bi_sub_float" else (if (dtb_u_u530 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1794 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_floatApp2 = (fun (dtb_u_u531 : string) (dtb_u_u532 : Core_dTerm.t_Term) (dtb_u_u533 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((v_arithFloatName dtb_u_u531))), dtb_u_u532, Core_dTerm.C_Rig_Rig1)), dtb_u_u533, Core_dTerm.C_Rig_Rig1)))

# 1804 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isEIntExpr = (fun (dtb_u_u534 : Frontend_dAst.t_Expr) -> (match dtb_u_u534 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u535, dtb_u_u536) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u535))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1913 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isSimpleComp = (fun (dtb_u_u537 : Frontend_dAst.t_Expr) -> (match dtb_u_u537 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u538, dtb_u_u539) -> true
  | _ -> false
))

# 1970 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_literalTraitLower = (fun (dtb_u_u540 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u541 : Elab_dTypes.t_Ctx) (dtb_u_u542 : Elab_dTypes.t_Ec) (dtb_u_u543 : string) (dtb_u_u544 : string) (dtb_u_u545 : Frontend_dAst.t_Expr) (dtb_u_u546 : Core_dTerm.t_Value) (dtb_u_u547 : Base_dSource.t_Span) -> (let dtb_u_u548 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName dtb_u_u543), (B_dData_dList.C_List__x58__x58_ (((Elab_dTypes.v_forceVal dtb_u_u542) dtb_u_u546), B_dData_dList.C_List_Nil)))))) in (let dtb_u_u549 = (((((Elab_dDict.v_searchInstanceIn dtb_u_u540) dtb_u_u541) dtb_u_u542) dtb_u_u548) dtb_u_u547) in (match dtb_u_u549 with
  | Base_dDiag.C_Check_OkC (dtb_u_u550) -> (match dtb_u_u550 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u551; B_dData_dPair.f_Pair_second = dtb_u_u552 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u544, (Frontend_dAst.v_detachedNodeRef dtb_u_u547))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u545, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef dtb_u_u547))); B_dData_dPair.f_Pair_second = dtb_u_u552 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u553) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 1980 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_exprFormName = (fun (dtb_u_u554 : Frontend_dAst.t_Expr) -> (match dtb_u_u554 with
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u555, dtb_u_u556) -> "EFloat"
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u557, dtb_u_u558) -> "EInterp"
  | Frontend_dAst.C_Expr_EDo (dtb_u_u559, dtb_u_u560) -> "EDo"
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u561, dtb_u_u562, dtb_u_u563) -> "ERecUpdate"
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u564, dtb_u_u565, dtb_u_u566) -> "ERecord"
  | Frontend_dAst.C_Expr_EField (dtb_u_u567, dtb_u_u568, dtb_u_u569) -> "EField"
  | Frontend_dAst.C_Expr_ELet (dtb_u_u570, dtb_u_u571, dtb_u_u572, dtb_u_u573) -> "ELet"
  | Frontend_dAst.C_Expr_ECase (dtb_u_u574, dtb_u_u575, dtb_u_u576) -> "ECase"
  | Frontend_dAst.C_Expr_EIf (dtb_u_u577, dtb_u_u578, dtb_u_u579, dtb_u_u580) -> "EIf"
  | Frontend_dAst.C_Expr_EPi (dtb_u_u581, dtb_u_u582, dtb_u_u583, dtb_u_u584, dtb_u_u585, dtb_u_u586) -> "EPi"
  | Frontend_dAst.C_Expr_EApp (dtb_u_u587, dtb_u_u588, dtb_u_u589) -> "EApp"
  | Frontend_dAst.C_Expr_ELam (dtb_u_u590, dtb_u_u591, dtb_u_u592) -> "ELam"
  | Frontend_dAst.C_Expr_EStr (dtb_u_u593, dtb_u_u594) -> "EStr"
  | Frontend_dAst.C_Expr_EInt (dtb_u_u595, dtb_u_u596) -> "EInt"
  | Frontend_dAst.C_Expr_EVar (dtb_u_u597, dtb_u_u598) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 2016 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueCandidateMatches = (fun (dtb_u_u599 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u600 : Elab_dTypes.t_Ctx) (dtb_u_u601 : Elab_dTypes.t_Ec) (dtb_u_u602 : Core_dTerm.t_Value) (dtb_u_u603 : string) -> (let dtb_u_u604 = (((Elab_dMeta.v_valueLookup dtb_u_u599) dtb_u_u601) dtb_u_u603) in (match dtb_u_u604 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u605) -> (match dtb_u_u605 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb_u_u606) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u601)) (Elab_dTypes.v_ecSolsP dtb_u_u601)) (Elab_dTypes.v_ctxDepth dtb_u_u600)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u600)) (dtb_u_u606).Elab_dTypes.f_DtCtor_dtCtorType)) dtb_u_u602) with
  | Base_dDiag.C_Check_OkC (dtb_u_u607) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u608) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Elab_dMeta.C_ValueEntry_VEDef (dtb_u_u609) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u601)) (Elab_dTypes.v_ecSolsP dtb_u_u601)) (Elab_dTypes.v_ctxDepth dtb_u_u600)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u600)) dtb_u_u609)) dtb_u_u602) with
  | Base_dDiag.C_Check_OkC (dtb_u_u610) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u611) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2052 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPiWithMetasFuel = (fun (dtb_u_u612 : int) (dtb_u_u613 : Elab_dTypes.t_Ctx) (dtb_u_u614 : Elab_dTypes.t_Ec) (dtb_u_u615 : Core_dTerm.t_Value) -> (if (dtb_u_u612 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u615; B_dData_dPair.f_Pair_second = dtb_u_u614 } else (match ((Elab_dTypes.v_forceVal dtb_u_u614) dtb_u_u615) with
  | Core_dTerm.C_Value_VPi (dtb_u_u616, dtb_u_u617, dtb_u_u618, dtb_u_u619, dtb_u_u620) -> (let dtb_u_u621 = (Elab_dTypes.v_ecNext dtb_u_u614) in (match ((Elab_dTypes.v_newMeta dtb_u_u613) dtb_u_u614) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u622; B_dData_dPair.f_Pair_second = dtb_u_u623 } -> ((((v_stripPiWithMetasFuel (dtb_u_u612 - 1)) dtb_u_u613) dtb_u_u623) ((Core_dEval.v_applyClosure dtb_u_u620) (Core_dTerm.C_Value_VMeta (dtb_u_u621, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u615; B_dData_dPair.f_Pair_second = dtb_u_u614 }
)))

# 2049 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_stripPiWithMetas = (fun (dtb_u_u624 : Elab_dTypes.t_Ctx) (dtb_u_u625 : Elab_dTypes.t_Ec) (dtb_u_u626 : Core_dTerm.t_Value) -> ((((v_stripPiWithMetasFuel 64) dtb_u_u624) dtb_u_u625) dtb_u_u626))

# 2041 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppResultMatches = (fun (dtb_u_u627 : Elab_dTypes.t_Ctx) (dtb_u_u628 : Elab_dTypes.t_Ec) (dtb_u_u629 : Core_dTerm.t_Value) (dtb_u_u630 : Core_dTerm.t_Value) -> (match (((v_stripPiWithMetas dtb_u_u627) dtb_u_u628) dtb_u_u630) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u631; B_dData_dPair.f_Pair_second = dtb_u_u632 } -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u632)) (Elab_dTypes.v_ecSolsP dtb_u_u632)) (Elab_dTypes.v_ctxDepth dtb_u_u627)) dtb_u_u631) dtb_u_u629) with
  | Base_dDiag.C_Check_OkC (dtb_u_u633) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u634) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2033 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_overValueAppCandidateMatches = (fun (dtb_u_u635 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u636 : Elab_dTypes.t_Ctx) (dtb_u_u637 : Elab_dTypes.t_Ec) (dtb_u_u638 : Core_dTerm.t_Value) (dtb_u_u639 : string) -> (let dtb_u_u640 = (((Elab_dMeta.v_valueLookup dtb_u_u635) dtb_u_u637) dtb_u_u639) in (match dtb_u_u640 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u641) -> (match dtb_u_u641 with
  | Elab_dMeta.C_ValueEntry_VECtor (dtb_u_u642) -> ((((v_overValueAppResultMatches dtb_u_u636) dtb_u_u637) dtb_u_u638) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u636)) (dtb_u_u642).Elab_dTypes.f_DtCtor_dtCtorType))
  | Elab_dMeta.C_ValueEntry_VEDef (dtb_u_u643) -> ((((v_overValueAppResultMatches dtb_u_u636) dtb_u_u637) dtb_u_u638) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u636)) dtb_u_u643))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2066 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueAppTarget = (fun (dtb_u_u644 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u645 : Elab_dTypes.t_Ctx) (dtb_u_u646 : Elab_dTypes.t_Ec) (dtb_u_u647 : string) (dtb_u_u648 : string B_dData_dList.t_List) (dtb_u_u649 : Core_dTerm.t_Value) (dtb_u_u650 : Base_dSource.t_Span) -> (let dtb_u_u651 = ((B_dData_dList.v_filter ((((v_overValueAppCandidateMatches dtb_u_u644) dtb_u_u645) dtb_u_u646) dtb_u_u649)) dtb_u_u648) in (match dtb_u_u651 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u652, dtb_u_u653) -> (match dtb_u_u653 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u652))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u650) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u647, (Frontend_dReserved.v_joinWithAt dtb_u_u648)))) dtb_u_u647) (Frontend_dReserved.v_joinWithAt dtb_u_u648))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u650) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u647, (Frontend_dReserved.v_joinWithAt dtb_u_u648)))) dtb_u_u647) (Frontend_dReserved.v_joinWithAt dtb_u_u648))
)))

# 2072 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverValueTarget = (fun (dtb_u_u654 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u655 : Elab_dTypes.t_Ctx) (dtb_u_u656 : Elab_dTypes.t_Ec) (dtb_u_u657 : string) (dtb_u_u658 : string B_dData_dList.t_List) (dtb_u_u659 : Core_dTerm.t_Value) (dtb_u_u660 : Base_dSource.t_Span) -> (let dtb_u_u661 = ((B_dData_dList.v_filter ((((v_overValueCandidateMatches dtb_u_u654) dtb_u_u655) dtb_u_u656) dtb_u_u659)) dtb_u_u658) in (match dtb_u_u661 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u662, dtb_u_u663) -> (match dtb_u_u663 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u662))
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u660) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u657, (Frontend_dReserved.v_joinWithAt dtb_u_u658)))) dtb_u_u657) (Frontend_dReserved.v_joinWithAt dtb_u_u658))
)
  | _ -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u660) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u657, (Frontend_dReserved.v_joinWithAt dtb_u_u658)))) dtb_u_u657) (Frontend_dReserved.v_joinWithAt dtb_u_u658))
)))

# 2213 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_patHasOverCtor = (fun (dtb_u_u664 : Frontend_dAst.t_Pat) -> (match dtb_u_u664 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u665, dtb_u_u666, dtb_u_u667) -> (v_anyFieldHasOverCtor dtb_u_u666)
  | Frontend_dAst.C_Pat_PAs (dtb_u_u668, dtb_u_u669, dtb_u_u670) -> (v_patHasOverCtor dtb_u_u669)
  | Frontend_dAst.C_Pat_PCon (dtb_u_u671, dtb_u_u672, dtb_u_u673) -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u671) then true else (v_anyPatHasOverCtor dtb_u_u672))
  | _ -> false
))
# 2221 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyPatHasOverCtor = (fun (dtb_u_u674 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u674 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u675, dtb_u_u676) -> (if (v_patHasOverCtor dtb_u_u675) then true else (v_anyPatHasOverCtor dtb_u_u676))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 2226 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_anyFieldHasOverCtor = (fun (dtb_u_u677 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u677 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u678, dtb_u_u679) -> (match dtb_u_u678 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u680; B_dData_dPair.f_Pair_second = dtb_u_u681 } -> (if (v_patHasOverCtor dtb_u_u681) then true else (v_anyFieldHasOverCtor dtb_u_u679))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2231 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_clausesHaveOverCtor = (fun (dtb_u_u682 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u682 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u683, dtb_u_u684) -> (match dtb_u_u683 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u685; B_dData_dPair.f_Pair_second = dtb_u_u686 } -> (if (v_anyPatHasOverCtor dtb_u_u685) then true else (v_clausesHaveOverCtor dtb_u_u684))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2301 "Vuna/Compiler/Elab/Term/Impl.vuna"
let[@tail_mod_cons] rec v_pairsToBindings = (fun (dtb_u_u687 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u687 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u688, dtb_u_u689) -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (B_dData_dPair.v_firstOf dtb_u_u688); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal ((B_dData_dPair.v_secondOf dtb_u_u688))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty) }, (v_pairsToBindings dtb_u_u689)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2307 "Vuna/Compiler/Elab/Term/Impl.vuna"
let[@tail_mod_cons] rec v_altsToPairs = (fun (dtb_u_u690 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match dtb_u_u690 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u691, dtb_u_u692) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u691).Frontend_dAst.f_Alt_altPat; B_dData_dPair.f_Pair_second = (dtb_u_u691).Frontend_dAst.f_Alt_altBody }, (v_altsToPairs dtb_u_u692)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprWith = (fun (dtb_u_u693 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u694 : Elab_dTypes.t_Ec) (dtb_u_u695 : Frontend_dAst.t_Expr) (dtb_u_u696 : Frontend_dAst.t_NodeRef) (dtb_u_u697 : bool) (dtb_u_u698 : Frontend_dAst.t_Expr) -> (let dtb_u_u699 = (v_handleOperand dtb_u_u695) in (match dtb_u_u699 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u700) -> (match dtb_u_u700 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u701; B_dData_dPair.f_Pair_second = dtb_u_u702 } -> (match dtb_u_u702 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u703; B_dData_dPair.f_Pair_second = dtb_u_u704 } -> (let dtb_u_u705 = dtb_u_u704 in (match dtb_u_u705 with
  | Frontend_dAst.C_Expr_ELam (dtb_u_u706, dtb_u_u707, dtb_u_u708) -> (match dtb_u_u706 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u709, dtb_u_u710) -> (match dtb_u_u710 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u711, dtb_u_u712) -> (match dtb_u_u707 with
  | Frontend_dAst.C_Expr_ECase (dtb_u_u713, dtb_u_u714, dtb_u_u715) -> ((Base_dCommon.v_bind ((v_handleClauseFamilies dtb_u_u694) (v_altsToPairs dtb_u_u714))) (fun (dtb_u_u716 : string) -> (let dtb_u_u717 = (v_perfFamilyOfCanonical dtb_u_u716) in (match dtb_u_u717 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u718) -> (match dtb_u_u718 with
  | C_PerfFamily_PerfFamily (dtb_u_u719, dtb_u_u720, dtb_u_u721) -> ((Base_dCommon.v_bind ((((v_opFamilyArityOf dtb_u_u693) dtb_u_u694) dtb_u_u719) (Frontend_dAst.v_nodeRefSpan dtb_u_u696))) (fun (dtb_u_u722 : int) -> (Base_dDiag.C_Check_OkC (((((((((v_handleCall dtb_u_u697) dtb_u_u698) dtb_u_u719) dtb_u_u722) dtb_u_u701) dtb_u_u703) dtb_u_u704) dtb_u_u696)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u696)) (Base_dDiagnostics_dTc.C_TcErr_HandleFamilyUnsupported (dtb_u_u716))) dtb_u_u716)
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
let v_handleCallExpr = (fun (dtb_u_u723 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u724 : Elab_dTypes.t_Ec) (dtb_u_u725 : Frontend_dAst.t_Expr) (dtb_u_u726 : Frontend_dAst.t_NodeRef) -> ((((((v_handleCallExprWith dtb_u_u723) dtb_u_u724) dtb_u_u725) dtb_u_u726) false) (Frontend_dAst.C_Expr_EVar ("_", dtb_u_u726))))

# 746 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAt = (fun (dtb_u_u727 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u728 : Elab_dTypes.t_Ec) (dtb_u_u729 : Frontend_dAst.t_Expr) (dtb_u_u730 : Frontend_dAst.t_NodeRef) -> ((((((v_handleCallExprWith dtb_u_u727) dtb_u_u728) dtb_u_u729) dtb_u_u730) true) (Frontend_dAst.C_Expr_EStr (Base_dIntrinsics.v_effDefaultInstance, dtb_u_u730))))

# 751 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_handleCallExprAtHole = (fun (dtb_u_u731 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u732 : Elab_dTypes.t_Ec) (dtb_u_u733 : Frontend_dAst.t_Expr) (dtb_u_u734 : Frontend_dAst.t_NodeRef) -> ((((((v_handleCallExprWith dtb_u_u731) dtb_u_u732) dtb_u_u733) dtb_u_u734) true) (Frontend_dAst.C_Expr_EVar ("_", dtb_u_u734))))

# 2311 "Vuna/Compiler/Elab/Term/Impl.vuna"
let[@tail_mod_cons] rec v_localClausesToPairs = (fun (dtb_u_u735 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u735 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u736, dtb_u_u737) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u736).Frontend_dAst.f_LocalClause_lcPats; B_dData_dPair.f_Pair_second = (dtb_u_u736).Frontend_dAst.f_LocalClause_lcBody }, (v_localClausesToPairs dtb_u_u737)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2239 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_expandLocalFunsF = (fun (dtb_u_u738 : int) (dtb_u_u739 : Elab_dTypes.t_Ec) (dtb_u_u740 : Frontend_dAst.t_Expr) -> (if (dtb_u_u738 <= 0) then (Base_dDiag.C_Check_OkC (dtb_u_u740)) else (match dtb_u_u740 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u741, dtb_u_u742) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u741, dtb_u_u742))))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u743, dtb_u_u744) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb_u_u743, dtb_u_u744))))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u745, dtb_u_u746) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb_u_u745, dtb_u_u746))))
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u747, dtb_u_u748) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb_u_u747, dtb_u_u748))))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u749, dtb_u_u750, dtb_u_u751) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u750)) (fun (dtb_u_u752 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb_u_u749, dtb_u_u752, dtb_u_u751))))))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u753, dtb_u_u754, dtb_u_u755) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u753)) (fun (dtb_u_u756 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739)) dtb_u_u754)) (fun (dtb_u_u757 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb_u_u756, dtb_u_u757, dtb_u_u755))))))))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u758, dtb_u_u759, dtb_u_u760, dtb_u_u761, dtb_u_u762, dtb_u_u763) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u761)) (fun (dtb_u_u764 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u762)) (fun (dtb_u_u765 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb_u_u758, dtb_u_u759, dtb_u_u760, dtb_u_u764, dtb_u_u765, dtb_u_u763))))))))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u766, dtb_u_u767, dtb_u_u768, dtb_u_u769) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandBindingF (dtb_u_u738 - 1)) dtb_u_u739)) dtb_u_u766)) (fun (dtb_u_u770 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u767)) (fun (dtb_u_u771 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb_u_u770, dtb_u_u771, dtb_u_u768, dtb_u_u769))))))))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u772, dtb_u_u773, dtb_u_u774) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u772)) (fun (dtb_u_u775 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandAltF (dtb_u_u738 - 1)) dtb_u_u739)) dtb_u_u773)) (fun (dtb_u_u776 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (dtb_u_u775, dtb_u_u776, dtb_u_u774))))))))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u777, dtb_u_u778, dtb_u_u779, dtb_u_u780) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u777)) (fun (dtb_u_u781 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u778)) (fun (dtb_u_u782 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u779)) (fun (dtb_u_u783 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (dtb_u_u781, dtb_u_u782, dtb_u_u783, dtb_u_u780))))))))))
  | Frontend_dAst.C_Expr_EField (dtb_u_u784, dtb_u_u785, dtb_u_u786) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u784)) (fun (dtb_u_u787 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (dtb_u_u787, dtb_u_u785, dtb_u_u786))))))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u788, dtb_u_u789, dtb_u_u790) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u791 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) (B_dData_dPair.v_secondOf dtb_u_u791))) (fun (dtb_u_u792 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u791); B_dData_dPair.f_Pair_second = dtb_u_u792 })))))) dtb_u_u789)) (fun (dtb_u_u793 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb_u_u788, dtb_u_u793, dtb_u_u790))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u794, dtb_u_u795, dtb_u_u796) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) dtb_u_u794)) (fun (dtb_u_u797 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u798 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u738 - 1)) dtb_u_u739) (B_dData_dPair.v_secondOf dtb_u_u798))) (fun (dtb_u_u799 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u798); B_dData_dPair.f_Pair_second = dtb_u_u799 })))))) dtb_u_u795)) (fun (dtb_u_u800 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u797, dtb_u_u800, dtb_u_u796))))))))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u801, dtb_u_u802) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandDoStmtF (dtb_u_u738 - 1)) dtb_u_u739)) dtb_u_u801)) (fun (dtb_u_u803 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (dtb_u_u803, dtb_u_u802))))))
  | _ -> (Base_dDiag.C_Check_OkC (dtb_u_u740))
)))
# 2261 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBindingF = (fun (dtb_u_u804 : int) (dtb_u_u805 : Elab_dTypes.t_Ec) (dtb_u_u806 : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind (((v_expandBindingValueF (dtb_u_u804 - 1)) dtb_u_u805) dtb_u_u806)) (fun (dtb_u_u807 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ dtb_u_u806 with Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (dtb_u_u807)) })))))
# 2269 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandBindingValueF = (fun (dtb_u_u808 : int) (dtb_u_u809 : Elab_dTypes.t_Ec) (dtb_u_u810 : Frontend_dAst.t_Binding) -> (match (dtb_u_u810).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u811) -> (((v_expandLocalFunsF (dtb_u_u808 - 1)) dtb_u_u809) dtb_u_u811)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u812) -> (if (v_clausesHaveOverCtor (v_localClausesToPairs dtb_u_u812)) then ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan (dtb_u_u810).Frontend_dAst.f_Binding_bindRef)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Elab_dMatch.v_multiToExpr (Elab_dMeta.v_ctorFamilyTable dtb_u_u809)) (v_localClausesToPairs dtb_u_u812)))
  | _ -> failwith "DT: impossible branch"
))
# 2283 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandAltF = (fun (dtb_u_u813 : int) (dtb_u_u814 : Elab_dTypes.t_Ec) (dtb_u_u815 : Frontend_dAst.t_Alt) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u813 - 1)) dtb_u_u814) (dtb_u_u815).Frontend_dAst.f_Alt_altBody)) (fun (dtb_u_u816 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ dtb_u_u815 with Frontend_dAst.f_Alt_altBody = dtb_u_u816 })))))
# 2289 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_expandDoStmtF = (fun (dtb_u_u817 : int) (dtb_u_u818 : Elab_dTypes.t_Ec) (dtb_u_u819 : Frontend_dAst.t_DoStmt) -> (match dtb_u_u819 with
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u820, dtb_u_u821) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_expandBindingF (dtb_u_u817 - 1)) dtb_u_u818)) dtb_u_u820)) (fun (dtb_u_u822 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (dtb_u_u822, dtb_u_u821))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u823, dtb_u_u824) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u817 - 1)) dtb_u_u818) dtb_u_u823)) (fun (dtb_u_u825 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (dtb_u_u825, dtb_u_u824))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u826, dtb_u_u827, dtb_u_u828) -> ((Base_dCommon.v_bind (((v_expandLocalFunsF (dtb_u_u817 - 1)) dtb_u_u818) dtb_u_u827)) (fun (dtb_u_u829 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (dtb_u_u826, dtb_u_u829, dtb_u_u828))))))
  | _ -> failwith "DT: impossible branch"
))

# 2236 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_expandLocalFuns = (fun (dtb_u_u830 : Elab_dTypes.t_Ec) (dtb_u_u831 : Frontend_dAst.t_Expr) -> (((v_expandLocalFunsF ((Frontend_dAstQuery.v_exprBudget 64) dtb_u_u831)) dtb_u_u830) dtb_u_u831))

# 2323 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindingToExpr = (fun (dtb_u_u832 : int) (dtb_u_u833 : Elab_dTypes.t_Ec) (dtb_u_u834 : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind (((v_expandBindingValueF (dtb_u_u832 - 1)) dtb_u_u833) dtb_u_u834)) (fun (dtb_u_u835 : Frontend_dAst.t_Expr) -> (match (dtb_u_u834).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u836) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAscribe), (dtb_u_u836).Frontend_dAst.f_BindingSig_sigRef)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u835, (B_dData_dList.C_List__x58__x58_ ((dtb_u_u836).Frontend_dAst.f_BindingSig_sigType, B_dData_dList.C_List_Nil)))), (dtb_u_u836).Frontend_dAst.f_BindingSig_sigRef))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u835))
  | _ -> failwith "DT: impossible branch"
))))

# 2316 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_letBindsToPairs = (fun (dtb_u_u837 : int) (dtb_u_u838 : Elab_dTypes.t_Ec) (dtb_u_u839 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u839 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u840, dtb_u_u841) -> ((Base_dCommon.v_bind (((v_bindingToExpr dtb_u_u837) dtb_u_u838) dtb_u_u840)) (fun (dtb_u_u842 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_letBindsToPairs (dtb_u_u837 - 1)) dtb_u_u838) dtb_u_u841)) (fun (dtb_u_u843 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u840).Frontend_dAst.f_Binding_bindPat; B_dData_dPair.f_Pair_second = dtb_u_u842 }, dtb_u_u843))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2458 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_stripPisWithMetas = (fun (dtb_u_u844 : int) (dtb_u_u845 : Elab_dTypes.t_Ctx) (dtb_u_u846 : Elab_dTypes.t_Ec) (dtb_u_u847 : Core_dTerm.t_Value) -> (if (dtb_u_u844 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dTypes.v_forceVal dtb_u_u846) dtb_u_u847) with
  | Core_dTerm.C_Value_VPi (dtb_u_u848, dtb_u_u849, dtb_u_u850, dtb_u_u851, dtb_u_u852) -> (match ((Elab_dTypes.v_newMeta dtb_u_u845) dtb_u_u846) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u853; B_dData_dPair.f_Pair_second = dtb_u_u854 } -> ((((v_stripPisWithMetas (dtb_u_u844 - 1)) dtb_u_u845) dtb_u_u854) ((Core_dEval.v_applyClosure dtb_u_u852) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u845)) dtb_u_u853)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u847; B_dData_dPair.f_Pair_second = dtb_u_u846 }))
)))

# 2473 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isMetaHeadedValue = (fun (dtb_u_u855 : Elab_dTypes.t_Ec) (dtb_u_u856 : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal dtb_u_u855) dtb_u_u856) with
  | Core_dTerm.C_Value_VMeta (dtb_u_u857, dtb_u_u858) -> true
  | _ -> false
))

# 2480 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isRigidHeadValue = (fun (dtb_u_u859 : Elab_dTypes.t_Ec) (dtb_u_u860 : Core_dTerm.t_Value) -> (let dtb_u_u861 = ((Elab_dTypes.v_forceVal dtb_u_u859) dtb_u_u860) in (match dtb_u_u861 with
  | Core_dTerm.C_Value_VCon (dtb_u_u862, dtb_u_u863) -> true
  | Core_dTerm.C_Value_VNeutral (dtb_u_u864) -> (match dtb_u_u864 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u865, dtb_u_u866, dtb_u_u867) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u868, dtb_u_u869) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 2491 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_remainingExplicitPis = (fun (dtb_u_u870 : int) (dtb_u_u871 : Elab_dTypes.t_Ctx) (dtb_u_u872 : Elab_dTypes.t_Ec) (dtb_u_u873 : Core_dTerm.t_Value) -> (if (dtb_u_u870 <= 0) then 0 else (match ((Elab_dTypes.v_forceVal dtb_u_u872) dtb_u_u873) with
  | Core_dTerm.C_Value_VPi (dtb_u_u874, dtb_u_u875, dtb_u_u876, dtb_u_u877, dtb_u_u878) -> (let dtb_u_u879 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u874, (Elab_dTypes.v_ctxDepth dtb_u_u871), B_dData_dList.C_List_Nil)))) in (let dtb_u_u880 = ((((v_remainingExplicitPis (dtb_u_u870 - 1)) dtb_u_u871) dtb_u_u872) ((Core_dEval.v_applyClosure dtb_u_u878) dtb_u_u879)) in (if dtb_u_u875 then dtb_u_u880 else (dtb_u_u880 + 1))))
  | _ -> 0
)))

# 2509 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryUseHint = (fun (dtb_u_u881 : Elab_dTypes.t_Ctx) (dtb_u_u882 : Core_dTerm.t_Value) (dtb_u_u883 : Elab_dTypes.t_Ec) (dtb_u_u884 : Core_dTerm.t_Value) -> (let dtb_u_u885 = ((((v_stripPisWithMetas 64) dtb_u_u881) dtb_u_u883) dtb_u_u884) in (match dtb_u_u885 with
  | Base_dDiag.C_Check_OkC (dtb_u_u886) -> (match dtb_u_u886 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u887; B_dData_dPair.f_Pair_second = dtb_u_u888 } -> (let dtb_u_u889 = ((Elab_dTypes.v_forceVal dtb_u_u888) dtb_u_u887) in (if ((v_isMetaHeadedValue dtb_u_u888) dtb_u_u889) then (if ((v_isRigidHeadValue dtb_u_u888) dtb_u_u882) then (match ((((Elab_dMeta.v_convEc dtb_u_u888) (Elab_dTypes.v_ctxDepth dtb_u_u881)) dtb_u_u882) dtb_u_u889) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u890) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb_u_u891) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u891))
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u892) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 2556 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowAndResult = (fun (dtb_u_u893 : Core_dTerm.t_Value) -> (match dtb_u_u893 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u894) -> (match dtb_u_u894 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u895, dtb_u_u896) -> (match dtb_u_u896 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u897, dtb_u_u898) -> (match dtb_u_u898 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u899, dtb_u_u900) -> (if (dtb_u_u895 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u897; B_dData_dPair.f_Pair_second = dtb_u_u899 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2562 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_effRowOfValue = (fun (dtb_u_u901 : Core_dTerm.t_Value) -> (match (v_effRowAndResult dtb_u_u901) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u902) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_firstOf dtb_u_u902)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2569 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isNilRowValue = (fun (dtb_u_u903 : Elab_dTypes.t_Ec) (dtb_u_u904 : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal dtb_u_u903) dtb_u_u904) with
  | Core_dTerm.C_Value_VCon (dtb_u_u905, dtb_u_u906) -> (dtb_u_u905 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 2576 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryLabelTail = (fun (dtb_u_u907 : Core_dTerm.t_Value) -> (match dtb_u_u907 with
  | Core_dTerm.C_Value_VCon (dtb_u_u908, dtb_u_u909) -> (if (dtb_u_u908 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u910 = dtb_u_u909 in (match dtb_u_u910 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u911, dtb_u_u912) -> (match dtb_u_u912 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u913, dtb_u_u914) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u911; B_dData_dPair.f_Pair_second = dtb_u_u913 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 2587 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_shortGlobalName = (fun (dtb_u_u915 : string) -> (Base_dSource.v_lastSeg dtb_u_u915))

# 2597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_labelHeadArgs = (fun (dtb_u_u916 : string) (dtb_u_u917 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u917 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u918, dtb_u_u919) -> ((v_labelHeadArgs (String.concat "" [dtb_u_u916; " "; ((Core_dEval.v_showValueAt 6) dtb_u_u918)])) dtb_u_u919)
  | B_dData_dList.C_List_Nil -> dtb_u_u916
  | _ -> failwith "DT: impossible branch"
))

# 2591 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowLabelText = (fun (dtb_u_u920 : Elab_dTypes.t_Ec) (dtb_u_u921 : Core_dTerm.t_Value) -> (let dtb_u_u922 = ((Elab_dTypes.v_forceVal dtb_u_u920) dtb_u_u921) in (match dtb_u_u922 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u923) -> (match dtb_u_u923 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u924, dtb_u_u925) -> ((v_labelHeadArgs (v_shortGlobalName dtb_u_u924)) dtb_u_u925)
  | _ -> ((Core_dEval.v_showValueAt 6) dtb_u_u921)
)
  | _ -> ((Core_dEval.v_showValueAt 6) dtb_u_u921)
)))

# 2602 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowNameText = (fun (dtb_u_u926 : Elab_dTypes.t_Ec) (dtb_u_u927 : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal dtb_u_u926) dtb_u_u927) with
  | Core_dTerm.C_Value_VStr (dtb_u_u928) -> dtb_u_u928
  | _ -> ((Core_dEval.v_showValueAt 6) dtb_u_u927)
))

# 2609 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryText = (fun (dtb_u_u929 : Elab_dTypes.t_Ec) (dtb_u_u930 : Core_dTerm.t_Value) (dtb_u_u931 : Core_dTerm.t_Value) -> (if (((v_rowNameText dtb_u_u929) dtb_u_u930) = "default") then ((v_rowLabelText dtb_u_u929) dtb_u_u931) else (String.concat "" [((v_rowLabelText dtb_u_u929) dtb_u_u931); "@"; ((v_rowNameText dtb_u_u929) dtb_u_u930)])))

# 2617 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_namedLabelParts = (fun (dtb_u_u932 : Elab_dTypes.t_Ec) (dtb_u_u933 : Core_dTerm.t_Value) -> (let dtb_u_u934 = ((Elab_dTypes.v_forceVal dtb_u_u932) dtb_u_u933) in (match dtb_u_u934 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u935) -> (match dtb_u_u935 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u936, dtb_u_u937) -> (if (dtb_u_u936 = Base_dIntrinsics.v_effNamedName) then (let dtb_u_u938 = dtb_u_u937 in (match dtb_u_u938 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u939, dtb_u_u940) -> (match dtb_u_u940 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u941, dtb_u_u942) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u939; B_dData_dPair.f_Pair_second = dtb_u_u941 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 2629 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_rowEntryTextOf = (fun (dtb_u_u943 : Elab_dTypes.t_Ec) (dtb_u_u944 : Core_dTerm.t_Value) -> (let dtb_u_u945 = ((v_namedLabelParts dtb_u_u943) dtb_u_u944) in (match dtb_u_u945 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_rowLabelText dtb_u_u943) dtb_u_u944)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u946) -> (match dtb_u_u946 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u947; B_dData_dPair.f_Pair_second = dtb_u_u948 } -> (((v_rowEntryText dtb_u_u943) dtb_u_u947) dtb_u_u948)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2636 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowEffectLabels = (fun (dtb_u_u949 : int) (dtb_u_u950 : Elab_dTypes.t_Ec) (dtb_u_u951 : Core_dTerm.t_Value) -> (if (dtb_u_u949 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal dtb_u_u950) dtb_u_u951) with
  | Core_dTerm.C_Value_VCon (dtb_u_u952, dtb_u_u953) -> (if (dtb_u_u952 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) else (if (dtb_u_u952 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u954 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb_u_u952, dtb_u_u953))) in (match dtb_u_u954 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u955) -> (match dtb_u_u955 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u956; B_dData_dPair.f_Pair_second = dtb_u_u957 } -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP dtb_u_u950)) dtb_u_u956) then B_dData_dMaybe.C_Maybe_Nothing else (match (((v_rowEffectLabels (dtb_u_u949 - 1)) dtb_u_u950) dtb_u_u957) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u958) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (((v_rowEntryTextOf dtb_u_u950) dtb_u_u956), dtb_u_u958))))
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
let rec v_rowNonDefaultHostEntries = (fun (dtb_u_u959 : int) (dtb_u_u960 : Elab_dTypes.t_Ec) (dtb_u_u961 : Core_dTerm.t_Value) -> (if (dtb_u_u959 <= 0) then B_dData_dList.C_List_Nil else (match ((Elab_dTypes.v_forceVal dtb_u_u960) dtb_u_u961) with
  | Core_dTerm.C_Value_VCon (dtb_u_u962, dtb_u_u963) -> (if (dtb_u_u962 = Base_dIntrinsics.v_effRowNilCtor) then B_dData_dList.C_List_Nil else (if (dtb_u_u962 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u964 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb_u_u962, dtb_u_u963))) in (match dtb_u_u964 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u965) -> (match dtb_u_u965 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u966; B_dData_dPair.f_Pair_second = dtb_u_u967 } -> (let dtb_u_u968 = (((v_rowNonDefaultHostEntries (dtb_u_u959 - 1)) dtb_u_u960) dtb_u_u967) in (let dtb_u_u969 = ((v_namedLabelParts dtb_u_u960) dtb_u_u966) in (match dtb_u_u969 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u968
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u970) -> (match dtb_u_u970 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u971; B_dData_dPair.f_Pair_second = dtb_u_u972 } -> (let dtb_u_u973 = ((Elab_dTypes.v_forceVal dtb_u_u960) dtb_u_u972) in (match dtb_u_u973 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u974) -> (match dtb_u_u974 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u975, dtb_u_u976) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb_u_u975) then (if (((v_rowNameText dtb_u_u960) dtb_u_u971) = "default") then dtb_u_u968 else (B_dData_dList.C_List__x58__x58_ ((((v_rowEntryText dtb_u_u960) dtb_u_u971) dtb_u_u972), dtb_u_u968))) else dtb_u_u968)
  | _ -> dtb_u_u968
)
  | _ -> dtb_u_u968
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
let rec v_joinEffectLabels = (fun (dtb_u_u977 : string B_dData_dList.t_List) -> (match dtb_u_u977 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u978, dtb_u_u979) -> (match dtb_u_u979 with
  | B_dData_dList.C_List_Nil -> dtb_u_u978
  | _ -> (String.concat "" [dtb_u_u978; ", "; (v_joinEffectLabels dtb_u_u979)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2696 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_unhandledEffectLabel = (fun (dtb_u_u980 : Elab_dTypes.t_Ec) (dtb_u_u981 : Core_dTerm.t_Value) (dtb_u_u982 : Core_dTerm.t_Value) -> (match (v_effRowOfValue ((Elab_dTypes.v_forceVal dtb_u_u980) dtb_u_u981)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u983) -> (if ((v_isNilRowValue dtb_u_u980) dtb_u_u983) then (match (v_effRowOfValue ((Elab_dTypes.v_forceVal dtb_u_u980) dtb_u_u982)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u984) -> (match (((v_rowEffectLabels 64) dtb_u_u980) dtb_u_u984) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u985) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb_u_u985) B_dData_dList.C_List_Nil) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u985)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2718 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_sameLabelValue = (fun (dtb_u_u986 : Elab_dTypes.t_Ec) (dtb_u_u987 : Core_dTerm.t_Value) (dtb_u_u988 : Core_dTerm.t_Value) -> (let dtb_u_u989 = (Elab_dTypes.v_ecDefTbl dtb_u_u986) in (let dtb_u_u990 = (Elab_dTypes.v_ecSolsP dtb_u_u986) in (let dtb_u_u991 = ((((Core_dEval.v_forceLabelArgs dtb_u_u989) dtb_u_u990) Core_dTerm.v_defaultFuel) dtb_u_u987) in (let dtb_u_u992 = ((((Core_dEval.v_forceLabelArgs dtb_u_u989) dtb_u_u990) Core_dTerm.v_defaultFuel) dtb_u_u988) in (let dtb_u_u993 = (((Core_dEval.v_valueEqFuel Core_dTerm.v_defaultFuel) dtb_u_u991) dtb_u_u992) in (match dtb_u_u993 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u994) -> (if dtb_u_u994 then true else false)
  | _ -> false
)))))))

# 2729 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowContainsValue = (fun (dtb_u_u995 : Elab_dTypes.t_Ec) (dtb_u_u996 : int) (dtb_u_u997 : Core_dTerm.t_Value) (dtb_u_u998 : Core_dTerm.t_Value) -> (if (dtb_u_u996 <= 0) then false else (match ((Elab_dTypes.v_forceVal dtb_u_u995) dtb_u_u997) with
  | Core_dTerm.C_Value_VCon (dtb_u_u999, dtb_u_u1000) -> (if (dtb_u_u999 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u1001 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb_u_u999, dtb_u_u1000))) in (match dtb_u_u1001 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1002) -> (match dtb_u_u1002 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1003; B_dData_dPair.f_Pair_second = dtb_u_u1004 } -> (if (((v_sameLabelValue dtb_u_u995) dtb_u_u998) dtb_u_u1003) then true else ((((v_rowContainsValue dtb_u_u995) (dtb_u_u996 - 1)) ((Elab_dTypes.v_forceVal dtb_u_u995) dtb_u_u1004)) dtb_u_u998))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false)
  | _ -> false
)))

# 2744 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_rowSubValue = (fun (dtb_u_u1005 : Elab_dTypes.t_Ec) (dtb_u_u1006 : int) (dtb_u_u1007 : Core_dTerm.t_Value) (dtb_u_u1008 : Core_dTerm.t_Value) -> (if (dtb_u_u1006 <= 0) then false else (match ((Elab_dTypes.v_forceVal dtb_u_u1005) dtb_u_u1007) with
  | Core_dTerm.C_Value_VCon (dtb_u_u1009, dtb_u_u1010) -> (if (dtb_u_u1009 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb_u_u1009 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u1011 = (v_rowEntryLabelTail (Core_dTerm.C_Value_VCon (dtb_u_u1009, dtb_u_u1010))) in (match dtb_u_u1011 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1012) -> (match dtb_u_u1012 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1013; B_dData_dPair.f_Pair_second = dtb_u_u1014 } -> (if ((((v_rowContainsValue dtb_u_u1005) (dtb_u_u1006 - 1)) dtb_u_u1008) dtb_u_u1013) then ((((v_rowSubValue dtb_u_u1005) (dtb_u_u1006 - 1)) ((Elab_dTypes.v_forceVal dtb_u_u1005) dtb_u_u1014)) dtb_u_u1008) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)))

# 2808 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_weakenLabelTerm = (fun (dtb_u_u1015 : int) (dtb_u_u1016 : Core_dTerm.t_Value) (dtb_u_u1017 : Core_dTerm.t_Value) (dtb_u_u1018 : Core_dTerm.t_Value) (dtb_u_u1019 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effWeakenName)), ((Core_dEval.v_quote dtb_u_u1015) dtb_u_u1016), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote dtb_u_u1015) dtb_u_u1017), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote dtb_u_u1015) dtb_u_u1018), Core_dTerm.C_Rig_Rig0)), dtb_u_u1019, Core_dTerm.C_Rig_RigOmega)))

# 2764 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_tryEffLift = (fun (dtb_u_u1020 : Elab_dTypes.t_Ctx) (dtb_u_u1021 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1022 : Elab_dTypes.t_Ec) (dtb_u_u1023 : Core_dTerm.t_Value) (dtb_u_u1024 : Core_dTerm.t_Value) (dtb_u_u1025 : Core_dTerm.t_Term) -> (match (((Elab_dMeta.v_globalsLookup Base_dIntrinsics.v_effWeakenName) dtb_u_u1021) dtb_u_u1022) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1026) -> (let dtb_u_u1027 = (Elab_dTypes.v_ctxDepth dtb_u_u1020) in (match (v_effRowAndResult ((Elab_dTypes.v_forceVal dtb_u_u1022) dtb_u_u1023)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1028) -> (let dtb_u_u1029 = (v_rowEntryLabelTail ((Elab_dTypes.v_forceVal dtb_u_u1022) (B_dData_dPair.v_firstOf dtb_u_u1028))) in (match dtb_u_u1029 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1030) -> (match dtb_u_u1030 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1031; B_dData_dPair.f_Pair_second = dtb_u_u1032 } -> (let dtb_u_u1033 = ((Elab_dTypes.v_forceVal dtb_u_u1022) dtb_u_u1032) in (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP dtb_u_u1022)) dtb_u_u1033) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_effRowAndResult ((Elab_dTypes.v_forceVal dtb_u_u1022) dtb_u_u1024)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1034) -> (match ((((Elab_dMeta.v_convEc dtb_u_u1022) dtb_u_u1027) (B_dData_dPair.v_secondOf dtb_u_u1028)) (B_dData_dPair.v_secondOf dtb_u_u1034)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1035) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb_u_u1036) -> (let dtb_u_u1037 = (B_dData_dPair.v_firstOf dtb_u_u1034) in (if ((((v_rowSubValue dtb_u_u1036) 64) dtb_u_u1037) (B_dData_dPair.v_firstOf dtb_u_u1028)) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u1025; B_dData_dPair.f_Pair_second = dtb_u_u1036 })) else (if ((v_isNilRowValue dtb_u_u1036) dtb_u_u1037) then (match (((Elab_dMeta.v_globalsLookup Base_dIntrinsics.v_effRaiseName) dtb_u_u1021) dtb_u_u1036) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1038) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effRaiseName)), ((Core_dEval.v_quote dtb_u_u1027) (B_dData_dPair.v_firstOf dtb_u_u1028)), Core_dTerm.C_Rig_Rig0)), ((Core_dEval.v_quote dtb_u_u1027) (B_dData_dPair.v_secondOf dtb_u_u1028)), Core_dTerm.C_Rig_Rig0)), dtb_u_u1025, Core_dTerm.C_Rig_RigOmega)); B_dData_dPair.f_Pair_second = dtb_u_u1036 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Elab_dMeta.v_convEc dtb_u_u1036) dtb_u_u1027) dtb_u_u1037) dtb_u_u1033) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1039) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb_u_u1040) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((((v_weakenLabelTerm dtb_u_u1027) dtb_u_u1031) dtb_u_u1033) (B_dData_dPair.v_secondOf dtb_u_u1028)) dtb_u_u1025); B_dData_dPair.f_Pair_second = dtb_u_u1040 }))
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
let v_typeHeadTerm = (fun (dtb_u_u1041 : Elab_dTypes.t_Ec) (dtb_u_u1042 : string) -> (match ((Elab_dMeta.v_dtDataLookup dtb_u_u1042) (Elab_dTypes.v_ecDatas dtb_u_u1041)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1043) -> (if (Elab_dTypes.v_dtDataIsRecord dtb_u_u1043) then (Core_dTerm.C_Term_TRecord (dtb_u_u1042, B_dData_dList.C_List_Nil)) else (Core_dTerm.C_Term_TGlobal (dtb_u_u1042)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (dtb_u_u1042))
  | _ -> failwith "DT: impossible branch"
))

# 2919 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_typeAppTerm = (fun (dtb_u_u1044 : Elab_dTypes.t_Ec) (dtb_u_u1045 : string) (dtb_u_u1046 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtDataLookup dtb_u_u1045) (Elab_dTypes.v_ecDatas dtb_u_u1044)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1047) -> (if (Elab_dTypes.v_dtDataIsRecord dtb_u_u1047) then (Core_dTerm.C_Term_TRecord (dtb_u_u1045, dtb_u_u1046)) else ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb_u_u1045))) dtb_u_u1046))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal (dtb_u_u1045))) dtb_u_u1046)
  | _ -> failwith "DT: impossible branch"
))

# 3195 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromIntTerm = (fun (dtb_u_u1048 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromInt")), dtb_u_u1048, Core_dTerm.C_Rig_Rig1)))

# 3199 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strFromFloatTerm = (fun (dtb_u_u1049 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("strFromFloat")), dtb_u_u1049, Core_dTerm.C_Rig_Rig1)))

# 3202 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_strTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil))))

# 3205 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_isStringTyValue = (fun (dtb_u_u1050 : Core_dTerm.t_Value) -> (match dtb_u_u1050 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u1051) -> (match dtb_u_u1051 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u1052, dtb_u_u1053) -> (match dtb_u_u1053 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u1052 = Base_dIntrinsics.v_strTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 3287 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorSpineOfType = (fun (dtb_u_u1054 : Core_dTerm.t_Term) -> (match dtb_u_u1054 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u1055) -> { B_dData_dPair.f_Pair_first = dtb_u_u1055; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | Core_dTerm.C_Term_TRecord (dtb_u_u1056, dtb_u_u1057) -> { B_dData_dPair.f_Pair_first = dtb_u_u1056; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u1057) }
  | Core_dTerm.C_Term_TApp (dtb_u_u1058, dtb_u_u1059, dtb_u_u1060) -> (match (v_ctorSpineOfType dtb_u_u1058) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1061; B_dData_dPair.f_Pair_second = dtb_u_u1062 } -> { B_dData_dPair.f_Pair_first = dtb_u_u1061; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u1062) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1059, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 3283 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorResultArgs = (fun (dtb_u_u1063 : Core_dTerm.t_Term) -> (match dtb_u_u1063 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1064, dtb_u_u1065, dtb_u_u1066, dtb_u_u1067, dtb_u_u1068) -> (v_ctorResultArgs dtb_u_u1068)
  | _ -> (B_dData_dPair.v_secondOf (v_ctorSpineOfType dtb_u_u1063))
))

# 3295 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_dropPis = (fun (dtb_u_u1069 : Core_dTerm.t_Term) -> (match dtb_u_u1069 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1070, dtb_u_u1071, dtb_u_u1072, dtb_u_u1073, dtb_u_u1074) -> (v_dropPis dtb_u_u1074)
  | _ -> dtb_u_u1069
))

# 3299 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_identityArgs = (fun (dtb_u_u1075 : int) (dtb_u_u1076 : int) (dtb_u_u1077 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u1077 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1078, dtb_u_u1079) -> (match dtb_u_u1078 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1080, dtb_u_u1081, dtb_u_u1082) -> (if (dtb_u_u1081 = ((dtb_u_u1076 - 1) - dtb_u_u1075)) then (((v_identityArgs (dtb_u_u1075 + 1)) dtb_u_u1076) dtb_u_u1079) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 3309 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorIdentitySpine = (fun (dtb_u_u1083 : string) (dtb_u_u1084 : Elab_dTypes.t_DtCtor) -> (let dtb_u_u1085 = (B_dData_dList.v_length (Elab_dTypes.v_dtCtorTelescope dtb_u_u1084)) in (let dtb_u_u1086 = (v_ctorResultArgs (Elab_dTypes.v_dtCtorType dtb_u_u1084)) in (match (v_ctorSpineOfType (v_dropPis (Elab_dTypes.v_dtCtorType dtb_u_u1084))) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1087; B_dData_dPair.f_Pair_second = dtb_u_u1088 } -> (if (dtb_u_u1087 = dtb_u_u1083) then (if ((B_dData_dList.v_length dtb_u_u1086) > 0) then (if ((B_dData_dList.v_length dtb_u_u1086) <= dtb_u_u1085) then (((v_identityArgs 0) dtb_u_u1085) dtb_u_u1086) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
))))

# 3325 "Vuna/Compiler/Elab/Term/Impl.vuna"
let[@tail_mod_cons] rec v_takeRigsGo = (fun (dtb_u_u1089 : int) (dtb_u_u1090 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1090 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1091, dtb_u_u1092) -> (if (dtb_u_u1089 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb_u_u1091), ((v_takeRigsGo (dtb_u_u1089 - 1)) dtb_u_u1092))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 3322 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_takeRigs = (fun (dtb_u_u1093 : int) (dtb_u_u1094 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_takeRigsGo dtb_u_u1093) dtb_u_u1094))

# 3343 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_ctorFamilyArgsGo = (fun (dtb_u_u1095 : Elab_dTypes.t_Ec) (dtb_u_u1096 : Core_dTerm.t_Value) (dtb_u_u1097 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u1098 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u1099 : int) (dtb_u_u1100 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1097 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1101, dtb_u_u1102) -> (match dtb_u_u1098 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1103, dtb_u_u1104) -> (match ((Elab_dTypes.v_forceVal dtb_u_u1095) dtb_u_u1096) with
  | Core_dTerm.C_Value_VPi (dtb_u_u1105, dtb_u_u1106, dtb_u_u1107, dtb_u_u1108, dtb_u_u1109) -> (if dtb_u_u1106 then ((((((v_ctorFamilyArgsGo dtb_u_u1095) ((Core_dEval.v_applyClosure dtb_u_u1109) dtb_u_u1101)) dtb_u_u1102) dtb_u_u1104) dtb_u_u1099) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote dtb_u_u1099) dtb_u_u1101); B_dData_dPair.f_Pair_second = dtb_u_u1103 }, dtb_u_u1100))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1100); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1096; B_dData_dPair.f_Pair_second = dtb_u_u1095 } }))
  | _ -> failwith "DT: impossible branch"
))

# 3329 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_ctorFamilyArgs = (fun (dtb_u_u1110 : Elab_dTypes.t_Ec) (dtb_u_u1111 : Elab_dTypes.t_Ctx) (dtb_u_u1112 : Elab_dTypes.t_DtCtor) (dtb_u_u1113 : Core_dTerm.t_Value) -> (let dtb_u_u1114 = (Elab_dTypes.v_dtCtorFamily dtb_u_u1112) in (if ((v_ctorIdentitySpine dtb_u_u1114) dtb_u_u1112) then (let dtb_u_u1115 = ((Elab_dTypes.v_forceVal dtb_u_u1110) dtb_u_u1113) in (match dtb_u_u1115 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u1116) -> (match dtb_u_u1116 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u1117, dtb_u_u1118) -> (let dtb_u_u1119 = (B_dData_dList.v_length (v_ctorResultArgs (Elab_dTypes.v_dtCtorType dtb_u_u1112))) in (if (dtb_u_u1117 = dtb_u_u1114) then (if ((B_dData_dList.v_length dtb_u_u1118) = dtb_u_u1119) then ((((((v_ctorFamilyArgsGo dtb_u_u1110) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u1112))) dtb_u_u1118) ((v_takeRigs dtb_u_u1119) (Elab_dTypes.v_dtCtorTelescope dtb_u_u1112))) (Elab_dTypes.v_ctxDepth dtb_u_u1111)) B_dData_dList.C_List_Nil) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 3365 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_natPatGo = (fun (dtb_u_u1120 : int) (dtb_u_u1121 : Base_dSource.t_Span) -> (if (dtb_u_u1120 <= 0) then (Frontend_dAst.C_Pat_PCon (Base_dIntrinsics.v_natZeroCtor, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef dtb_u_u1121))) else (Frontend_dAst.C_Pat_PCon (Base_dIntrinsics.v_natSuccCtor, (B_dData_dList.C_List__x58__x58_ (((v_natPatGo (dtb_u_u1120 - 1)) dtb_u_u1121), B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef dtb_u_u1121)))))

# 3361 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_natPatOf = (fun (dtb_u_u1122 : int) (dtb_u_u1123 : Base_dSource.t_Span) -> (if (dtb_u_u1122 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1123) Base_dDiagnostics_dTc.C_TcErr_NatLiteralOutOfRange) else (Base_dDiag.C_Check_OkC (((v_natPatGo dtb_u_u1122) dtb_u_u1123)))))

# 3373 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverPatFuel = (fun (dtb_u_u1124 : int) (dtb_u_u1125 : Elab_dTypes.t_Ec) (dtb_u_u1126 : Elab_dTypes.t_Ctx) (dtb_u_u1127 : Core_dTerm.t_Value) (dtb_u_u1128 : Frontend_dAst.t_Pat) -> (let dtnat__595 = dtb_u_u1124 in (if (dtnat__595 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb_u_u1129 = (dtnat__595 - 1) in (match dtb_u_u1128 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u1130, dtb_u_u1131, dtb_u_u1132) -> (let dtb_u_u1133 = (Frontend_dReserved.v_classify dtb_u_u1130) in (match dtb_u_u1133 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1134) -> (match dtb_u_u1134 with
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u1135, dtb_u_u1136) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor dtb_u_u1125) (Frontend_dAst.v_nodeRefSpan dtb_u_u1132)) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1127))) dtb_u_u1135) dtb_u_u1136)) (fun (dtb_u_u1137 : string) -> (((((((v_resolveCtorPatFuel dtb_u_u1129) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) dtb_u_u1137) dtb_u_u1131) (Frontend_dAst.v_nodeRefSpan dtb_u_u1132))))
  | Frontend_dReserved.C_Reserved_RsListCons -> (match ((v_litFamilyCons dtb_u_u1125) ((v_listLitFamily dtb_u_u1125) dtb_u_u1127)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1138) -> (((((((v_resolveCtorPatFuel dtb_u_u1129) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) (Elab_dTypes.v_dtCtorName dtb_u_u1138)) dtb_u_u1131) (Frontend_dAst.v_nodeRefSpan dtb_u_u1132))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("__list_literal__", dtb_u_u1131, dtb_u_u1132)); B_dData_dPair.f_Pair_second = dtb_u_u1125 }))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dReserved.C_Reserved_RsListNil -> (match (((v_litFamilyCtor dtb_u_u1125) ((v_listLitFamily dtb_u_u1125) dtb_u_u1127)) "Nil") with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1139) -> (((((((v_resolveCtorPatFuel dtb_u_u1129) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) (Elab_dTypes.v_dtCtorName dtb_u_u1139)) dtb_u_u1131) (Frontend_dAst.v_nodeRefSpan dtb_u_u1132))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("__list_literal__", dtb_u_u1131, dtb_u_u1132)); B_dData_dPair.f_Pair_second = dtb_u_u1125 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_resolveCtorPatFuel dtb_u_u1129) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) dtb_u_u1130) dtb_u_u1131) (Frontend_dAst.v_nodeRefSpan dtb_u_u1132))
)
  | _ -> (((((((v_resolveCtorPatFuel dtb_u_u1129) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) dtb_u_u1130) dtb_u_u1131) (Frontend_dAst.v_nodeRefSpan dtb_u_u1132))
))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u1140, dtb_u_u1141) -> (if ((v_isNatTy dtb_u_u1125) dtb_u_u1127) then ((Base_dCommon.v_bind ((v_natPatOf dtb_u_u1140) (Frontend_dAst.v_nodeRefSpan dtb_u_u1141))) (fun (dtb_u_u1142 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1142; B_dData_dPair.f_Pair_second = dtb_u_u1125 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1128; B_dData_dPair.f_Pair_second = dtb_u_u1125 })))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u1143, dtb_u_u1144, dtb_u_u1145) -> (match dtb_u_u1144 with
  | Frontend_dAst.C_Pat_PInt (dtb_u_u1146, dtb_u_u1147) -> (if ((v_isNatTy dtb_u_u1125) dtb_u_u1127) then ((Base_dCommon.v_bind ((v_natPatOf dtb_u_u1146) (Frontend_dAst.v_nodeRefSpan dtb_u_u1147))) (fun (dtb_u_u1148 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb_u_u1143, dtb_u_u1148, dtb_u_u1145)); B_dData_dPair.f_Pair_second = dtb_u_u1125 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1128; B_dData_dPair.f_Pair_second = dtb_u_u1125 })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1128; B_dData_dPair.f_Pair_second = dtb_u_u1125 }))
)
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u1149, dtb_u_u1150, dtb_u_u1151) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1128; B_dData_dPair.f_Pair_second = dtb_u_u1125 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1128; B_dData_dPair.f_Pair_second = dtb_u_u1125 }))
)))))
# 3411 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolveCtorPatFuel = (fun (dtb_u_u1152 : int) (dtb_u_u1153 : Elab_dTypes.t_Ec) (dtb_u_u1154 : Elab_dTypes.t_Ctx) (dtb_u_u1155 : Core_dTerm.t_Value) (dtb_u_u1156 : string) (dtb_u_u1157 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1158 : Base_dSource.t_Span) -> (let dtnat__615 = dtb_u_u1152 in (if (dtnat__615 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb_u_u1159 = (dtnat__615 - 1) in (match ((Elab_dMeta.v_dtCtorLookupEc dtb_u_u1153) dtb_u_u1156) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u1156, dtb_u_u1157, (Frontend_dAst.v_detachedNodeRef dtb_u_u1158))); B_dData_dPair.f_Pair_second = dtb_u_u1153 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1160) -> (let dtb_u_u1161 = ((((v_ctorFamilyArgs dtb_u_u1153) dtb_u_u1154) dtb_u_u1160) dtb_u_u1155) in (match dtb_u_u1161 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1162) -> (match dtb_u_u1162 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1163; B_dData_dPair.f_Pair_second = dtb_u_u1164 } -> (match dtb_u_u1164 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1165; B_dData_dPair.f_Pair_second = dtb_u_u1166 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb_u_u1159) dtb_u_u1166) dtb_u_u1154) dtb_u_u1165) dtb_u_u1157)) (fun (dtb_u_u1167 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1167 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1168; B_dData_dPair.f_Pair_second = dtb_u_u1169 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u1156, dtb_u_u1168, (Frontend_dAst.v_detachedNodeRef dtb_u_u1158))); B_dData_dPair.f_Pair_second = dtb_u_u1169 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u1156, dtb_u_u1157, (Frontend_dAst.v_detachedNodeRef dtb_u_u1158))); B_dData_dPair.f_Pair_second = dtb_u_u1153 }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))
# 3427 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_resolvePatArgsFuel = (fun (dtb_u_u1170 : int) (dtb_u_u1171 : Elab_dTypes.t_Ec) (dtb_u_u1172 : Elab_dTypes.t_Ctx) (dtb_u_u1173 : Core_dTerm.t_Value) (dtb_u_u1174 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__625 = dtb_u_u1170 in (if (dtnat__625 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb_u_u1175 = (dtnat__625 - 1) in (match dtb_u_u1174 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1171 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1176, dtb_u_u1177) -> (match ((Elab_dTypes.v_forceVal dtb_u_u1171) dtb_u_u1173) with
  | Core_dTerm.C_Value_VPi (dtb_u_u1178, dtb_u_u1179, dtb_u_u1180, dtb_u_u1181, dtb_u_u1182) -> (let dtb_u_u1183 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u1178, (Elab_dTypes.v_ctxDepth dtb_u_u1172), B_dData_dList.C_List_Nil)))) in (let dtb_u_u1184 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1178) dtb_u_u1181) dtb_u_u1172) in (let dtb_u_u1185 = ((Core_dEval.v_applyClosure dtb_u_u1182) dtb_u_u1183) in (if dtb_u_u1179 then (((((v_resolvePatArgsFuel dtb_u_u1175) dtb_u_u1171) dtb_u_u1184) dtb_u_u1185) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1176, dtb_u_u1177))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb_u_u1175) dtb_u_u1171) dtb_u_u1172) dtb_u_u1181) dtb_u_u1176)) (fun (dtb_u_u1186 : (Frontend_dAst.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1186 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1187; B_dData_dPair.f_Pair_second = dtb_u_u1188 } -> ((Base_dCommon.v_bind (((((v_resolvePatArgsFuel dtb_u_u1175) dtb_u_u1188) dtb_u_u1184) dtb_u_u1185) dtb_u_u1177)) (fun (dtb_u_u1189 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1189 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1190; B_dData_dPair.f_Pair_second = dtb_u_u1191 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1187, dtb_u_u1190)); B_dData_dPair.f_Pair_second = dtb_u_u1191 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1174; B_dData_dPair.f_Pair_second = dtb_u_u1171 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3459 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverAltsGo = (fun (dtb_u_u1192 : int) (dtb_u_u1193 : Elab_dTypes.t_Ec) (dtb_u_u1194 : Elab_dTypes.t_Ctx) (dtb_u_u1195 : Core_dTerm.t_Value) (dtb_u_u1196 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__638 = dtb_u_u1192 in (if (dtnat__638 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb_u_u1197 = (dtnat__638 - 1) in (let dtb_u_u1198 = dtb_u_u1196 in (match dtb_u_u1198 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1199, dtb_u_u1200) -> (match dtb_u_u1199 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1201; B_dData_dPair.f_Pair_second = dtb_u_u1202 } -> ((Base_dCommon.v_bind (((((v_resolveOverPatFuel (bi_natFromInt 512)) dtb_u_u1193) dtb_u_u1194) dtb_u_u1195) dtb_u_u1201)) (fun (dtb_u_u1203 : (Frontend_dAst.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1203 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1204; B_dData_dPair.f_Pair_second = dtb_u_u1205 } -> ((Base_dCommon.v_bind (((((v_resolveOverAltsGo dtb_u_u1197) dtb_u_u1205) dtb_u_u1194) dtb_u_u1195) dtb_u_u1200)) (fun (dtb_u_u1206 : ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1206 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1207; B_dData_dPair.f_Pair_second = dtb_u_u1208 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1204; B_dData_dPair.f_Pair_second = dtb_u_u1202 }, dtb_u_u1207)); B_dData_dPair.f_Pair_second = dtb_u_u1208 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1193 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3455 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverAlts = (fun (dtb_u_u1209 : Elab_dTypes.t_Ec) (dtb_u_u1210 : Elab_dTypes.t_Ctx) (dtb_u_u1211 : Core_dTerm.t_Value) (dtb_u_u1212 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverAltsGo (bi_natFromInt 512)) dtb_u_u1209) dtb_u_u1210) dtb_u_u1211) dtb_u_u1212))

# 3501 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveClausePatsFuel = (fun (dtb_u_u1213 : int) (dtb_u_u1214 : Elab_dTypes.t_Ec) (dtb_u_u1215 : Elab_dTypes.t_Ctx) (dtb_u_u1216 : Core_dTerm.t_Value) (dtb_u_u1217 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtnat__648 = dtb_u_u1213 in (if (dtnat__648 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb_u_u1218 = (dtnat__648 - 1) in (match dtb_u_u1217 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1214 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1219, dtb_u_u1220) -> (match ((Elab_dTypes.v_forceVal dtb_u_u1214) dtb_u_u1216) with
  | Core_dTerm.C_Value_VPi (dtb_u_u1221, dtb_u_u1222, dtb_u_u1223, dtb_u_u1224, dtb_u_u1225) -> (let dtb_u_u1226 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u1221, (Elab_dTypes.v_ctxDepth dtb_u_u1215), B_dData_dList.C_List_Nil)))) in (let dtb_u_u1227 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1221) dtb_u_u1224) dtb_u_u1215) in (let dtb_u_u1228 = ((Core_dEval.v_applyClosure dtb_u_u1225) dtb_u_u1226) in (if dtb_u_u1222 then (((((v_resolveClausePatsFuel dtb_u_u1218) dtb_u_u1214) dtb_u_u1227) dtb_u_u1228) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1219, dtb_u_u1220))) else ((Base_dCommon.v_bind (((((v_resolveOverPatFuel dtb_u_u1218) dtb_u_u1214) dtb_u_u1215) dtb_u_u1224) dtb_u_u1219)) (fun (dtb_u_u1229 : (Frontend_dAst.t_Pat, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1229 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1230; B_dData_dPair.f_Pair_second = dtb_u_u1231 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel dtb_u_u1218) dtb_u_u1231) dtb_u_u1227) dtb_u_u1228) dtb_u_u1220)) (fun (dtb_u_u1232 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1232 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1233; B_dData_dPair.f_Pair_second = dtb_u_u1234 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1230, dtb_u_u1233)); B_dData_dPair.f_Pair_second = dtb_u_u1234 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1217; B_dData_dPair.f_Pair_second = dtb_u_u1214 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3483 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_resolveOverFunPatsGo = (fun (dtb_u_u1235 : int) (dtb_u_u1236 : Elab_dTypes.t_Ec) (dtb_u_u1237 : Elab_dTypes.t_Ctx) (dtb_u_u1238 : Core_dTerm.t_Value) (dtb_u_u1239 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtnat__661 = dtb_u_u1235 in (if (dtnat__661 = 0) then (Base_dDiag.v_icFuel "pattern resolve") else (let dtb_u_u1240 = (dtnat__661 - 1) in (let dtb_u_u1241 = dtb_u_u1239 in (match dtb_u_u1241 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1242, dtb_u_u1243) -> (match dtb_u_u1242 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1244; B_dData_dPair.f_Pair_second = dtb_u_u1245 } -> ((Base_dCommon.v_bind (((((v_resolveClausePatsFuel (bi_natFromInt 512)) dtb_u_u1236) dtb_u_u1237) dtb_u_u1238) dtb_u_u1244)) (fun (dtb_u_u1246 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1246 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1247; B_dData_dPair.f_Pair_second = dtb_u_u1248 } -> ((Base_dCommon.v_bind (((((v_resolveOverFunPatsGo dtb_u_u1240) dtb_u_u1248) dtb_u_u1237) dtb_u_u1238) dtb_u_u1243)) (fun (dtb_u_u1249 : ((Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1249 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1250; B_dData_dPair.f_Pair_second = dtb_u_u1251 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1247; B_dData_dPair.f_Pair_second = dtb_u_u1245 }, dtb_u_u1250)); B_dData_dPair.f_Pair_second = dtb_u_u1251 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1236 }))
  | _ -> failwith "DT: impossible branch"
))))))

# 3478 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_resolveOverFunPats = (fun (dtb_u_u1252 : Elab_dTypes.t_Ec) (dtb_u_u1253 : Elab_dTypes.t_Ctx) (dtb_u_u1254 : Core_dTerm.t_Value) (dtb_u_u1255 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_resolveOverFunPatsGo (bi_natFromInt 512)) dtb_u_u1252) dtb_u_u1253) dtb_u_u1254) dtb_u_u1255))

# 3582 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doMarkerHead = (fun (dtb_u_u1256 : Frontend_dAst.t_Expr) -> (match dtb_u_u1256 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1257, dtb_u_u1258, dtb_u_u1259) -> (match dtb_u_u1257 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1260, dtb_u_u1261) -> (match (Frontend_dReserved.v_doSyntaxCanonical dtb_u_u1260) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1262) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 3605 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_decodeDoChain = (fun (dtb_u_u1263 : int) (dtb_u_u1264 : string) (dtb_u_u1265 : t_DoChainStep B_dData_dList.t_List) (dtb_u_u1266 : Frontend_dAst.t_Expr) -> (if (dtb_u_u1263 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u1267 = dtb_u_u1266 in (match dtb_u_u1267 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1268, dtb_u_u1269, dtb_u_u1270) -> (match dtb_u_u1268 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1271, dtb_u_u1272) -> (match (Frontend_dReserved.v_doSyntaxCanonical dtb_u_u1271) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1265); B_dData_dPair.f_Pair_second = dtb_u_u1266 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1273) -> (if (dtb_u_u1264 <> dtb_u_u1273) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u1274 = dtb_u_u1269 in (match dtb_u_u1274 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1275, dtb_u_u1276) -> (match dtb_u_u1276 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1277, dtb_u_u1278) -> (match dtb_u_u1277 with
  | Frontend_dAst.C_Expr_ELam (dtb_u_u1279, dtb_u_u1280, dtb_u_u1281) -> (match dtb_u_u1279 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1282, dtb_u_u1283) -> (match dtb_u_u1282 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1284; B_dData_dPair.f_Pair_second = dtb_u_u1285 } -> (match dtb_u_u1283 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u1278 with
  | B_dData_dList.C_List_Nil -> ((((v_decodeDoChain (dtb_u_u1263 - 1)) dtb_u_u1273) (B_dData_dList.C_List__x58__x58_ ((C_DoChainStep_DoChainStep (dtb_u_u1284, dtb_u_u1275, (Frontend_dAst.v_nodeRefSpan dtb_u_u1272), dtb_u_u1285)), dtb_u_u1265))) dtb_u_u1280)
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
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1265); B_dData_dPair.f_Pair_second = dtb_u_u1266 }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1265); B_dData_dPair.f_Pair_second = dtb_u_u1266 }))
))))

# 3624 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_decodeDoBlock = (fun (dtb_u_u1286 : Frontend_dAst.t_Expr) -> (match dtb_u_u1286 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1287, dtb_u_u1288, dtb_u_u1289) -> (match dtb_u_u1287 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1290, dtb_u_u1291) -> (match (Frontend_dReserved.v_doSyntaxCanonical dtb_u_u1290) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1292) -> (let dtb_u_u1293 = ((((v_decodeDoChain 4096) dtb_u_u1292) B_dData_dList.C_List_Nil) dtb_u_u1286) in (match dtb_u_u1293 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1294) -> (match dtb_u_u1294 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1295; B_dData_dPair.f_Pair_second = dtb_u_u1296 } -> (B_dData_dMaybe.C_Maybe_Just ({ f_DoChain_doChainCanonical = dtb_u_u1292; f_DoChain_doChainSteps = dtb_u_u1295; f_DoChain_doChainLast = dtb_u_u1296; f_DoChain_doChainSpan = (Frontend_dAst.v_nodeRefSpan dtb_u_u1291) }))
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
let rec v_doChainBuild = (fun (dtb_u_u1297 : string) (dtb_u_u1298 : t_DoChainStep B_dData_dList.t_List) (dtb_u_u1299 : Frontend_dAst.t_Expr) (dtb_u_u1300 : Base_dSource.t_Span) -> (match dtb_u_u1298 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1301, dtb_u_u1302) -> (match dtb_u_u1301 with
  | C_DoChainStep_DoChainStep (dtb_u_u1303, dtb_u_u1304, dtb_u_u1305, dtb_u_u1306) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u1297, (Frontend_dAst.v_detachedNodeRef dtb_u_u1305))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1304, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1303; B_dData_dPair.f_Pair_second = dtb_u_u1306 }, B_dData_dList.C_List_Nil)), ((((v_doChainBuild dtb_u_u1297) dtb_u_u1302) dtb_u_u1299) dtb_u_u1300), (Frontend_dAst.v_detachedNodeRef dtb_u_u1305))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef dtb_u_u1305)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u1299
  | _ -> failwith "DT: impossible branch"
))

# 3645 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainFallback = (fun (dtb_u_u1307 : t_DoChain) -> ((((v_doChainBuild (dtb_u_u1307).f_DoChain_doChainCanonical) (dtb_u_u1307).f_DoChain_doChainSteps) (dtb_u_u1307).f_DoChain_doChainLast) (dtb_u_u1307).f_DoChain_doChainSpan))

# 3652 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_splitDoSpine = (fun (dtb_u_u1308 : Core_dTerm.t_Value) (dtb_u_u1309 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u1309 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1310, dtb_u_u1311) -> (match ((v_splitDoSpine ((Core_dEval.v_applyValue dtb_u_u1308) dtb_u_u1310)) dtb_u_u1311) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u1308; B_dData_dPair.f_Pair_second = dtb_u_u1310 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1312) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1312))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 3660 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_splitDoExpected = (fun (dtb_u_u1313 : Elab_dTypes.t_Ec) (dtb_u_u1314 : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal dtb_u_u1313) dtb_u_u1314) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u1315) -> (match dtb_u_u1315 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u1316, dtb_u_u1317, dtb_u_u1318) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u1316, dtb_u_u1317, B_dData_dList.C_List_Nil))))) dtb_u_u1318)
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u1319, dtb_u_u1320) -> ((v_splitDoSpine (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u1319, B_dData_dList.C_List_Nil))))) dtb_u_u1320)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 3678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_bindShapeOf = (fun (dtb_u_u1321 : Core_dTerm.t_Term) -> (match dtb_u_u1321 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1322, dtb_u_u1323, dtb_u_u1324, dtb_u_u1325, dtb_u_u1326) -> (if dtb_u_u1323 then (match dtb_u_u1326 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1327, dtb_u_u1328, dtb_u_u1329, dtb_u_u1330, dtb_u_u1331) -> (if dtb_u_u1328 then (match dtb_u_u1330 with
  | Core_dTerm.C_Term_TApp (dtb_u_u1332, dtb_u_u1333, dtb_u_u1334) -> (match dtb_u_u1332 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u1335) -> (match dtb_u_u1333 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1336, dtb_u_u1337, dtb_u_u1338) -> (match dtb_u_u1331 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1339, dtb_u_u1340, dtb_u_u1341, dtb_u_u1342, dtb_u_u1343) -> (if dtb_u_u1340 then (match dtb_u_u1343 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1344, dtb_u_u1345, dtb_u_u1346, dtb_u_u1347, dtb_u_u1348) -> (if dtb_u_u1345 then (match dtb_u_u1348 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1349, dtb_u_u1350, dtb_u_u1351, dtb_u_u1352, dtb_u_u1353) -> (if dtb_u_u1350 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u1352 with
  | Core_dTerm.C_Term_TApp (dtb_u_u1354, dtb_u_u1355, dtb_u_u1356) -> (match dtb_u_u1354 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1357, dtb_u_u1358, dtb_u_u1359) -> (match dtb_u_u1355 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1360, dtb_u_u1361, dtb_u_u1362) -> (match dtb_u_u1353 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1363, dtb_u_u1364, dtb_u_u1365, dtb_u_u1366, dtb_u_u1367) -> (if dtb_u_u1364 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u1366 with
  | Core_dTerm.C_Term_TPi (dtb_u_u1368, dtb_u_u1369, dtb_u_u1370, dtb_u_u1371, dtb_u_u1372) -> (if dtb_u_u1369 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u1371 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1373, dtb_u_u1374, dtb_u_u1375) -> (match dtb_u_u1372 with
  | Core_dTerm.C_Term_TApp (dtb_u_u1376, dtb_u_u1377, dtb_u_u1378) -> (match dtb_u_u1376 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1379, dtb_u_u1380, dtb_u_u1381) -> (match dtb_u_u1377 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1382, dtb_u_u1383, dtb_u_u1384) -> (match dtb_u_u1367 with
  | Core_dTerm.C_Term_TApp (dtb_u_u1385, dtb_u_u1386, dtb_u_u1387) -> (match dtb_u_u1385 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1388, dtb_u_u1389, dtb_u_u1390) -> (match dtb_u_u1386 with
  | Core_dTerm.C_Term_TVar (dtb_u_u1391, dtb_u_u1392, dtb_u_u1393) -> (if (if (if (if (dtb_u_u1337 = 0) then (dtb_u_u1358 = 3) else false) then (dtb_u_u1380 = 5) else false) then (dtb_u_u1389 = 5) else false) then (if (if (if (if (dtb_u_u1361 = 1) then (dtb_u_u1374 = 2) else false) then (dtb_u_u1383 = 2) else false) then (dtb_u_u1392 = 2) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb_u_u1351, dtb_u_u1365, dtb_u_u1370)))) else (if (if (if (if (dtb_u_u1361 = 0) then (dtb_u_u1374 = 1) else false) then (dtb_u_u1383 = 3) else false) then (dtb_u_u1392 = 3) else false) then (B_dData_dMaybe.C_Maybe_Just ((C_DoBindShape_DoBindShape (dtb_u_u1351, dtb_u_u1365, dtb_u_u1370)))) else B_dData_dMaybe.C_Maybe_Nothing)) else B_dData_dMaybe.C_Maybe_Nothing)
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
let v_doBindHeadOf = (fun (dtb_u_u1394 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1395 : Elab_dTypes.t_Ctx) (dtb_u_u1396 : Elab_dTypes.t_Ec) (dtb_u_u1397 : string) -> (match ((Elab_dTypes.v_ctxLookup dtb_u_u1397) dtb_u_u1395) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1398) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup dtb_u_u1397) dtb_u_u1394) dtb_u_u1396) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1399) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb_u_u1397)); B_dData_dPair.f_Pair_second = dtb_u_u1399 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 3704 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBlockShapeOf = (fun (dtb_u_u1400 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1401 : Elab_dTypes.t_Ctx) (dtb_u_u1402 : Elab_dTypes.t_Ec) (dtb_u_u1403 : string) -> (let dtb_u_u1404 = ((((v_doBindHeadOf dtb_u_u1400) dtb_u_u1401) dtb_u_u1402) dtb_u_u1403) in (match dtb_u_u1404 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1405) -> (match dtb_u_u1405 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1406; B_dData_dPair.f_Pair_second = dtb_u_u1407 } -> (match (v_bindShapeOf dtb_u_u1407) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1408) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u1406; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1407; B_dData_dPair.f_Pair_second = dtb_u_u1408 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 3716 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictDefer = (fun (dtb_u_u1409 : Elab_dTypes.t_Ctx) (dtb_u_u1410 : Elab_dTypes.t_Ec) (dtb_u_u1411 : Core_dTerm.t_Value) (dtb_u_u1412 : Base_dSource.t_Span) -> (let dtb_u_u1413 = (Elab_dTypes.v_ecNext dtb_u_u1410) in (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u1412) dtb_u_u1409) dtb_u_u1410) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1414; B_dData_dPair.f_Pair_second = dtb_u_u1415 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1414; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb_u_u1415) Elab_dTypes.C_ConstraintKind_CkDict) dtb_u_u1413) ((Elab_dTypes.v_forceVal dtb_u_u1415) dtb_u_u1411)) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1412))) (Elab_dTypes.v_ctxDepth dtb_u_u1409)) }))
  | _ -> failwith "DT: impossible branch"
)))

# 3725 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doDictStep = (fun (dtb_u_u1416 : int) (dtb_u_u1417 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1418 : Elab_dTypes.t_Ctx) (dtb_u_u1419 : Elab_dTypes.t_Ec) (dtb_u_u1420 : Base_dSource.t_Span) (dtb_u_u1421 : Core_dTerm.t_Value) -> (if (dtb_u_u1416 <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_dictArgUnsolvedMeta dtb_u_u1419) dtb_u_u1421) then ((((v_doDictDefer dtb_u_u1418) dtb_u_u1419) dtb_u_u1421) dtb_u_u1420) else (let dtb_u_u1422 = (((((Elab_dDict.v_searchInstanceIn dtb_u_u1417) dtb_u_u1418) dtb_u_u1419) ((Elab_dTypes.v_forceVal dtb_u_u1419) dtb_u_u1421)) dtb_u_u1420) in (match dtb_u_u1422 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1423) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP dtb_u_u1419)) ((Elab_dTypes.v_forceVal dtb_u_u1419) dtb_u_u1421)) then ((((v_doDictDefer dtb_u_u1418) dtb_u_u1419) dtb_u_u1421) dtb_u_u1420) else (if ((Elab_dDict.v_isRigidDictArg dtb_u_u1419) ((Elab_dTypes.v_forceVal dtb_u_u1419) dtb_u_u1421)) then ((((v_doDictDefer dtb_u_u1418) dtb_u_u1419) dtb_u_u1421) dtb_u_u1420) else (Base_dDiag.C_Check_ErrC (dtb_u_u1423))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1424) -> (match dtb_u_u1424 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1425; B_dData_dPair.f_Pair_second = dtb_u_u1426 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1425; B_dData_dPair.f_Pair_second = dtb_u_u1426 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 3753 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDoBlock = (fun (dtb_u_u1427 : int) (dtb_u_u1428 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1429 : Elab_dTypes.t_Ctx) (dtb_u_u1430 : Elab_dTypes.t_Ec) (dtb_u_u1431 : Base_dSource.t_Span) (dtb_u_u1432 : string) (dtb_u_u1433 : Core_dTerm.t_Term) (dtb_u_u1434 : Core_dTerm.t_Term) (dtb_u_u1435 : t_DoBindShape) (dtb_u_u1436 : Core_dTerm.t_Value) (dtb_u_u1437 : Core_dTerm.t_Value) -> (if (dtb_u_u1427 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u1435 with
  | C_DoBindShape_DoBindShape (dtb_u_u1438, dtb_u_u1439, dtb_u_u1440) -> (let dtb_u_u1441 = ((Elab_dTypes.v_forceVal dtb_u_u1430) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u1434)) in (match dtb_u_u1441 with
  | Core_dTerm.C_Value_VPi (dtb_u_u1442, dtb_u_u1443, dtb_u_u1444, dtb_u_u1445, dtb_u_u1446) -> (if dtb_u_u1443 then (let dtb_u_u1447 = ((Elab_dTypes.v_forceVal dtb_u_u1430) ((Core_dEval.v_applyClosure dtb_u_u1446) dtb_u_u1436)) in (match dtb_u_u1447 with
  | Core_dTerm.C_Value_VPi (dtb_u_u1448, dtb_u_u1449, dtb_u_u1450, dtb_u_u1451, dtb_u_u1452) -> (if dtb_u_u1449 then (if ((Elab_dDict.v_isDictDomain dtb_u_u1430) dtb_u_u1451) then ((Base_dCommon.v_bind ((((((v_doDictStep (dtb_u_u1427 - 1)) dtb_u_u1428) dtb_u_u1429) dtb_u_u1430) dtb_u_u1431) dtb_u_u1451)) (fun (dtb_u_u1453 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1453 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1454; B_dData_dPair.f_Pair_second = dtb_u_u1455 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ f_DoPlan_planBind = dtb_u_u1432; f_DoPlan_planHead = dtb_u_u1433; f_DoPlan_planMTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth dtb_u_u1429)) dtb_u_u1436); f_DoPlan_planMVal = dtb_u_u1436; f_DoPlan_planAVal = dtb_u_u1437; f_DoPlan_planDictTerm = dtb_u_u1454; f_DoPlan_planRigE = dtb_u_u1438; f_DoPlan_planRigL = dtb_u_u1439; f_DoPlan_planInnerRig = dtb_u_u1440; f_DoPlan_planEc = dtb_u_u1455 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))
  | _ -> failwith "DT: impossible branch"
)))

# 3780 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doBindAppTerm = (fun (dtb_u_u1456 : Elab_dTypes.t_Ec) (dtb_u_u1457 : Elab_dTypes.t_Ec) (dtb_u_u1458 : Elab_dTypes.t_Ctx) (dtb_u_u1459 : Base_dSource.t_Span) (dtb_u_u1460 : Base_dSource.t_Span) (dtb_u_u1461 : t_DoPlan) (dtb_u_u1462 : string) (dtb_u_u1463 : Core_dTerm.t_Value) (dtb_u_u1464 : Core_dTerm.t_Term) (dtb_u_u1465 : Core_dTerm.t_Rig) (dtb_u_u1466 : Core_dTerm.t_Rig) (dtb_u_u1467 : Core_dTerm.t_Term) -> (let dtb_u_u1468 = (Elab_dTypes.v_ctxDepth dtb_u_u1458) in (let dtb_u_u1469 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1462) dtb_u_u1463) dtb_u_u1458) in (let dtb_u_u1470 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u1457) dtb_u_u1458) dtb_u_u1463) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb_u_u1467) else dtb_u_u1467) in (let dtb_u_u1471 = ((Core_dTerm.v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) (B_dData_dMaybe.C_Maybe_Just ((((Core_dTerm.v_shift 0) 1) ((Core_dEval.v_quote dtb_u_u1468) ((Core_dEval.v_applyValue (dtb_u_u1461).f_DoPlan_planMVal) (dtb_u_u1461).f_DoPlan_planAVal)))))) in (let dtb_u_u1472 = (if ((Elab_dMeta.v_ctxHasLinear dtb_u_u1456) dtb_u_u1458) then (if (((Elab_dMeta.v_termHasOuterLinear dtb_u_u1456) dtb_u_u1469) dtb_u_u1467) then (Core_dTerm.v_markLamLinear dtb_u_u1471) else dtb_u_u1471) else dtb_u_u1471) in (let dtb_u_u1473 = (Core_dTerm.C_Term_TLam (dtb_u_u1462, dtb_u_u1466, dtb_u_u1472, dtb_u_u1460, dtb_u_u1470)) in (let dtb_u_u1474 = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u1461).f_DoPlan_planMTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u1461).f_DoPlan_planDictTerm; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote dtb_u_u1468) dtb_u_u1463); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote dtb_u_u1468) (dtb_u_u1461).f_DoPlan_planAVal); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1464; B_dData_dPair.f_Pair_second = dtb_u_u1465 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1473; B_dData_dPair.f_Pair_second = (dtb_u_u1461).f_DoPlan_planRigL }, B_dData_dList.C_List_Nil)))))))))))) in ((Elab_dMeta.v_foldAppTerms (dtb_u_u1461).f_DoPlan_planHead) dtb_u_u1474)))))))))

# 67 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_elabConAltFuel = (fun (dtb_u_u1475 : int) (dtb_u_u1476 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1477 : Elab_dTypes.t_Ctx) (dtb_u_u1478 : Elab_dTypes.t_Ec) (dtb_u_u1479 : Elab_dTypes.t_DtData) (dtb_u_u1480 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u1481 : Core_dTerm.t_Value) (dtb_u_u1482 : Core_dTerm.t_Value) (dtb_u_u1483 : string) (dtb_u_u1484 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1485 : Base_dSource.t_Span) (dtb_u_u1486 : Frontend_dAst.t_Expr) -> (if (dtb_u_u1475 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_findCtorIn dtb_u_u1483) (Elab_dTypes.v_dtDataCtors dtb_u_u1479)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u1485) (Base_dDiagnostics_dTc.C_TcErr_UnknownConstructorInCase ((Frontend_dAst.v_ctorDisplayName dtb_u_u1483), (Elab_dTypes.v_dtDataName dtb_u_u1479)))) (Frontend_dAst.v_ctorDisplayName dtb_u_u1483)) (Elab_dTypes.v_dtDataName dtb_u_u1479))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1487) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u1485)) (((((Elab_dCase.v_bindCtorTele (Frontend_dAst.v_ctorDisplayName dtb_u_u1483)) ((v_ctorFieldLabels dtb_u_u1479) dtb_u_u1487)) dtb_u_u1477) (Elab_dTypes.v_dtCtorType dtb_u_u1487)) dtb_u_u1484))) (fun (dtb_u_u1488 : (Elab_dTypes.t_Ctx, (Core_dTerm.t_Binder B_dData_dList.t_List, Frontend_dAst.t_Pat B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1489 = dtb_u_u1488 in (match dtb_u_u1489 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1490; B_dData_dPair.f_Pair_second = dtb_u_u1491 } -> (match dtb_u_u1491 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1492; B_dData_dPair.f_Pair_second = dtb_u_u1493 } -> (if (Elab_dMeta.v_nonEmpty dtb_u_u1493) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u1485) (Base_dDiagnostics_dTc.C_TcErr_BranchTooManyArgs ((Frontend_dAst.v_ctorDisplayName dtb_u_u1483)))) (Frontend_dAst.v_ctorDisplayName dtb_u_u1483)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u1485)) (((((Elab_dCase.v_unifyIdxListSized dtb_u_u1478) B_dData_dList.C_List_Nil) (Elab_dTypes.v_ctxDepth dtb_u_u1490)) ((Elab_dCase.v_ctorResultValsIn dtb_u_u1490) dtb_u_u1487)) ((B_dData_dList.v_map (fun (dtb_u_u1494 : Core_dTerm.t_Value) -> (((Elab_dTypes.v_refineValue B_dData_dList.C_List_Nil) Core_dTerm.v_defaultFuel) dtb_u_u1494))) dtb_u_u1480)))) (fun (dtb_u_u1495 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (((Elab_dCase.v_branchAfterUnify dtb_u_u1478) dtb_u_u1490) dtb_u_u1495) with
  | Elab_dCase.C_BranchVerdict_BranchImpossibleIndex -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1485) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchIndex)
  | Elab_dCase.C_BranchVerdict_BranchImpossibleEmptyCtx -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1485) Base_dDiagnostics_dTc.C_TcErr_ImpossibleBranchEmptyCtx)
  | Elab_dCase.C_BranchVerdict_BranchOk -> ((Base_dCommon.v_bind (((((Elab_dCase.v_reflectScrutinee dtb_u_u1478) (Elab_dTypes.v_ctxDepth dtb_u_u1490)) dtb_u_u1495) ((Elab_dCase.v_ctorValueIn dtb_u_u1490) dtb_u_u1487)) dtb_u_u1481)) (fun (dtb_u_u1496 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u1497 = (((Elab_dTypes.v_refineValue dtb_u_u1496) Core_dTerm.v_defaultFuel) dtb_u_u1482) in (let dtb_u_u1498 = ((Elab_dTypes.v_ctxRefine dtb_u_u1490) dtb_u_u1496) in ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1475 - 1)) dtb_u_u1476) dtb_u_u1498) dtb_u_u1478) dtb_u_u1486) dtb_u_u1497)) (fun (dtb_u_u1499 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1499 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1500; B_dData_dPair.f_Pair_second = dtb_u_u1501 } -> (let dtb_u_u1502 = (B_dData_dList.v_length dtb_u_u1492) in (let dtb_u_u1503 = ((((v_opaqueBranchIndices dtb_u_u1501) dtb_u_u1498) dtb_u_u1502) (Core_dTerm.v_binderPairs dtb_u_u1492)) in (let dtb_u_u1504 = ((Elab_dMeta.v_wrapOpaqueUses dtb_u_u1503) dtb_u_u1500) in (let dtb_u_u1505 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u1501) dtb_u_u1477) dtb_u_u1482) then (Elab_dMeta.v_castErased dtb_u_u1504) else dtb_u_u1504) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u1483; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u1492; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u1505 }; B_dData_dPair.f_Pair_second = dtb_u_u1501 }))))))
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
and v_elabCaseAltsFuel = (fun (dtb_u_u1506 : int) (dtb_u_u1507 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1508 : Elab_dTypes.t_Ctx) (dtb_u_u1509 : Elab_dTypes.t_Ec) (dtb_u_u1510 : Core_dTerm.t_Value) (dtb_u_u1511 : Elab_dTypes.t_DtData) (dtb_u_u1512 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u1513 : Core_dTerm.t_Value) (dtb_u_u1514 : Core_dTerm.t_Value) (dtb_u_u1515 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1516 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u1515 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1517, dtb_u_u1518) -> (if (dtb_u_u1506 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u1517 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1519; B_dData_dPair.f_Pair_second = dtb_u_u1520 } -> (match dtb_u_u1519 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u1521, dtb_u_u1522, dtb_u_u1523) -> ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (dtb_u_u1506 - 1)) dtb_u_u1507) dtb_u_u1508) dtb_u_u1509) dtb_u_u1511) dtb_u_u1512) dtb_u_u1513) dtb_u_u1514) dtb_u_u1521) dtb_u_u1522) (Frontend_dAst.v_nodeRefSpan dtb_u_u1523)) dtb_u_u1520)) (fun (dtb_u_u1524 : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1524 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1525; B_dData_dPair.f_Pair_second = dtb_u_u1526 } -> (((((((((((v_elabCaseAltsFuel (dtb_u_u1506 - 1)) dtb_u_u1507) dtb_u_u1508) dtb_u_u1526) dtb_u_u1510) dtb_u_u1511) dtb_u_u1512) dtb_u_u1513) dtb_u_u1514) dtb_u_u1518) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1525, dtb_u_u1516)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1527, dtb_u_u1528) -> (((((((((((((v_elabCatchAllFuel (dtb_u_u1506 - 1)) dtb_u_u1507) dtb_u_u1508) dtb_u_u1509) dtb_u_u1510) dtb_u_u1511) dtb_u_u1512) dtb_u_u1514) dtb_u_u1518) dtb_u_u1516) dtb_u_u1520) dtb_u_u1527) (Frontend_dAst.v_nodeRefSpan dtb_u_u1528))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1529) -> (((((((((((((v_elabCatchAllFuel (dtb_u_u1506 - 1)) dtb_u_u1507) dtb_u_u1508) dtb_u_u1509) dtb_u_u1510) dtb_u_u1511) dtb_u_u1512) dtb_u_u1514) dtb_u_u1518) dtb_u_u1516) dtb_u_u1520) "_") (Frontend_dAst.v_nodeRefSpan dtb_u_u1529))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb_u_u1519)) Base_dDiagnostics_dTc.C_TcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u1506 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1516); B_dData_dPair.f_Pair_second = dtb_u_u1509 })))
  | _ -> failwith "DT: impossible branch"
))
# 132 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabCatchAllFuel = (fun (dtb_u_u1530 : int) (dtb_u_u1531 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1532 : Elab_dTypes.t_Ctx) (dtb_u_u1533 : Elab_dTypes.t_Ec) (dtb_u_u1534 : Core_dTerm.t_Value) (dtb_u_u1535 : Elab_dTypes.t_DtData) (dtb_u_u1536 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u1537 : Core_dTerm.t_Value) (dtb_u_u1538 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1539 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (dtb_u_u1540 : Frontend_dAst.t_Expr) (dtb_u_u1541 : string) (dtb_u_u1542 : Base_dSource.t_Span) -> (if (dtb_u_u1530 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u1543 = (if (dtb_u_u1541 = "_") then dtb_u_u1532 else (((Elab_dTypes.v_ctxBindValue dtb_u_u1541) dtb_u_u1534) dtb_u_u1532)) in (if (Elab_dMeta.v_nonEmpty dtb_u_u1538) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1542) Base_dDiagnostics_dTc.C_TcErr_CatchAllNotLast) else ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1530 - 1)) dtb_u_u1531) dtb_u_u1543) dtb_u_u1533) dtb_u_u1540) dtb_u_u1537)) (fun (dtb_u_u1544 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1544 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1545; B_dData_dPair.f_Pair_second = dtb_u_u1546 } -> (let dtb_u_u1547 = (if (dtb_u_u1541 = "_") then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_Binder_binderName = dtb_u_u1541; Core_dTerm.f_Binder_binderRig = ((Elab_dMeta.v_rigOfLinearValue dtb_u_u1533) dtb_u_u1534); Core_dTerm.f_Binder_binderSpan = ((Base_dSource.v_spanAtName dtb_u_u1541) dtb_u_u1542) }, B_dData_dList.C_List_Nil))) in (let dtb_u_u1548 = (if (dtb_u_u1541 = "_") then dtb_u_u1545 else (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u1546) dtb_u_u1532) dtb_u_u1534) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb_u_u1545) else dtb_u_u1545)) in (let dtb_u_u1549 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u1546) dtb_u_u1532) dtb_u_u1537) then (Elab_dMeta.v_castErased dtb_u_u1548) else dtb_u_u1548) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = ""; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u1547; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u1549 }, dtb_u_u1539))); B_dData_dPair.f_Pair_second = dtb_u_u1546 })))))
  | _ -> failwith "DT: impossible branch"
)))))))
# 162 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFuel = (fun (dtb_u_u1550 : int) (dtb_u_u1551 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1552 : Elab_dTypes.t_Ctx) (dtb_u_u1553 : Elab_dTypes.t_Ec) (dtb_u_u1554 : Frontend_dAst.t_Expr) (dtb_u_u1555 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1556 : Core_dTerm.t_Value) (dtb_u_u1557 : Base_dSource.t_Span) -> (if (dtb_u_u1550 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u1550 - 1)) dtb_u_u1551) dtb_u_u1552) dtb_u_u1553) dtb_u_u1554)) (fun (dtb_u_u1558 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1559 = dtb_u_u1558 in (match dtb_u_u1559 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1560; B_dData_dPair.f_Pair_second = dtb_u_u1561 } -> (match dtb_u_u1561 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1562; B_dData_dPair.f_Pair_second = dtb_u_u1563 } -> (if (((v_natLitCaseFast dtb_u_u1563) dtb_u_u1562) dtb_u_u1555) then ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb_u_u1563) dtb_u_u1555)) (fun (dtb_u_u1564 : int) (dtb_u_u1565 : Elab_dTypes.t_Ec) -> ((((((((((v_checkNatLitCaseFuel (dtb_u_u1550 - 1)) dtb_u_u1551) dtb_u_u1552) dtb_u_u1565) (v_natToIntTerm dtb_u_u1560)) dtb_u_u1560) v_natTyValue) dtb_u_u1555) dtb_u_u1556) dtb_u_u1557))) else ((Base_dCommon.v_bind ((((v_resolveOverAlts dtb_u_u1563) dtb_u_u1552) dtb_u_u1562) dtb_u_u1555)) (fun (dtb_u_u1566 : ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1566 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1567; B_dData_dPair.f_Pair_second = dtb_u_u1568 } -> (let dtb_u_u1569 = (((B_dTrait_dOrd.v_max B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (dtb_u_u1550 - 1)) (Elab_dCoverage.v_coverageFuelFor ((B_dData_dList.v_map (fun (dtb_u_u1572 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb_u_u1572), B_dData_dList.C_List_Nil)))) dtb_u_u1567))) in ((Base_dCommon.v_step ((Elab_dCase.v_checkCaseAltsFlat dtb_u_u1568) dtb_u_u1567)) (fun (dtb_u_u1570 : int) (dtb_u_u1571 : Elab_dTypes.t_Ec) -> (if (v_needsMatrixCase dtb_u_u1567) then ((((((((v_checkCaseMatrixFuel dtb_u_u1569) dtb_u_u1551) dtb_u_u1552) dtb_u_u1571) dtb_u_u1554) dtb_u_u1567) dtb_u_u1556) dtb_u_u1557) else (((((((((v_checkCaseFamFuel dtb_u_u1569) dtb_u_u1551) dtb_u_u1552) dtb_u_u1571) dtb_u_u1560) dtb_u_u1562) dtb_u_u1567) dtb_u_u1556) dtb_u_u1557)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 196 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseMatrixFuel = (fun (dtb_u_u1573 : int) (dtb_u_u1574 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1575 : Elab_dTypes.t_Ctx) (dtb_u_u1576 : Elab_dTypes.t_Ec) (dtb_u_u1577 : Frontend_dAst.t_Expr) (dtb_u_u1578 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1579 : Core_dTerm.t_Value) (dtb_u_u1580 : Base_dSource.t_Span) -> (if (dtb_u_u1573 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u1581 = ("nd_scrut" ^ (string_of_int (Elab_dTypes.v_ctxDepth dtb_u_u1575))) in (let dtb_u_u1582 = ((B_dData_dList.v_map (fun (dtb_u_u1586 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb_u_u1586), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1586) })) dtb_u_u1578) in (let dtb_u_u1583 = (Elab_dMeta.v_ctorFamilyTable dtb_u_u1576) in ((Base_dCommon.v_bind (((Elab_dMatch.v_multiToCaseExpr dtb_u_u1583) dtb_u_u1582) dtb_u_u1581)) (fun (dtb_u_u1584 : Frontend_dAst.t_Expr) -> ((((Elab_dCoverage.v_improveExhaustive dtb_u_u1583) (fun (dtb_u_u1585 : int) -> (Elab_dMatch.v_matrixOf dtb_u_u1582))) dtb_u_u1580) ((((((v_checkEFuel (dtb_u_u1573 - 1)) dtb_u_u1574) dtb_u_u1575) dtb_u_u1576) (Frontend_dAst.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb_u_u1581, (Frontend_dAst.v_detachedNodeRef dtb_u_u1580))); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (dtb_u_u1577)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = (Frontend_dAst.v_detachedNodeRef dtb_u_u1580) }, B_dData_dList.C_List_Nil)), dtb_u_u1584, false, (Frontend_dAst.v_detachedNodeRef dtb_u_u1580)))) dtb_u_u1579)))))))))
# 207 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseFamFuel = (fun (dtb_u_u1587 : int) (dtb_u_u1588 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1589 : Elab_dTypes.t_Ctx) (dtb_u_u1590 : Elab_dTypes.t_Ec) (dtb_u_u1591 : Core_dTerm.t_Term) (dtb_u_u1592 : Core_dTerm.t_Value) (dtb_u_u1593 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1594 : Core_dTerm.t_Value) (dtb_u_u1595 : Base_dSource.t_Span) -> (if (dtb_u_u1587 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u1596 = ((Elab_dTypes.v_forceVal dtb_u_u1590) dtb_u_u1592) in (match dtb_u_u1596 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u1597) -> (match dtb_u_u1597 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u1598, dtb_u_u1599) -> (if (if (Base_dIntrinsics.v_isBoolCanonical dtb_u_u1598) then ((B_dData_dList.v_length dtb_u_u1599) = 0) else false) then ((((((((v_checkBoolCaseFuel (dtb_u_u1587 - 1)) dtb_u_u1588) dtb_u_u1589) dtb_u_u1590) dtb_u_u1591) dtb_u_u1593) dtb_u_u1594) dtb_u_u1595) else (if (dtb_u_u1598 = Base_dIntrinsics.v_intTypeName) then (((((((((v_checkLitCaseFuel (dtb_u_u1587 - 1)) dtb_u_u1588) dtb_u_u1589) dtb_u_u1590) dtb_u_u1591) Base_dIntrinsics.v_intTypeName) dtb_u_u1593) dtb_u_u1594) dtb_u_u1595) else (if (dtb_u_u1598 = Base_dIntrinsics.v_strTypeName) then (((((((((v_checkLitCaseFuel (dtb_u_u1587 - 1)) dtb_u_u1588) dtb_u_u1589) dtb_u_u1590) dtb_u_u1591) Base_dIntrinsics.v_strTypeName) dtb_u_u1593) dtb_u_u1594) dtb_u_u1595) else (((((((((((v_checkCaseOfFuel (dtb_u_u1587 - 1)) dtb_u_u1588) dtb_u_u1589) dtb_u_u1590) dtb_u_u1591) dtb_u_u1592) dtb_u_u1598) dtb_u_u1599) dtb_u_u1593) dtb_u_u1594) dtb_u_u1595))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1595) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1595) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
))))
# 217 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkBoolCaseFuel = (fun (dtb_u_u1600 : int) (dtb_u_u1601 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1602 : Elab_dTypes.t_Ctx) (dtb_u_u1603 : Elab_dTypes.t_Ec) (dtb_u_u1604 : Core_dTerm.t_Term) (dtb_u_u1605 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1606 : Core_dTerm.t_Value) (dtb_u_u1607 : Base_dSource.t_Span) -> (if (dtb_u_u1600 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((v_boolAltFuel (dtb_u_u1600 - 1)) dtb_u_u1601) dtb_u_u1602) dtb_u_u1603) dtb_u_u1605) Base_dIntrinsics.v_boolTrueCtor) dtb_u_u1606) dtb_u_u1607)) (fun (dtb_u_u1608 : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1609 = dtb_u_u1608 in (match dtb_u_u1609 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1610; B_dData_dPair.f_Pair_second = dtb_u_u1611 } -> (match dtb_u_u1611 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1612; B_dData_dPair.f_Pair_second = dtb_u_u1613 } -> (match dtb_u_u1612 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1614) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb_u_u1604, dtb_u_u1610, dtb_u_u1614)); B_dData_dPair.f_Pair_second = dtb_u_u1613 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_boolAltFuel (dtb_u_u1600 - 1)) dtb_u_u1601) dtb_u_u1602) dtb_u_u1613) dtb_u_u1605) Base_dIntrinsics.v_boolFalseCtor) dtb_u_u1606) dtb_u_u1607)) (fun (dtb_u_u1615 : (Core_dTerm.t_Term, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1616 = dtb_u_u1615 in (match dtb_u_u1616 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1617; B_dData_dPair.f_Pair_second = dtb_u_u1618 } -> (match dtb_u_u1618 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1619; B_dData_dPair.f_Pair_second = dtb_u_u1620 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb_u_u1604, dtb_u_u1610, dtb_u_u1617)); B_dData_dPair.f_Pair_second = dtb_u_u1620 }))
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
and v_boolAltFuel = (fun (dtb_u_u1621 : int) (dtb_u_u1622 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1623 : Elab_dTypes.t_Ctx) (dtb_u_u1624 : Elab_dTypes.t_Ec) (dtb_u_u1625 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1626 : string) (dtb_u_u1627 : Core_dTerm.t_Value) (dtb_u_u1628 : Base_dSource.t_Span) -> (if (dtb_u_u1621 <= 0) then (Base_dDiag.v_icFuel "inference") else (((((((((v_boolAltGoFuel (dtb_u_u1621 - 1)) dtb_u_u1622) dtb_u_u1623) dtb_u_u1624) dtb_u_u1625) dtb_u_u1626) dtb_u_u1627) dtb_u_u1628) B_dData_dMaybe.C_Maybe_Nothing)))
# 244 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_boolAltGoFuel = (fun (dtb_u_u1629 : int) (dtb_u_u1630 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1631 : Elab_dTypes.t_Ctx) (dtb_u_u1632 : Elab_dTypes.t_Ec) (dtb_u_u1633 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1634 : string) (dtb_u_u1635 : Core_dTerm.t_Value) (dtb_u_u1636 : Base_dSource.t_Span) (dtb_u_u1637 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u1633 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1638, dtb_u_u1639) -> (if (dtb_u_u1629 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u1638 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1640; B_dData_dPair.f_Pair_second = dtb_u_u1641 } -> (match dtb_u_u1640 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u1642, dtb_u_u1643, dtb_u_u1644) -> (if (dtb_u_u1642 = dtb_u_u1634) then ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1629 - 1)) dtb_u_u1630) dtb_u_u1631) dtb_u_u1632) dtb_u_u1641) dtb_u_u1635)) (fun (dtb_u_u1645 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1645 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1646; B_dData_dPair.f_Pair_second = dtb_u_u1647 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1646; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1637; B_dData_dPair.f_Pair_second = dtb_u_u1647 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_boolAltGoFuel (dtb_u_u1629 - 1)) dtb_u_u1630) dtb_u_u1631) dtb_u_u1632) dtb_u_u1639) dtb_u_u1634) dtb_u_u1635) dtb_u_u1636) dtb_u_u1637))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1648, dtb_u_u1649) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1629 - 1)) dtb_u_u1630) dtb_u_u1631) dtb_u_u1632) dtb_u_u1641) dtb_u_u1635)) (fun (dtb_u_u1650 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1650 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1651; B_dData_dPair.f_Pair_second = dtb_u_u1652 } -> (((((((((v_boolAltGoFuel (dtb_u_u1629 - 1)) dtb_u_u1630) dtb_u_u1631) dtb_u_u1652) dtb_u_u1639) dtb_u_u1634) dtb_u_u1635) dtb_u_u1636) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1651)))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1653) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1629 - 1)) dtb_u_u1630) dtb_u_u1631) dtb_u_u1632) dtb_u_u1641) dtb_u_u1635)) (fun (dtb_u_u1654 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1654 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1655; B_dData_dPair.f_Pair_second = dtb_u_u1656 } -> (((((((((v_boolAltGoFuel (dtb_u_u1629 - 1)) dtb_u_u1630) dtb_u_u1631) dtb_u_u1656) dtb_u_u1639) dtb_u_u1634) dtb_u_u1635) dtb_u_u1636) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1655)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb_u_u1640)) Base_dDiagnostics_dTc.C_TcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u1629 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u1637 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1657) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1657; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u1632 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u1636) (Base_dDiagnostics_dTc.C_TcErr_NotExhaustive ((Frontend_dAst.v_ctorDisplayName dtb_u_u1634)))) (Frontend_dAst.v_ctorDisplayName dtb_u_u1634))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 284 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitCaseFuel = (fun (dtb_u_u1658 : int) (dtb_u_u1659 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1660 : Elab_dTypes.t_Ctx) (dtb_u_u1661 : Elab_dTypes.t_Ec) (dtb_u_u1662 : Core_dTerm.t_Term) (dtb_u_u1663 : string) (dtb_u_u1664 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1665 : Core_dTerm.t_Value) (dtb_u_u1666 : Base_dSource.t_Span) -> (if (dtb_u_u1658 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (dtb_u_u1658 - 1)) dtb_u_u1659) dtb_u_u1660) dtb_u_u1661) dtb_u_u1662) dtb_u_u1663) dtb_u_u1664) dtb_u_u1665) dtb_u_u1666)) (fun (dtb_u_u1667 : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1668 = dtb_u_u1667 in (match dtb_u_u1668 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1669; B_dData_dPair.f_Pair_second = dtb_u_u1670 } -> (match dtb_u_u1670 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1671; B_dData_dPair.f_Pair_second = dtb_u_u1672 } -> (if dtb_u_u1671 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1669; B_dData_dPair.f_Pair_second = dtb_u_u1672 })) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1666) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 298 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitAltsFuel = (fun (dtb_u_u1673 : int) (dtb_u_u1674 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1675 : Elab_dTypes.t_Ctx) (dtb_u_u1676 : Elab_dTypes.t_Ec) (dtb_u_u1677 : Core_dTerm.t_Term) (dtb_u_u1678 : string) (dtb_u_u1679 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1680 : Core_dTerm.t_Value) (dtb_u_u1681 : Base_dSource.t_Span) -> (match dtb_u_u1679 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1682, dtb_u_u1683) -> (if (dtb_u_u1673 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u1682 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1684; B_dData_dPair.f_Pair_second = dtb_u_u1685 } -> (match dtb_u_u1684 with
  | Frontend_dAst.C_Pat_PInt (dtb_u_u1686, dtb_u_u1687) -> (((((((((((v_litAltStepFuel (dtb_u_u1673 - 1)) dtb_u_u1674) dtb_u_u1675) dtb_u_u1676) dtb_u_u1677) dtb_u_u1678) (Core_dTerm.C_Term_TInt (dtb_u_u1686))) dtb_u_u1685) dtb_u_u1683) dtb_u_u1680) dtb_u_u1681)
  | Frontend_dAst.C_Pat_PStr (dtb_u_u1688, dtb_u_u1689) -> (((((((((((v_litAltStepFuel (dtb_u_u1673 - 1)) dtb_u_u1674) dtb_u_u1675) dtb_u_u1676) dtb_u_u1677) dtb_u_u1678) (Core_dTerm.C_Term_TStr (dtb_u_u1688))) dtb_u_u1685) dtb_u_u1683) dtb_u_u1680) dtb_u_u1681)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1690, dtb_u_u1691) -> ((Base_dCommon.v_bind (((((((((((v_checkLitBoundVarFuel (dtb_u_u1673 - 1)) dtb_u_u1674) dtb_u_u1675) dtb_u_u1676) dtb_u_u1677) dtb_u_u1678) dtb_u_u1690) dtb_u_u1685) dtb_u_u1680) ((Base_dSource.v_spanAtName dtb_u_u1690) (Frontend_dAst.v_nodeRefSpan dtb_u_u1691))) dtb_u_u1681)) (fun (dtb_u_u1692 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1692 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1693; B_dData_dPair.f_Pair_second = dtb_u_u1694 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1693; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1694 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1695) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1673 - 1)) dtb_u_u1674) dtb_u_u1675) dtb_u_u1676) dtb_u_u1685) dtb_u_u1680)) (fun (dtb_u_u1696 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1696 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1697; B_dData_dPair.f_Pair_second = dtb_u_u1698 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1697; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1698 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb_u_u1684)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u1673 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u1676 } })))
  | _ -> failwith "DT: impossible branch"
))
# 325 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_litAltStepFuel = (fun (dtb_u_u1699 : int) (dtb_u_u1700 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1701 : Elab_dTypes.t_Ctx) (dtb_u_u1702 : Elab_dTypes.t_Ec) (dtb_u_u1703 : Core_dTerm.t_Term) (dtb_u_u1704 : string) (dtb_u_u1705 : Core_dTerm.t_Term) (dtb_u_u1706 : Frontend_dAst.t_Expr) (dtb_u_u1707 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1708 : Core_dTerm.t_Value) (dtb_u_u1709 : Base_dSource.t_Span) -> (if (dtb_u_u1699 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1699 - 1)) dtb_u_u1700) dtb_u_u1701) dtb_u_u1702) dtb_u_u1706) dtb_u_u1708)) (fun (dtb_u_u1710 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1710 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1711; B_dData_dPair.f_Pair_second = dtb_u_u1712 } -> ((Base_dCommon.v_bind (((((((((v_checkLitAltsFuel (dtb_u_u1699 - 1)) dtb_u_u1700) dtb_u_u1701) dtb_u_u1712) dtb_u_u1703) dtb_u_u1704) dtb_u_u1707) dtb_u_u1708) dtb_u_u1709)) (fun (dtb_u_u1713 : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1714 = dtb_u_u1713 in (match dtb_u_u1714 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1715; B_dData_dPair.f_Pair_second = dtb_u_u1716 } -> (match dtb_u_u1716 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1717; B_dData_dPair.f_Pair_second = dtb_u_u1718 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((Elab_dMeta.v_litEqName dtb_u_u1704))), dtb_u_u1703, Core_dTerm.C_Rig_Rig1)), dtb_u_u1705, Core_dTerm.C_Rig_Rig1)), dtb_u_u1711, dtb_u_u1715)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1717; B_dData_dPair.f_Pair_second = dtb_u_u1718 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 342 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLitBoundVarFuel = (fun (dtb_u_u1719 : int) (dtb_u_u1720 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1721 : Elab_dTypes.t_Ctx) (dtb_u_u1722 : Elab_dTypes.t_Ec) (dtb_u_u1723 : Core_dTerm.t_Term) (dtb_u_u1724 : string) (dtb_u_u1725 : string) (dtb_u_u1726 : Frontend_dAst.t_Expr) (dtb_u_u1727 : Core_dTerm.t_Value) (dtb_u_u1728 : Base_dSource.t_Span) (dtb_u_u1729 : Base_dSource.t_Span) -> (if (dtb_u_u1719 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u1730 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1725) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u1724, B_dData_dList.C_List_Nil))))) dtb_u_u1721) in (let dtb_u_u1731 = ((Elab_dMeta.v_piBinderRig false) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u1724, B_dData_dList.C_List_Nil))))) in ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1719 - 1)) dtb_u_u1720) dtb_u_u1730) dtb_u_u1722) dtb_u_u1726) dtb_u_u1727)) (fun (dtb_u_u1732 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1732 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1733; B_dData_dPair.f_Pair_second = dtb_u_u1734 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb_u_u1725, dtb_u_u1731, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u1728, dtb_u_u1733)), dtb_u_u1723, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb_u_u1734 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 383 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitCaseFuel = (fun (dtb_u_u1735 : int) (dtb_u_u1736 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1737 : Elab_dTypes.t_Ctx) (dtb_u_u1738 : Elab_dTypes.t_Ec) (dtb_u_u1739 : Core_dTerm.t_Term) (dtb_u_u1740 : Core_dTerm.t_Term) (dtb_u_u1741 : Core_dTerm.t_Value) (dtb_u_u1742 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1743 : Core_dTerm.t_Value) (dtb_u_u1744 : Base_dSource.t_Span) -> (if (dtb_u_u1735 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (dtb_u_u1735 - 1)) dtb_u_u1736) dtb_u_u1737) dtb_u_u1738) dtb_u_u1739) dtb_u_u1740) dtb_u_u1741) dtb_u_u1742) dtb_u_u1743) dtb_u_u1744)) (fun (dtb_u_u1745 : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1746 = dtb_u_u1745 in (match dtb_u_u1746 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1747; B_dData_dPair.f_Pair_second = dtb_u_u1748 } -> (match dtb_u_u1748 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1749; B_dData_dPair.f_Pair_second = dtb_u_u1750 } -> (if dtb_u_u1749 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1747; B_dData_dPair.f_Pair_second = dtb_u_u1750 })) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1744) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 395 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitAltsFuel = (fun (dtb_u_u1751 : int) (dtb_u_u1752 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1753 : Elab_dTypes.t_Ctx) (dtb_u_u1754 : Elab_dTypes.t_Ec) (dtb_u_u1755 : Core_dTerm.t_Term) (dtb_u_u1756 : Core_dTerm.t_Term) (dtb_u_u1757 : Core_dTerm.t_Value) (dtb_u_u1758 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1759 : Core_dTerm.t_Value) (dtb_u_u1760 : Base_dSource.t_Span) -> (match dtb_u_u1758 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1761, dtb_u_u1762) -> (if (dtb_u_u1751 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u1761 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1763; B_dData_dPair.f_Pair_second = dtb_u_u1764 } -> (match dtb_u_u1763 with
  | Frontend_dAst.C_Pat_PInt (dtb_u_u1765, dtb_u_u1766) -> ((((((((((((v_natLitAltStepFuel (dtb_u_u1751 - 1)) dtb_u_u1752) dtb_u_u1753) dtb_u_u1754) dtb_u_u1755) dtb_u_u1756) dtb_u_u1757) (Core_dTerm.C_Term_TInt (dtb_u_u1765))) dtb_u_u1764) dtb_u_u1762) dtb_u_u1759) dtb_u_u1760)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1767, dtb_u_u1768) -> ((Base_dCommon.v_bind (((((((((((v_checkNatLitBoundVarFuel (dtb_u_u1751 - 1)) dtb_u_u1752) dtb_u_u1753) dtb_u_u1754) dtb_u_u1756) dtb_u_u1757) dtb_u_u1767) dtb_u_u1764) dtb_u_u1759) ((Base_dSource.v_spanAtName dtb_u_u1767) (Frontend_dAst.v_nodeRefSpan dtb_u_u1768))) dtb_u_u1760)) (fun (dtb_u_u1769 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1769 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1770; B_dData_dPair.f_Pair_second = dtb_u_u1771 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1770; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1771 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1772) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1751 - 1)) dtb_u_u1752) dtb_u_u1753) dtb_u_u1754) dtb_u_u1764) dtb_u_u1759)) (fun (dtb_u_u1773 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1773 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1774; B_dData_dPair.f_Pair_second = dtb_u_u1775 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1774; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1775 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_patSpan dtb_u_u1763)) Base_dDiagnostics_dTc.C_TcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u1751 <= 0) then (Base_dDiag.v_icFuel "inference") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TBool (false)), (Core_dTerm.C_Term_TInt (0)), (Core_dTerm.C_Term_TInt (0)))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u1754 } })))
  | _ -> failwith "DT: impossible branch"
))
# 420 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_natLitAltStepFuel = (fun (dtb_u_u1776 : int) (dtb_u_u1777 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1778 : Elab_dTypes.t_Ctx) (dtb_u_u1779 : Elab_dTypes.t_Ec) (dtb_u_u1780 : Core_dTerm.t_Term) (dtb_u_u1781 : Core_dTerm.t_Term) (dtb_u_u1782 : Core_dTerm.t_Value) (dtb_u_u1783 : Core_dTerm.t_Term) (dtb_u_u1784 : Frontend_dAst.t_Expr) (dtb_u_u1785 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1786 : Core_dTerm.t_Value) (dtb_u_u1787 : Base_dSource.t_Span) -> (if (dtb_u_u1776 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1776 - 1)) dtb_u_u1777) dtb_u_u1778) dtb_u_u1779) dtb_u_u1784) dtb_u_u1786)) (fun (dtb_u_u1788 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1788 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1789; B_dData_dPair.f_Pair_second = dtb_u_u1790 } -> ((Base_dCommon.v_bind ((((((((((v_checkNatLitAltsFuel (dtb_u_u1776 - 1)) dtb_u_u1777) dtb_u_u1778) dtb_u_u1790) dtb_u_u1780) dtb_u_u1781) dtb_u_u1782) dtb_u_u1785) dtb_u_u1786) dtb_u_u1787)) (fun (dtb_u_u1791 : (Core_dTerm.t_Term, (bool, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1792 = dtb_u_u1791 in (match dtb_u_u1792 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1793; B_dData_dPair.f_Pair_second = dtb_u_u1794 } -> (match dtb_u_u1794 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1795; B_dData_dPair.f_Pair_second = dtb_u_u1796 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("bi_eq_int")), dtb_u_u1780, Core_dTerm.C_Rig_Rig1)), dtb_u_u1783, Core_dTerm.C_Rig_Rig1)), dtb_u_u1789, dtb_u_u1793)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1795; B_dData_dPair.f_Pair_second = dtb_u_u1796 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
# 436 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkNatLitBoundVarFuel = (fun (dtb_u_u1797 : int) (dtb_u_u1798 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1799 : Elab_dTypes.t_Ctx) (dtb_u_u1800 : Elab_dTypes.t_Ec) (dtb_u_u1801 : Core_dTerm.t_Term) (dtb_u_u1802 : Core_dTerm.t_Value) (dtb_u_u1803 : string) (dtb_u_u1804 : Frontend_dAst.t_Expr) (dtb_u_u1805 : Core_dTerm.t_Value) (dtb_u_u1806 : Base_dSource.t_Span) (dtb_u_u1807 : Base_dSource.t_Span) -> (if (dtb_u_u1797 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u1808 = (((Elab_dTypes.v_ctxBindValue dtb_u_u1803) dtb_u_u1802) dtb_u_u1799) in (let dtb_u_u1809 = ((Elab_dMeta.v_piBinderRig false) dtb_u_u1802) in ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u1797 - 1)) dtb_u_u1798) dtb_u_u1808) dtb_u_u1800) dtb_u_u1804) dtb_u_u1805)) (fun (dtb_u_u1810 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1810 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1811; B_dData_dPair.f_Pair_second = dtb_u_u1812 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb_u_u1803, dtb_u_u1809, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u1806, dtb_u_u1811)), dtb_u_u1801, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb_u_u1812 }))
  | _ -> failwith "DT: impossible branch"
)))))))
# 450 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCaseOfFuel = (fun (dtb_u_u1813 : int) (dtb_u_u1814 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1815 : Elab_dTypes.t_Ctx) (dtb_u_u1816 : Elab_dTypes.t_Ec) (dtb_u_u1817 : Core_dTerm.t_Term) (dtb_u_u1818 : Core_dTerm.t_Value) (dtb_u_u1819 : string) (dtb_u_u1820 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u1821 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1822 : Core_dTerm.t_Value) (dtb_u_u1823 : Base_dSource.t_Span) -> (if (dtb_u_u1813 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtDataLookup dtb_u_u1819) (Elab_dTypes.v_ecDatas dtb_u_u1816)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u1823) Base_dDiagnostics_dTc.C_TcErr_NotInductiveFamily)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1824) -> ((Base_dCommon.v_bind (((((((((((v_elabCaseAltsFuel (dtb_u_u1813 - 1)) dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1818) dtb_u_u1824) dtb_u_u1820) ((Elab_dTypes.v_evalCtx dtb_u_u1815) dtb_u_u1817)) dtb_u_u1822) dtb_u_u1821) B_dData_dList.C_List_Nil)) (fun (dtb_u_u1825 : (Core_dTerm.t_CaseAlt B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1825 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1826; B_dData_dPair.f_Pair_second = dtb_u_u1827 } -> (((((((((Elab_dCase.v_checkCaseDone dtb_u_u1827) dtb_u_u1815) dtb_u_u1824) dtb_u_u1820) dtb_u_u1821) dtb_u_u1822) dtb_u_u1823) dtb_u_u1817) dtb_u_u1826)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 466 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferCaseEFuel = (fun (dtb_u_u1828 : int) (dtb_u_u1829 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1830 : Elab_dTypes.t_Ctx) (dtb_u_u1831 : Elab_dTypes.t_Ec) (dtb_u_u1832 : Frontend_dAst.t_Expr) (dtb_u_u1833 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1834 : Base_dSource.t_Span) -> (if (dtb_u_u1828 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u1835 = (((Elab_dMetaSpans.v_newMetaAt dtb_u_u1834) dtb_u_u1830) dtb_u_u1831) in (match dtb_u_u1835 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1836; B_dData_dPair.f_Pair_second = dtb_u_u1837 } -> (let dtb_u_u1838 = ((Elab_dTypes.v_evalCtx dtb_u_u1830) dtb_u_u1836) in ((Base_dCommon.v_bind ((((((((v_checkCaseFuel (dtb_u_u1828 - 1)) dtb_u_u1829) dtb_u_u1830) dtb_u_u1837) dtb_u_u1832) dtb_u_u1833) dtb_u_u1838) dtb_u_u1834)) (fun (dtb_u_u1839 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1839 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1840; B_dData_dPair.f_Pair_second = dtb_u_u1841 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1840; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1838; B_dData_dPair.f_Pair_second = dtb_u_u1841 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 486 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkCondBoolFuel = (fun (dtb_u_u1842 : int) (dtb_u_u1843 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1844 : Elab_dTypes.t_Ctx) (dtb_u_u1845 : Elab_dTypes.t_Ec) (dtb_u_u1846 : Frontend_dAst.t_Expr) (dtb_u_u1847 : Base_dSource.t_Span) -> (if (dtb_u_u1842 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((((((v_checkEFuel (dtb_u_u1842 - 1)) dtb_u_u1843) dtb_u_u1844) dtb_u_u1845) dtb_u_u1846) Elab_dPrelude.v_boolTyValue) with
  | Base_dDiag.C_Check_OkC (dtb_u_u1848) -> (Base_dDiag.C_Check_OkC (dtb_u_u1848))
  | Base_dDiag.C_Check_ErrC (dtb_u_u1849) -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u1842 - 1)) dtb_u_u1843) dtb_u_u1844) dtb_u_u1845) dtb_u_u1846)) (fun (dtb_u_u1850 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1851 = dtb_u_u1850 in (match dtb_u_u1851 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1852; B_dData_dPair.f_Pair_second = dtb_u_u1853 } -> (match dtb_u_u1853 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1854; B_dData_dPair.f_Pair_second = dtb_u_u1855 } -> (if (Elab_dMeta.v_isBoolType dtb_u_u1854) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1852; B_dData_dPair.f_Pair_second = dtb_u_u1855 })) else ((Elab_dTypes.v_errAt dtb_u_u1847) (String.concat "" ["if condition must be "; Base_dIntrinsics.v_boolTypeName; " (got "; ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth dtb_u_u1844)) dtb_u_u1854); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 754 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuel = (fun (dtb_u_u1856 : int) (dtb_u_u1857 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1858 : Elab_dTypes.t_Ctx) (dtb_u_u1859 : Elab_dTypes.t_Ec) (dtb_u_u1860 : Frontend_dAst.t_Expr) -> (if (dtb_u_u1856 <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand dtb_u_u1860) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1861) -> ((Base_dCommon.v_bind ((((v_handleCallExprAt dtb_u_u1857) dtb_u_u1859) dtb_u_u1860) (Frontend_dAst.v_exprRef dtb_u_u1860))) (fun (dtb_u_u1862 : Frontend_dAst.t_Expr) -> (match (((((v_inferEFuel (dtb_u_u1856 - 1)) dtb_u_u1857) dtb_u_u1858) dtb_u_u1859) dtb_u_u1862) with
  | Base_dDiag.C_Check_OkC (dtb_u_u1863) -> (Base_dDiag.C_Check_OkC (dtb_u_u1863))
  | Base_dDiag.C_Check_ErrC (dtb_u_u1864) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole dtb_u_u1857) dtb_u_u1859) dtb_u_u1860) (Frontend_dAst.v_exprRef dtb_u_u1860))) (fun (dtb_u_u1865 : Frontend_dAst.t_Expr) -> (match (((((v_inferEFuel (dtb_u_u1856 - 1)) dtb_u_u1857) dtb_u_u1858) dtb_u_u1859) dtb_u_u1865) with
  | Base_dDiag.C_Check_OkC (dtb_u_u1866) -> (Base_dDiag.C_Check_OkC (dtb_u_u1866))
  | Base_dDiag.C_Check_ErrC (dtb_u_u1867) -> ((Base_dCommon.v_bind ((((v_handleCallExpr dtb_u_u1857) dtb_u_u1859) dtb_u_u1860) (Frontend_dAst.v_exprRef dtb_u_u1860))) (fun (dtb_u_u1868 : Frontend_dAst.t_Expr) -> (match (((((v_inferEFuel (dtb_u_u1856 - 1)) dtb_u_u1857) dtb_u_u1858) dtb_u_u1859) dtb_u_u1868) with
  | Base_dDiag.C_Check_OkC (dtb_u_u1869) -> (Base_dDiag.C_Check_OkC (dtb_u_u1869))
  | Base_dDiag.C_Check_ErrC (dtb_u_u1870) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1864))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1871 = (v_performOperand dtb_u_u1860) in (match dtb_u_u1871 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand dtb_u_u1860) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1872) -> ((Base_dCommon.v_bind (v_appAtCallExpr dtb_u_u1860)) (fun (dtb_u_u1873 : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (dtb_u_u1856 - 1)) dtb_u_u1857) dtb_u_u1858) dtb_u_u1859) dtb_u_u1873)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems dtb_u_u1860) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1874) -> ((Base_dCommon.v_bind ((((v_expandListLit dtb_u_u1859) Base_dIntrinsics.v_listFamilyName) dtb_u_u1874) (Frontend_dAst.v_exprSpan dtb_u_u1860))) (fun (dtb_u_u1875 : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (dtb_u_u1856 - 1)) dtb_u_u1857) dtb_u_u1858) dtb_u_u1859) dtb_u_u1875)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCore dtb_u_u1856) dtb_u_u1857) dtb_u_u1858) dtb_u_u1859) dtb_u_u1860)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1876) -> (match dtb_u_u1876 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1877; B_dData_dPair.f_Pair_second = dtb_u_u1878 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u1856 - 1)) dtb_u_u1857) dtb_u_u1858) dtb_u_u1859) dtb_u_u1877)) (fun (dtb_u_u1879 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1880 = dtb_u_u1879 in (match dtb_u_u1880 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1881; B_dData_dPair.f_Pair_second = dtb_u_u1882 } -> (match dtb_u_u1882 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1883; B_dData_dPair.f_Pair_second = dtb_u_u1884 } -> ((Base_dCommon.v_bind (((((v_performCallExpr dtb_u_u1857) dtb_u_u1884) dtb_u_u1883) dtb_u_u1877) (Frontend_dAst.v_exprSpan dtb_u_u1860))) (fun (dtb_u_u1885 : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (dtb_u_u1856 - 1)) dtb_u_u1857) dtb_u_u1858) dtb_u_u1884) dtb_u_u1885)))
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
and v_inferEFuelCore = (fun (dtb_u_u1886 : int) (dtb_u_u1887 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1888 : Elab_dTypes.t_Ctx) (dtb_u_u1889 : Elab_dTypes.t_Ec) (dtb_u_u1890 : Frontend_dAst.t_Expr) -> (if (dtb_u_u1886 <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead dtb_u_u1890) then (match (v_decodeDoBlock dtb_u_u1890) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1891) -> ((Base_dCommon.v_bind (((((v_inferDoBlockFuel (dtb_u_u1886 - 1)) dtb_u_u1887) dtb_u_u1888) dtb_u_u1889) dtb_u_u1891)) (fun (dtb_u_u1892 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u1892 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1893) -> (Base_dDiag.C_Check_OkC (dtb_u_u1893))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain dtb_u_u1886) dtb_u_u1887) dtb_u_u1888) dtb_u_u1889) (v_doChainFallback dtb_u_u1891))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_inferEFuelCorePlain dtb_u_u1886) dtb_u_u1887) dtb_u_u1888) dtb_u_u1889) dtb_u_u1890)
  | _ -> failwith "DT: impossible branch"
) else (((((v_inferEFuelCorePlain dtb_u_u1886) dtb_u_u1887) dtb_u_u1888) dtb_u_u1889) dtb_u_u1890))))
# 814 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlain = (fun (dtb_u_u1894 : int) (dtb_u_u1895 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1896 : Elab_dTypes.t_Ctx) (dtb_u_u1897 : Elab_dTypes.t_Ec) (dtb_u_u1898 : Frontend_dAst.t_Expr) -> (if (dtb_u_u1894 <= 0) then (Base_dDiag.v_icFuel "inference") else (((((v_inferEFuelCorePlainGo dtb_u_u1894) dtb_u_u1895) dtb_u_u1896) dtb_u_u1897) dtb_u_u1898)))
# 818 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelCorePlainGo = (fun (dtb_u_u1899 : int) (dtb_u_u1900 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1901 : Elab_dTypes.t_Ctx) (dtb_u_u1902 : Elab_dTypes.t_Ec) (dtb_u_u1903 : Frontend_dAst.t_Expr) -> (if (dtb_u_u1899 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u1904 = dtb_u_u1903 in (match dtb_u_u1904 with
  | Frontend_dAst.C_Expr_EDo (dtb_u_u1905, dtb_u_u1906) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1906)) Base_dDiagnostics_dTc.C_TcErr_DoUnsupported)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u1907, dtb_u_u1908, dtb_u_u1909) -> (((((((v_elabERecUpdateFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1907) dtb_u_u1908) (Frontend_dAst.v_nodeRefSpan dtb_u_u1909))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u1910, dtb_u_u1911, dtb_u_u1912) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1912)) Base_dDiagnostics_dTc.C_TcErr_RecordsUnsupported)
  | Frontend_dAst.C_Expr_EField (dtb_u_u1913, dtb_u_u1914, dtb_u_u1915) -> (((((((v_elabEFieldFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1913) dtb_u_u1914) (Frontend_dAst.v_nodeRefSpan dtb_u_u1915))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u1916, dtb_u_u1917, dtb_u_u1918) -> (((((((v_inferCaseEFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1916) (v_altsToPairs dtb_u_u1917)) (Frontend_dAst.v_nodeRefSpan dtb_u_u1918))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u1919, dtb_u_u1920, dtb_u_u1921, dtb_u_u1922) -> ((((((((v_inferLetFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1919) dtb_u_u1920) dtb_u_u1921) (Frontend_dAst.v_nodeRefSpan dtb_u_u1922))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u1923, dtb_u_u1924, dtb_u_u1925, dtb_u_u1926) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1923) (Frontend_dAst.v_nodeRefSpan dtb_u_u1926))) (fun (dtb_u_u1927 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u1927 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1928; B_dData_dPair.f_Pair_second = dtb_u_u1929 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1929) dtb_u_u1924)) (fun (dtb_u_u1930 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1931 = dtb_u_u1930 in (match dtb_u_u1931 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1932; B_dData_dPair.f_Pair_second = dtb_u_u1933 } -> (match dtb_u_u1933 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1934; B_dData_dPair.f_Pair_second = dtb_u_u1935 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1935) dtb_u_u1925)) (fun (dtb_u_u1936 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u1937 = dtb_u_u1936 in (match dtb_u_u1937 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1938; B_dData_dPair.f_Pair_second = dtb_u_u1939 } -> (match dtb_u_u1939 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1940; B_dData_dPair.f_Pair_second = dtb_u_u1941 } -> (if (if ((v_isIntTy dtb_u_u1941) dtb_u_u1934) then ((v_isNatTy dtb_u_u1941) dtb_u_u1940) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb_u_u1928, dtb_u_u1932, (v_natToIntTerm dtb_u_u1938))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1934; B_dData_dPair.f_Pair_second = dtb_u_u1941 } })) else (if (if ((v_isNatTy dtb_u_u1941) dtb_u_u1934) then ((v_isIntTy dtb_u_u1941) dtb_u_u1940) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb_u_u1928, (v_natToIntTerm dtb_u_u1932), dtb_u_u1938)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb_u_u1941 } })) else ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb_u_u1941) (Elab_dTypes.v_ctxDepth dtb_u_u1901)) dtb_u_u1934) dtb_u_u1940)) (fun (dtb_u_u1942 : Elab_dTypes.t_Ec) -> (let dtb_u_u1943 = (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u1942) dtb_u_u1901) dtb_u_u1934) in (let dtb_u_u1944 = (if dtb_u_u1943 then (Elab_dMeta.v_castErased dtb_u_u1932) else dtb_u_u1932) in (let dtb_u_u1945 = (if dtb_u_u1943 then (Elab_dMeta.v_castErased dtb_u_u1938) else dtb_u_u1938) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb_u_u1928, dtb_u_u1944, dtb_u_u1945)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1934; B_dData_dPair.f_Pair_second = dtb_u_u1942 } })))))))))
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
  | Frontend_dAst.C_Expr_ELam (dtb_u_u1946, dtb_u_u1947, dtb_u_u1948) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1948)) Base_dDiagnostics_dTc.C_TcErr_LambdaNoSignature)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1949, dtb_u_u1950, dtb_u_u1951) -> (match dtb_u_u1949 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953) -> (match dtb_u_u1950 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1954, dtb_u_u1955) -> (match dtb_u_u1955 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1956, dtb_u_u1957) -> (match dtb_u_u1957 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1958 = (Frontend_dReserved.v_classify dtb_u_u1952) in (match dtb_u_u1958 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1959) -> (match dtb_u_u1959 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u1960, dtb_u_u1961) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u1960, (Frontend_dReserved.v_joinWithAt dtb_u_u1961)))) dtb_u_u1960) (Frontend_dReserved.v_joinWithAt dtb_u_u1961))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | Frontend_dReserved.C_Reserved_RsAscribe -> (((((((v_inferAnnFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1954) dtb_u_u1956) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951))
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1954, (B_dData_dList.C_List__x58__x58_ (dtb_u_u1956, B_dData_dList.C_List_Nil))))) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1954, (B_dData_dList.C_List__x58__x58_ (dtb_u_u1956, B_dData_dList.C_List_Nil))))) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
))
  | _ -> (let dtb_u_u1962 = (Frontend_dReserved.v_classify dtb_u_u1952) in (match dtb_u_u1962 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1963) -> (match dtb_u_u1963 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u1964, dtb_u_u1965) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u1964, (Frontend_dReserved.v_joinWithAt dtb_u_u1965)))) dtb_u_u1964) (Frontend_dReserved.v_joinWithAt dtb_u_u1965))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) dtb_u_u1950) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) dtb_u_u1950) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
))
)
  | _ -> (let dtb_u_u1966 = (Frontend_dReserved.v_classify dtb_u_u1952) in (match dtb_u_u1966 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1967) -> (match dtb_u_u1967 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u1968, dtb_u_u1969) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u1968, (Frontend_dReserved.v_joinWithAt dtb_u_u1969)))) dtb_u_u1968) (Frontend_dReserved.v_joinWithAt dtb_u_u1969))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) dtb_u_u1950) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) dtb_u_u1950) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
))
)
  | _ -> (let dtb_u_u1970 = (Frontend_dReserved.v_classify dtb_u_u1952) in (match dtb_u_u1970 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1971) -> (match dtb_u_u1971 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u1972, dtb_u_u1973) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u1972, (Frontend_dReserved.v_joinWithAt dtb_u_u1973)))) dtb_u_u1972) (Frontend_dReserved.v_joinWithAt dtb_u_u1973))
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) dtb_u_u1950) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) (Frontend_dAst.C_Expr_EVar (dtb_u_u1952, dtb_u_u1953))) dtb_u_u1950) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
))
)
  | _ -> ((((((((v_inferAppFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1949) dtb_u_u1950) (Frontend_dAst.v_nodeRefSpan dtb_u_u1951)) B_dData_dMaybe.C_Maybe_Nothing)
)
  | Frontend_dAst.C_Expr_EPi (dtb_u_u1974, dtb_u_u1975, dtb_u_u1976, dtb_u_u1977, dtb_u_u1978, dtb_u_u1979) -> ((((((((((v_inferPiFuel (dtb_u_u1899 - 1)) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1974) dtb_u_u1975) dtb_u_u1976) dtb_u_u1977) dtb_u_u1978) (Frontend_dAst.v_nodeRefSpan dtb_u_u1979))
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u1980, dtb_u_u1981) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb_u_u1980)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = dtb_u_u1902 } }))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u1982, dtb_u_u1983) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb_u_u1982)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_strTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = dtb_u_u1902 } }))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u1984, dtb_u_u1985) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb_u_u1984)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_intTypeName, B_dData_dList.C_List_Nil)))); B_dData_dPair.f_Pair_second = dtb_u_u1902 } }))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1986, dtb_u_u1987) -> (if (dtb_u_u1986 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc Core_dTerm.v_levelZero))); B_dData_dPair.f_Pair_second = dtb_u_u1902 } })) else (let dtb_u_u1988 = (Frontend_dReserved.v_classify dtb_u_u1986) in (match dtb_u_u1988 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1989) -> (match dtb_u_u1989 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u1990, dtb_u_u1991) -> ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_nodeRefSpan dtb_u_u1987)) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousName (dtb_u_u1990, (Frontend_dReserved.v_joinWithAt dtb_u_u1991)))) dtb_u_u1990) (Frontend_dReserved.v_joinWithAt dtb_u_u1991))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u1992, dtb_u_u1993) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor dtb_u_u1902) (Frontend_dAst.v_nodeRefSpan dtb_u_u1987)) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u1992) dtb_u_u1993)) (fun (dtb_u_u1994 : string) -> (((((Elab_dTerm_dSupport.v_inferVarRef dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1994) (Frontend_dAst.v_nodeRefSpan dtb_u_u1987))))
  | _ -> (if (Frontend_dReserved.v_isHoleName dtb_u_u1986) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1987)) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (((((Elab_dTerm_dSupport.v_inferVarRef dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1986) (Frontend_dAst.v_nodeRefSpan dtb_u_u1987)))
)
  | _ -> (if (Frontend_dReserved.v_isHoleName dtb_u_u1986) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u1987)) Base_dDiagnostics_dTc.C_TcErr_HoleNoExpectedType) else (((((Elab_dTerm_dSupport.v_inferVarRef dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) dtb_u_u1986) (Frontend_dAst.v_nodeRefSpan dtb_u_u1987)))
)))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
))))
# 1087 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabEFieldFuel = (fun (dtb_u_u1995 : int) (dtb_u_u1996 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1997 : Elab_dTypes.t_Ctx) (dtb_u_u1998 : Elab_dTypes.t_Ec) (dtb_u_u1999 : Frontend_dAst.t_Expr) (dtb_u_u2000 : string) (dtb_u_u2001 : Base_dSource.t_Span) -> (if (dtb_u_u1995 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u1995 - 1)) dtb_u_u1996) dtb_u_u1997) dtb_u_u1998) dtb_u_u1999)) (fun (dtb_u_u2002 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2003 = dtb_u_u2002 in (match dtb_u_u2003 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2004; B_dData_dPair.f_Pair_second = dtb_u_u2005 } -> (match dtb_u_u2005 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2006; B_dData_dPair.f_Pair_second = dtb_u_u2007 } -> (match ((v_recordTypeOf dtb_u_u2007) dtb_u_u2006) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2008) -> ((Base_dCommon.v_bind ((((v_recordFieldPlan dtb_u_u2007) dtb_u_u2006) dtb_u_u2000) dtb_u_u2001)) (fun (dtb_u_u2009 : t_FieldAccessPlan) -> (let dtb_u_u2010 = (B_dData_dList.v_length ((dtb_u_u2009).f_FieldAccessPlan_planData).Elab_dTypes.f_DtData_dtDataParams) in (let dtb_u_u2011 = ((B_dData_dList.v_drop dtb_u_u2010) (Elab_dTypes.v_dtCtorTelescope (dtb_u_u2009).f_FieldAccessPlan_planCtor)) in (let dtb_u_u2012 = (Core_dTerm.C_Term_TProj (dtb_u_u2004, (Elab_dTypes.v_dtCtorName (dtb_u_u2009).f_FieldAccessPlan_planCtor), dtb_u_u2011, (dtb_u_u2010 + (dtb_u_u2009).f_FieldAccessPlan_planField), (dtb_u_u2009).f_FieldAccessPlan_planField)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2012; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u2009).f_FieldAccessPlan_planType; B_dData_dPair.f_Pair_second = dtb_u_u2007 } })))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_hasFieldAccessFuel (dtb_u_u1995 - 1)) dtb_u_u1996) dtb_u_u1997) dtb_u_u2007) dtb_u_u2004) dtb_u_u2006) dtb_u_u2000) dtb_u_u2001)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1113 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_elabERecUpdateFuel = (fun (dtb_u_u2013 : int) (dtb_u_u2014 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2015 : Elab_dTypes.t_Ctx) (dtb_u_u2016 : Elab_dTypes.t_Ec) (dtb_u_u2017 : Frontend_dAst.t_Expr) (dtb_u_u2018 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2019 : Base_dSource.t_Span) -> (if (dtb_u_u2013 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u2018 with
  | B_dData_dList.C_List_Nil -> ((Elab_dTypes.v_errAt dtb_u_u2019) "record update needs at least one field")
  | _ -> (if (Elab_dRecords.v_hasDuplicateFieldNames dtb_u_u2018) then ((Elab_dTypes.v_errAt dtb_u_u2019) "duplicate field in record update") else ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2013 - 1)) dtb_u_u2014) dtb_u_u2015) dtb_u_u2016) dtb_u_u2017)) (fun (dtb_u_u2020 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2021 = dtb_u_u2020 in (match dtb_u_u2021 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2022; B_dData_dPair.f_Pair_second = dtb_u_u2023 } -> (match dtb_u_u2023 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2024; B_dData_dPair.f_Pair_second = dtb_u_u2025 } -> ((Base_dCommon.v_bind ((((v_recordUpdatePlan dtb_u_u2025) dtb_u_u2024) dtb_u_u2018) dtb_u_u2019)) (fun (dtb_u_u2026 : t_UpdateAccessPlan) -> (let dtb_u_u2027 = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Elab_dTypes.v_dtCtorName (dtb_u_u2026).f_UpdateAccessPlan_upCtor), (Frontend_dAst.v_detachedNodeRef dtb_u_u2019))), (dtb_u_u2026).f_UpdateAccessPlan_upBodyArgs, (Frontend_dAst.v_detachedNodeRef dtb_u_u2019))) in ((Base_dCommon.v_bind ((((((((((((v_elabConAltFuel (dtb_u_u2013 - 1)) dtb_u_u2014) dtb_u_u2015) dtb_u_u2025) (dtb_u_u2026).f_UpdateAccessPlan_upData) (dtb_u_u2026).f_UpdateAccessPlan_upIdxs) ((Elab_dTypes.v_evalCtx dtb_u_u2015) dtb_u_u2022)) dtb_u_u2024) (Elab_dTypes.v_dtCtorName (dtb_u_u2026).f_UpdateAccessPlan_upCtor)) ((v_recordFieldPats (dtb_u_u2026).f_UpdateAccessPlan_upFieldCount) dtb_u_u2019)) dtb_u_u2019) dtb_u_u2027)) (fun (dtb_u_u2028 : (Core_dTerm.t_CaseAlt, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2028 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2029; B_dData_dPair.f_Pair_second = dtb_u_u2030 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb_u_u2022, (dtb_u_u2029).Core_dTerm.f_CaseAlt_caseAltName, (Core_dTerm.v_binderPairs (dtb_u_u2029).Core_dTerm.f_CaseAlt_caseAltBinders), (dtb_u_u2026).f_UpdateAccessPlan_upFieldIndices, (dtb_u_u2029).Core_dTerm.f_CaseAlt_caseAltBody)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2024; B_dData_dPair.f_Pair_second = dtb_u_u2030 } }))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
)))
# 1142 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAnnFuel = (fun (dtb_u_u2031 : int) (dtb_u_u2032 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2033 : Elab_dTypes.t_Ctx) (dtb_u_u2034 : Elab_dTypes.t_Ec) (dtb_u_u2035 : Frontend_dAst.t_Expr) (dtb_u_u2036 : Frontend_dAst.t_Expr) (dtb_u_u2037 : Base_dSource.t_Span) -> (if (dtb_u_u2031 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (dtb_u_u2031 - 1)) dtb_u_u2032) dtb_u_u2033) dtb_u_u2034) dtb_u_u2036)) (fun (dtb_u_u2038 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2039 = dtb_u_u2038 in (match dtb_u_u2039 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2040; B_dData_dPair.f_Pair_second = dtb_u_u2041 } -> (match dtb_u_u2041 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2042; B_dData_dPair.f_Pair_second = dtb_u_u2043 } -> (let dtb_u_u2044 = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u2033)) dtb_u_u2040) in ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2031 - 1)) dtb_u_u2032) dtb_u_u2033) dtb_u_u2043) dtb_u_u2035) dtb_u_u2044)) (fun (dtb_u_u2045 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2045 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2046; B_dData_dPair.f_Pair_second = dtb_u_u2047 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2046; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2044; B_dData_dPair.f_Pair_second = dtb_u_u2047 } }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1160 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferPiFuel = (fun (dtb_u_u2048 : int) (dtb_u_u2049 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2050 : Elab_dTypes.t_Ctx) (dtb_u_u2051 : Elab_dTypes.t_Ec) (dtb_u_u2052 : string) (dtb_u_u2053 : bool) (dtb_u_u2054 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dtb_u_u2055 : Frontend_dAst.t_Expr) (dtb_u_u2056 : Frontend_dAst.t_Expr) (dtb_u_u2057 : Base_dSource.t_Span) -> (if (dtb_u_u2048 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_checkTypeFuel (dtb_u_u2048 - 1)) dtb_u_u2049) dtb_u_u2050) dtb_u_u2051) dtb_u_u2055)) (fun (dtb_u_u2058 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2059 = dtb_u_u2058 in (match dtb_u_u2059 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2060; B_dData_dPair.f_Pair_second = dtb_u_u2061 } -> (match dtb_u_u2061 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2062; B_dData_dPair.f_Pair_second = dtb_u_u2063 } -> (let dtb_u_u2064 = ((Elab_dTypes.v_evalCtx dtb_u_u2050) dtb_u_u2060) in (let dtb_u_u2065 = (Elab_dMeta.v_isTypeDomain dtb_u_u2064) in (let dtb_u_u2066 = ((Elab_dMeta.v_isLinearType dtb_u_u2051) dtb_u_u2064) in (let dtb_u_u2067 = (Elab_dTypes.v_ctxDepth dtb_u_u2050) in (let dtb_u_u2068 = (((Elab_dTypes.v_ctxBind dtb_u_u2052) dtb_u_u2060) dtb_u_u2050) in (let dtb_u_u2069 = (match dtb_u_u2054 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2078) -> (if dtb_u_u2053 then true else dtb_u_u2065)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u2070 = (match dtb_u_u2054 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2077) -> (if (Frontend_dAst.v_qtyIsZero dtb_u_u2077) then dtb_u_u2066 else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) in (if dtb_u_u2069 then (if dtb_u_u2053 then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u2057) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityImplicit (dtb_u_u2052))) dtb_u_u2052) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u2057) (Base_dDiagnostics_dTc.C_TcErr_MultiplicityTypeDomain (dtb_u_u2052))) dtb_u_u2052)) else (if dtb_u_u2070 then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u2057) (Base_dDiagnostics_dTc.C_TcErr_LinearTypeNeedsOne (dtb_u_u2052))) dtb_u_u2052) else ((Base_dCommon.v_bind (((((v_checkTypeFuel (dtb_u_u2048 - 1)) dtb_u_u2049) dtb_u_u2068) dtb_u_u2063) dtb_u_u2056)) (fun (dtb_u_u2071 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2072 = dtb_u_u2071 in (match dtb_u_u2072 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2073; B_dData_dPair.f_Pair_second = dtb_u_u2074 } -> (match dtb_u_u2074 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2075; B_dData_dPair.f_Pair_second = dtb_u_u2076 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (dtb_u_u2052, dtb_u_u2053, (if dtb_u_u2066 then Core_dTerm.C_Rig_Rig1 else (if dtb_u_u2053 then ((Elab_dMeta.v_implicitBinderRig dtb_u_u2051) dtb_u_u2064) else (((Elab_dMeta.v_rigOfQty false) dtb_u_u2065) dtb_u_u2054))), dtb_u_u2060, dtb_u_u2073)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType (((Core_dTerm.v_levelMax dtb_u_u2062) dtb_u_u2075))); B_dData_dPair.f_Pair_second = dtb_u_u2076 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1224 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppFuel = (fun (dtb_u_u2079 : int) (dtb_u_u2080 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2081 : Elab_dTypes.t_Ctx) (dtb_u_u2082 : Elab_dTypes.t_Ec) (dtb_u_u2083 : Frontend_dAst.t_Expr) (dtb_u_u2084 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2085 : Base_dSource.t_Span) (dtb_u_u2086 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u2079 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2087 = dtb_u_u2083 in (match dtb_u_u2087 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2088, dtb_u_u2089) -> (if (dtb_u_u2088 = "->") then (let dtb_u_u2090 = dtb_u_u2084 in (match dtb_u_u2090 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2091, dtb_u_u2092) -> (match dtb_u_u2092 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2093, dtb_u_u2094) -> (match dtb_u_u2094 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_inferPiFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) "_") false) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u2091) dtb_u_u2093) dtb_u_u2085)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2085) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2085) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2085) Base_dDiagnostics_dTc.C_TcErr_InvalidArrowType)
)) else (if (dtb_u_u2088 = "Type") then (let dtb_u_u2095 = dtb_u_u2084 in (match dtb_u_u2095 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2096, dtb_u_u2097) -> (match dtb_u_u2096 with
  | Frontend_dAst.C_Expr_EInt (dtb_u_u2098, dtb_u_u2099) -> (match dtb_u_u2097 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u2098 < 0) then ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2099)) Base_dDiagnostics_dTc.C_TcErr_UniverseLevelNonNegative) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb_u_u2098))); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Value_VType ((Core_dTerm.v_levelSucc (Core_dTerm.v_levelOfInt dtb_u_u2098)))); B_dData_dPair.f_Pair_second = dtb_u_u2082 } })))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2089)) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2089)) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2089)) Base_dDiagnostics_dTc.C_TcErr_TypeLevelArg)
)) else (match dtb_u_u2083 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2100, dtb_u_u2101) -> (if (Elab_dTerm_dSupport.v_isFieldSelectorName dtb_u_u2100) then ((((((((v_inferAppGeneralGoFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2083) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086) else (if (Frontend_dReserved.v_isOverCtorName dtb_u_u2100) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor dtb_u_u2082) (Frontend_dAst.v_nodeRefSpan dtb_u_u2101)) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort dtb_u_u2100)) (Frontend_dReserved.v_overCtorTargets dtb_u_u2100))) (fun (dtb_u_u2102 : string) -> ((((((((v_inferAppFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) (Frontend_dAst.C_Expr_EVar (dtb_u_u2102, dtb_u_u2101))) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086))) else (match ((Elab_dTypes.v_ctxLookup dtb_u_u2100) dtb_u_u2081) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2103) -> ((((((((v_inferAppGeneralFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2083) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc dtb_u_u2082) dtb_u_u2100) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2104) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u2104))) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)) (fun (dtb_u_u2105 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2106 = dtb_u_u2105 in (match dtb_u_u2106 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2107; B_dData_dPair.f_Pair_second = dtb_u_u2108 } -> (match dtb_u_u2108 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2109; B_dData_dPair.f_Pair_second = dtb_u_u2110 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb_u_u2110) (Core_dTerm.C_Term_TGlobal (dtb_u_u2100))) dtb_u_u2107); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2109; B_dData_dPair.f_Pair_second = dtb_u_u2110 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup dtb_u_u2100) dtb_u_u2080) dtb_u_u2082) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2111) -> (if (((v_skipArithSpecForHint dtb_u_u2082) dtb_u_u2100) dtb_u_u2086) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u2111)) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)) (fun (dtb_u_u2112 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2113 = dtb_u_u2112 in (match dtb_u_u2113 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2114; B_dData_dPair.f_Pair_second = dtb_u_u2115 } -> (match dtb_u_u2115 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2116; B_dData_dPair.f_Pair_second = dtb_u_u2117 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb_u_u2117) (Core_dTerm.C_Term_TGlobal (dtb_u_u2100))) dtb_u_u2114); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2116; B_dData_dPair.f_Pair_second = dtb_u_u2117 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2100) dtb_u_u2084) dtb_u_u2085)) (fun (dtb_u_u2118 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2118 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2119) -> (Base_dDiag.C_Check_OkC (dtb_u_u2119))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u2111)) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)) (fun (dtb_u_u2120 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2121 = dtb_u_u2120 in (match dtb_u_u2121 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2122; B_dData_dPair.f_Pair_second = dtb_u_u2123 } -> (match dtb_u_u2123 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2124; B_dData_dPair.f_Pair_second = dtb_u_u2125 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb_u_u2125) (Core_dTerm.C_Term_TGlobal (dtb_u_u2100))) dtb_u_u2122); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2124; B_dData_dPair.f_Pair_second = dtb_u_u2125 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2100) dtb_u_u2084) dtb_u_u2085)) (fun (dtb_u_u2126 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2126 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2127) -> (Base_dDiag.C_Check_OkC (dtb_u_u2127))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u2101)) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u2100))) dtb_u_u2100)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2083) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)
)))
  | _ -> (match dtb_u_u2083 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2128, dtb_u_u2129) -> (if (Elab_dTerm_dSupport.v_isFieldSelectorName dtb_u_u2128) then ((((((((v_inferAppGeneralGoFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2083) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086) else (if (Frontend_dReserved.v_isOverCtorName dtb_u_u2128) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor dtb_u_u2082) (Frontend_dAst.v_nodeRefSpan dtb_u_u2129)) B_dData_dMaybe.C_Maybe_Nothing) (Frontend_dReserved.v_overCtorShort dtb_u_u2128)) (Frontend_dReserved.v_overCtorTargets dtb_u_u2128))) (fun (dtb_u_u2130 : string) -> ((((((((v_inferAppFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) (Frontend_dAst.C_Expr_EVar (dtb_u_u2130, dtb_u_u2129))) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086))) else (match ((Elab_dTypes.v_ctxLookup dtb_u_u2128) dtb_u_u2081) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2131) -> ((((((((v_inferAppGeneralFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2083) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Elab_dMeta.v_dtCtorLookupEc dtb_u_u2082) dtb_u_u2128) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2132) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u2132))) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)) (fun (dtb_u_u2133 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2134 = dtb_u_u2133 in (match dtb_u_u2134 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2135; B_dData_dPair.f_Pair_second = dtb_u_u2136 } -> (match dtb_u_u2136 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2137; B_dData_dPair.f_Pair_second = dtb_u_u2138 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb_u_u2138) (Core_dTerm.C_Term_TGlobal (dtb_u_u2128))) dtb_u_u2135); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2137; B_dData_dPair.f_Pair_second = dtb_u_u2138 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_globalsLookup dtb_u_u2128) dtb_u_u2080) dtb_u_u2082) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2139) -> (if (((v_skipArithSpecForHint dtb_u_u2082) dtb_u_u2128) dtb_u_u2086) then ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u2139)) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)) (fun (dtb_u_u2140 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2141 = dtb_u_u2140 in (match dtb_u_u2141 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2142; B_dData_dPair.f_Pair_second = dtb_u_u2143 } -> (match dtb_u_u2143 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2144; B_dData_dPair.f_Pair_second = dtb_u_u2145 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb_u_u2145) (Core_dTerm.C_Term_TGlobal (dtb_u_u2128))) dtb_u_u2142); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2144; B_dData_dPair.f_Pair_second = dtb_u_u2145 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2128) dtb_u_u2084) dtb_u_u2085)) (fun (dtb_u_u2146 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2146 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2147) -> (Base_dDiag.C_Check_OkC (dtb_u_u2147))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u2139)) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)) (fun (dtb_u_u2148 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2149 = dtb_u_u2148 in (match dtb_u_u2149 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2150; B_dData_dPair.f_Pair_second = dtb_u_u2151 } -> (match dtb_u_u2151 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2152; B_dData_dPair.f_Pair_second = dtb_u_u2153 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTermEc dtb_u_u2153) (Core_dTerm.C_Term_TGlobal (dtb_u_u2128))) dtb_u_u2150); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2152; B_dData_dPair.f_Pair_second = dtb_u_u2153 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2128) dtb_u_u2084) dtb_u_u2085)) (fun (dtb_u_u2154 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2154 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2155) -> (Base_dDiag.C_Check_OkC (dtb_u_u2155))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u2129)) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u2128))) dtb_u_u2128)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralFuel (dtb_u_u2079 - 1)) dtb_u_u2080) dtb_u_u2081) dtb_u_u2082) dtb_u_u2083) dtb_u_u2084) dtb_u_u2085) dtb_u_u2086)
)
))))
# 1297 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralFuel = (fun (dtb_u_u2156 : int) (dtb_u_u2157 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2158 : Elab_dTypes.t_Ctx) (dtb_u_u2159 : Elab_dTypes.t_Ec) (dtb_u_u2160 : Frontend_dAst.t_Expr) (dtb_u_u2161 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2162 : Base_dSource.t_Span) (dtb_u_u2163 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u2156 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u2160 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2164, dtb_u_u2165) -> ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (dtb_u_u2156 - 1)) dtb_u_u2157) dtb_u_u2158) dtb_u_u2159) dtb_u_u2164) dtb_u_u2161) dtb_u_u2162)) (fun (dtb_u_u2166 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2166 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2167) -> (Base_dDiag.C_Check_OkC (dtb_u_u2167))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_inferAppGeneralGoFuel (dtb_u_u2156 - 1)) dtb_u_u2157) dtb_u_u2158) dtb_u_u2159) dtb_u_u2160) dtb_u_u2161) dtb_u_u2162) dtb_u_u2163)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_inferAppGeneralGoFuel (dtb_u_u2156 - 1)) dtb_u_u2157) dtb_u_u2158) dtb_u_u2159) dtb_u_u2160) dtb_u_u2161) dtb_u_u2162) dtb_u_u2163)
)))
# 1312 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppGeneralGoFuel = (fun (dtb_u_u2168 : int) (dtb_u_u2169 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2170 : Elab_dTypes.t_Ctx) (dtb_u_u2171 : Elab_dTypes.t_Ec) (dtb_u_u2172 : Frontend_dAst.t_Expr) (dtb_u_u2173 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2174 : Base_dSource.t_Span) (dtb_u_u2175 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u2168 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2168 - 1)) dtb_u_u2169) dtb_u_u2170) dtb_u_u2171) dtb_u_u2172)) (fun (dtb_u_u2176 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2177 = dtb_u_u2176 in (match dtb_u_u2177 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2178; B_dData_dPair.f_Pair_second = dtb_u_u2179 } -> (match dtb_u_u2179 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2180; B_dData_dPair.f_Pair_second = dtb_u_u2181 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2168 - 1)) dtb_u_u2169) dtb_u_u2170) dtb_u_u2181) dtb_u_u2180) dtb_u_u2173) dtb_u_u2174) dtb_u_u2175)) (fun (dtb_u_u2182 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2183 = dtb_u_u2182 in (match dtb_u_u2183 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2184; B_dData_dPair.f_Pair_second = dtb_u_u2185 } -> (match dtb_u_u2185 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2186; B_dData_dPair.f_Pair_second = dtb_u_u2187 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb_u_u2187)) dtb_u_u2178) dtb_u_u2184); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2186; B_dData_dPair.f_Pair_second = dtb_u_u2187 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 1328 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsFuel = (fun (dtb_u_u2188 : int) (dtb_u_u2189 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2190 : Elab_dTypes.t_Ctx) (dtb_u_u2191 : Elab_dTypes.t_Ec) (dtb_u_u2192 : Core_dTerm.t_Value) (dtb_u_u2193 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2194 : Base_dSource.t_Span) (dtb_u_u2195 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u2188 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((v_inferArgsGo 64) dtb_u_u2189) dtb_u_u2190) dtb_u_u2191) dtb_u_u2192) dtb_u_u2193) dtb_u_u2194) dtb_u_u2195)))
# 1493 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferArgsGo = (fun (dtb_u_u2196 : int) (dtb_u_u2197 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2198 : Elab_dTypes.t_Ctx) (dtb_u_u2199 : Elab_dTypes.t_Ec) (dtb_u_u2200 : Core_dTerm.t_Value) (dtb_u_u2201 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2202 : Base_dSource.t_Span) (dtb_u_u2203 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u2196 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2204 = ((Elab_dTypes.v_forceVal dtb_u_u2199) dtb_u_u2200) in (match dtb_u_u2204 with
  | Core_dTerm.C_Value_VPi (dtb_u_u2205, dtb_u_u2206, dtb_u_u2207, dtb_u_u2208, dtb_u_u2209) -> (if dtb_u_u2206 then (if ((Elab_dDict.v_isDictDomain dtb_u_u2199) dtb_u_u2208) then (if ((Elab_dDict.v_dictArgUnsolvedMeta dtb_u_u2199) dtb_u_u2208) then (((((((((v_deferDictBinderFuel (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2199) dtb_u_u2208) dtb_u_u2209) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203) else ((Base_dCommon.v_bind (((((((v_constrainDictDomFuel (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2199) dtb_u_u2198) dtb_u_u2208) dtb_u_u2201) dtb_u_u2202)) (fun (dtb_u_u2210 : Elab_dTypes.t_Ec) -> (let dtb_u_u2211 = (((((Elab_dDict.v_searchInstanceIn dtb_u_u2197) dtb_u_u2198) dtb_u_u2210) ((Elab_dTypes.v_forceVal dtb_u_u2210) dtb_u_u2208)) dtb_u_u2202) in (match dtb_u_u2211 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2212) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP dtb_u_u2210)) ((Elab_dTypes.v_forceVal dtb_u_u2210) dtb_u_u2208)) then (((((((((v_deferDictBinderFuel (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2210) dtb_u_u2208) dtb_u_u2209) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203) else (if ((Elab_dDict.v_isRigidDictArg dtb_u_u2210) ((Elab_dTypes.v_forceVal dtb_u_u2210) dtb_u_u2208)) then (((((((((v_deferDictBinderFuel (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2210) dtb_u_u2208) dtb_u_u2209) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203) else (Base_dDiag.C_Check_ErrC (dtb_u_u2212))))
  | Base_dDiag.C_Check_OkC (dtb_u_u2213) -> (match dtb_u_u2213 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2214; B_dData_dPair.f_Pair_second = dtb_u_u2215 } -> (let dtb_u_u2216 = ((Core_dEval.v_applyClosure dtb_u_u2209) ((Elab_dTypes.v_evalCtx dtb_u_u2198) dtb_u_u2214)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2215) dtb_u_u2216) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2217 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2218 = dtb_u_u2217 in (match dtb_u_u2218 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2219; B_dData_dPair.f_Pair_second = dtb_u_u2220 } -> (match dtb_u_u2220 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2221; B_dData_dPair.f_Pair_second = dtb_u_u2222 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2214; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb_u_u2219)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2221; B_dData_dPair.f_Pair_second = dtb_u_u2222 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) else (if ((Elab_dDict.v_isMemberDomain dtb_u_u2199) dtb_u_u2208) then (match ((((Elab_dDict.v_memberLookup 64) (Elab_dTypes.v_ctxDepth dtb_u_u2198)) dtb_u_u2199) dtb_u_u2208) with
  | Elab_dDict.C_MemberLookup_MemberFound (dtb_u_u2223, dtb_u_u2224) -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2224) ((Core_dEval.v_applyClosure dtb_u_u2209) dtb_u_u2223)) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2225 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2226 = dtb_u_u2225 in (match dtb_u_u2226 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2227; B_dData_dPair.f_Pair_second = dtb_u_u2228 } -> (match dtb_u_u2228 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2229; B_dData_dPair.f_Pair_second = dtb_u_u2230 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth dtb_u_u2198)) dtb_u_u2223); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb_u_u2227)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2229; B_dData_dPair.f_Pair_second = dtb_u_u2230 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Elab_dDict.C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u2202) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | Elab_dDict.C_MemberLookup_MemberAmbiguous (dtb_u_u2231) -> (let dtb_u_u2232 = (Elab_dTypes.v_ecNext dtb_u_u2199) in (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2202) dtb_u_u2198) dtb_u_u2199) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2233; B_dData_dPair.f_Pair_second = dtb_u_u2234 } -> (let dtb_u_u2235 = ((((((Elab_dTypes.v_ecAddConstraint dtb_u_u2234) Elab_dTypes.C_ConstraintKind_CkRow) dtb_u_u2232) dtb_u_u2208) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2202))) (Elab_dTypes.v_ctxDepth dtb_u_u2198)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2235) ((Core_dEval.v_applyClosure dtb_u_u2209) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u2198)) dtb_u_u2233))) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2236 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2237 = dtb_u_u2236 in (match dtb_u_u2237 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2238; B_dData_dPair.f_Pair_second = dtb_u_u2239 } -> (match dtb_u_u2239 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2240; B_dData_dPair.f_Pair_second = dtb_u_u2241 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2233; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb_u_u2238)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2240; B_dData_dPair.f_Pair_second = dtb_u_u2241 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | Elab_dDict.C_MemberLookup_MemberStuck -> (let dtb_u_u2242 = (Elab_dTypes.v_ecNext dtb_u_u2199) in (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2202) dtb_u_u2198) dtb_u_u2199) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2243; B_dData_dPair.f_Pair_second = dtb_u_u2244 } -> (let dtb_u_u2245 = ((((((Elab_dTypes.v_ecAddConstraint dtb_u_u2244) Elab_dTypes.C_ConstraintKind_CkRow) dtb_u_u2242) dtb_u_u2208) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2202))) (Elab_dTypes.v_ctxDepth dtb_u_u2198)) in ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2245) ((Core_dEval.v_applyClosure dtb_u_u2209) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u2198)) dtb_u_u2243))) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2246 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2247 = dtb_u_u2246 in (match dtb_u_u2247 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2248; B_dData_dPair.f_Pair_second = dtb_u_u2249 } -> (match dtb_u_u2249 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2250; B_dData_dPair.f_Pair_second = dtb_u_u2251 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2243; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, dtb_u_u2248)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2250; B_dData_dPair.f_Pair_second = dtb_u_u2251 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (if (((Elab_dMeta.v_isImplicitDomain dtb_u_u2198) dtb_u_u2199) dtb_u_u2208) then (if ((Elab_dMeta.v_isStringImplicitDomain dtb_u_u2199) dtb_u_u2208) then (match dtb_u_u2201 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2252, dtb_u_u2253) -> (match (v_instArgOperand dtb_u_u2252) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2254) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2199) dtb_u_u2254) dtb_u_u2208)) (fun (dtb_u_u2255 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2255 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2256; B_dData_dPair.f_Pair_second = dtb_u_u2257 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2257) ((Core_dEval.v_applyClosure dtb_u_u2209) ((Elab_dTypes.v_evalCtx dtb_u_u2198) dtb_u_u2256))) dtb_u_u2253) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2258 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2259 = dtb_u_u2258 in (match dtb_u_u2259 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2260; B_dData_dPair.f_Pair_second = dtb_u_u2261 } -> (match dtb_u_u2261 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2262; B_dData_dPair.f_Pair_second = dtb_u_u2263 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2256; B_dData_dPair.f_Pair_second = dtb_u_u2207 }, dtb_u_u2260)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2262; B_dData_dPair.f_Pair_second = dtb_u_u2263 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2202) dtb_u_u2198) dtb_u_u2199) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2264; B_dData_dPair.f_Pair_second = dtb_u_u2265 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2265) ((Core_dEval.v_applyClosure dtb_u_u2209) ((Elab_dTypes.v_evalCtx dtb_u_u2198) dtb_u_u2264))) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2266 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2267 = dtb_u_u2266 in (match dtb_u_u2267 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2268; B_dData_dPair.f_Pair_second = dtb_u_u2269 } -> (match dtb_u_u2269 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2270; B_dData_dPair.f_Pair_second = dtb_u_u2271 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2264; B_dData_dPair.f_Pair_second = dtb_u_u2207 }, dtb_u_u2268)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2270; B_dData_dPair.f_Pair_second = dtb_u_u2271 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2202) dtb_u_u2198) dtb_u_u2199) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2272; B_dData_dPair.f_Pair_second = dtb_u_u2273 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2273) ((Core_dEval.v_applyClosure dtb_u_u2209) ((Elab_dTypes.v_evalCtx dtb_u_u2198) dtb_u_u2272))) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2274 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2275 = dtb_u_u2274 in (match dtb_u_u2275 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2276; B_dData_dPair.f_Pair_second = dtb_u_u2277 } -> (match dtb_u_u2277 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2278; B_dData_dPair.f_Pair_second = dtb_u_u2279 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2272; B_dData_dPair.f_Pair_second = dtb_u_u2207 }, dtb_u_u2276)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2278; B_dData_dPair.f_Pair_second = dtb_u_u2279 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2202) dtb_u_u2198) dtb_u_u2199) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2280; B_dData_dPair.f_Pair_second = dtb_u_u2281 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2281) ((Core_dEval.v_applyClosure dtb_u_u2209) ((Elab_dTypes.v_evalCtx dtb_u_u2198) dtb_u_u2280))) dtb_u_u2201) dtb_u_u2202) dtb_u_u2203)) (fun (dtb_u_u2282 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2283 = dtb_u_u2282 in (match dtb_u_u2283 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2284; B_dData_dPair.f_Pair_second = dtb_u_u2285 } -> (match dtb_u_u2285 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2286; B_dData_dPair.f_Pair_second = dtb_u_u2287 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2280; B_dData_dPair.f_Pair_second = dtb_u_u2207 }, dtb_u_u2284)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2286; B_dData_dPair.f_Pair_second = dtb_u_u2287 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2202) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)))) else (match dtb_u_u2201 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2204; B_dData_dPair.f_Pair_second = dtb_u_u2199 } }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2288, dtb_u_u2289) -> (let dtb_u_u2290 = (match dtb_u_u2203 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u2199
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2302) -> (if (((((v_remainingExplicitPis 64) dtb_u_u2198) dtb_u_u2199) dtb_u_u2204) = (B_dData_dList.v_length dtb_u_u2201)) then (match ((((v_tryUseHint dtb_u_u2198) dtb_u_u2302) dtb_u_u2199) dtb_u_u2204) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u2199
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2303) -> dtb_u_u2303
  | _ -> failwith "DT: impossible branch"
) else dtb_u_u2199)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb_u_u2290) dtb_u_u2202) dtb_u_u2205) dtb_u_u2207) dtb_u_u2208)) (fun (dtb_u_u2291 : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((v_expandArgListLit dtb_u_u2290) dtb_u_u2208) dtb_u_u2288)) (fun (dtb_u_u2292 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2290) dtb_u_u2292) dtb_u_u2208)) (fun (dtb_u_u2293 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2293 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2294; B_dData_dPair.f_Pair_second = dtb_u_u2295 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2196 - 1)) dtb_u_u2197) dtb_u_u2198) dtb_u_u2295) ((Core_dEval.v_applyClosure dtb_u_u2209) ((Elab_dTypes.v_evalCtx dtb_u_u2198) dtb_u_u2294))) dtb_u_u2289) dtb_u_u2202) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u2296 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2297 = dtb_u_u2296 in (match dtb_u_u2297 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2298; B_dData_dPair.f_Pair_second = dtb_u_u2299 } -> (match dtb_u_u2299 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2300; B_dData_dPair.f_Pair_second = dtb_u_u2301 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2294; B_dData_dPair.f_Pair_second = dtb_u_u2291 }, dtb_u_u2298)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2300; B_dData_dPair.f_Pair_second = dtb_u_u2301 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match dtb_u_u2201 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2204; B_dData_dPair.f_Pair_second = dtb_u_u2199 } }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2304, dtb_u_u2305) -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_exprSpan dtb_u_u2304)) Base_dDiagnostics_dTc.C_TcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
))))
# 1633 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_deferDictBinderFuel = (fun (dtb_u_u2306 : int) (dtb_u_u2307 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2308 : Elab_dTypes.t_Ctx) (dtb_u_u2309 : Elab_dTypes.t_Ec) (dtb_u_u2310 : Core_dTerm.t_Value) (dtb_u_u2311 : Core_dTerm.t_Closure) (dtb_u_u2312 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2313 : Base_dSource.t_Span) (dtb_u_u2314 : Core_dTerm.t_Value B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u2306 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2315 = (Elab_dTypes.v_ecNext dtb_u_u2309) in (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2313) dtb_u_u2308) dtb_u_u2309) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2316; B_dData_dPair.f_Pair_second = dtb_u_u2317 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsGo (dtb_u_u2306 - 1)) dtb_u_u2307) dtb_u_u2308) ((((((Elab_dTypes.v_ecAddConstraint dtb_u_u2317) Elab_dTypes.C_ConstraintKind_CkDict) dtb_u_u2315) ((Elab_dTypes.v_forceVal dtb_u_u2317) dtb_u_u2310)) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2313))) (Elab_dTypes.v_ctxDepth dtb_u_u2308))) ((Core_dEval.v_applyClosure dtb_u_u2311) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u2308)) dtb_u_u2316))) dtb_u_u2312) dtb_u_u2313) dtb_u_u2314)) (fun (dtb_u_u2318 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2319 = dtb_u_u2318 in (match dtb_u_u2319 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2320; B_dData_dPair.f_Pair_second = dtb_u_u2321 } -> (match dtb_u_u2321 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2322; B_dData_dPair.f_Pair_second = dtb_u_u2323 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2316; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb_u_u2320)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2322; B_dData_dPair.f_Pair_second = dtb_u_u2323 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 1651 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomFuel = (fun (dtb_u_u2324 : int) (dtb_u_u2325 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2326 : Elab_dTypes.t_Ec) (dtb_u_u2327 : Elab_dTypes.t_Ctx) (dtb_u_u2328 : Core_dTerm.t_Value) (dtb_u_u2329 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2330 : Base_dSource.t_Span) -> (if (dtb_u_u2324 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dDict.v_dictClassArg dtb_u_u2326) dtb_u_u2328) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u2326))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2331) -> (match ((Elab_dDict.v_dictArgKind dtb_u_u2326) dtb_u_u2328) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u2326))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2332) -> (let dtb_u_u2333 = dtb_u_u2331 in (match dtb_u_u2333 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u2334, dtb_u_u2335) -> (match dtb_u_u2335 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_constrainDictDomGoKFuel (dtb_u_u2324 - 1)) dtb_u_u2325) dtb_u_u2326) dtb_u_u2327) dtb_u_u2331) dtb_u_u2332) dtb_u_u2329) dtb_u_u2330)) (fun (dtb_u_u2336 : Elab_dTypes.t_Ec) -> (match ((Core_dTerm.v_metaLookup dtb_u_u2334) (Elab_dTypes.v_ecSolTbl dtb_u_u2336)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2337) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u2326)) (Elab_dTypes.v_ecSolsP dtb_u_u2326)) (Elab_dTypes.v_ctxDepth dtb_u_u2327)) dtb_u_u2334) B_dData_dList.C_List_Nil) dtb_u_u2337) with
  | Base_dDiag.C_Check_OkC (dtb_u_u2338) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols dtb_u_u2326) (Core_dTerm.v_solsList dtb_u_u2338))))
  | Base_dDiag.C_Check_ErrC (dtb_u_u2339) -> (Base_dDiag.C_Check_OkC (dtb_u_u2326))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u2326))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_constrainDictDomGoKFuel (dtb_u_u2324 - 1)) dtb_u_u2325) dtb_u_u2326) dtb_u_u2327) dtb_u_u2331) dtb_u_u2332) dtb_u_u2329) dtb_u_u2330)
)
  | _ -> ((((((((v_constrainDictDomGoKFuel (dtb_u_u2324 - 1)) dtb_u_u2325) dtb_u_u2326) dtb_u_u2327) dtb_u_u2331) dtb_u_u2332) dtb_u_u2329) dtb_u_u2330)
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1679 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_constrainDictDomGoKFuel = (fun (dtb_u_u2340 : int) (dtb_u_u2341 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2342 : Elab_dTypes.t_Ec) (dtb_u_u2343 : Elab_dTypes.t_Ctx) (dtb_u_u2344 : Core_dTerm.t_Value) (dtb_u_u2345 : Core_dTerm.t_Value) (dtb_u_u2346 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2347 : Base_dSource.t_Span) -> (if (dtb_u_u2340 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u2346 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u2342))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2348, dtb_u_u2349) -> (let dtb_u_u2350 = (((((v_inferEFuel (dtb_u_u2340 - 1)) dtb_u_u2341) dtb_u_u2343) dtb_u_u2342) dtb_u_u2348) in (match dtb_u_u2350 with
  | Base_dDiag.C_Check_OkC (dtb_u_u2351) -> (match dtb_u_u2351 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2352; B_dData_dPair.f_Pair_second = dtb_u_u2353 } -> (match dtb_u_u2353 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2354; B_dData_dPair.f_Pair_second = dtb_u_u2355 } -> (let dtb_u_u2356 = ((Elab_dTypes.v_forceVal dtb_u_u2355) dtb_u_u2354) in (if (Core_dTerm.v_isTypeValue dtb_u_u2356) then ((((((((v_constrainDictDomGoKFuel (dtb_u_u2340 - 1)) dtb_u_u2341) dtb_u_u2355) dtb_u_u2343) dtb_u_u2344) dtb_u_u2345) dtb_u_u2349) dtb_u_u2347) else (if (((((Elab_dDict.v_argHeadMatchesKind dtb_u_u2341) dtb_u_u2355) dtb_u_u2343) dtb_u_u2356) dtb_u_u2345) then (match ((((Elab_dMeta.v_convEc dtb_u_u2355) (Elab_dTypes.v_ctxDepth dtb_u_u2343)) dtb_u_u2344) (Elab_dDict.v_neutralHeadOrSelf dtb_u_u2356)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u2357) -> (Base_dDiag.C_Check_OkC (dtb_u_u2357))
  | Base_dDiag.C_Check_ErrC (dtb_u_u2358) -> ((((((((v_constrainDictDomGoKFuel (dtb_u_u2340 - 1)) dtb_u_u2341) dtb_u_u2355) dtb_u_u2343) dtb_u_u2344) dtb_u_u2345) dtb_u_u2349) dtb_u_u2347)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_constrainDictDomGoKFuel (dtb_u_u2340 - 1)) dtb_u_u2341) dtb_u_u2355) dtb_u_u2343) dtb_u_u2344) dtb_u_u2345) dtb_u_u2349) dtb_u_u2347))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u2359) -> (Base_dDiag.C_Check_OkC (dtb_u_u2342))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1811 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckFuel = (fun (dtb_u_u2360 : int) (dtb_u_u2361 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2362 : Elab_dTypes.t_Ctx) (dtb_u_u2363 : Elab_dTypes.t_Ec) (dtb_u_u2364 : string) (dtb_u_u2365 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2366 : Core_dTerm.t_Value) (dtb_u_u2367 : Base_dSource.t_Span) -> (if (dtb_u_u2360 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf dtb_u_u2363) dtb_u_u2364) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2368) -> ((((((((v_specializeArithCheckOpFuel (dtb_u_u2360 - 1)) dtb_u_u2361) dtb_u_u2362) dtb_u_u2363) dtb_u_u2368) dtb_u_u2365) dtb_u_u2366) dtb_u_u2367)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1821 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithCheckOpFuel = (fun (dtb_u_u2369 : int) (dtb_u_u2370 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2371 : Elab_dTypes.t_Ctx) (dtb_u_u2372 : Elab_dTypes.t_Ec) (dtb_u_u2373 : string) (dtb_u_u2374 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2375 : Core_dTerm.t_Value) (dtb_u_u2376 : Base_dSource.t_Span) -> (if (dtb_u_u2369 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2377 = dtb_u_u2374 in (match dtb_u_u2377 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2378, dtb_u_u2379) -> (match dtb_u_u2379 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2380, dtb_u_u2381) -> (match dtb_u_u2381 with
  | B_dData_dList.C_List_Nil -> (if ((v_isNatTy dtb_u_u2372) dtb_u_u2375) then ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2369 - 1)) dtb_u_u2370) dtb_u_u2371) dtb_u_u2372) dtb_u_u2378) v_natTyValue)) (fun (dtb_u_u2382 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2382 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2383; B_dData_dPair.f_Pair_second = dtb_u_u2384 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2369 - 1)) dtb_u_u2370) dtb_u_u2371) dtb_u_u2384) dtb_u_u2380) v_natTyValue)) (fun (dtb_u_u2385 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2385 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2386; B_dData_dPair.f_Pair_second = dtb_u_u2387 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 dtb_u_u2373) dtb_u_u2383) dtb_u_u2386); B_dData_dPair.f_Pair_second = dtb_u_u2387 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isIntTy dtb_u_u2372) dtb_u_u2375) then ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2369 - 1)) dtb_u_u2370) dtb_u_u2371) dtb_u_u2372) dtb_u_u2378) v_intTyValue)) (fun (dtb_u_u2388 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2388 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2389; B_dData_dPair.f_Pair_second = dtb_u_u2390 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2369 - 1)) dtb_u_u2370) dtb_u_u2371) dtb_u_u2390) dtb_u_u2380) v_intTyValue)) (fun (dtb_u_u2391 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2391 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2392; B_dData_dPair.f_Pair_second = dtb_u_u2393 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 dtb_u_u2373) dtb_u_u2389) dtb_u_u2392); B_dData_dPair.f_Pair_second = dtb_u_u2393 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_isFloatTy dtb_u_u2372) dtb_u_u2375) then ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2369 - 1)) dtb_u_u2370) dtb_u_u2371) dtb_u_u2372) dtb_u_u2378) v_floatTyValue)) (fun (dtb_u_u2394 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2394 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2395; B_dData_dPair.f_Pair_second = dtb_u_u2396 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2369 - 1)) dtb_u_u2370) dtb_u_u2371) dtb_u_u2396) dtb_u_u2380) v_floatTyValue)) (fun (dtb_u_u2397 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2397 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2398; B_dData_dPair.f_Pair_second = dtb_u_u2399 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 dtb_u_u2373) dtb_u_u2395) dtb_u_u2398); B_dData_dPair.f_Pair_second = dtb_u_u2399 }))))
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
and v_specializeArithAppFuel = (fun (dtb_u_u2400 : int) (dtb_u_u2401 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2402 : Elab_dTypes.t_Ctx) (dtb_u_u2403 : Elab_dTypes.t_Ec) (dtb_u_u2404 : string) (dtb_u_u2405 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2406 : Base_dSource.t_Span) -> (if (dtb_u_u2400 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((v_arithOpNameOf dtb_u_u2403) dtb_u_u2404) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2407) -> (((((((v_specializeArithAppOpFuel (dtb_u_u2400 - 1)) dtb_u_u2401) dtb_u_u2402) dtb_u_u2403) dtb_u_u2407) dtb_u_u2405) dtb_u_u2406)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1877 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeArithAppOpFuel = (fun (dtb_u_u2408 : int) (dtb_u_u2409 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2410 : Elab_dTypes.t_Ctx) (dtb_u_u2411 : Elab_dTypes.t_Ec) (dtb_u_u2412 : string) (dtb_u_u2413 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2414 : Base_dSource.t_Span) -> (if (dtb_u_u2408 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2415 = dtb_u_u2413 in (match dtb_u_u2415 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2416, dtb_u_u2417) -> (match dtb_u_u2417 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2418, dtb_u_u2419) -> (match dtb_u_u2419 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2408 - 1)) dtb_u_u2409) dtb_u_u2410) dtb_u_u2411) dtb_u_u2416)) (fun (dtb_u_u2420 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2421 = dtb_u_u2420 in (match dtb_u_u2421 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2422; B_dData_dPair.f_Pair_second = dtb_u_u2423 } -> (match dtb_u_u2423 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2424; B_dData_dPair.f_Pair_second = dtb_u_u2425 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2408 - 1)) dtb_u_u2409) dtb_u_u2410) dtb_u_u2425) dtb_u_u2418)) (fun (dtb_u_u2426 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2427 = dtb_u_u2426 in (match dtb_u_u2427 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2428; B_dData_dPair.f_Pair_second = dtb_u_u2429 } -> (match dtb_u_u2429 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2430; B_dData_dPair.f_Pair_second = dtb_u_u2431 } -> (if (if ((v_isNatTy dtb_u_u2431) dtb_u_u2424) then ((v_isNatTy dtb_u_u2431) dtb_u_u2430) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 dtb_u_u2412) dtb_u_u2422) dtb_u_u2428); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb_u_u2431 } })))) else (if (if ((v_isIntTy dtb_u_u2431) dtb_u_u2424) then ((v_isIntTy dtb_u_u2431) dtb_u_u2430) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 dtb_u_u2412) dtb_u_u2422) dtb_u_u2428); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb_u_u2431 } })))) else (if (if ((v_isFloatTy dtb_u_u2431) dtb_u_u2424) then ((v_isFloatTy dtb_u_u2431) dtb_u_u2430) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_floatApp2 dtb_u_u2412) dtb_u_u2422) dtb_u_u2428); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_floatTyValue; B_dData_dPair.f_Pair_second = dtb_u_u2431 } })))) else (if (if ((v_isNatTy dtb_u_u2431) dtb_u_u2424) then ((v_isIntTy dtb_u_u2431) dtb_u_u2430) else false) then (match (v_isEIntExpr dtb_u_u2418) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2432) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dAst.v_exprSpan dtb_u_u2418)) dtb_u_u2432)) (fun (dtb_u_u2433 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 dtb_u_u2412) dtb_u_u2422) dtb_u_u2433); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb_u_u2431 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 dtb_u_u2412) (v_natToIntTerm dtb_u_u2422)) dtb_u_u2428); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb_u_u2431 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_isIntTy dtb_u_u2431) dtb_u_u2424) then ((v_isNatTy dtb_u_u2431) dtb_u_u2430) else false) then (match (v_isEIntExpr dtb_u_u2416) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2434) -> ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dAst.v_exprSpan dtb_u_u2416)) dtb_u_u2434)) (fun (dtb_u_u2435 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_natApp2 dtb_u_u2412) dtb_u_u2435) dtb_u_u2428); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_natTyValue; B_dData_dPair.f_Pair_second = dtb_u_u2431 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_intApp2 dtb_u_u2412) dtb_u_u2422) (v_natToIntTerm dtb_u_u2428)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_intTyValue; B_dData_dPair.f_Pair_second = dtb_u_u2431 } }))))
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
and v_checkEFuel = (fun (dtb_u_u2436 : int) (dtb_u_u2437 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2438 : Elab_dTypes.t_Ctx) (dtb_u_u2439 : Elab_dTypes.t_Ec) (dtb_u_u2440 : Frontend_dAst.t_Expr) (dtb_u_u2441 : Core_dTerm.t_Value) -> (if (dtb_u_u2436 <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand dtb_u_u2440) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2442) -> (let dtb_u_u2443 = (let dtb_u_u2456 = (v_handleOperand dtb_u_u2440) in (match dtb_u_u2456 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2457) -> (match dtb_u_u2457 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2458; B_dData_dPair.f_Pair_second = dtb_u_u2459 } -> (v_isSimpleComp dtb_u_u2458)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u2444 = (if dtb_u_u2443 then ((((v_handleCallExpr dtb_u_u2437) dtb_u_u2439) dtb_u_u2440) (Frontend_dAst.v_exprRef dtb_u_u2440)) else ((((v_handleCallExprAt dtb_u_u2437) dtb_u_u2439) dtb_u_u2440) (Frontend_dAst.v_exprRef dtb_u_u2440))) in (let dtb_u_u2445 = (if dtb_u_u2443 then ((((v_handleCallExprAt dtb_u_u2437) dtb_u_u2439) dtb_u_u2440) (Frontend_dAst.v_exprRef dtb_u_u2440)) else ((((v_handleCallExpr dtb_u_u2437) dtb_u_u2439) dtb_u_u2440) (Frontend_dAst.v_exprRef dtb_u_u2440))) in ((Base_dCommon.v_bind dtb_u_u2444) (fun (dtb_u_u2446 : Frontend_dAst.t_Expr) -> (match ((((((v_checkEFuel (dtb_u_u2436 - 1)) dtb_u_u2437) dtb_u_u2438) dtb_u_u2439) dtb_u_u2446) dtb_u_u2441) with
  | Base_dDiag.C_Check_OkC (dtb_u_u2447) -> (Base_dDiag.C_Check_OkC (dtb_u_u2447))
  | Base_dDiag.C_Check_ErrC (dtb_u_u2448) -> ((Base_dCommon.v_bind ((((v_handleCallExprAtHole dtb_u_u2437) dtb_u_u2439) dtb_u_u2440) (Frontend_dAst.v_exprRef dtb_u_u2440))) (fun (dtb_u_u2449 : Frontend_dAst.t_Expr) -> (match ((((((v_checkEFuel (dtb_u_u2436 - 1)) dtb_u_u2437) dtb_u_u2438) dtb_u_u2439) dtb_u_u2449) dtb_u_u2441) with
  | Base_dDiag.C_Check_OkC (dtb_u_u2450) -> (Base_dDiag.C_Check_OkC (dtb_u_u2450))
  | Base_dDiag.C_Check_ErrC (dtb_u_u2451) -> ((Base_dCommon.v_bind dtb_u_u2445) (fun (dtb_u_u2452 : Frontend_dAst.t_Expr) -> (match ((Base_dObs.v_obsCheck "vuna.elab.term.retry-third") (fun (dtb_u_u2453 : int) -> ((((((v_checkEFuel (dtb_u_u2436 - 1)) dtb_u_u2437) dtb_u_u2438) dtb_u_u2439) dtb_u_u2452) dtb_u_u2441))) with
  | Base_dDiag.C_Check_OkC (dtb_u_u2454) -> (Base_dDiag.C_Check_OkC (dtb_u_u2454))
  | Base_dDiag.C_Check_ErrC (dtb_u_u2455) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2448))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand dtb_u_u2440) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2460) -> ((Base_dObs.v_obsCheck "vuna.elab.term.infer") (fun (dtb_u_u2461 : int) -> ((((((v_checkByInferFuel (dtb_u_u2436 - 1)) dtb_u_u2437) dtb_u_u2438) dtb_u_u2439) dtb_u_u2440) dtb_u_u2441)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand dtb_u_u2440) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2462) -> ((Base_dCommon.v_bind (v_appAtCallExpr dtb_u_u2440)) (fun (dtb_u_u2463 : Frontend_dAst.t_Expr) -> ((((((v_checkEFuel (dtb_u_u2436 - 1)) dtb_u_u2437) dtb_u_u2438) dtb_u_u2439) dtb_u_u2463) dtb_u_u2441)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_listLitElems dtb_u_u2440) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2464) -> ((Base_dCommon.v_bind ((((v_expandListLit dtb_u_u2439) ((v_listLitFamily dtb_u_u2439) ((Elab_dTypes.v_forceVal dtb_u_u2439) dtb_u_u2441))) dtb_u_u2464) (Frontend_dAst.v_exprSpan dtb_u_u2440))) (fun (dtb_u_u2465 : Frontend_dAst.t_Expr) -> ((((((v_checkEFuel (dtb_u_u2436 - 1)) dtb_u_u2437) dtb_u_u2438) dtb_u_u2439) dtb_u_u2465) dtb_u_u2441)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dObs.v_obsDefCheckAt 3) "vuna.elab.term.core") (v_exprFormName dtb_u_u2440)) (fun (dtb_u_u2466 : int) -> ((((((v_checkEFuelNoRow dtb_u_u2436) dtb_u_u2437) dtb_u_u2438) dtb_u_u2439) dtb_u_u2440) dtb_u_u2441)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1997 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRow = (fun (dtb_u_u2467 : int) (dtb_u_u2468 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2469 : Elab_dTypes.t_Ctx) (dtb_u_u2470 : Elab_dTypes.t_Ec) (dtb_u_u2471 : Frontend_dAst.t_Expr) (dtb_u_u2472 : Core_dTerm.t_Value) -> (if (dtb_u_u2467 <= 0) then (Base_dDiag.v_icFuel "inference") else (if (v_doMarkerHead dtb_u_u2471) then (match (v_decodeDoBlock dtb_u_u2471) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2473) -> ((Base_dCommon.v_bind ((((((v_checkDoBlockFuel (dtb_u_u2467 - 1)) dtb_u_u2468) dtb_u_u2469) dtb_u_u2470) dtb_u_u2473) dtb_u_u2472)) (fun (dtb_u_u2474 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2474 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2475) -> (Base_dDiag.C_Check_OkC (dtb_u_u2475))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain dtb_u_u2467) dtb_u_u2468) dtb_u_u2469) dtb_u_u2470) (v_doChainFallback dtb_u_u2473)) dtb_u_u2472)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkEFuelNoRowPlain dtb_u_u2467) dtb_u_u2468) dtb_u_u2469) dtb_u_u2470) dtb_u_u2471) dtb_u_u2472)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_checkEFuelNoRowPlain dtb_u_u2467) dtb_u_u2468) dtb_u_u2469) dtb_u_u2470) dtb_u_u2471) dtb_u_u2472))))
# 2078 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlain = (fun (dtb_u_u2476 : int) (dtb_u_u2477 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2478 : Elab_dTypes.t_Ctx) (dtb_u_u2479 : Elab_dTypes.t_Ec) (dtb_u_u2480 : Frontend_dAst.t_Expr) (dtb_u_u2481 : Core_dTerm.t_Value) -> (if (dtb_u_u2476 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuelNoRowPlainGo dtb_u_u2476) dtb_u_u2477) dtb_u_u2478) dtb_u_u2479) dtb_u_u2480) dtb_u_u2481)))
# 2082 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkEFuelNoRowPlainGo = (fun (dtb_u_u2482 : int) (dtb_u_u2483 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2484 : Elab_dTypes.t_Ctx) (dtb_u_u2485 : Elab_dTypes.t_Ec) (dtb_u_u2486 : Frontend_dAst.t_Expr) (dtb_u_u2487 : Core_dTerm.t_Value) -> (if (dtb_u_u2482 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2488 = dtb_u_u2486 in (match dtb_u_u2488 with
  | Frontend_dAst.C_Expr_ELet (dtb_u_u2489, dtb_u_u2490, dtb_u_u2491, dtb_u_u2492) -> (((((((((v_checkLetFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2489) dtb_u_u2490) dtb_u_u2491) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2492))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u2493, dtb_u_u2494, dtb_u_u2495) -> ((((((((v_checkCaseFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2493) (v_altsToPairs dtb_u_u2494)) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2495))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u2496, dtb_u_u2497, dtb_u_u2498, dtb_u_u2499) -> ((Base_dCommon.v_bind ((((((v_checkCondBoolFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2496) (Frontend_dAst.v_nodeRefSpan dtb_u_u2499))) (fun (dtb_u_u2500 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2500 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2501; B_dData_dPair.f_Pair_second = dtb_u_u2502 } -> (let dtb_u_u2503 = ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2502) dtb_u_u2497) dtb_u_u2487)) (fun (dtb_u_u2506 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2506 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2507; B_dData_dPair.f_Pair_second = dtb_u_u2508 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2508) dtb_u_u2498) dtb_u_u2487)) (fun (dtb_u_u2509 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2509 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2510; B_dData_dPair.f_Pair_second = dtb_u_u2511 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb_u_u2501, dtb_u_u2507, dtb_u_u2510)); B_dData_dPair.f_Pair_second = dtb_u_u2511 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) in (match dtb_u_u2503 with
  | Base_dDiag.C_Check_OkC (dtb_u_u2504) -> (Base_dDiag.C_Check_OkC (dtb_u_u2504))
  | Base_dDiag.C_Check_ErrC (dtb_u_u2505) -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u2512, dtb_u_u2513, dtb_u_u2514, dtb_u_u2515, dtb_u_u2516, dtb_u_u2517) -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u2518, dtb_u_u2519, dtb_u_u2520) -> (match dtb_u_u2518 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522) -> (if (dtb_u_u2521 = "->") then ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487) else (if (dtb_u_u2521 = "Type") then ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487) else (match dtb_u_u2519 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2523, dtb_u_u2524) -> (match dtb_u_u2524 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2525, dtb_u_u2526) -> (match dtb_u_u2526 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2527 = (Frontend_dReserved.v_classify dtb_u_u2521) in (match dtb_u_u2527 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2528) -> (match dtb_u_u2528 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2520)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | Frontend_dReserved.C_Reserved_RsAscribe -> ((Base_dCommon.v_bind (((((v_checkTypeFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2525)) (fun (dtb_u_u2529 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2530 = dtb_u_u2529 in (match dtb_u_u2530 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2531; B_dData_dPair.f_Pair_second = dtb_u_u2532 } -> (match dtb_u_u2532 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2533; B_dData_dPair.f_Pair_second = dtb_u_u2534 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2534) dtb_u_u2523) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u2484)) dtb_u_u2531))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u2523, (B_dData_dList.C_List__x58__x58_ (dtb_u_u2525, B_dData_dList.C_List_Nil))))) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u2523, (B_dData_dList.C_List__x58__x58_ (dtb_u_u2525, B_dData_dList.C_List_Nil))))) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
))
  | _ -> (let dtb_u_u2535 = (Frontend_dReserved.v_classify dtb_u_u2521) in (match dtb_u_u2535 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2536) -> (match dtb_u_u2536 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2520)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) dtb_u_u2519) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) dtb_u_u2519) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
))
)
  | _ -> (let dtb_u_u2537 = (Frontend_dReserved.v_classify dtb_u_u2521) in (match dtb_u_u2537 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2538) -> (match dtb_u_u2538 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2520)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) dtb_u_u2519) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) dtb_u_u2519) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
))
)
  | _ -> (let dtb_u_u2539 = (Frontend_dReserved.v_classify dtb_u_u2521) in (match dtb_u_u2539 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2540) -> (match dtb_u_u2540 with
  | Frontend_dReserved.C_Reserved_RsInstArg -> ((Base_dDiagnostics_dTc.v_tcErr0 (Frontend_dAst.v_nodeRefSpan dtb_u_u2520)) Base_dDiagnostics_dTc.C_TcErr_NoInstParam)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) dtb_u_u2519) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2521, dtb_u_u2522))) dtb_u_u2519) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
))
)))
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2518) dtb_u_u2519) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2520))
)
  | Frontend_dAst.C_Expr_ELam (dtb_u_u2541, dtb_u_u2542, dtb_u_u2543) -> ((((((((v_checkLamFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2541) dtb_u_u2542) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2543))
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u2544, dtb_u_u2545) -> (let dtb_u_u2546 = ((Elab_dTypes.v_forceVal dtb_u_u2485) dtb_u_u2487) in (match dtb_u_u2546 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u2547, dtb_u_u2548) -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u2549) -> (match dtb_u_u2549 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u2550, dtb_u_u2551) -> (match dtb_u_u2551 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u2550 = Base_dIntrinsics.v_floatTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb_u_u2544)); B_dData_dPair.f_Pair_second = dtb_u_u2485 })) else (let dtb_u_u2552 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2545)) in (match dtb_u_u2552 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2553) -> (match dtb_u_u2553 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2554; B_dData_dPair.f_Pair_second = dtb_u_u2555 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2555) dtb_u_u2554) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let dtb_u_u2556 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2545)) in (match dtb_u_u2556 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2557) -> (match dtb_u_u2557 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2558; B_dData_dPair.f_Pair_second = dtb_u_u2559 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2559) dtb_u_u2558) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let dtb_u_u2560 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2545)) in (match dtb_u_u2560 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2561) -> (match dtb_u_u2561 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2562; B_dData_dPair.f_Pair_second = dtb_u_u2563 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2563) dtb_u_u2562) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let dtb_u_u2564 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromFloatTypeName) Base_dIntrinsics.v_fromFloatMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2545)) in (match dtb_u_u2564 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2565) -> (match dtb_u_u2565 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2566; B_dData_dPair.f_Pair_second = dtb_u_u2567 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2567) dtb_u_u2566) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u2568, dtb_u_u2569) -> (let dtb_u_u2570 = ((Elab_dTypes.v_forceVal dtb_u_u2485) dtb_u_u2487) in (match dtb_u_u2570 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u2571, dtb_u_u2572) -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u2573) -> (match dtb_u_u2573 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u2574, dtb_u_u2575) -> (match dtb_u_u2575 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u2574 = Base_dIntrinsics.v_strTypeName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb_u_u2568)); B_dData_dPair.f_Pair_second = dtb_u_u2485 })) else (let dtb_u_u2576 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2569)) in (match dtb_u_u2576 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2577) -> (match dtb_u_u2577 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2578; B_dData_dPair.f_Pair_second = dtb_u_u2579 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2579) dtb_u_u2578) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (let dtb_u_u2580 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2569)) in (match dtb_u_u2580 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2581) -> (match dtb_u_u2581 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2582; B_dData_dPair.f_Pair_second = dtb_u_u2583 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2583) dtb_u_u2582) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let dtb_u_u2584 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2569)) in (match dtb_u_u2584 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2585) -> (match dtb_u_u2585 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2586; B_dData_dPair.f_Pair_second = dtb_u_u2587 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2587) dtb_u_u2586) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let dtb_u_u2588 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromStringTypeName) Base_dIntrinsics.v_fromStringMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2569)) in (match dtb_u_u2588 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2589) -> (match dtb_u_u2589 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2590; B_dData_dPair.f_Pair_second = dtb_u_u2591 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2591) dtb_u_u2590) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u2592, dtb_u_u2593) -> (let dtb_u_u2594 = ((Elab_dTypes.v_forceVal dtb_u_u2485) dtb_u_u2487) in (match dtb_u_u2594 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u2595, dtb_u_u2596) -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u2597) -> (match dtb_u_u2597 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u2598, dtb_u_u2599) -> (match dtb_u_u2599 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u2598 = Base_dIntrinsics.v_natTypeName) then ((Base_dCommon.v_bind ((v_natLitResult (Frontend_dAst.v_nodeRefSpan dtb_u_u2593)) dtb_u_u2592)) (fun (dtb_u_u2600 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2600; B_dData_dPair.f_Pair_second = dtb_u_u2485 })))) else (if (dtb_u_u2598 = Base_dIntrinsics.v_intTypeName) then ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487) else (let dtb_u_u2601 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2593)) in (match dtb_u_u2601 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2602) -> (match dtb_u_u2602 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2603; B_dData_dPair.f_Pair_second = dtb_u_u2604 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2604) dtb_u_u2603) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (let dtb_u_u2605 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2593)) in (match dtb_u_u2605 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2606) -> (match dtb_u_u2606 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2607; B_dData_dPair.f_Pair_second = dtb_u_u2608 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2608) dtb_u_u2607) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let dtb_u_u2609 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2593)) in (match dtb_u_u2609 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2610) -> (match dtb_u_u2610 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2611; B_dData_dPair.f_Pair_second = dtb_u_u2612 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2612) dtb_u_u2611) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)
  | _ -> (let dtb_u_u2613 = ((((((((v_literalTraitLower dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) Base_dIntrinsics.v_fromIntTypeName) Base_dIntrinsics.v_fromIntMethodName) dtb_u_u2486) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2593)) in (match dtb_u_u2613 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2614) -> (match dtb_u_u2614 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2615; B_dData_dPair.f_Pair_second = dtb_u_u2616 } -> ((((((v_checkEFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2616) dtb_u_u2615) dtb_u_u2487)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2617, dtb_u_u2618) -> (if (Frontend_dReserved.v_isHoleName dtb_u_u2617) then (let dtb_u_u2619 = (((((Elab_dMetaSpans.v_newHoleMeta dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.v_nodeRefSpan dtb_u_u2618)) dtb_u_u2487) (Frontend_dReserved.v_holeNameOf dtb_u_u2617)) in (match dtb_u_u2619 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2620; B_dData_dPair.f_Pair_second = dtb_u_u2621 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2620; B_dData_dPair.f_Pair_second = dtb_u_u2621 }))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u2622 = (Frontend_dReserved.v_classify dtb_u_u2617) in (match dtb_u_u2622 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2623) -> (match dtb_u_u2623 with
  | Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u2624, dtb_u_u2625) -> ((Base_dCommon.v_bind (((((((v_resolveOverValueTarget dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2624) dtb_u_u2625) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2618))) (fun (dtb_u_u2626 : string) -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2626, dtb_u_u2618))) B_dData_dList.C_List_Nil) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2618))))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u2627, dtb_u_u2628) -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor dtb_u_u2485) (Frontend_dAst.v_nodeRefSpan dtb_u_u2618)) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2487))) dtb_u_u2627) dtb_u_u2628)) (fun (dtb_u_u2629 : string) -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2629, dtb_u_u2618))) B_dData_dList.C_List_Nil) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2618))))
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2617, dtb_u_u2618))) B_dData_dList.C_List_Nil) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2618))
)
  | _ -> ((((((((v_checkAppFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) (Frontend_dAst.C_Expr_EVar (dtb_u_u2617, dtb_u_u2618))) B_dData_dList.C_List_Nil) dtb_u_u2487) (Frontend_dAst.v_nodeRefSpan dtb_u_u2618))
)))
  | _ -> ((((((v_checkByInferFuel (dtb_u_u2482 - 1)) dtb_u_u2483) dtb_u_u2484) dtb_u_u2485) dtb_u_u2486) dtb_u_u2487)
))))
# 2199 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetFuel = (fun (dtb_u_u2630 : int) (dtb_u_u2631 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2632 : Elab_dTypes.t_Ctx) (dtb_u_u2633 : Elab_dTypes.t_Ec) (dtb_u_u2634 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u2635 : Frontend_dAst.t_Expr) (dtb_u_u2636 : bool) (dtb_u_u2637 : Core_dTerm.t_Value) (dtb_u_u2638 : Base_dSource.t_Span) -> (if (dtb_u_u2630 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs dtb_u_u2636) dtb_u_u2634)) (fun (dtb_u_u2639 : int) -> ((Base_dCommon.v_bind (((v_letBindsToPairs (dtb_u_u2630 - 1)) dtb_u_u2633) dtb_u_u2634)) (fun (dtb_u_u2640 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((((((v_checkLetGoFuel (dtb_u_u2630 - 1)) dtb_u_u2631) dtb_u_u2632) dtb_u_u2633) dtb_u_u2640) dtb_u_u2635) dtb_u_u2636) dtb_u_u2637) dtb_u_u2638)))))))
# 2333 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetFuel = (fun (dtb_u_u2641 : int) (dtb_u_u2642 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2643 : Elab_dTypes.t_Ctx) (dtb_u_u2644 : Elab_dTypes.t_Ec) (dtb_u_u2645 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u2646 : Frontend_dAst.t_Expr) (dtb_u_u2647 : bool) (dtb_u_u2648 : Base_dSource.t_Span) -> (if (dtb_u_u2641 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind ((Elab_dTerm_dSupport.v_checkBindingSigs dtb_u_u2647) dtb_u_u2645)) (fun (dtb_u_u2649 : int) -> ((Base_dCommon.v_bind (((v_letBindsToPairs (dtb_u_u2641 - 1)) dtb_u_u2644) dtb_u_u2645)) (fun (dtb_u_u2650 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((((v_inferLetGoFuel (dtb_u_u2641 - 1)) dtb_u_u2642) dtb_u_u2643) dtb_u_u2644) dtb_u_u2650) dtb_u_u2646) dtb_u_u2647) dtb_u_u2648)))))))
# 2343 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetGoFuel = (fun (dtb_u_u2651 : int) (dtb_u_u2652 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2653 : Elab_dTypes.t_Ctx) (dtb_u_u2654 : Elab_dTypes.t_Ec) (dtb_u_u2655 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2656 : Frontend_dAst.t_Expr) (dtb_u_u2657 : bool) (dtb_u_u2658 : Core_dTerm.t_Value) (dtb_u_u2659 : Base_dSource.t_Span) -> (match dtb_u_u2655 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2660, dtb_u_u2661) -> (if (dtb_u_u2651 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((((((v_checkLetOneFuel (dtb_u_u2651 - 1)) dtb_u_u2652) dtb_u_u2653) dtb_u_u2654) dtb_u_u2660) dtb_u_u2661) dtb_u_u2656) dtb_u_u2657) dtb_u_u2658) dtb_u_u2659))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u2651 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (dtb_u_u2651 - 1)) dtb_u_u2652) dtb_u_u2653) dtb_u_u2654) dtb_u_u2656) dtb_u_u2658))
  | _ -> failwith "DT: impossible branch"
))
# 2352 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLetOneFuel = (fun (dtb_u_u2662 : int) (dtb_u_u2663 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2664 : Elab_dTypes.t_Ctx) (dtb_u_u2665 : Elab_dTypes.t_Ec) (dtb_u_u2666 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (dtb_u_u2667 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2668 : Frontend_dAst.t_Expr) (dtb_u_u2669 : bool) (dtb_u_u2670 : Core_dTerm.t_Value) (dtb_u_u2671 : Base_dSource.t_Span) -> (if (dtb_u_u2662 <= 0) then (Base_dDiag.v_icFuel "inference") else (match (B_dData_dPair.v_firstOf dtb_u_u2666) with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u2672, dtb_u_u2673) -> (let dtb_u_u2674 = (B_dData_dPair.v_secondOf dtb_u_u2666) in ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2662 - 1)) dtb_u_u2663) dtb_u_u2664) dtb_u_u2665) dtb_u_u2674)) (fun (dtb_u_u2675 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2676 = dtb_u_u2675 in (match dtb_u_u2676 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2677; B_dData_dPair.f_Pair_second = dtb_u_u2678 } -> (match dtb_u_u2678 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2679; B_dData_dPair.f_Pair_second = dtb_u_u2680 } -> (let dtb_u_u2681 = ((Elab_dMeta.v_rigOfLinearValue dtb_u_u2665) dtb_u_u2679) in (let dtb_u_u2682 = (((Elab_dTypes.v_ctxBindValue dtb_u_u2672) dtb_u_u2679) dtb_u_u2664) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (dtb_u_u2662 - 1)) dtb_u_u2663) dtb_u_u2682) dtb_u_u2680) dtb_u_u2667) dtb_u_u2668) dtb_u_u2669) dtb_u_u2670) dtb_u_u2671)) (fun (dtb_u_u2683 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2683 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2684; B_dData_dPair.f_Pair_second = dtb_u_u2685 } -> (let dtb_u_u2686 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u2685) dtb_u_u2664) dtb_u_u2679) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb_u_u2684) else dtb_u_u2684) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb_u_u2672, dtb_u_u2681, B_dData_dMaybe.C_Maybe_Nothing, ((Base_dSource.v_spanAtName dtb_u_u2672) (Frontend_dAst.v_nodeRefSpan dtb_u_u2673)), dtb_u_u2686)), dtb_u_u2677, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb_u_u2685 })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u2687) -> (let dtb_u_u2688 = (B_dData_dPair.v_secondOf dtb_u_u2666) in ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2662 - 1)) dtb_u_u2663) dtb_u_u2664) dtb_u_u2665) dtb_u_u2688)) (fun (dtb_u_u2689 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2690 = dtb_u_u2689 in (match dtb_u_u2690 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2691; B_dData_dPair.f_Pair_second = dtb_u_u2692 } -> (match dtb_u_u2692 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2693; B_dData_dPair.f_Pair_second = dtb_u_u2694 } -> (let dtb_u_u2695 = ((Elab_dMeta.v_rigOfLinearValue dtb_u_u2665) dtb_u_u2693) in ((Base_dCommon.v_bind (((((((((v_checkLetGoFuel (dtb_u_u2662 - 1)) dtb_u_u2663) dtb_u_u2664) dtb_u_u2694) dtb_u_u2667) dtb_u_u2668) dtb_u_u2669) dtb_u_u2670) dtb_u_u2671)) (fun (dtb_u_u2696 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2696 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2697; B_dData_dPair.f_Pair_second = dtb_u_u2698 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", dtb_u_u2695, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.v_nodeRefSpan dtb_u_u2687), (((Core_dTerm.v_shift 0) 1) dtb_u_u2697))), dtb_u_u2691, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = dtb_u_u2698 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((((((v_checkEFuel (dtb_u_u2662 - 1)) dtb_u_u2663) dtb_u_u2664) dtb_u_u2665) (Frontend_dAst.C_Expr_ECase ((B_dData_dPair.v_secondOf dtb_u_u2666), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (B_dData_dPair.v_firstOf dtb_u_u2666); Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_ELet ((v_pairsToBindings dtb_u_u2667), dtb_u_u2668, dtb_u_u2669, (Frontend_dAst.v_detachedNodeRef dtb_u_u2671))); Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan (B_dData_dPair.v_firstOf dtb_u_u2666))) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan (B_dData_dPair.v_firstOf dtb_u_u2666)))))) dtb_u_u2670)
)))
# 2400 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetGoFuel = (fun (dtb_u_u2699 : int) (dtb_u_u2700 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2701 : Elab_dTypes.t_Ctx) (dtb_u_u2702 : Elab_dTypes.t_Ec) (dtb_u_u2703 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2704 : Frontend_dAst.t_Expr) (dtb_u_u2705 : bool) (dtb_u_u2706 : Base_dSource.t_Span) -> (if (dtb_u_u2699 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2707 = dtb_u_u2703 in (match dtb_u_u2707 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2708, dtb_u_u2709) -> (match dtb_u_u2708 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2710; B_dData_dPair.f_Pair_second = dtb_u_u2711 } -> (match dtb_u_u2710 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u2712, dtb_u_u2713) -> (((((((((((v_inferLetBoundFuel (dtb_u_u2699 - 1)) dtb_u_u2700) dtb_u_u2701) dtb_u_u2702) dtb_u_u2712) dtb_u_u2711) dtb_u_u2709) dtb_u_u2704) dtb_u_u2705) ((Base_dSource.v_spanAtName dtb_u_u2712) (Frontend_dAst.v_nodeRefSpan dtb_u_u2713))) dtb_u_u2706)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u2714) -> ((((((((((v_inferLetIgnoredFuel (dtb_u_u2699 - 1)) dtb_u_u2700) dtb_u_u2701) dtb_u_u2702) dtb_u_u2711) dtb_u_u2709) dtb_u_u2704) dtb_u_u2705) (Frontend_dAst.v_nodeRefSpan dtb_u_u2714)) dtb_u_u2706)
  | _ -> (((((v_inferEFuel (dtb_u_u2699 - 1)) dtb_u_u2700) dtb_u_u2701) dtb_u_u2702) (Frontend_dAst.C_Expr_ECase (dtb_u_u2711, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb_u_u2710; Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_ELet ((v_pairsToBindings dtb_u_u2709), dtb_u_u2704, dtb_u_u2705, (Frontend_dAst.v_detachedNodeRef dtb_u_u2706))); Frontend_dAst.f_Alt_altRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb_u_u2710)) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_patSpan dtb_u_u2710)))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((((v_inferEFuel (dtb_u_u2699 - 1)) dtb_u_u2700) dtb_u_u2701) dtb_u_u2702) dtb_u_u2704)
  | _ -> failwith "DT: impossible branch"
))))
# 2414 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetBoundFuel = (fun (dtb_u_u2715 : int) (dtb_u_u2716 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2717 : Elab_dTypes.t_Ctx) (dtb_u_u2718 : Elab_dTypes.t_Ec) (dtb_u_u2719 : string) (dtb_u_u2720 : Frontend_dAst.t_Expr) (dtb_u_u2721 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2722 : Frontend_dAst.t_Expr) (dtb_u_u2723 : bool) (dtb_u_u2724 : Base_dSource.t_Span) (dtb_u_u2725 : Base_dSource.t_Span) -> (if (dtb_u_u2715 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2715 - 1)) dtb_u_u2716) dtb_u_u2717) dtb_u_u2718) dtb_u_u2720)) (fun (dtb_u_u2726 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2727 = dtb_u_u2726 in (match dtb_u_u2727 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2728; B_dData_dPair.f_Pair_second = dtb_u_u2729 } -> (match dtb_u_u2729 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2730; B_dData_dPair.f_Pair_second = dtb_u_u2731 } -> (let dtb_u_u2732 = ((Elab_dMeta.v_rigOfLinearValue dtb_u_u2718) dtb_u_u2730) in (let dtb_u_u2733 = (((Elab_dTypes.v_ctxBindValue dtb_u_u2719) dtb_u_u2730) dtb_u_u2717) in ((Base_dCommon.v_bind ((((((((v_inferLetGoFuel (dtb_u_u2715 - 1)) dtb_u_u2716) dtb_u_u2733) dtb_u_u2731) dtb_u_u2721) dtb_u_u2722) dtb_u_u2723) dtb_u_u2725)) (fun (dtb_u_u2734 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2735 = dtb_u_u2734 in (match dtb_u_u2735 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2736; B_dData_dPair.f_Pair_second = dtb_u_u2737 } -> (match dtb_u_u2737 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2738; B_dData_dPair.f_Pair_second = dtb_u_u2739 } -> (let dtb_u_u2740 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u2739) dtb_u_u2717) dtb_u_u2730) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb_u_u2736) else dtb_u_u2736) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam (dtb_u_u2719, dtb_u_u2732, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u2724, dtb_u_u2740)), dtb_u_u2728, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2738; B_dData_dPair.f_Pair_second = dtb_u_u2739 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2436 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferLetIgnoredFuel = (fun (dtb_u_u2741 : int) (dtb_u_u2742 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2743 : Elab_dTypes.t_Ctx) (dtb_u_u2744 : Elab_dTypes.t_Ec) (dtb_u_u2745 : Frontend_dAst.t_Expr) (dtb_u_u2746 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2747 : Frontend_dAst.t_Expr) (dtb_u_u2748 : bool) (dtb_u_u2749 : Base_dSource.t_Span) (dtb_u_u2750 : Base_dSource.t_Span) -> (if (dtb_u_u2741 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2741 - 1)) dtb_u_u2742) dtb_u_u2743) dtb_u_u2744) dtb_u_u2745)) (fun (dtb_u_u2751 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2752 = dtb_u_u2751 in (match dtb_u_u2752 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2753; B_dData_dPair.f_Pair_second = dtb_u_u2754 } -> (match dtb_u_u2754 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2755; B_dData_dPair.f_Pair_second = dtb_u_u2756 } -> (let dtb_u_u2757 = ((Elab_dMeta.v_rigOfLinearValue dtb_u_u2744) dtb_u_u2755) in ((Base_dCommon.v_bind ((((((((v_inferLetGoFuel (dtb_u_u2741 - 1)) dtb_u_u2742) dtb_u_u2743) dtb_u_u2756) dtb_u_u2746) dtb_u_u2747) dtb_u_u2748) dtb_u_u2750)) (fun (dtb_u_u2758 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2759 = dtb_u_u2758 in (match dtb_u_u2759 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2760; B_dData_dPair.f_Pair_second = dtb_u_u2761 } -> (match dtb_u_u2761 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2762; B_dData_dPair.f_Pair_second = dtb_u_u2763 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TLam ("_", dtb_u_u2757, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u2749, (((Core_dTerm.v_shift 0) 1) dtb_u_u2760))), dtb_u_u2753, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2762; B_dData_dPair.f_Pair_second = dtb_u_u2763 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2529 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferEFuelHint = (fun (dtb_u_u2764 : int) (dtb_u_u2765 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2766 : Elab_dTypes.t_Ctx) (dtb_u_u2767 : Elab_dTypes.t_Ec) (dtb_u_u2768 : Frontend_dAst.t_Expr) (dtb_u_u2769 : Core_dTerm.t_Value) -> (if (dtb_u_u2764 <= 0) then (Base_dDiag.v_icFuel "inference") else (match (v_handleOperand dtb_u_u2768) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2770) -> (((((v_inferEFuel (dtb_u_u2764 - 1)) dtb_u_u2765) dtb_u_u2766) dtb_u_u2767) dtb_u_u2768)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_performOperand dtb_u_u2768) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2771) -> (((((v_inferEFuel (dtb_u_u2764 - 1)) dtb_u_u2765) dtb_u_u2766) dtb_u_u2767) dtb_u_u2768)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_appAtOperand dtb_u_u2768) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2772) -> ((Base_dCommon.v_bind (v_appAtCallExpr dtb_u_u2768)) (fun (dtb_u_u2773 : Frontend_dAst.t_Expr) -> (((((v_inferEFuel (dtb_u_u2764 - 1)) dtb_u_u2765) dtb_u_u2766) dtb_u_u2767) dtb_u_u2773)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u2768 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u2774, dtb_u_u2775, dtb_u_u2776) -> ((((((((v_inferAppFuel (dtb_u_u2764 - 1)) dtb_u_u2765) dtb_u_u2766) dtb_u_u2767) dtb_u_u2774) dtb_u_u2775) (Frontend_dAst.v_nodeRefSpan dtb_u_u2776)) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2769)))
  | _ -> (((((v_inferEFuel dtb_u_u2764) dtb_u_u2765) dtb_u_u2766) dtb_u_u2767) dtb_u_u2768)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2815 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkByInferFuel = (fun (dtb_u_u2777 : int) (dtb_u_u2778 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2779 : Elab_dTypes.t_Ctx) (dtb_u_u2780 : Elab_dTypes.t_Ec) (dtb_u_u2781 : Frontend_dAst.t_Expr) (dtb_u_u2782 : Core_dTerm.t_Value) -> (if (dtb_u_u2777 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2783 = ((((((v_inferEFuelHint (dtb_u_u2777 - 1)) dtb_u_u2778) dtb_u_u2779) dtb_u_u2780) dtb_u_u2781) dtb_u_u2782) in (match dtb_u_u2783 with
  | Base_dDiag.C_Check_OkC (dtb_u_u2784) -> (match dtb_u_u2784 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2785; B_dData_dPair.f_Pair_second = dtb_u_u2786 } -> (match dtb_u_u2786 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2787; B_dData_dPair.f_Pair_second = dtb_u_u2788 } -> (match ((((v_coerceTerm dtb_u_u2788) dtb_u_u2782) dtb_u_u2787) dtb_u_u2785) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2789) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2789; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals dtb_u_u2778) dtb_u_u2788) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb_u_u2788) (Elab_dTypes.v_ctxDepth dtb_u_u2779)) dtb_u_u2782) dtb_u_u2787) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2790) -> (match ((((((v_tryEffLift dtb_u_u2779) dtb_u_u2778) dtb_u_u2788) dtb_u_u2782) dtb_u_u2787) dtb_u_u2785) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2791) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u2791); B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals dtb_u_u2778) (B_dData_dPair.v_secondOf dtb_u_u2791)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_unhandledEffectLabel dtb_u_u2788) dtb_u_u2782) dtb_u_u2787) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2792) -> ((Base_dDiag.v_onErrDiag (fun (dtb_u_u2793 : Base_dDiag.t_Diagnostic) -> ((Elab_dTerm_dSupport.v_withEffectLabels dtb_u_u2792) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("actual: " ^ (Core_dEval.v_showValue dtb_u_u2787))))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("expected: " ^ (Core_dEval.v_showValue dtb_u_u2782))))) dtb_u_u2793))))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_exprSpan dtb_u_u2781)) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((v_joinEffectLabels dtb_u_u2792)))) (v_joinEffectLabels dtb_u_u2792)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan dtb_u_u2781)) dtb_u_u2790)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb_u_u2794) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2785; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals dtb_u_u2778) dtb_u_u2794) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u2795) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2795))
  | _ -> failwith "DT: impossible branch"
))))
# 2836 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkLamFuel = (fun (dtb_u_u2796 : int) (dtb_u_u2797 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2798 : Elab_dTypes.t_Ctx) (dtb_u_u2799 : Elab_dTypes.t_Ec) (dtb_u_u2800 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2801 : Frontend_dAst.t_Expr) (dtb_u_u2802 : Core_dTerm.t_Value) (dtb_u_u2803 : Base_dSource.t_Span) -> (match dtb_u_u2800 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2804, dtb_u_u2805) -> (match dtb_u_u2804 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2806; B_dData_dPair.f_Pair_second = dtb_u_u2807 } -> (if (dtb_u_u2796 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2808 = ((Elab_dTypes.v_forceVal dtb_u_u2799) dtb_u_u2802) in (let dtb_u_u2809 = dtb_u_u2808 in (match dtb_u_u2809 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u2810, dtb_u_u2811) -> (match dtb_u_u2811 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2812 = (Elab_dTypes.v_ctxDepth dtb_u_u2798) in (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2803) dtb_u_u2798) dtb_u_u2799) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2813; B_dData_dPair.f_Pair_second = dtb_u_u2814 } -> (let dtb_u_u2815 = ((Elab_dTypes.v_evalCtx dtb_u_u2798) dtb_u_u2813) in (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u2803) dtb_u_u2798) dtb_u_u2814) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2816; B_dData_dPair.f_Pair_second = dtb_u_u2817 } -> (let dtb_u_u2818 = (Core_dTerm.C_Value_VPi ("_", false, Core_dTerm.C_Rig_RigOmega, dtb_u_u2815, { Core_dTerm.f_Closure_closureEnv = B_dData_dList.C_List_Nil; Core_dTerm.f_Closure_closureBody = dtb_u_u2816 })) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u2817)) (Elab_dTypes.v_ecSolsP dtb_u_u2817)) dtb_u_u2812) dtb_u_u2810) B_dData_dList.C_List_Nil) dtb_u_u2818) with
  | Base_dDiag.C_Check_OkC (dtb_u_u2819) -> ((((((((v_checkLamFuel (dtb_u_u2796 - 1)) dtb_u_u2797) dtb_u_u2798) ((Elab_dTypes.v_ecPutSols dtb_u_u2817) (Core_dTerm.v_solsList dtb_u_u2819))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2806; B_dData_dPair.f_Pair_second = dtb_u_u2807 }, dtb_u_u2805))) dtb_u_u2801) dtb_u_u2818) dtb_u_u2803)
  | Base_dDiag.C_Check_ErrC (dtb_u_u2820) -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2803) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2803) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
)
  | Core_dTerm.C_Value_VPi (dtb_u_u2821, dtb_u_u2822, dtb_u_u2823, dtb_u_u2824, dtb_u_u2825) -> (if dtb_u_u2822 then (if (if ((Elab_dDict.v_isDictDomain dtb_u_u2799) dtb_u_u2824) then true else (((Elab_dMeta.v_isImplicitDomain dtb_u_u2798) dtb_u_u2799) dtb_u_u2824)) then (let dtb_u_u2826 = (Elab_dTypes.v_ctxDepth dtb_u_u2798) in (let dtb_u_u2827 = ((Elab_dMeta.v_freshVarValue dtb_u_u2821) dtb_u_u2826) in (let dtb_u_u2828 = (((Elab_dTypes.v_ctxBindValue dtb_u_u2821) dtb_u_u2824) dtb_u_u2798) in (let dtb_u_u2829 = ((Core_dEval.v_applyClosure dtb_u_u2825) dtb_u_u2827) in ((Base_dCommon.v_bind ((((((((v_checkLamFuel (dtb_u_u2796 - 1)) dtb_u_u2797) dtb_u_u2828) dtb_u_u2799) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u2806; B_dData_dPair.f_Pair_second = dtb_u_u2807 }, dtb_u_u2805))) dtb_u_u2801) dtb_u_u2829) dtb_u_u2803)) (fun (dtb_u_u2830 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2830 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2831; B_dData_dPair.f_Pair_second = dtb_u_u2832 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb_u_u2821, dtb_u_u2823, ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote dtb_u_u2826) dtb_u_u2824)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (dtb_u_u2826 + 1)) dtb_u_u2829)))), Base_dSource.v_spanEmpty, dtb_u_u2831)); B_dData_dPair.f_Pair_second = dtb_u_u2832 }))
  | _ -> failwith "DT: impossible branch"
))))))) else ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2803) Base_dDiagnostics_dTc.C_TcErr_ImplicitParamKind)) else (let dtb_u_u2833 = (Elab_dTypes.v_ctxDepth dtb_u_u2798) in (let dtb_u_u2834 = ((Elab_dMeta.v_freshVarValue dtb_u_u2821) dtb_u_u2833) in (let dtb_u_u2835 = (((Elab_dTypes.v_ctxBindValue dtb_u_u2806) dtb_u_u2824) dtb_u_u2798) in (let dtb_u_u2836 = ((Core_dEval.v_applyClosure dtb_u_u2825) dtb_u_u2834) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb_u_u2799) dtb_u_u2803) dtb_u_u2806) dtb_u_u2823) dtb_u_u2824)) (fun (dtb_u_u2837 : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((((v_checkLamFuel (dtb_u_u2796 - 1)) dtb_u_u2797) dtb_u_u2835) dtb_u_u2799) dtb_u_u2805) dtb_u_u2801) dtb_u_u2836) dtb_u_u2803)) (fun (dtb_u_u2838 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u2838 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2839; B_dData_dPair.f_Pair_second = dtb_u_u2840 } -> (let dtb_u_u2841 = (if (((Elab_dMeta.v_isOpaqueRuntimeTyIn dtb_u_u2840) dtb_u_u2798) dtb_u_u2824) then ((Elab_dMeta.v_wrapOpaqueUses (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))) dtb_u_u2839) else dtb_u_u2839) in (let dtb_u_u2842 = ((Core_dTerm.v_lamTyOf (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote dtb_u_u2833) dtb_u_u2824)))) (B_dData_dMaybe.C_Maybe_Just (((Core_dEval.v_quote (dtb_u_u2833 + 1)) dtb_u_u2836)))) in (let dtb_u_u2843 = (if ((Elab_dMeta.v_ctxHasLinear dtb_u_u2799) dtb_u_u2798) then (if (((Elab_dMeta.v_termHasOuterLinear dtb_u_u2799) dtb_u_u2835) dtb_u_u2839) then (Core_dTerm.v_markLamLinear dtb_u_u2842) else dtb_u_u2842) else dtb_u_u2842) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb_u_u2806, dtb_u_u2837, dtb_u_u2843, dtb_u_u2807, dtb_u_u2841)); B_dData_dPair.f_Pair_second = dtb_u_u2840 })))))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u2803) Base_dDiagnostics_dTc.C_TcErr_LambdaTooManyParams)
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u2796 <= 0) then (Base_dDiag.v_icFuel "inference") else ((((((v_checkEFuel (dtb_u_u2796 - 1)) dtb_u_u2797) dtb_u_u2798) dtb_u_u2799) dtb_u_u2801) dtb_u_u2802))
  | _ -> failwith "DT: impossible branch"
))
# 2925 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeFuel = (fun (dtb_u_u2844 : int) (dtb_u_u2845 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2846 : Elab_dTypes.t_Ctx) (dtb_u_u2847 : Elab_dTypes.t_Ec) (dtb_u_u2848 : Frontend_dAst.t_Expr) -> (if (dtb_u_u2844 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2849 = dtb_u_u2848 in (match dtb_u_u2849 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u2850, dtb_u_u2851, dtb_u_u2852) -> (match dtb_u_u2850 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2853, dtb_u_u2854) -> (if (if (dtb_u_u2853 = "->") then true else (dtb_u_u2853 = "Type")) then (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848) else (match ((Elab_dTypes.v_ctxLookup dtb_u_u2853) dtb_u_u2846) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2855) -> (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName dtb_u_u2845) dtb_u_u2847) dtb_u_u2853) then (match (((((((v_inferAppUnderTypeFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2853) dtb_u_u2851) (Frontend_dAst.v_nodeRefSpan dtb_u_u2854)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2856) -> (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848)
  | Base_dDiag.C_Check_OkC (dtb_u_u2857) -> (Base_dDiag.C_Check_OkC (dtb_u_u2857))
  | _ -> failwith "DT: impossible branch"
) else (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848)
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2858, dtb_u_u2859) -> (match ((Elab_dTypes.v_ctxLookup dtb_u_u2858) dtb_u_u2846) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2860) -> (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_typeLookup dtb_u_u2845) dtb_u_u2847) dtb_u_u2858) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2861) -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb_u_u2847) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u2861))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2862) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm dtb_u_u2847) dtb_u_u2858); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2862; B_dData_dPair.f_Pair_second = dtb_u_u2847 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_checkTypeInferFuel (dtb_u_u2844 - 1)) dtb_u_u2845) dtb_u_u2846) dtb_u_u2847) dtb_u_u2848)
))))
# 2958 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkTypeInferFuel = (fun (dtb_u_u2863 : int) (dtb_u_u2864 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2865 : Elab_dTypes.t_Ctx) (dtb_u_u2866 : Elab_dTypes.t_Ec) (dtb_u_u2867 : Frontend_dAst.t_Expr) -> (if (dtb_u_u2863 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2863 - 1)) dtb_u_u2864) dtb_u_u2865) dtb_u_u2866) dtb_u_u2867)) (fun (dtb_u_u2868 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2869 = dtb_u_u2868 in (match dtb_u_u2869 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2870; B_dData_dPair.f_Pair_second = dtb_u_u2871 } -> (match dtb_u_u2871 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2872; B_dData_dPair.f_Pair_second = dtb_u_u2873 } -> (let dtb_u_u2874 = ((Elab_dTypes.v_forceVal dtb_u_u2873) dtb_u_u2872) in (match (Core_dTerm.v_typeLevelOf dtb_u_u2874) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2875) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2870; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2875; B_dData_dPair.f_Pair_second = dtb_u_u2873 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_exprSpan dtb_u_u2867)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedType (((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth dtb_u_u2865)) dtb_u_u2872)))) ((Core_dEval.v_showValueAt (Elab_dTypes.v_ctxDepth dtb_u_u2865)) dtb_u_u2872))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 2976 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppFuel = (fun (dtb_u_u2876 : int) (dtb_u_u2877 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2878 : Elab_dTypes.t_Ctx) (dtb_u_u2879 : Elab_dTypes.t_Ec) (dtb_u_u2880 : Frontend_dAst.t_Expr) (dtb_u_u2881 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2882 : Core_dTerm.t_Value) (dtb_u_u2883 : Base_dSource.t_Span) -> (if (dtb_u_u2876 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u2880 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u2884, dtb_u_u2885) -> (if (Frontend_dReserved.v_isOverCtorName dtb_u_u2884) then ((Base_dCommon.v_bind (((((Elab_dMeta.v_resolveOverCtor dtb_u_u2879) (Frontend_dAst.v_nodeRefSpan dtb_u_u2885)) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2882))) (Frontend_dReserved.v_overCtorShort dtb_u_u2884)) (Frontend_dReserved.v_overCtorTargets dtb_u_u2884))) (fun (dtb_u_u2886 : string) -> ((((((((v_checkAppFuel (dtb_u_u2876 - 1)) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) (Frontend_dAst.C_Expr_EVar (dtb_u_u2886, dtb_u_u2885))) dtb_u_u2881) dtb_u_u2882) dtb_u_u2883))) else (if (Frontend_dReserved.v_isOverValueName dtb_u_u2884) then ((Base_dCommon.v_bind (((((((v_resolveOverValueAppTarget dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) (Frontend_dReserved.v_overValueShort dtb_u_u2884)) (Frontend_dReserved.v_overValueTargets dtb_u_u2884)) dtb_u_u2882) dtb_u_u2883)) (fun (dtb_u_u2887 : string) -> ((((((((v_checkAppFuel (dtb_u_u2876 - 1)) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) (Frontend_dAst.C_Expr_EVar (dtb_u_u2887, dtb_u_u2885))) dtb_u_u2881) dtb_u_u2882) dtb_u_u2883))) else (match ((Elab_dTypes.v_ctxLookup dtb_u_u2884) dtb_u_u2878) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2888) -> ((((((v_checkByInferFuel (dtb_u_u2876 - 1)) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) (Frontend_dAst.C_Expr_EApp (dtb_u_u2880, dtb_u_u2881, (Frontend_dAst.v_detachedNodeRef dtb_u_u2883)))) dtb_u_u2882)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((Elab_dMeta.v_isSortVal dtb_u_u2879) dtb_u_u2882) then (match ((Elab_dMeta.v_typeNameOfDualCtor dtb_u_u2879) dtb_u_u2884) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2889) -> ((((((((v_checkAppUnderTypeFuel (dtb_u_u2876 - 1)) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) dtb_u_u2889) dtb_u_u2881) dtb_u_u2882) (Frontend_dAst.v_nodeRefSpan dtb_u_u2885))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((Elab_dMeta.v_isTypeName dtb_u_u2877) dtb_u_u2879) dtb_u_u2884) then ((((((((v_checkAppUnderTypeFuel (dtb_u_u2876 - 1)) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) dtb_u_u2884) dtb_u_u2881) dtb_u_u2882) (Frontend_dAst.v_nodeRefSpan dtb_u_u2885)) else ((((((((((v_checkAppByValueFuel dtb_u_u2876) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) dtb_u_u2880) dtb_u_u2884) dtb_u_u2881) dtb_u_u2882) dtb_u_u2883) (Frontend_dAst.v_nodeRefSpan dtb_u_u2885)))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_checkAppByValueFuel dtb_u_u2876) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) dtb_u_u2880) dtb_u_u2884) dtb_u_u2881) dtb_u_u2882) dtb_u_u2883) (Frontend_dAst.v_nodeRefSpan dtb_u_u2885)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_checkAppGeneralFuel (dtb_u_u2876 - 1)) dtb_u_u2877) dtb_u_u2878) dtb_u_u2879) dtb_u_u2880) dtb_u_u2881) dtb_u_u2882) dtb_u_u2883)
)))
# 3009 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppByValueFuel = (fun (dtb_u_u2890 : int) (dtb_u_u2891 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2892 : Elab_dTypes.t_Ctx) (dtb_u_u2893 : Elab_dTypes.t_Ec) (dtb_u_u2894 : Frontend_dAst.t_Expr) (dtb_u_u2895 : string) (dtb_u_u2896 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2897 : Core_dTerm.t_Value) (dtb_u_u2898 : Base_dSource.t_Span) (dtb_u_u2899 : Base_dSource.t_Span) -> (if (dtb_u_u2890 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u2900 = (((Elab_dMeta.v_valueLookup dtb_u_u2891) dtb_u_u2893) dtb_u_u2895) in (match dtb_u_u2900 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_checkAppGeneralFuel (dtb_u_u2890 - 1)) dtb_u_u2891) dtb_u_u2892) dtb_u_u2893) dtb_u_u2894) dtb_u_u2896) dtb_u_u2897) dtb_u_u2898)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2901) -> (match dtb_u_u2901 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb_u_u2902) -> ((((((((v_checkAppGeneralFuel (dtb_u_u2890 - 1)) dtb_u_u2891) dtb_u_u2892) dtb_u_u2893) dtb_u_u2894) dtb_u_u2896) dtb_u_u2897) dtb_u_u2898)
  | Elab_dMeta.C_ValueEntry_VECtor (dtb_u_u2903) -> ((((((((v_checkAppCtorFuel (dtb_u_u2890 - 1)) dtb_u_u2891) dtb_u_u2892) dtb_u_u2893) dtb_u_u2895) dtb_u_u2896) dtb_u_u2897) dtb_u_u2899)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
# 3022 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppUnderTypeFuel = (fun (dtb_u_u2904 : int) (dtb_u_u2905 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2906 : Elab_dTypes.t_Ctx) (dtb_u_u2907 : Elab_dTypes.t_Ec) (dtb_u_u2908 : string) (dtb_u_u2909 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2910 : Core_dTerm.t_Value) (dtb_u_u2911 : Base_dSource.t_Span) -> (if (dtb_u_u2904 <= 0) then (Base_dDiag.v_icFuel "inference") else ((Base_dCommon.v_bind (((((((v_inferAppUnderTypeFuel (dtb_u_u2904 - 1)) dtb_u_u2905) dtb_u_u2906) dtb_u_u2907) dtb_u_u2908) dtb_u_u2909) dtb_u_u2911)) (fun (dtb_u_u2912 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2913 = dtb_u_u2912 in (match dtb_u_u2913 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2914; B_dData_dPair.f_Pair_second = dtb_u_u2915 } -> (match dtb_u_u2915 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2916; B_dData_dPair.f_Pair_second = dtb_u_u2917 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb_u_u2917) (Elab_dTypes.v_ctxDepth dtb_u_u2906)) dtb_u_u2910) (Core_dTerm.C_Value_VType (dtb_u_u2916)))) (fun (dtb_u_u2918 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2914; B_dData_dPair.f_Pair_second = dtb_u_u2918 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
# 3033 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_inferAppUnderTypeFuel = (fun (dtb_u_u2919 : int) (dtb_u_u2920 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2921 : Elab_dTypes.t_Ctx) (dtb_u_u2922 : Elab_dTypes.t_Ec) (dtb_u_u2923 : string) (dtb_u_u2924 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2925 : Base_dSource.t_Span) -> (if (dtb_u_u2919 <= 0) then (Base_dDiag.v_icFuel "inference") else (match (((Elab_dMeta.v_typeHeadLookup dtb_u_u2920) dtb_u_u2922) dtb_u_u2923) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u2925) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u2923))) dtb_u_u2923)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2926) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u2919 - 1)) dtb_u_u2920) dtb_u_u2921) dtb_u_u2922) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u2926)) dtb_u_u2924) dtb_u_u2925) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u2927 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2928 = dtb_u_u2927 in (match dtb_u_u2928 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2929; B_dData_dPair.f_Pair_second = dtb_u_u2930 } -> (match dtb_u_u2930 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2931; B_dData_dPair.f_Pair_second = dtb_u_u2932 } -> (match (Core_dTerm.v_typeLevelOf ((Elab_dTypes.v_forceVal dtb_u_u2932) dtb_u_u2931)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2933) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb_u_u2932) dtb_u_u2923) dtb_u_u2929); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u2933; B_dData_dPair.f_Pair_second = dtb_u_u2932 } }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u2925) (Base_dDiagnostics_dTc.C_TcErr_AppliedNotType (dtb_u_u2923))) dtb_u_u2923)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 3094 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeEqAppFuel = (fun (dtb_u_u2934 : int) (dtb_u_u2935 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2936 : Elab_dTypes.t_Ctx) (dtb_u_u2937 : Elab_dTypes.t_Ec) (dtb_u_u2938 : string) (dtb_u_u2939 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2940 : Base_dSource.t_Span) -> (if (dtb_u_u2934 <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isEqMethod dtb_u_u2937) dtb_u_u2938) then (let dtb_u_u2941 = dtb_u_u2939 in (match dtb_u_u2941 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2942, dtb_u_u2943) -> (match dtb_u_u2943 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2944, dtb_u_u2945) -> (match dtb_u_u2945 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2934 - 1)) dtb_u_u2935) dtb_u_u2936) dtb_u_u2937) dtb_u_u2942)) (fun (dtb_u_u2946 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2947 = dtb_u_u2946 in (match dtb_u_u2947 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2948; B_dData_dPair.f_Pair_second = dtb_u_u2949 } -> (match dtb_u_u2949 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2950; B_dData_dPair.f_Pair_second = dtb_u_u2951 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2934 - 1)) dtb_u_u2935) dtb_u_u2936) dtb_u_u2951) dtb_u_u2944)) (fun (dtb_u_u2952 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2953 = dtb_u_u2952 in (match dtb_u_u2953 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2954; B_dData_dPair.f_Pair_second = dtb_u_u2955 } -> (match dtb_u_u2955 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2956; B_dData_dPair.f_Pair_second = dtb_u_u2957 } -> (match (((((v_coerceNatOperands dtb_u_u2957) dtb_u_u2950) dtb_u_u2956) dtb_u_u2948) dtb_u_u2954) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2958) -> ((((((((Elab_dDict.v_specializeEqTy dtb_u_u2935) dtb_u_u2936) dtb_u_u2938) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u2958))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u2958))) dtb_u_u2940) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u2958))) dtb_u_u2957)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb_u_u2957) (Elab_dTypes.v_ctxDepth dtb_u_u2936)) dtb_u_u2950) dtb_u_u2956)) (fun (dtb_u_u2959 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeEqTy dtb_u_u2935) dtb_u_u2936) dtb_u_u2938) dtb_u_u2948) dtb_u_u2954) dtb_u_u2940) dtb_u_u2950) dtb_u_u2959)))
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
and v_specializeCmpAppFuel = (fun (dtb_u_u2960 : int) (dtb_u_u2961 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2962 : Elab_dTypes.t_Ctx) (dtb_u_u2963 : Elab_dTypes.t_Ec) (dtb_u_u2964 : string) (dtb_u_u2965 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2966 : Base_dSource.t_Span) -> (if (dtb_u_u2960 <= 0) then (Base_dDiag.v_icFuel "inference") else (if ((Elab_dDict.v_isCmpMethod dtb_u_u2963) dtb_u_u2964) then (let dtb_u_u2967 = dtb_u_u2965 in (match dtb_u_u2967 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2968, dtb_u_u2969) -> (match dtb_u_u2969 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2970, dtb_u_u2971) -> (match dtb_u_u2971 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2960 - 1)) dtb_u_u2961) dtb_u_u2962) dtb_u_u2963) dtb_u_u2968)) (fun (dtb_u_u2972 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2973 = dtb_u_u2972 in (match dtb_u_u2973 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2974; B_dData_dPair.f_Pair_second = dtb_u_u2975 } -> (match dtb_u_u2975 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2976; B_dData_dPair.f_Pair_second = dtb_u_u2977 } -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2960 - 1)) dtb_u_u2961) dtb_u_u2962) dtb_u_u2977) dtb_u_u2970)) (fun (dtb_u_u2978 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u2979 = dtb_u_u2978 in (match dtb_u_u2979 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2980; B_dData_dPair.f_Pair_second = dtb_u_u2981 } -> (match dtb_u_u2981 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2982; B_dData_dPair.f_Pair_second = dtb_u_u2983 } -> (match (((((v_coerceNatOperands dtb_u_u2983) dtb_u_u2976) dtb_u_u2982) dtb_u_u2974) dtb_u_u2980) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2984) -> ((((((((Elab_dDict.v_specializeCmpTy dtb_u_u2961) dtb_u_u2962) dtb_u_u2964) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u2984))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u2984))) dtb_u_u2966) (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u2984))) dtb_u_u2983)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb_u_u2983) (Elab_dTypes.v_ctxDepth dtb_u_u2962)) dtb_u_u2976) dtb_u_u2982)) (fun (dtb_u_u2985 : Elab_dTypes.t_Ec) -> ((((((((Elab_dDict.v_specializeCmpTy dtb_u_u2961) dtb_u_u2962) dtb_u_u2964) dtb_u_u2974) dtb_u_u2980) dtb_u_u2966) dtb_u_u2976) dtb_u_u2985)))
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
and v_specializeOpAppFuel = (fun (dtb_u_u2986 : int) (dtb_u_u2987 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2988 : Elab_dTypes.t_Ctx) (dtb_u_u2989 : Elab_dTypes.t_Ec) (dtb_u_u2990 : string) (dtb_u_u2991 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u2992 : Base_dSource.t_Span) -> (if (dtb_u_u2986 <= 0) then (Base_dDiag.v_icFuel "inference") else (if (dtb_u_u2990 = Base_dIntrinsics.v_interpMethodName) then (((((((v_specializeInterpPrimApp (dtb_u_u2986 - 1)) dtb_u_u2987) dtb_u_u2988) dtb_u_u2989) dtb_u_u2990) dtb_u_u2991) dtb_u_u2992) else ((Base_dCommon.v_bind (((((((v_specializeEqAppFuel (dtb_u_u2986 - 1)) dtb_u_u2987) dtb_u_u2988) dtb_u_u2989) dtb_u_u2990) dtb_u_u2991) dtb_u_u2992)) (fun (dtb_u_u2993 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2993 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2994) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u2994))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeCmpAppFuel (dtb_u_u2986 - 1)) dtb_u_u2987) dtb_u_u2988) dtb_u_u2989) dtb_u_u2990) dtb_u_u2991) dtb_u_u2992)) (fun (dtb_u_u2995 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2995 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2996) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u2996))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_specializeBoolAppFuel (dtb_u_u2986 - 1)) dtb_u_u2987) dtb_u_u2988) dtb_u_u2989) dtb_u_u2990) dtb_u_u2991) dtb_u_u2992)) (fun (dtb_u_u2997 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u2997 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2998) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u2998))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_specializeArithAppFuel (dtb_u_u2986 - 1)) dtb_u_u2987) dtb_u_u2988) dtb_u_u2989) dtb_u_u2990) dtb_u_u2991) dtb_u_u2992)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 3177 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeInterpPrimApp = (fun (dtb_u_u2999 : int) (dtb_u_u3000 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3001 : Elab_dTypes.t_Ctx) (dtb_u_u3002 : Elab_dTypes.t_Ec) (dtb_u_u3003 : string) (dtb_u_u3004 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u3005 : Base_dSource.t_Span) -> (if (dtb_u_u2999 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u3006 = dtb_u_u3004 in (match dtb_u_u3006 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3007, dtb_u_u3008) -> (match dtb_u_u3008 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_inferEFuel (dtb_u_u2999 - 1)) dtb_u_u3000) dtb_u_u3001) dtb_u_u3002) dtb_u_u3007)) (fun (dtb_u_u3009 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u3010 = dtb_u_u3009 in (match dtb_u_u3010 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3011; B_dData_dPair.f_Pair_second = dtb_u_u3012 } -> (match dtb_u_u3012 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3013; B_dData_dPair.f_Pair_second = dtb_u_u3014 } -> (let dtb_u_u3015 = ((Elab_dTypes.v_forceVal dtb_u_u3014) dtb_u_u3013) in (if (v_isStringTyValue dtb_u_u3015) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u3011; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u3015; B_dData_dPair.f_Pair_second = dtb_u_u3014 } })))) else (if (if ((v_isIntTy dtb_u_u3014) dtb_u_u3015) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb_u_u3014) Base_dIntrinsics.v_intTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm dtb_u_u3011); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb_u_u3014 } })))) else (if (if ((v_isNatTy dtb_u_u3014) dtb_u_u3015) then (B_dData_dBool.v_not ((Elab_dDict.v_hasSpecificInterpInstance dtb_u_u3014) Base_dIntrinsics.v_natTypeName)) else false) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromIntTerm (v_natToIntTerm dtb_u_u3011)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb_u_u3014 } })))) else (if ((v_isFloatTy dtb_u_u3014) dtb_u_u3015) then (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (v_strFromFloatTerm dtb_u_u3011); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = v_strTyValue; B_dData_dPair.f_Pair_second = dtb_u_u3014 } })))) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 3217 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_specializeBoolAppFuel = (fun (dtb_u_u3016 : int) (dtb_u_u3017 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3018 : Elab_dTypes.t_Ctx) (dtb_u_u3019 : Elab_dTypes.t_Ec) (dtb_u_u3020 : string) (dtb_u_u3021 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u3022 : Base_dSource.t_Span) -> (if (dtb_u_u3016 <= 0) then (Base_dDiag.v_icFuel "inference") else (if (if (dtb_u_u3020 = "&&") then true else (dtb_u_u3020 = "||")) then (let dtb_u_u3023 = dtb_u_u3021 in (match dtb_u_u3023 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3024, dtb_u_u3025) -> (match dtb_u_u3025 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3026, dtb_u_u3027) -> (match dtb_u_u3027 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u3016 - 1)) dtb_u_u3017) dtb_u_u3018) dtb_u_u3019) dtb_u_u3024) Elab_dPrelude.v_boolTyValue)) (fun (dtb_u_u3028 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u3028 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3029; B_dData_dPair.f_Pair_second = dtb_u_u3030 } -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u3016 - 1)) dtb_u_u3017) dtb_u_u3018) dtb_u_u3030) dtb_u_u3026) Elab_dPrelude.v_boolTyValue)) (fun (dtb_u_u3031 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u3031 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3032; B_dData_dPair.f_Pair_second = dtb_u_u3033 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((Elab_dDict.v_boolShortCircuit dtb_u_u3020) dtb_u_u3029) dtb_u_u3032); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb_u_u3033 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u3022) (Base_dDiagnostics_dTc.C_TcErr_NeedsTwoArgs (dtb_u_u3020))) dtb_u_u3020)
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u3022) (Base_dDiagnostics_dTc.C_TcErr_NeedsTwoArgs (dtb_u_u3020))) dtb_u_u3020)
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u3022) (Base_dDiagnostics_dTc.C_TcErr_NeedsTwoArgs (dtb_u_u3020))) dtb_u_u3020)
)) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))))
# 3238 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppGeneralFuel = (fun (dtb_u_u3034 : int) (dtb_u_u3035 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3036 : Elab_dTypes.t_Ctx) (dtb_u_u3037 : Elab_dTypes.t_Ec) (dtb_u_u3038 : Frontend_dAst.t_Expr) (dtb_u_u3039 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u3040 : Core_dTerm.t_Value) (dtb_u_u3041 : Base_dSource.t_Span) -> (if (dtb_u_u3034 <= 0) then (Base_dDiag.v_icFuel "inference") else (match dtb_u_u3038 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u3042, dtb_u_u3043) -> ((Base_dCommon.v_bind ((((((((v_specializeArithCheckFuel (dtb_u_u3034 - 1)) dtb_u_u3035) dtb_u_u3036) dtb_u_u3037) dtb_u_u3042) dtb_u_u3039) dtb_u_u3040) dtb_u_u3041)) (fun (dtb_u_u3044 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let dtb_u_u3045 = dtb_u_u3044 in (match dtb_u_u3045 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (((v_skipArithSpecForExpected dtb_u_u3037) dtb_u_u3042) dtb_u_u3040) then ((((((v_checkByInferFuel (dtb_u_u3034 - 1)) dtb_u_u3035) dtb_u_u3036) dtb_u_u3037) (Frontend_dAst.C_Expr_EApp (dtb_u_u3038, dtb_u_u3039, (Frontend_dAst.v_detachedNodeRef dtb_u_u3041)))) dtb_u_u3040) else ((Base_dCommon.v_bind (((((((v_specializeOpAppFuel (dtb_u_u3034 - 1)) dtb_u_u3035) dtb_u_u3036) dtb_u_u3037) dtb_u_u3042) dtb_u_u3039) dtb_u_u3041)) (fun (dtb_u_u3046 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let dtb_u_u3047 = dtb_u_u3046 in (match dtb_u_u3047 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_checkByInferFuel (dtb_u_u3034 - 1)) dtb_u_u3035) dtb_u_u3036) dtb_u_u3037) (Frontend_dAst.C_Expr_EApp (dtb_u_u3038, dtb_u_u3039, (Frontend_dAst.v_detachedNodeRef dtb_u_u3041)))) dtb_u_u3040)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3048) -> (match dtb_u_u3048 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3049; B_dData_dPair.f_Pair_second = dtb_u_u3050 } -> (match dtb_u_u3050 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3051; B_dData_dPair.f_Pair_second = dtb_u_u3052 } -> (match ((((v_coerceTerm dtb_u_u3052) dtb_u_u3040) dtb_u_u3051) dtb_u_u3049) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3053) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u3053; B_dData_dPair.f_Pair_second = dtb_u_u3052 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb_u_u3052) (Elab_dTypes.v_ctxDepth dtb_u_u3036)) dtb_u_u3040) dtb_u_u3051)) (fun (dtb_u_u3054 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u3049; B_dData_dPair.f_Pair_second = dtb_u_u3054 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3055) -> (match dtb_u_u3055 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3056; B_dData_dPair.f_Pair_second = dtb_u_u3057 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u3056; B_dData_dPair.f_Pair_second = dtb_u_u3057 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((((((v_checkByInferFuel (dtb_u_u3034 - 1)) dtb_u_u3035) dtb_u_u3036) dtb_u_u3037) (Frontend_dAst.C_Expr_EApp (dtb_u_u3038, dtb_u_u3039, (Frontend_dAst.v_detachedNodeRef dtb_u_u3041)))) dtb_u_u3040)
)))
# 3528 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkAppCtorFuel = (fun (dtb_u_u3058 : int) (dtb_u_u3059 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3060 : Elab_dTypes.t_Ctx) (dtb_u_u3061 : Elab_dTypes.t_Ec) (dtb_u_u3062 : string) (dtb_u_u3063 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u3064 : Core_dTerm.t_Value) (dtb_u_u3065 : Base_dSource.t_Span) -> (if (dtb_u_u3058 <= 0) then (Base_dDiag.v_icFuel "inference") else (match ((Elab_dMeta.v_dtCtorLookupEc dtb_u_u3061) dtb_u_u3062) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u3065) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u3062))) dtb_u_u3062)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3066) -> (let dtb_u_u3067 = ((((v_ctorFamilyArgs dtb_u_u3061) dtb_u_u3060) dtb_u_u3066) dtb_u_u3064) in (match dtb_u_u3067 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u3058 - 1)) dtb_u_u3059) dtb_u_u3060) dtb_u_u3061) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u3066))) dtb_u_u3063) dtb_u_u3065) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u3068 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u3069 = dtb_u_u3068 in (match dtb_u_u3069 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3070; B_dData_dPair.f_Pair_second = dtb_u_u3071 } -> (match dtb_u_u3071 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3072; B_dData_dPair.f_Pair_second = dtb_u_u3073 } -> (let dtb_u_u3074 = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb_u_u3073)) (Core_dTerm.C_Term_TGlobal (dtb_u_u3062))) dtb_u_u3070) in (match ((((v_coerceTerm dtb_u_u3073) dtb_u_u3064) dtb_u_u3072) dtb_u_u3074) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3075) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u3075; B_dData_dPair.f_Pair_second = dtb_u_u3073 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb_u_u3073) (Elab_dTypes.v_ctxDepth dtb_u_u3060)) dtb_u_u3064) dtb_u_u3072) with
  | Base_dDiag.C_Check_OkC (dtb_u_u3076) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb_u_u3076)) (Core_dTerm.C_Term_TGlobal (dtb_u_u3062))) dtb_u_u3070); B_dData_dPair.f_Pair_second = dtb_u_u3076 }))
  | Base_dDiag.C_Check_ErrC (dtb_u_u3077) -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u3065) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName dtb_u_u3062), (Base_dDiag.v_diagText dtb_u_u3077)))) (Frontend_dAst.v_ctorDisplayName dtb_u_u3062)) (Base_dDiag.v_diagText dtb_u_u3077))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3078) -> (match dtb_u_u3078 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3079; B_dData_dPair.f_Pair_second = dtb_u_u3080 } -> (match dtb_u_u3080 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3081; B_dData_dPair.f_Pair_second = dtb_u_u3082 } -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel (dtb_u_u3058 - 1)) dtb_u_u3059) dtb_u_u3060) dtb_u_u3082) dtb_u_u3081) dtb_u_u3063) dtb_u_u3065) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u3083 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u3084 = dtb_u_u3083 in (match dtb_u_u3084 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3085; B_dData_dPair.f_Pair_second = dtb_u_u3086 } -> (match dtb_u_u3086 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3087; B_dData_dPair.f_Pair_second = dtb_u_u3088 } -> (let dtb_u_u3089 = ((B_dData_dList.v_append dtb_u_u3079) dtb_u_u3085) in (match ((((v_coerceTerm dtb_u_u3088) dtb_u_u3064) dtb_u_u3087) (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb_u_u3088)) (Core_dTerm.C_Term_TGlobal (dtb_u_u3062))) dtb_u_u3089)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3090) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u3090; B_dData_dPair.f_Pair_second = dtb_u_u3088 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Elab_dMeta.v_convEc dtb_u_u3088) (Elab_dTypes.v_ctxDepth dtb_u_u3060)) dtb_u_u3064) dtb_u_u3087) with
  | Base_dDiag.C_Check_OkC (dtb_u_u3091) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((Elab_dMeta.v_ctorAppTerm (Elab_dTypes.v_ecDatas dtb_u_u3091)) (Core_dTerm.C_Term_TGlobal (dtb_u_u3062))) dtb_u_u3089); B_dData_dPair.f_Pair_second = dtb_u_u3091 }))
  | Base_dDiag.C_Check_ErrC (dtb_u_u3092) -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u3065) (Base_dDiagnostics_dTc.C_TcErr_CtorError ((Frontend_dAst.v_ctorDisplayName dtb_u_u3062), (Base_dDiag.v_diagText dtb_u_u3092)))) (Frontend_dAst.v_ctorDisplayName dtb_u_u3062)) (Base_dDiag.v_diagText dtb_u_u3092))
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
and v_elabDoChain = (fun (dtb_u_u3093 : int) (dtb_u_u3094 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3095 : Elab_dTypes.t_Ctx) (dtb_u_u3096 : Elab_dTypes.t_Ec) (dtb_u_u3097 : t_DoPlan) (dtb_u_u3098 : t_DoChainStep B_dData_dList.t_List) (dtb_u_u3099 : Frontend_dAst.t_Expr) -> (if (dtb_u_u3093 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u3100 = dtb_u_u3098 in (match dtb_u_u3100 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3101, dtb_u_u3102) -> (match dtb_u_u3101 with
  | C_DoChainStep_DoChainStep (dtb_u_u3103, dtb_u_u3104, dtb_u_u3105, dtb_u_u3106) -> (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u3105) dtb_u_u3095) dtb_u_u3096) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3107; B_dData_dPair.f_Pair_second = dtb_u_u3108 } -> (let dtb_u_u3109 = ((Elab_dTypes.v_evalCtx dtb_u_u3095) dtb_u_u3107) in (let dtb_u_u3110 = ((Core_dEval.v_applyValue (dtb_u_u3097).f_DoPlan_planMVal) dtb_u_u3109) in (let dtb_u_u3111 = (((Elab_dTypes.v_ctxBindValue dtb_u_u3103) dtb_u_u3109) dtb_u_u3095) in ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb_u_u3108) dtb_u_u3105) "_") (dtb_u_u3097).f_DoPlan_planRigE) dtb_u_u3110)) (fun (dtb_u_u3112 : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind ((((((v_checkEFuel (dtb_u_u3093 - 1)) dtb_u_u3094) dtb_u_u3095) dtb_u_u3108) dtb_u_u3104) dtb_u_u3110)) (fun (dtb_u_u3113 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u3113 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3114; B_dData_dPair.f_Pair_second = dtb_u_u3115 } -> ((Base_dCommon.v_bind (((((Elab_dMeta.v_rigForLinearDomain dtb_u_u3115) dtb_u_u3105) dtb_u_u3103) (dtb_u_u3097).f_DoPlan_planInnerRig) dtb_u_u3109)) (fun (dtb_u_u3116 : Core_dTerm.t_Rig) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (dtb_u_u3093 - 1)) dtb_u_u3094) dtb_u_u3111) dtb_u_u3115) dtb_u_u3097) dtb_u_u3102) dtb_u_u3099)) (fun (dtb_u_u3117 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u3117 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3118; B_dData_dPair.f_Pair_second = dtb_u_u3119 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((((((((v_doBindAppTerm dtb_u_u3115) dtb_u_u3119) dtb_u_u3095) dtb_u_u3105) dtb_u_u3106) dtb_u_u3097) dtb_u_u3103) dtb_u_u3109) dtb_u_u3114) dtb_u_u3112) dtb_u_u3116) dtb_u_u3118); B_dData_dPair.f_Pair_second = dtb_u_u3119 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((((((v_checkEFuel (dtb_u_u3093 - 1)) dtb_u_u3094) dtb_u_u3095) dtb_u_u3096) dtb_u_u3099) ((Core_dEval.v_applyValue (dtb_u_u3097).f_DoPlan_planMVal) (dtb_u_u3097).f_DoPlan_planAVal))
  | _ -> failwith "DT: impossible branch"
))))
# 3841 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_checkDoBlockFuel = (fun (dtb_u_u3120 : int) (dtb_u_u3121 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3122 : Elab_dTypes.t_Ctx) (dtb_u_u3123 : Elab_dTypes.t_Ec) (dtb_u_u3124 : t_DoChain) (dtb_u_u3125 : Core_dTerm.t_Value) -> (if (dtb_u_u3120 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u3126 = ((((v_doBlockShapeOf dtb_u_u3121) dtb_u_u3122) dtb_u_u3123) (dtb_u_u3124).f_DoChain_doChainCanonical) in (match dtb_u_u3126 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3127) -> (match dtb_u_u3127 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3128; B_dData_dPair.f_Pair_second = dtb_u_u3129 } -> (match dtb_u_u3129 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3130; B_dData_dPair.f_Pair_second = dtb_u_u3131 } -> (let dtb_u_u3132 = ((v_splitDoExpected dtb_u_u3123) dtb_u_u3125) in (match dtb_u_u3132 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMetaSpans.v_newMetaAt (dtb_u_u3124).f_DoChain_doChainSpan) dtb_u_u3122) dtb_u_u3123) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3133; B_dData_dPair.f_Pair_second = dtb_u_u3134 } -> (match (((Elab_dMetaSpans.v_newMetaAt (dtb_u_u3124).f_DoChain_doChainSpan) dtb_u_u3122) dtb_u_u3134) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3135; B_dData_dPair.f_Pair_second = dtb_u_u3136 } -> (let dtb_u_u3137 = ((Elab_dTypes.v_evalCtx dtb_u_u3122) dtb_u_u3133) in (let dtb_u_u3138 = ((Elab_dTypes.v_evalCtx dtb_u_u3122) dtb_u_u3135) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (dtb_u_u3120 - 1)) dtb_u_u3121) dtb_u_u3122) dtb_u_u3136) (dtb_u_u3124).f_DoChain_doChainSpan) (dtb_u_u3124).f_DoChain_doChainCanonical) dtb_u_u3128) dtb_u_u3130) dtb_u_u3131) dtb_u_u3137) dtb_u_u3138)) (fun (dtb_u_u3139 : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match dtb_u_u3139 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3140) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (dtb_u_u3120 - 1)) dtb_u_u3121) dtb_u_u3122) (dtb_u_u3140).f_DoPlan_planEc) dtb_u_u3140) (dtb_u_u3124).f_DoChain_doChainSteps) (dtb_u_u3124).f_DoChain_doChainLast)) (fun (dtb_u_u3141 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u3141 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3142; B_dData_dPair.f_Pair_second = dtb_u_u3143 } -> ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb_u_u3143) (Elab_dTypes.v_ctxDepth dtb_u_u3122)) dtb_u_u3125) ((Core_dEval.v_applyValue (dtb_u_u3140).f_DoPlan_planMVal) (dtb_u_u3140).f_DoPlan_planAVal))) (fun (dtb_u_u3144 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u3142; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals dtb_u_u3121) dtb_u_u3144) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3145) -> (match dtb_u_u3145 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3146; B_dData_dPair.f_Pair_second = dtb_u_u3147 } -> ((Base_dCommon.v_bind (((((((((((v_planDoBlock (dtb_u_u3120 - 1)) dtb_u_u3121) dtb_u_u3122) dtb_u_u3123) (dtb_u_u3124).f_DoChain_doChainSpan) (dtb_u_u3124).f_DoChain_doChainCanonical) dtb_u_u3128) dtb_u_u3130) dtb_u_u3131) dtb_u_u3146) dtb_u_u3147)) (fun (dtb_u_u3148 : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match dtb_u_u3148 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3149) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (dtb_u_u3120 - 1)) dtb_u_u3121) dtb_u_u3122) (dtb_u_u3149).f_DoPlan_planEc) dtb_u_u3149) (dtb_u_u3124).f_DoChain_doChainSteps) (dtb_u_u3124).f_DoChain_doChainLast)) (fun (dtb_u_u3150 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u3150 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3151; B_dData_dPair.f_Pair_second = dtb_u_u3152 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u3151; B_dData_dPair.f_Pair_second = ((Elab_dDict.v_resolveDictGoals dtb_u_u3121) dtb_u_u3152) }))))
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
and v_inferDoBlockFuel = (fun (dtb_u_u3153 : int) (dtb_u_u3154 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3155 : Elab_dTypes.t_Ctx) (dtb_u_u3156 : Elab_dTypes.t_Ec) (dtb_u_u3157 : t_DoChain) -> (if (dtb_u_u3153 <= 0) then (Base_dDiag.v_icFuel "inference") else (let dtb_u_u3158 = ((((v_doBlockShapeOf dtb_u_u3154) dtb_u_u3155) dtb_u_u3156) (dtb_u_u3157).f_DoChain_doChainCanonical) in (match dtb_u_u3158 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3159) -> (match dtb_u_u3159 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3160; B_dData_dPair.f_Pair_second = dtb_u_u3161 } -> (match dtb_u_u3161 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3162; B_dData_dPair.f_Pair_second = dtb_u_u3163 } -> (match (((Elab_dMetaSpans.v_newMetaAt (dtb_u_u3157).f_DoChain_doChainSpan) dtb_u_u3155) dtb_u_u3156) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3164; B_dData_dPair.f_Pair_second = dtb_u_u3165 } -> (match (((Elab_dMetaSpans.v_newMetaAt (dtb_u_u3157).f_DoChain_doChainSpan) dtb_u_u3155) dtb_u_u3165) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3166; B_dData_dPair.f_Pair_second = dtb_u_u3167 } -> (let dtb_u_u3168 = ((Elab_dTypes.v_evalCtx dtb_u_u3155) dtb_u_u3164) in (let dtb_u_u3169 = ((Elab_dTypes.v_evalCtx dtb_u_u3155) dtb_u_u3166) in (let dtb_u_u3170 = ((Core_dEval.v_applyValue dtb_u_u3168) dtb_u_u3169) in ((Base_dCommon.v_bind (((((((((((v_planDoBlock (dtb_u_u3153 - 1)) dtb_u_u3154) dtb_u_u3155) dtb_u_u3167) (dtb_u_u3157).f_DoChain_doChainSpan) (dtb_u_u3157).f_DoChain_doChainCanonical) dtb_u_u3160) dtb_u_u3162) dtb_u_u3163) dtb_u_u3168) dtb_u_u3169)) (fun (dtb_u_u3171 : t_DoPlan B_dData_dMaybe.t_Maybe) -> (match dtb_u_u3171 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3172) -> ((Base_dCommon.v_bind (((((((v_elabDoChain (dtb_u_u3153 - 1)) dtb_u_u3154) dtb_u_u3155) (dtb_u_u3172).f_DoPlan_planEc) dtb_u_u3172) (dtb_u_u3157).f_DoChain_doChainSteps) (dtb_u_u3157).f_DoChain_doChainLast)) (fun (dtb_u_u3173 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u3173 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3174; B_dData_dPair.f_Pair_second = dtb_u_u3175 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u3174; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u3170; B_dData_dPair.f_Pair_second = dtb_u_u3175 } }))))
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
let v_checkTypeAtKind = (fun (dtb_u_u3176 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3177 : Elab_dTypes.t_Ctx) (dtb_u_u3178 : Elab_dTypes.t_Ec) (dtb_u_u3179 : Frontend_dAst.t_Expr) (dtb_u_u3180 : Core_dTerm.t_Value) (dtb_u_u3181 : Base_dSource.t_Span) -> (match ((Elab_dTypes.v_forceVal dtb_u_u3178) dtb_u_u3180) with
  | Core_dTerm.C_Value_VType (dtb_u_u3182) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u3181)) (((((v_checkTypeFuel 256) dtb_u_u3176) dtb_u_u3177) dtb_u_u3178) dtb_u_u3179))) (fun (dtb_u_u3183 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u3183); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u3183)) }))))
  | _ -> (let dtb_u_u3184 = dtb_u_u3179 in (match dtb_u_u3184 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u3185, dtb_u_u3186, dtb_u_u3187) -> (match dtb_u_u3185 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u3188, dtb_u_u3189) -> (if (((Elab_dMeta.v_isTypeName dtb_u_u3176) dtb_u_u3178) dtb_u_u3188) then (match (((Elab_dMeta.v_typeHeadLookup dtb_u_u3176) dtb_u_u3178) dtb_u_u3188) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u3181) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u3188))) dtb_u_u3188)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3190) -> ((Base_dCommon.v_bind ((((((((v_inferArgsFuel 256) dtb_u_u3176) dtb_u_u3177) dtb_u_u3178) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u3190)) dtb_u_u3186) dtb_u_u3181) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u3191 : ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u3192 = dtb_u_u3191 in (match dtb_u_u3192 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3193; B_dData_dPair.f_Pair_second = dtb_u_u3194 } -> (match dtb_u_u3194 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3195; B_dData_dPair.f_Pair_second = dtb_u_u3196 } -> (match ((((Elab_dMeta.v_convEc dtb_u_u3196) (Elab_dTypes.v_ctxDepth dtb_u_u3177)) dtb_u_u3180) dtb_u_u3195) with
  | Base_dDiag.C_Check_OkC (dtb_u_u3197) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_typeAppTerm dtb_u_u3197) dtb_u_u3188) dtb_u_u3193); B_dData_dPair.f_Pair_second = dtb_u_u3197 }))
  | Base_dDiag.C_Check_ErrC (dtb_u_u3198) -> (((Base_dDiagnostics_dTc.v_tcTypeMismatch dtb_u_u3181) (Core_dEval.v_showValue dtb_u_u3180)) (Core_dEval.v_showValue dtb_u_u3195))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u3181)) ((((((v_checkEFuel 256) dtb_u_u3176) dtb_u_u3177) dtb_u_u3178) dtb_u_u3179) dtb_u_u3180)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u3181)) ((((((v_checkEFuel 256) dtb_u_u3176) dtb_u_u3177) dtb_u_u3178) dtb_u_u3179) dtb_u_u3180))
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u3199, dtb_u_u3200) -> (if (((Elab_dMeta.v_isTypeName dtb_u_u3176) dtb_u_u3178) dtb_u_u3199) then (match (((Elab_dMeta.v_typeHeadLookup dtb_u_u3176) dtb_u_u3178) dtb_u_u3199) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u3181) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u3199))) dtb_u_u3199)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3201) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u3181)) ((((Elab_dMeta.v_convEc dtb_u_u3178) (Elab_dTypes.v_ctxDepth dtb_u_u3177)) dtb_u_u3180) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u3201)))) (fun (dtb_u_u3202 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_typeHeadTerm dtb_u_u3202) dtb_u_u3199); B_dData_dPair.f_Pair_second = dtb_u_u3202 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u3181)) ((((((v_checkEFuel 256) dtb_u_u3176) dtb_u_u3177) dtb_u_u3178) dtb_u_u3179) dtb_u_u3180)))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb_u_u3181)) ((((((v_checkEFuel 256) dtb_u_u3176) dtb_u_u3177) dtb_u_u3178) dtb_u_u3179) dtb_u_u3180))
))
))

# 981 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planData = (fun (dtb_u_u3203 : t_FieldAccessPlan) -> (match dtb_u_u3203 with
  | { f_FieldAccessPlan_planData = dtb_u_u3204; f_FieldAccessPlan_planCtor = dtb_u_u3205; f_FieldAccessPlan_planIdxs = dtb_u_u3206; f_FieldAccessPlan_planRecord = dtb_u_u3207; f_FieldAccessPlan_planField = dtb_u_u3208; f_FieldAccessPlan_planFieldCount = dtb_u_u3209; f_FieldAccessPlan_planType = dtb_u_u3210 } -> dtb_u_u3204
  | _ -> failwith "DT: impossible branch"
))

# 982 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planCtor = (fun (dtb_u_u3211 : t_FieldAccessPlan) -> (match dtb_u_u3211 with
  | { f_FieldAccessPlan_planData = dtb_u_u3212; f_FieldAccessPlan_planCtor = dtb_u_u3213; f_FieldAccessPlan_planIdxs = dtb_u_u3214; f_FieldAccessPlan_planRecord = dtb_u_u3215; f_FieldAccessPlan_planField = dtb_u_u3216; f_FieldAccessPlan_planFieldCount = dtb_u_u3217; f_FieldAccessPlan_planType = dtb_u_u3218 } -> dtb_u_u3213
  | _ -> failwith "DT: impossible branch"
))

# 983 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planIdxs = (fun (dtb_u_u3219 : t_FieldAccessPlan) -> (match dtb_u_u3219 with
  | { f_FieldAccessPlan_planData = dtb_u_u3220; f_FieldAccessPlan_planCtor = dtb_u_u3221; f_FieldAccessPlan_planIdxs = dtb_u_u3222; f_FieldAccessPlan_planRecord = dtb_u_u3223; f_FieldAccessPlan_planField = dtb_u_u3224; f_FieldAccessPlan_planFieldCount = dtb_u_u3225; f_FieldAccessPlan_planType = dtb_u_u3226 } -> dtb_u_u3222
  | _ -> failwith "DT: impossible branch"
))

# 984 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRecord = (fun (dtb_u_u3227 : t_FieldAccessPlan) -> (match dtb_u_u3227 with
  | { f_FieldAccessPlan_planData = dtb_u_u3228; f_FieldAccessPlan_planCtor = dtb_u_u3229; f_FieldAccessPlan_planIdxs = dtb_u_u3230; f_FieldAccessPlan_planRecord = dtb_u_u3231; f_FieldAccessPlan_planField = dtb_u_u3232; f_FieldAccessPlan_planFieldCount = dtb_u_u3233; f_FieldAccessPlan_planType = dtb_u_u3234 } -> dtb_u_u3231
  | _ -> failwith "DT: impossible branch"
))

# 985 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planField = (fun (dtb_u_u3235 : t_FieldAccessPlan) -> (match dtb_u_u3235 with
  | { f_FieldAccessPlan_planData = dtb_u_u3236; f_FieldAccessPlan_planCtor = dtb_u_u3237; f_FieldAccessPlan_planIdxs = dtb_u_u3238; f_FieldAccessPlan_planRecord = dtb_u_u3239; f_FieldAccessPlan_planField = dtb_u_u3240; f_FieldAccessPlan_planFieldCount = dtb_u_u3241; f_FieldAccessPlan_planType = dtb_u_u3242 } -> dtb_u_u3240
  | _ -> failwith "DT: impossible branch"
))

# 986 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planFieldCount = (fun (dtb_u_u3243 : t_FieldAccessPlan) -> (match dtb_u_u3243 with
  | { f_FieldAccessPlan_planData = dtb_u_u3244; f_FieldAccessPlan_planCtor = dtb_u_u3245; f_FieldAccessPlan_planIdxs = dtb_u_u3246; f_FieldAccessPlan_planRecord = dtb_u_u3247; f_FieldAccessPlan_planField = dtb_u_u3248; f_FieldAccessPlan_planFieldCount = dtb_u_u3249; f_FieldAccessPlan_planType = dtb_u_u3250 } -> dtb_u_u3249
  | _ -> failwith "DT: impossible branch"
))

# 987 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planType = (fun (dtb_u_u3251 : t_FieldAccessPlan) -> (match dtb_u_u3251 with
  | { f_FieldAccessPlan_planData = dtb_u_u3252; f_FieldAccessPlan_planCtor = dtb_u_u3253; f_FieldAccessPlan_planIdxs = dtb_u_u3254; f_FieldAccessPlan_planRecord = dtb_u_u3255; f_FieldAccessPlan_planField = dtb_u_u3256; f_FieldAccessPlan_planFieldCount = dtb_u_u3257; f_FieldAccessPlan_planType = dtb_u_u3258 } -> dtb_u_u3258
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upData = (fun (dtb_u_u3259 : t_UpdateAccessPlan) -> (match dtb_u_u3259 with
  | { f_UpdateAccessPlan_upData = dtb_u_u3260; f_UpdateAccessPlan_upCtor = dtb_u_u3261; f_UpdateAccessPlan_upIdxs = dtb_u_u3262; f_UpdateAccessPlan_upRecord = dtb_u_u3263; f_UpdateAccessPlan_upFieldCount = dtb_u_u3264; f_UpdateAccessPlan_upFieldIndices = dtb_u_u3265; f_UpdateAccessPlan_upBodyArgs = dtb_u_u3266 } -> dtb_u_u3260
  | _ -> failwith "DT: impossible branch"
))

# 992 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upCtor = (fun (dtb_u_u3267 : t_UpdateAccessPlan) -> (match dtb_u_u3267 with
  | { f_UpdateAccessPlan_upData = dtb_u_u3268; f_UpdateAccessPlan_upCtor = dtb_u_u3269; f_UpdateAccessPlan_upIdxs = dtb_u_u3270; f_UpdateAccessPlan_upRecord = dtb_u_u3271; f_UpdateAccessPlan_upFieldCount = dtb_u_u3272; f_UpdateAccessPlan_upFieldIndices = dtb_u_u3273; f_UpdateAccessPlan_upBodyArgs = dtb_u_u3274 } -> dtb_u_u3269
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upIdxs = (fun (dtb_u_u3275 : t_UpdateAccessPlan) -> (match dtb_u_u3275 with
  | { f_UpdateAccessPlan_upData = dtb_u_u3276; f_UpdateAccessPlan_upCtor = dtb_u_u3277; f_UpdateAccessPlan_upIdxs = dtb_u_u3278; f_UpdateAccessPlan_upRecord = dtb_u_u3279; f_UpdateAccessPlan_upFieldCount = dtb_u_u3280; f_UpdateAccessPlan_upFieldIndices = dtb_u_u3281; f_UpdateAccessPlan_upBodyArgs = dtb_u_u3282 } -> dtb_u_u3278
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upRecord = (fun (dtb_u_u3283 : t_UpdateAccessPlan) -> (match dtb_u_u3283 with
  | { f_UpdateAccessPlan_upData = dtb_u_u3284; f_UpdateAccessPlan_upCtor = dtb_u_u3285; f_UpdateAccessPlan_upIdxs = dtb_u_u3286; f_UpdateAccessPlan_upRecord = dtb_u_u3287; f_UpdateAccessPlan_upFieldCount = dtb_u_u3288; f_UpdateAccessPlan_upFieldIndices = dtb_u_u3289; f_UpdateAccessPlan_upBodyArgs = dtb_u_u3290 } -> dtb_u_u3287
  | _ -> failwith "DT: impossible branch"
))

# 995 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upFieldCount = (fun (dtb_u_u3291 : t_UpdateAccessPlan) -> (match dtb_u_u3291 with
  | { f_UpdateAccessPlan_upData = dtb_u_u3292; f_UpdateAccessPlan_upCtor = dtb_u_u3293; f_UpdateAccessPlan_upIdxs = dtb_u_u3294; f_UpdateAccessPlan_upRecord = dtb_u_u3295; f_UpdateAccessPlan_upFieldCount = dtb_u_u3296; f_UpdateAccessPlan_upFieldIndices = dtb_u_u3297; f_UpdateAccessPlan_upBodyArgs = dtb_u_u3298 } -> dtb_u_u3296
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upFieldIndices = (fun (dtb_u_u3299 : t_UpdateAccessPlan) -> (match dtb_u_u3299 with
  | { f_UpdateAccessPlan_upData = dtb_u_u3300; f_UpdateAccessPlan_upCtor = dtb_u_u3301; f_UpdateAccessPlan_upIdxs = dtb_u_u3302; f_UpdateAccessPlan_upRecord = dtb_u_u3303; f_UpdateAccessPlan_upFieldCount = dtb_u_u3304; f_UpdateAccessPlan_upFieldIndices = dtb_u_u3305; f_UpdateAccessPlan_upBodyArgs = dtb_u_u3306 } -> dtb_u_u3305
  | _ -> failwith "DT: impossible branch"
))

# 997 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_upBodyArgs = (fun (dtb_u_u3307 : t_UpdateAccessPlan) -> (match dtb_u_u3307 with
  | { f_UpdateAccessPlan_upData = dtb_u_u3308; f_UpdateAccessPlan_upCtor = dtb_u_u3309; f_UpdateAccessPlan_upIdxs = dtb_u_u3310; f_UpdateAccessPlan_upRecord = dtb_u_u3311; f_UpdateAccessPlan_upFieldCount = dtb_u_u3312; f_UpdateAccessPlan_upFieldIndices = dtb_u_u3313; f_UpdateAccessPlan_upBodyArgs = dtb_u_u3314 } -> dtb_u_u3314
  | _ -> failwith "DT: impossible branch"
))

# 3596 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainCanonical = (fun (dtb_u_u3315 : t_DoChain) -> (match dtb_u_u3315 with
  | { f_DoChain_doChainCanonical = dtb_u_u3316; f_DoChain_doChainSteps = dtb_u_u3317; f_DoChain_doChainLast = dtb_u_u3318; f_DoChain_doChainSpan = dtb_u_u3319 } -> dtb_u_u3316
  | _ -> failwith "DT: impossible branch"
))

# 3597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainSteps = (fun (dtb_u_u3320 : t_DoChain) -> (match dtb_u_u3320 with
  | { f_DoChain_doChainCanonical = dtb_u_u3321; f_DoChain_doChainSteps = dtb_u_u3322; f_DoChain_doChainLast = dtb_u_u3323; f_DoChain_doChainSpan = dtb_u_u3324 } -> dtb_u_u3322
  | _ -> failwith "DT: impossible branch"
))

# 3598 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainLast = (fun (dtb_u_u3325 : t_DoChain) -> (match dtb_u_u3325 with
  | { f_DoChain_doChainCanonical = dtb_u_u3326; f_DoChain_doChainSteps = dtb_u_u3327; f_DoChain_doChainLast = dtb_u_u3328; f_DoChain_doChainSpan = dtb_u_u3329 } -> dtb_u_u3328
  | _ -> failwith "DT: impossible branch"
))

# 3599 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_doChainSpan = (fun (dtb_u_u3330 : t_DoChain) -> (match dtb_u_u3330 with
  | { f_DoChain_doChainCanonical = dtb_u_u3331; f_DoChain_doChainSteps = dtb_u_u3332; f_DoChain_doChainLast = dtb_u_u3333; f_DoChain_doChainSpan = dtb_u_u3334 } -> dtb_u_u3334
  | _ -> failwith "DT: impossible branch"
))

# 3739 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planBind = (fun (dtb_u_u3335 : t_DoPlan) -> (match dtb_u_u3335 with
  | { f_DoPlan_planBind = dtb_u_u3336; f_DoPlan_planHead = dtb_u_u3337; f_DoPlan_planMTerm = dtb_u_u3338; f_DoPlan_planMVal = dtb_u_u3339; f_DoPlan_planAVal = dtb_u_u3340; f_DoPlan_planDictTerm = dtb_u_u3341; f_DoPlan_planRigE = dtb_u_u3342; f_DoPlan_planRigL = dtb_u_u3343; f_DoPlan_planInnerRig = dtb_u_u3344; f_DoPlan_planEc = dtb_u_u3345 } -> dtb_u_u3336
  | _ -> failwith "DT: impossible branch"
))

# 3740 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planHead = (fun (dtb_u_u3346 : t_DoPlan) -> (match dtb_u_u3346 with
  | { f_DoPlan_planBind = dtb_u_u3347; f_DoPlan_planHead = dtb_u_u3348; f_DoPlan_planMTerm = dtb_u_u3349; f_DoPlan_planMVal = dtb_u_u3350; f_DoPlan_planAVal = dtb_u_u3351; f_DoPlan_planDictTerm = dtb_u_u3352; f_DoPlan_planRigE = dtb_u_u3353; f_DoPlan_planRigL = dtb_u_u3354; f_DoPlan_planInnerRig = dtb_u_u3355; f_DoPlan_planEc = dtb_u_u3356 } -> dtb_u_u3348
  | _ -> failwith "DT: impossible branch"
))

# 3741 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planMTerm = (fun (dtb_u_u3357 : t_DoPlan) -> (match dtb_u_u3357 with
  | { f_DoPlan_planBind = dtb_u_u3358; f_DoPlan_planHead = dtb_u_u3359; f_DoPlan_planMTerm = dtb_u_u3360; f_DoPlan_planMVal = dtb_u_u3361; f_DoPlan_planAVal = dtb_u_u3362; f_DoPlan_planDictTerm = dtb_u_u3363; f_DoPlan_planRigE = dtb_u_u3364; f_DoPlan_planRigL = dtb_u_u3365; f_DoPlan_planInnerRig = dtb_u_u3366; f_DoPlan_planEc = dtb_u_u3367 } -> dtb_u_u3360
  | _ -> failwith "DT: impossible branch"
))

# 3742 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planMVal = (fun (dtb_u_u3368 : t_DoPlan) -> (match dtb_u_u3368 with
  | { f_DoPlan_planBind = dtb_u_u3369; f_DoPlan_planHead = dtb_u_u3370; f_DoPlan_planMTerm = dtb_u_u3371; f_DoPlan_planMVal = dtb_u_u3372; f_DoPlan_planAVal = dtb_u_u3373; f_DoPlan_planDictTerm = dtb_u_u3374; f_DoPlan_planRigE = dtb_u_u3375; f_DoPlan_planRigL = dtb_u_u3376; f_DoPlan_planInnerRig = dtb_u_u3377; f_DoPlan_planEc = dtb_u_u3378 } -> dtb_u_u3372
  | _ -> failwith "DT: impossible branch"
))

# 3743 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planAVal = (fun (dtb_u_u3379 : t_DoPlan) -> (match dtb_u_u3379 with
  | { f_DoPlan_planBind = dtb_u_u3380; f_DoPlan_planHead = dtb_u_u3381; f_DoPlan_planMTerm = dtb_u_u3382; f_DoPlan_planMVal = dtb_u_u3383; f_DoPlan_planAVal = dtb_u_u3384; f_DoPlan_planDictTerm = dtb_u_u3385; f_DoPlan_planRigE = dtb_u_u3386; f_DoPlan_planRigL = dtb_u_u3387; f_DoPlan_planInnerRig = dtb_u_u3388; f_DoPlan_planEc = dtb_u_u3389 } -> dtb_u_u3384
  | _ -> failwith "DT: impossible branch"
))

# 3744 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planDictTerm = (fun (dtb_u_u3390 : t_DoPlan) -> (match dtb_u_u3390 with
  | { f_DoPlan_planBind = dtb_u_u3391; f_DoPlan_planHead = dtb_u_u3392; f_DoPlan_planMTerm = dtb_u_u3393; f_DoPlan_planMVal = dtb_u_u3394; f_DoPlan_planAVal = dtb_u_u3395; f_DoPlan_planDictTerm = dtb_u_u3396; f_DoPlan_planRigE = dtb_u_u3397; f_DoPlan_planRigL = dtb_u_u3398; f_DoPlan_planInnerRig = dtb_u_u3399; f_DoPlan_planEc = dtb_u_u3400 } -> dtb_u_u3396
  | _ -> failwith "DT: impossible branch"
))

# 3745 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRigE = (fun (dtb_u_u3401 : t_DoPlan) -> (match dtb_u_u3401 with
  | { f_DoPlan_planBind = dtb_u_u3402; f_DoPlan_planHead = dtb_u_u3403; f_DoPlan_planMTerm = dtb_u_u3404; f_DoPlan_planMVal = dtb_u_u3405; f_DoPlan_planAVal = dtb_u_u3406; f_DoPlan_planDictTerm = dtb_u_u3407; f_DoPlan_planRigE = dtb_u_u3408; f_DoPlan_planRigL = dtb_u_u3409; f_DoPlan_planInnerRig = dtb_u_u3410; f_DoPlan_planEc = dtb_u_u3411 } -> dtb_u_u3408
  | _ -> failwith "DT: impossible branch"
))

# 3746 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planRigL = (fun (dtb_u_u3412 : t_DoPlan) -> (match dtb_u_u3412 with
  | { f_DoPlan_planBind = dtb_u_u3413; f_DoPlan_planHead = dtb_u_u3414; f_DoPlan_planMTerm = dtb_u_u3415; f_DoPlan_planMVal = dtb_u_u3416; f_DoPlan_planAVal = dtb_u_u3417; f_DoPlan_planDictTerm = dtb_u_u3418; f_DoPlan_planRigE = dtb_u_u3419; f_DoPlan_planRigL = dtb_u_u3420; f_DoPlan_planInnerRig = dtb_u_u3421; f_DoPlan_planEc = dtb_u_u3422 } -> dtb_u_u3420
  | _ -> failwith "DT: impossible branch"
))

# 3747 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planInnerRig = (fun (dtb_u_u3423 : t_DoPlan) -> (match dtb_u_u3423 with
  | { f_DoPlan_planBind = dtb_u_u3424; f_DoPlan_planHead = dtb_u_u3425; f_DoPlan_planMTerm = dtb_u_u3426; f_DoPlan_planMVal = dtb_u_u3427; f_DoPlan_planAVal = dtb_u_u3428; f_DoPlan_planDictTerm = dtb_u_u3429; f_DoPlan_planRigE = dtb_u_u3430; f_DoPlan_planRigL = dtb_u_u3431; f_DoPlan_planInnerRig = dtb_u_u3432; f_DoPlan_planEc = dtb_u_u3433 } -> dtb_u_u3432
  | _ -> failwith "DT: impossible branch"
))

# 3748 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_planEc = (fun (dtb_u_u3434 : t_DoPlan) -> (match dtb_u_u3434 with
  | { f_DoPlan_planBind = dtb_u_u3435; f_DoPlan_planHead = dtb_u_u3436; f_DoPlan_planMTerm = dtb_u_u3437; f_DoPlan_planMVal = dtb_u_u3438; f_DoPlan_planAVal = dtb_u_u3439; f_DoPlan_planDictTerm = dtb_u_u3440; f_DoPlan_planRigE = dtb_u_u3441; f_DoPlan_planRigL = dtb_u_u3442; f_DoPlan_planInnerRig = dtb_u_u3443; f_DoPlan_planEc = dtb_u_u3444 } -> dtb_u_u3444
  | _ -> failwith "DT: impossible branch"
))
