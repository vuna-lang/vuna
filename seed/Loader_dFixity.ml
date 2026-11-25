open Vuna_runtime
type t_FixityTable = { f_FixityTable_renameMode : bool; f_FixityTable_fixityDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_FixityTable_fixFacts : Frontend_dCst.t_FixityFacts }
and t_ChainOp = { f_ChainOp_chainOp : string; f_ChainOp_chainIsBacktick : bool; f_ChainOp_chainRhs : Frontend_dAst.t_Expr; f_ChainOp_chainRef : Frontend_dAst.t_NodeRef }

# 34 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOf = (fun (facts : Frontend_dCst.t_FixityFacts) (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = true; f_FixityTable_fixityDecls = ds; f_FixityTable_fixFacts = facts })

# 38 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOps = (fun (facts : Frontend_dCst.t_FixityFacts) (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = false; f_FixityTable_fixityDecls = ds; f_FixityTable_fixFacts = facts })

# 42 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfCst = (fun cst -> (v_tableOf (Frontend_dCst.v_fixityFactsOf cst)))

# 45 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOpsCst = (fun cst -> (v_tableOfKeepOps (Frontend_dCst.v_fixityFactsOf cst)))

# 48 "Vuna/Compiler/Loader/Fixity.vuna"
let v_renameMode = (fun (mc0 : t_FixityTable) -> (match mc0 with
  | { f_FixityTable_renameMode = dtb__0; f_FixityTable_fixityDecls = dtb__1; f_FixityTable_fixFacts = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityDecls = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "->"; Frontend_dAst.f_FixityDecl_fixityLevel = 1; Frontend_dAst.f_FixityDecl_fixityAssoc = 2; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "&&"; Frontend_dAst.f_FixityDecl_fixityLevel = 3; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "||"; Frontend_dAst.f_FixityDecl_fixityLevel = 2; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))))

# 60 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOpOf = (fun (d : Frontend_dAst.t_FixityDecl) -> (d).Frontend_dAst.f_FixityDecl_fixityOp)

# 57 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityOps = ((B_dData_dList.v_map v_fixityOpOf) v_builtinFixityDecls)

# 81 "Vuna/Compiler/Loader/Fixity.vuna"
let v_withFixitySpan = (fun (sp : Base_dSource.t_Span) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then e else ((Base_dDiag.v_withFallbackSpan sp) e)))

# 68 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_checkUniqueFixitiesGo = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (let sp = (Frontend_dAst.v_fixitySpan dtb__3) in (if ((B_dData_dList.v_memName (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp) v_builtinFixityOps) then ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_BuiltinFixity ((dtb__3).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp)) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_DuplicateFixity ((dtb__3).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_checkUniqueFixitiesGo dtb__4) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__3).Frontend_dAst.f_FixityDecl_fixityOp) 1) mc1))) (fun (tailDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__3, tailDecls))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Loader/Fixity.vuna"
let v_checkUniqueFixities = (fun (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((v_checkUniqueFixitiesGo ds) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 85 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_lookupDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if ((dtb__6).Frontend_dAst.f_FixityDecl_fixityOp = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__6)) else ((v_lookupDecl mc0) dtb__7))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixityDecl = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupDecl op) (t).f_FixityTable_fixityDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (B_dData_dMaybe.C_Maybe_Just (dtb__8))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_lookupDecl op) v_builtinFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixity = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupFixityDecl t) op) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__9).Frontend_dAst.f_FixityDecl_fixityLevel; B_dData_dPair.f_Pair_second = (dtb__9).Frontend_dAst.f_FixityDecl_fixityAssoc }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Loader/Fixity.vuna"
let v_unknownFixityMsg = (fun (op : string) -> ((Base_dDiagnostics_dRn.v_rnMsg (Base_dDiagnostics_dRn.C_RnErr_UnknownFixity (op))) (B_dData_dVec.C_Vec_VCons (op, B_dData_dVec.C_Vec_Nil))))

# 115 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOf = (fun (t : t_FixityTable) (c : t_ChainOp) -> (match ((v_lookupFixity t) (c).f_ChainOp_chainOp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (Base_dDiag.C_Check_OkC (dtb__10))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (c).f_ChainOp_chainIsBacktick then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 9; B_dData_dPair.f_Pair_second = 1 })) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan (c).f_ChainOp_chainRef))) (Base_dDiag.C_Check_ErrC ((v_unknownFixityMsg (c).f_ChainOp_chainOp)))))
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Loader/Fixity.vuna"
let v_infixTerm = (fun (t : t_FixityTable) (c : t_ChainOp) (lhs : Frontend_dAst.t_Expr) (rhs : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (if (if (v_renameMode t) then ((c).f_ChainOp_chainOp = ">>") else false) then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (">>=", sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), rhs, sp)), B_dData_dList.C_List_Nil)))), sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((c).f_ChainOp_chainOp, sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), sp))))

# 147 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainBacktick = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> ((Frontend_dCst.v_backtickOfFacts (t).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef e))))

# 136 "Vuna/Compiler/Loader/Fixity.vuna"
let v_isChainNode = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> (match ((Frontend_dCst.v_sectionOfFacts (t).f_FixityTable_fixFacts) (Frontend_dAst.v_exprSpan e)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut3 = e in (match nd_uscrut3 with
  | Frontend_dAst.C_Expr_EApp (dtb__12, dtb__13, dtb__14) -> (match dtb__12 with
  | Frontend_dAst.C_Expr_EVar (dtb__15, dtb__16) -> (match dtb__13 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dLexer.v_isSymbolName dtb__15) then true else ((v_chainBacktick t) e))
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

# 174 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_climb = (fun (fuel : int) (t : t_FixityTable) (minPrec : int) (lhs : Frontend_dAst.t_Expr) (rest : t_ChainOp B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "infix reorder fuel exhausted") else (match rest with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match ((v_fixityOf t) dtb__21) with
  | Base_dDiag.C_Check_ErrC (dtb__23) -> (Base_dDiag.C_Check_ErrC (dtb__23))
  | Base_dDiag.C_Check_OkC (dtb__24) -> (let level = (B_dData_dPair.v_firstOf dtb__24) in (let assoc = (B_dData_dPair.v_secondOf dtb__24) in (let nextMin = (if (assoc = 2) then level else (level + 1)) in (let rhs = (dtb__21).f_ChainOp_chainRhs in (if (level < minPrec) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = rest })) else ((Base_dCommon.v_bind ((((((v_climb (fuel - 1)) t) nextMin) rhs) dtb__22) sp)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = dtb__26 } -> ((((((v_climb (fuel - 1)) t) minPrec) (((((v_infixTerm t) dtb__21) lhs) dtb__25) sp)) dtb__26) sp)
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 215 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_foldApps = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (((v_foldApps (Frontend_dAst.C_Expr_EApp (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__27, B_dData_dList.C_List_Nil)), mc2))) dtb__28) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_reorderPattern = (fun (t : t_FixityTable) (pat : Frontend_dAst.t_Pat) -> (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__29, dtb__30) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PVar (dtb__29, dtb__30))))
  | Frontend_dAst.C_Pat_PWild (dtb__31) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PWild (dtb__31))))
  | Frontend_dAst.C_Pat_PInt (dtb__32, dtb__33) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PInt (dtb__32, dtb__33))))
  | Frontend_dAst.C_Pat_PStr (dtb__34, dtb__35) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PStr (dtb__34, dtb__35))))
  | Frontend_dAst.C_Pat_PCon (dtb__36, dtb__37, dtb__38) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern t) p))) dtb__37)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb__36, pats2, dtb__38))))))
  | Frontend_dAst.C_Pat_PAs (dtb__39, dtb__40, dtb__41) -> ((Base_dCommon.v_bind ((v_reorderPattern t) dtb__40)) (fun (inner2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb__39, inner2, dtb__41))))))
  | Frontend_dAst.C_Pat_PRecord (dtb__42, dtb__43, dtb__44) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> ((v_reorderRecPatField t) p))) dtb__43)) (fun (fs : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PRecord (dtb__42, fs, dtb__44))))))
  | _ -> failwith "DT: impossible branch"
))
# 412 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderRecPatField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__46)) (fun (p2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = p2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_collectChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EApp (dtb__47, dtb__48, dtb__49) -> (match dtb__47 with
  | Frontend_dAst.C_Expr_EVar (dtb__50, dtb__51) -> (match dtb__48 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | B_dData_dList.C_List_Nil -> (if ((v_isChainNode mc0) mc1) then ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__52)) (fun (l2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_chainOperand mc0) dtb__54)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = l2; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb__50; f_ChainOp_chainIsBacktick = ((v_chainBacktick mc0) mc1); f_ChainOp_chainRhs = (B_dData_dPair.v_firstOf p); f_ChainOp_chainRef = dtb__49 }, (B_dData_dPair.v_secondOf p))) })))))) else ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
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
# 164 "Vuna/Compiler/Loader/Fixity.vuna"
and v_chainOperand = (fun (t : t_FixityTable) (r : Frontend_dAst.t_Expr) -> (if (((Frontend_dCst.v_parenDepthOfFacts (t).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef r))) > 0) then ((Base_dCommon.v_bind ((v_reorderExpr t) r)) (fun (r2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = r2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))) else ((v_collectChain t) r)))
# 200 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderChain = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain t) e)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__56; B_dData_dPair.f_Pair_second = dtb__57 } -> ((Base_dCommon.v_bind ((((((v_climb ((2 * (B_dData_dList.v_length dtb__57)) + 2)) t) 0) dtb__56) dtb__57) (Frontend_dAst.v_exprRef e))) (fun (q : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__58; B_dData_dPair.f_Pair_second = dtb__59 } -> (if ((B_dData_dList.v_length dtb__59) = 0) then (Base_dDiag.C_Check_OkC (dtb__58)) else (Base_dDiag.v_icInternal "infix reorder left an operator"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 220 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderNonChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__60, dtb__61) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__60)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (ps, dtb__61))))))
  | Frontend_dAst.C_Expr_EDo (dtb__62, dtb__63) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_DoStmt) -> ((v_reorderDoStmt mc0) v))) dtb__62)) (fun (ss : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (ss, dtb__63))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__64, dtb__65, dtb__66) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__64)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__65)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__66))))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__67, dtb__68, dtb__69) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__68)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__67, fs, dtb__69))))))
  | Frontend_dAst.C_Expr_EField (dtb__70, dtb__71, dtb__72) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__70)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__71, dtb__72))))))
  | Frontend_dAst.C_Expr_EIf (dtb__73, dtb__74, dtb__75, dtb__76) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__73)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__74)) (fun (th2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__75)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, th2, el2, dtb__76))))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__77, dtb__78, dtb__79) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__77)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderAlts mc0) dtb__78)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__79))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__80, dtb__81, dtb__82, dtb__83) -> ((Base_dCommon.v_bind ((v_reorderBinds mc0) dtb__80)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__81)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__82, dtb__83))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__87)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__88)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__84, dtb__85, dtb__86, dom2, cod2, dtb__89))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__90, dtb__91, dtb__92) -> (match dtb__90 with
  | Frontend_dAst.C_Expr_ELam (dtb__93, dtb__94, dtb__95) -> (match ((Frontend_dCst.v_sectionOfFacts (mc0).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefSpan dtb__95)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__96) -> (if (v_renameMode mc0) then (((((v_reorderSectionApply mc0) dtb__96) dtb__94) dtb__91) dtb__92) else ((((v_reorderApp mc0) dtb__90) dtb__91) dtb__92))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_reorderApp mc0) dtb__90) dtb__91) dtb__92)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_reorderApp mc0) dtb__90) dtb__91) dtb__92)
)
  | Frontend_dAst.C_Expr_ELam (dtb__97, dtb__98, dtb__99) -> (match ((Frontend_dCst.v_sectionOfFacts (mc0).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefSpan dtb__99)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> (match dtb__98 with
  | Frontend_dAst.C_Expr_EApp (dtb__101, dtb__102, dtb__103) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__101)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__102)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__97, (Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__103)), dtb__99))))))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__98)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__97, b, dtb__99))))))
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__98)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__97, b, dtb__99))))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EFloat (dtb__104, dtb__105) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__104, dtb__105))))
  | Frontend_dAst.C_Expr_EStr (dtb__106, dtb__107) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__106, dtb__107))))
  | Frontend_dAst.C_Expr_EInt (dtb__108, dtb__109) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__108, dtb__109))))
  | Frontend_dAst.C_Expr_EVar (dtb__110, dtb__111) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__110, dtb__111))))
  | _ -> failwith "DT: impossible branch"
))
# 281 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderApp = (fun (t : t_FixityTable) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> ((Base_dCommon.v_bind ((v_reorderExpr t) fn)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr t) a))) args)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, sp)))))))))
# 287 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderSectionApply = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dCst.t_SectionShape) (mc2 : Frontend_dAst.t_Expr) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc4 : Frontend_dAst.t_NodeRef) -> (match mc2 with
  | Frontend_dAst.C_Expr_EApp (dtb__112, dtb__113, dtb__114) -> (match dtb__112 with
  | Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116) -> (match mc1 with
  | Frontend_dCst.C_SectionShape_SectionLeft (dtb__117) -> (let nd_uscrut11 = dtb__113 in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__121 with
  | B_dData_dList.C_List_Nil -> ((((((v_applySectionLeft mc0) dtb__115) dtb__116) dtb__120) mc3) mc4)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116)), dtb__113, dtb__114))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116)), dtb__113, dtb__114))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116)), dtb__113, dtb__114))) mc3) mc4)
))
  | Frontend_dCst.C_SectionShape_SectionRight (dtb__122) -> (let nd_uscrut11 = dtb__113 in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__124 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (match dtb__126 with
  | B_dData_dList.C_List_Nil -> ((((((v_applySectionRight mc0) dtb__115) dtb__116) dtb__123) mc3) mc4)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116)), dtb__113, dtb__114))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116)), dtb__113, dtb__114))) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116)), dtb__113, dtb__114))) mc3) mc4)
))
  | Frontend_dCst.C_SectionShape_SectionOp (dtb__127) -> ((((v_reorderApp mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__115, dtb__116)), dtb__113, dtb__114))) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_reorderApp mc0) mc2) mc3) mc4)
)
  | _ -> ((((v_reorderApp mc0) mc2) mc3) mc4)
))
# 301 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionLeft = (fun (mc0 : t_FixityTable) (mc1 : string) (mc2 : Frontend_dAst.t_NodeRef) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__128)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) mc3)) (fun (o2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__129)) (fun (r2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc1, mc2)), (B_dData_dList.C_List__x58__x58_ (a2, (B_dData_dList.C_List__x58__x58_ (o2, B_dData_dList.C_List_Nil)))), mc5))) r2) mc5)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 308 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionRight = (fun (mc0 : t_FixityTable) (mc1 : string) (mc2 : Frontend_dAst.t_NodeRef) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) mc3)) (fun (o2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__130)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__131)) (fun (r2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc1, mc2)), (B_dData_dList.C_List__x58__x58_ (o2, (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)))), mc5))) r2) mc5)))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 316 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderExpr = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EApp (dtb__132, dtb__133, dtb__134) -> (match dtb__132 with
  | Frontend_dAst.C_Expr_EVar (dtb__135, dtb__136) -> (match dtb__133 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (match dtb__138 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (match dtb__140 with
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
# 322 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderInterpParts = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (match dtb__141 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__143) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__142)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__143)), ps))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__144) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__144)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__142)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e2)), ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 333 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBinds = (fun (t : t_FixityTable) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Binding) -> ((v_reorderBind t) v))) binds))
# 336 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBind = (fun (t : t_FixityTable) (binding : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind ((v_reorderPattern t) (binding).Frontend_dAst.f_Binding_bindPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderBindingSig t) (binding).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((v_reorderBindingValue t) (binding).Frontend_dAst.f_Binding_bindValue)) (fun (v2 : Frontend_dAst.t_BindingValue) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Binding_bindPat = p2; Frontend_dAst.f_Binding_bindValue = v2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (binding).Frontend_dAst.f_Binding_bindRef })))))))))
# 343 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBindingValue = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_BindingValue) -> (match mc1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__145) -> ((Base_dCommon.v_bind ((v_reorderClauses mc0) dtb__145)) (fun (cs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (cs))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb__146) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__146)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (e2))))))
  | _ -> failwith "DT: impossible branch"
))
# 350 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBindingSig = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) (dtb__147).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__147).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 357 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderFields = (fun (t : t_FixityTable) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderField t) v))) fields))
# 360 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = dtb__149 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__149)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 364 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClauses = (fun (t : t_FixityTable) (clauses : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_LocalClause) -> ((v_reorderClause t) v))) clauses))
# 368 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlts = (fun (t : t_FixityTable) (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Alt) -> ((v_reorderAlt t) a))) alts))
# 371 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlt = (fun (t : t_FixityTable) (alt : Frontend_dAst.t_Alt) -> ((Base_dCommon.v_bind ((v_reorderPattern t) (alt).Frontend_dAst.f_Alt_altPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr t) (alt).Frontend_dAst.f_Alt_altBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Alt_altPat = p2; Frontend_dAst.f_Alt_altBody = b2; Frontend_dAst.f_Alt_altRef = (alt).Frontend_dAst.f_Alt_altRef })))))))
# 377 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClause = (fun (t : t_FixityTable) (clause : Frontend_dAst.t_LocalClause) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (pat : Frontend_dAst.t_Pat) -> ((v_reorderPattern t) pat))) (clause).Frontend_dAst.f_LocalClause_lcPats)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr t) (clause).Frontend_dAst.f_LocalClause_lcBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_LocalClause_lcPats = pats2; Frontend_dAst.f_LocalClause_lcBody = b2; Frontend_dAst.f_LocalClause_lcRef = (clause).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (clause).Frontend_dAst.f_LocalClause_lcHead })))))))
# 383 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderDoStmt = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__150, dtb__151) -> ((Base_dCommon.v_bind ((v_reorderBinds mc0) dtb__150)) (fun (b2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (b2, dtb__151))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__152, dtb__153) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__152)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (e2, dtb__153))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb__154, dtb__155, dtb__156) -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__154)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__155)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (p2, e2, dtb__156))))))))
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitParam = (fun (t : t_FixityTable) (p : Frontend_dAst.t_TraitParam) -> (match (p).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (p))
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> ((Base_dCommon.v_bind ((v_reorderExpr t) dtb__157)) (fun (k2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitParam_traitParamName = (p).Frontend_dAst.f_TraitParam_traitParamName; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (k2)) }))))
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderCtor = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__158; Frontend_dAst.f_Ctor_ctorType = dtb__159; Frontend_dAst.f_Ctor_ctorArity = dtb__160; Frontend_dAst.f_Ctor_ctorRef = dtb__161 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__159)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__158; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__160; Frontend_dAst.f_Ctor_ctorRef = dtb__161 }))))
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderRecordField = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__162; Frontend_dAst.f_Field_fieldType = dtb__163; Frontend_dAst.f_Field_fieldRef = dtb__164 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__163)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__162; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__164 }))))
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitMethod = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__165; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__166; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__167 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__166)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__165; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__167 }))))
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderInstanceMethodDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DFun (dtb__168, dtb__169, dtb__170, dtb__171) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__169)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__170)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__168, pats2, b2, dtb__171))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__172, dtb__173, dtb__174, dtb__175) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__173)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__174)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__172, ctx2, ty2, dtb__175))))))))
  | _ -> (Base_dDiag.C_Check_OkC (mc1))
))

# 417 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__176, dtb__177, dtb__178, dtb__179) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__176)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__177)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderInstanceMethodDecl mc0) v))) dtb__178)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, ms, dtb__179))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_TraitParam) -> ((v_reorderTraitParam mc0) p))) dtb__181)) (fun (ps : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__182)) (fun (ss : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_TraitMethod) -> ((v_reorderTraitMethod mc0) v))) dtb__183)) (fun (ms : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__180, ps, ss, ms, dtb__184))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Field) -> ((v_reorderRecordField mc0) v))) dtb__187)) (fun (fs : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__185, dtb__186, fs, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192))))))
  | Frontend_dAst.C_Decl_DFun (dtb__193, dtb__194, dtb__195, dtb__196) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__194)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__195)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__193, pats2, b2, dtb__196))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__197, dtb__198, dtb__199, dtb__200) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__198)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__199)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__197, ctx2, ty2, dtb__200))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__201, dtb__202, dtb__203, dtb__204) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__203)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__201, dtb__202, ty2, dtb__204))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__205, dtb__206, dtb__207) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__206)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__205, ty2, dtb__207))))))
  | Frontend_dAst.C_Decl_DData (dtb__208, dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__210)) (fun (k2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Frontend_dAst.t_Ctor) -> ((v_reorderCtor mc0) c))) dtb__211)) (fun (cs : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__208, dtb__209, k2, cs, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216))))))))
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderProgram = (fun (t : t_FixityTable) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderDecl t) v))) decls))

# 30 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityDecls = (fun (p : t_FixityTable) -> (match p with
  | { f_FixityTable_renameMode = dtb__217; f_FixityTable_fixityDecls = dtb__218; f_FixityTable_fixFacts = dtb__219 } -> dtb__218
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixFacts = (fun (p : t_FixityTable) -> (match p with
  | { f_FixityTable_renameMode = dtb__220; f_FixityTable_fixityDecls = dtb__221; f_FixityTable_fixFacts = dtb__222 } -> dtb__222
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainOp = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__223; f_ChainOp_chainIsBacktick = dtb__224; f_ChainOp_chainRhs = dtb__225; f_ChainOp_chainRef = dtb__226 } -> dtb__223
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainIsBacktick = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__227; f_ChainOp_chainIsBacktick = dtb__228; f_ChainOp_chainRhs = dtb__229; f_ChainOp_chainRef = dtb__230 } -> dtb__228
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainRhs = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__231; f_ChainOp_chainIsBacktick = dtb__232; f_ChainOp_chainRhs = dtb__233; f_ChainOp_chainRef = dtb__234 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainRef = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__235; f_ChainOp_chainIsBacktick = dtb__236; f_ChainOp_chainRhs = dtb__237; f_ChainOp_chainRef = dtb__238 } -> dtb__238
  | _ -> failwith "DT: impossible branch"
))
