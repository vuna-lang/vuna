open Vuna_runtime
type t_FixityTable = { f_FixityTable_renameMode : bool; f_FixityTable_fixityDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_FixityTable_fixSurface : Frontend_dCst.t_Surface }
and t_ChainOp = { f_ChainOp_chainOp : string; f_ChainOp_chainIsBacktick : bool; f_ChainOp_chainRhs : Frontend_dAst.t_Expr; f_ChainOp_chainRef : Frontend_dAst.t_NodeRef }

# 34 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOf = (fun (surface : Frontend_dCst.t_Surface) (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = true; f_FixityTable_fixityDecls = ds; f_FixityTable_fixSurface = surface })

# 38 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOps = (fun (surface : Frontend_dCst.t_Surface) (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = false; f_FixityTable_fixityDecls = ds; f_FixityTable_fixSurface = surface })

# 41 "Vuna/Compiler/Loader/Fixity.vuna"
let v_renameMode = (fun (mc0 : t_FixityTable) -> (match mc0 with
  | { f_FixityTable_renameMode = dtb__0; f_FixityTable_fixityDecls = dtb__1; f_FixityTable_fixSurface = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityDecls = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "->"; Frontend_dAst.f_FixityDecl_fixityLevel = 1; Frontend_dAst.f_FixityDecl_fixityAssoc = 2; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "&&"; Frontend_dAst.f_FixityDecl_fixityLevel = 3; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "||"; Frontend_dAst.f_FixityDecl_fixityLevel = 2; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))))

# 53 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOpOf = (fun (d : Frontend_dAst.t_FixityDecl) -> (d).Frontend_dAst.f_FixityDecl_fixityOp)

# 50 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityOps = ((B_dData_dList.v_map v_fixityOpOf) v_builtinFixityDecls)

# 74 "Vuna/Compiler/Loader/Fixity.vuna"
let v_withFixitySpan = (fun (sp : Base_dSource.t_Span) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then e else ((Base_dDiag.v_withFallbackSpan sp) e)))

# 61 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_checkUniqueFixitiesGo = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (let sp = (Frontend_dAst.v_fixitySpan dtb__3) in (if ((B_dData_dList.v_memName (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp) v_builtinFixityOps) then ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_BuiltinFixity ((dtb__3).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp)) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_DuplicateFixity ((dtb__3).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_checkUniqueFixitiesGo dtb__4) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp) 1) mc1))) (fun (tailDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__3, tailDecls))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Loader/Fixity.vuna"
let v_checkUniqueFixities = (fun (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((v_checkUniqueFixitiesGo ds) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 78 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_lookupDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if ((dtb__6).Frontend_dAst.f_FixityDecl_fixityOp = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__6)) else ((v_lookupDecl mc0) dtb__7))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixityDecl = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupDecl op) (t).f_FixityTable_fixityDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (B_dData_dMaybe.C_Maybe_Just (dtb__8))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_lookupDecl op) v_builtinFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixity = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupFixityDecl t) op) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__9).Frontend_dAst.f_FixityDecl_fixityLevel; B_dData_dPair.f_Pair_second = (dtb__9).Frontend_dAst.f_FixityDecl_fixityAssoc }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Loader/Fixity.vuna"
let v_unknownFixityMsg = (fun (op : string) -> ((Base_dDiagnostics_dRn.v_rnMsg (Base_dDiagnostics_dRn.C_RnErr_UnknownFixity (op))) (B_dData_dVec.C_Vec_VCons (op, B_dData_dVec.C_Vec_Nil))))

# 108 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOf = (fun (t : t_FixityTable) (c : t_ChainOp) -> (match ((v_lookupFixity t) (c).f_ChainOp_chainOp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (Base_dDiag.C_Check_OkC (dtb__10))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (c).f_ChainOp_chainIsBacktick then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 9; B_dData_dPair.f_Pair_second = 1 })) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan (c).f_ChainOp_chainRef))) (Base_dDiag.C_Check_ErrC ((v_unknownFixityMsg (c).f_ChainOp_chainOp)))))
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Loader/Fixity.vuna"
let v_infixTerm = (fun (t : t_FixityTable) (c : t_ChainOp) (lhs : Frontend_dAst.t_Expr) (rhs : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (if (if (v_renameMode t) then ((c).f_ChainOp_chainOp = ">>") else false) then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (">>=", sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), rhs, sp)), B_dData_dList.C_List_Nil)))), sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((c).f_ChainOp_chainOp, sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), sp))))

# 140 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainBacktick = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> (match ((Frontend_dCst.v_backtickShapeOf (t).f_FixityTable_fixSurface) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef e))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Loader/Fixity.vuna"
let v_isChainNode = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> (match ((Frontend_dCst.v_sectionShapeOfSpan (t).f_FixityTable_fixSurface) (Frontend_dAst.v_exprSpan e)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut3 = e in (match nd_uscrut3 with
  | Frontend_dAst.C_Expr_EApp (dtb__13, dtb__14, dtb__15) -> (match dtb__13 with
  | Frontend_dAst.C_Expr_EVar (dtb__16, dtb__17) -> (match dtb__14 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__19 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dLexer.v_isSymbolName dtb__16) then true else ((v_chainBacktick t) e))
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_climb = (fun (fuel : int) (t : t_FixityTable) (minPrec : int) (lhs : Frontend_dAst.t_Expr) (rest : t_ChainOp B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "infix reorder fuel exhausted") else (match rest with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match ((v_fixityOf t) dtb__22) with
  | Base_dDiag.C_Check_ErrC (dtb__24) -> (Base_dDiag.C_Check_ErrC (dtb__24))
  | Base_dDiag.C_Check_OkC (dtb__25) -> (let level = (B_dData_dPair.v_firstOf dtb__25) in (let assoc = (B_dData_dPair.v_secondOf dtb__25) in (let nextMin = (if (assoc = 2) then level else (level + 1)) in (let rhs = (dtb__22).f_ChainOp_chainRhs in (if (level < minPrec) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = rest })) else ((Base_dCommon.v_bind ((((((v_climb (fuel - 1)) t) nextMin) rhs) dtb__23) sp)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__26; B_dData_dPair.f_Pair_second = dtb__27 } -> ((((((v_climb (fuel - 1)) t) minPrec) (((((v_infixTerm t) dtb__22) lhs) dtb__26) sp)) dtb__27) sp)
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 211 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_foldApps = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (((v_foldApps (Frontend_dAst.C_Expr_EApp (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__28, B_dData_dList.C_List_Nil)), mc2))) dtb__29) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_reorderPattern = (fun (t : t_FixityTable) (pat : Frontend_dAst.t_Pat) -> (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__30, dtb__31) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PVar (dtb__30, dtb__31))))
  | Frontend_dAst.C_Pat_PWild (dtb__32) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PWild (dtb__32))))
  | Frontend_dAst.C_Pat_PInt (dtb__33, dtb__34) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PInt (dtb__33, dtb__34))))
  | Frontend_dAst.C_Pat_PStr (dtb__35, dtb__36) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PStr (dtb__35, dtb__36))))
  | Frontend_dAst.C_Pat_PCon (dtb__37, dtb__38, dtb__39) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern t) p))) dtb__38)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb__37, pats2, dtb__39))))))
  | Frontend_dAst.C_Pat_PAs (dtb__40, dtb__41, dtb__42) -> ((Base_dCommon.v_bind ((v_reorderPattern t) dtb__41)) (fun (inner2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb__40, inner2, dtb__42))))))
  | Frontend_dAst.C_Pat_PRecord (dtb__43, dtb__44, dtb__45) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> ((v_reorderRecPatField t) p))) dtb__44)) (fun (fs : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PRecord (dtb__43, fs, dtb__45))))))
  | _ -> failwith "DT: impossible branch"
))
# 408 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderRecPatField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__47)) (fun (p2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = p2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_collectChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EApp (dtb__48, dtb__49, dtb__50) -> (match dtb__48 with
  | Frontend_dAst.C_Expr_EVar (dtb__51, dtb__52) -> (match dtb__49 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__54 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | B_dData_dList.C_List_Nil -> (if ((v_isChainNode mc0) mc1) then ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__53)) (fun (l2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_chainOperand mc0) dtb__55)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = l2; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb__51; f_ChainOp_chainIsBacktick = ((v_chainBacktick mc0) mc1); f_ChainOp_chainRhs = (B_dData_dPair.v_firstOf p); f_ChainOp_chainRef = dtb__50 }, (B_dData_dPair.v_secondOf p))) })))))) else ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
)
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
))
# 160 "Vuna/Compiler/Loader/Fixity.vuna"
and v_chainOperand = (fun (t : t_FixityTable) (r : Frontend_dAst.t_Expr) -> (if (((Frontend_dCst.v_parenDepthOf (t).f_FixityTable_fixSurface) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef r))) > 0) then ((Base_dCommon.v_bind ((v_reorderExpr t) r)) (fun (r2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = r2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))) else ((v_collectChain t) r)))
# 196 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderChain = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain t) e)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> ((Base_dCommon.v_bind ((((((v_climb ((2 * (B_dData_dList.v_length dtb__58)) + 2)) t) 0) dtb__57) dtb__58) (Frontend_dAst.v_exprRef e))) (fun (q : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (if ((B_dData_dList.v_length dtb__60) = 0) then (Base_dDiag.C_Check_OkC (dtb__59)) else (Base_dDiag.v_icInternal "infix reorder left an operator"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 216 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderNonChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__61, dtb__62) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__61)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (ps, dtb__62))))))
  | Frontend_dAst.C_Expr_EDo (dtb__63, dtb__64) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_DoStmt) -> ((v_reorderDoStmt mc0) v))) dtb__63)) (fun (ss : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (ss, dtb__64))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__65, dtb__66, dtb__67) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__65)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__66)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__67))))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__68, dtb__69, dtb__70) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__69)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__68, fs, dtb__70))))))
  | Frontend_dAst.C_Expr_EField (dtb__71, dtb__72, dtb__73) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__71)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__72, dtb__73))))))
  | Frontend_dAst.C_Expr_EIf (dtb__74, dtb__75, dtb__76, dtb__77) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__74)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__75)) (fun (th2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__76)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, th2, el2, dtb__77))))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__78, dtb__79, dtb__80) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__78)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderAlts mc0) dtb__79)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__80))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__81, dtb__82, dtb__83, dtb__84) -> ((Base_dCommon.v_bind ((v_reorderBinds mc0) dtb__81)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__82)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__83, dtb__84))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__88)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__89)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__85, dtb__86, dtb__87, dom2, cod2, dtb__90))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__91, dtb__92, dtb__93) -> (match dtb__91 with
  | Frontend_dAst.C_Expr_ELam (dtb__94, dtb__95, dtb__96) -> (match ((Frontend_dCst.v_sectionShapeOfSpan (mc0).f_FixityTable_fixSurface) (Frontend_dAst.v_nodeRefSpan dtb__96)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__97) -> (if (v_renameMode mc0) then (((((v_reorderSectionApply mc0) dtb__97) dtb__95) dtb__92) dtb__93) else ((((v_reorderApp mc0) dtb__91) dtb__92) dtb__93))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_reorderApp mc0) dtb__91) dtb__92) dtb__93)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_reorderApp mc0) dtb__91) dtb__92) dtb__93)
)
  | Frontend_dAst.C_Expr_ELam (dtb__98, dtb__99, dtb__100) -> (match ((Frontend_dCst.v_sectionShapeOfSpan (mc0).f_FixityTable_fixSurface) (Frontend_dAst.v_nodeRefSpan dtb__100)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__101) -> (match dtb__99 with
  | Frontend_dAst.C_Expr_EApp (dtb__102, dtb__103, dtb__104) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__102)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__103)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__98, (Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__104)), dtb__100))))))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__99)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__98, b, dtb__100))))))
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__99)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__98, b, dtb__100))))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EFloat (dtb__105, dtb__106) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__105, dtb__106))))
  | Frontend_dAst.C_Expr_EStr (dtb__107, dtb__108) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__107, dtb__108))))
  | Frontend_dAst.C_Expr_EInt (dtb__109, dtb__110) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__109, dtb__110))))
  | Frontend_dAst.C_Expr_EVar (dtb__111, dtb__112) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__111, dtb__112))))
  | _ -> failwith "DT: impossible branch"
))
# 277 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderApp = (fun (t : t_FixityTable) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> ((Base_dCommon.v_bind ((v_reorderExpr t) fn)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr t) a))) args)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, sp)))))))))
# 283 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderSectionApply = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dCst.t_SectionShape) (mc2 : Frontend_dAst.t_Expr) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc4 : Frontend_dAst.t_NodeRef) -> (match mc2 with
  | Frontend_dAst.C_Expr_EApp (dtb__113, dtb__114, dtb__115) -> (match dtb__113 with
  | Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117) -> (match mc1 with
  | Frontend_dCst.C_SectionShape_SectionLeft (dtb__118) -> (let nd_uscrut11 = dtb__114 in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (match dtb__120 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (match dtb__122 with
  | B_dData_dList.C_List_Nil -> ((((((v_applySectionLeft mc0) dtb__116) dtb__117) dtb__121) mc3) mc4)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117)), dtb__114, dtb__115))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117)), dtb__114, dtb__115))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117)), dtb__114, dtb__115))) mc3) mc4)
))
  | Frontend_dCst.C_SectionShape_SectionRight (dtb__123) -> (let nd_uscrut11 = dtb__114 in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__125 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (match dtb__127 with
  | B_dData_dList.C_List_Nil -> ((((((v_applySectionRight mc0) dtb__116) dtb__117) dtb__124) mc3) mc4)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117)), dtb__114, dtb__115))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117)), dtb__114, dtb__115))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117)), dtb__114, dtb__115))) mc3) mc4)
))
  | Frontend_dCst.C_SectionShape_SectionOp (dtb__128) -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__116, dtb__117)), dtb__114, dtb__115))) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_reorderApp mc0) mc2) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) mc2) mc3) mc4)
))
# 297 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionLeft = (fun (mc0 : t_FixityTable) (mc1 : string) (mc2 : Frontend_dAst.t_NodeRef) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__129)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) mc3)) (fun (o2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__130)) (fun (r2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc1, mc2)), (B_dData_dList.C_List__x58__x58_ (a2, (B_dData_dList.C_List__x58__x58_ (o2, B_dData_dList.C_List_Nil)))), mc5))) r2) mc5)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionRight = (fun (mc0 : t_FixityTable) (mc1 : string) (mc2 : Frontend_dAst.t_NodeRef) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) mc3)) (fun (o2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__131)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__132)) (fun (r2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc1, mc2)), (B_dData_dList.C_List__x58__x58_ (o2, (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)))), mc5))) r2) mc5)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 312 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderExpr = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EApp (dtb__133, dtb__134, dtb__135) -> (match dtb__133 with
  | Frontend_dAst.C_Expr_EVar (dtb__136, dtb__137) -> (match dtb__134 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (match dtb__141 with
  | B_dData_dList.C_List_Nil -> (if ((v_isChainNode mc0) mc1) then ((v_reorderChain mc0) mc1) else ((v_reorderNonChain mc0) mc1))
  | _ -> ((v_reorderNonChain mc0) mc1)
)
  | _ -> ((v_reorderNonChain mc0) mc1)
)
  | _ -> ((v_reorderNonChain mc0) mc1)
)
  | _ -> ((v_reorderNonChain mc0) mc1)
)
  | _ -> ((v_reorderNonChain mc0) mc1)
))
# 318 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderInterpParts = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (match dtb__142 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__144) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__143)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__144)), ps))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__145) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__145)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__143)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e2)), ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 329 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBinds = (fun (t : t_FixityTable) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Binding) -> ((v_reorderBind t) v))) binds))
# 332 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBind = (fun (t : t_FixityTable) (binding : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind ((v_reorderPattern t) (binding).Frontend_dAst.f_Binding_bindPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderBindingSig t) (binding).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((v_reorderBindingValue t) (binding).Frontend_dAst.f_Binding_bindValue)) (fun (v2 : Frontend_dAst.t_BindingValue) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Binding_bindPat = p2; Frontend_dAst.f_Binding_bindValue = v2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (binding).Frontend_dAst.f_Binding_bindRef })))))))))
# 339 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBindingValue = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_BindingValue) -> (match mc1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__146) -> ((Base_dCommon.v_bind ((v_reorderClauses mc0) dtb__146)) (fun (cs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (cs))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb__147) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__147)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (e2))))))
  | _ -> failwith "DT: impossible branch"
))
# 346 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBindingSig = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) (dtb__148).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__148).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 353 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderFields = (fun (t : t_FixityTable) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderField t) v))) fields))
# 356 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__150)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 360 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClauses = (fun (t : t_FixityTable) (clauses : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_LocalClause) -> ((v_reorderClause t) v))) clauses))
# 364 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlts = (fun (t : t_FixityTable) (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Alt) -> ((v_reorderAlt t) a))) alts))
# 367 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlt = (fun (t : t_FixityTable) (alt : Frontend_dAst.t_Alt) -> ((Base_dCommon.v_bind ((v_reorderPattern t) (alt).Frontend_dAst.f_Alt_altPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr t) (alt).Frontend_dAst.f_Alt_altBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Alt_altPat = p2; Frontend_dAst.f_Alt_altBody = b2; Frontend_dAst.f_Alt_altRef = (alt).Frontend_dAst.f_Alt_altRef })))))))
# 373 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClause = (fun (t : t_FixityTable) (clause : Frontend_dAst.t_LocalClause) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (pat : Frontend_dAst.t_Pat) -> ((v_reorderPattern t) pat))) (clause).Frontend_dAst.f_LocalClause_lcPats)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr t) (clause).Frontend_dAst.f_LocalClause_lcBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_LocalClause_lcPats = pats2; Frontend_dAst.f_LocalClause_lcBody = b2; Frontend_dAst.f_LocalClause_lcRef = (clause).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (clause).Frontend_dAst.f_LocalClause_lcHead })))))))
# 379 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderDoStmt = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__151, dtb__152) -> ((Base_dCommon.v_bind ((v_reorderBinds mc0) dtb__151)) (fun (b2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (b2, dtb__152))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__153, dtb__154) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__153)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (e2, dtb__154))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb__155, dtb__156, dtb__157) -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__155)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__156)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (p2, e2, dtb__157))))))))
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitParam = (fun (t : t_FixityTable) (p : Frontend_dAst.t_TraitParam) -> (match (p).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (p))
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> ((Base_dCommon.v_bind ((v_reorderExpr t) dtb__158)) (fun (k2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitParam_traitParamName = (p).Frontend_dAst.f_TraitParam_traitParamName; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (k2)) }))))
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderCtor = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__159; Frontend_dAst.f_Ctor_ctorType = dtb__160; Frontend_dAst.f_Ctor_ctorArity = dtb__161; Frontend_dAst.f_Ctor_ctorRef = dtb__162 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__160)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__159; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__161; Frontend_dAst.f_Ctor_ctorRef = dtb__162 }))))
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderRecordField = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__163; Frontend_dAst.f_Field_fieldType = dtb__164; Frontend_dAst.f_Field_fieldRef = dtb__165 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__164)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__163; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__165 }))))
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitMethod = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__166; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__167; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__168 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__167)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__166; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__168 }))))
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderInstanceMethodDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DFun (dtb__169, dtb__170, dtb__171, dtb__172) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__170)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__171)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__169, pats2, b2, dtb__172))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__173, dtb__174, dtb__175, dtb__176) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__174)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__175)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__173, ctx2, ty2, dtb__176))))))))
  | _ -> (Base_dDiag.C_Check_OkC (mc1))
))

# 413 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__177, dtb__178, dtb__179, dtb__180) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__177)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__178)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderInstanceMethodDecl mc0) v))) dtb__179)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, ms, dtb__180))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_TraitParam) -> ((v_reorderTraitParam mc0) p))) dtb__182)) (fun (ps : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__183)) (fun (ss : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_TraitMethod) -> ((v_reorderTraitMethod mc0) v))) dtb__184)) (fun (ms : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__181, ps, ss, ms, dtb__185))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Field) -> ((v_reorderRecordField mc0) v))) dtb__188)) (fun (fs : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__186, dtb__187, fs, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193))))))
  | Frontend_dAst.C_Decl_DFun (dtb__194, dtb__195, dtb__196, dtb__197) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__195)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__196)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__194, pats2, b2, dtb__197))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__198, dtb__199, dtb__200, dtb__201) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__199)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__200)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__198, ctx2, ty2, dtb__201))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__202, dtb__203, dtb__204, dtb__205) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__204)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__202, dtb__203, ty2, dtb__205))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__206, dtb__207, dtb__208) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__207)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__206, ty2, dtb__208))))))
  | Frontend_dAst.C_Decl_DData (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__211)) (fun (k2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Frontend_dAst.t_Ctor) -> ((v_reorderCtor mc0) c))) dtb__212)) (fun (cs : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__209, dtb__210, k2, cs, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217))))))))
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderProgram = (fun (t : t_FixityTable) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderDecl t) v))) decls))
