open Vuna_runtime
type t_FixityTable = { f_FixityTable_renameMode : bool; f_FixityTable_fixityDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_FixityTable_fixFacts : Frontend_dCst.t_FixityFacts }
and t_ChainOp = { f_ChainOp_chainOp : string; f_ChainOp_chainIsBacktick : bool; f_ChainOp_chainRhs : Frontend_dAst.t_Expr; f_ChainOp_chainRef : Frontend_dAst.t_NodeRef }

# 35 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOf = (fun (facts : Frontend_dCst.t_FixityFacts) (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = true; f_FixityTable_fixityDecls = ds; f_FixityTable_fixFacts = facts })

# 39 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOps = (fun (facts : Frontend_dCst.t_FixityFacts) (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = false; f_FixityTable_fixityDecls = ds; f_FixityTable_fixFacts = facts })

# 43 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfCst = (fun cst -> (v_tableOf (Frontend_dCst.v_fixityFactsOf cst)))

# 46 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOpsCst = (fun cst -> (v_tableOfKeepOps (Frontend_dCst.v_fixityFactsOf cst)))

# 51 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityDecls = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "->"; Frontend_dAst.f_FixityDecl_fixityLevel = 1; Frontend_dAst.f_FixityDecl_fixityAssoc = 2; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "&&"; Frontend_dAst.f_FixityDecl_fixityLevel = 3; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "||"; Frontend_dAst.f_FixityDecl_fixityLevel = 2; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))))

# 58 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOpOf = (fun (d : Frontend_dAst.t_FixityDecl) -> (d).Frontend_dAst.f_FixityDecl_fixityOp)

# 55 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityOps = ((B_dData_dList.v_map v_fixityOpOf) v_builtinFixityDecls)

# 79 "Vuna/Compiler/Loader/Fixity.vuna"
let v_withFixitySpan = (fun (sp : Base_dSource.t_Span) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then e else ((Base_dDiag.v_withFallbackSpan sp) e)))

# 66 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_checkUniqueFixitiesGo = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (let sp = (Frontend_dAst.v_fixitySpan dtb__0) in (if ((B_dData_dList.v_memName (dtb__0).Frontend_dAst.f_FixityDecl_fixityOp) v_builtinFixityOps) then ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_BuiltinFixity ((dtb__0).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__0).Frontend_dAst.f_FixityDecl_fixityOp)) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__0).Frontend_dAst.f_FixityDecl_fixityOp) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_DuplicateFixity ((dtb__0).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__0).Frontend_dAst.f_FixityDecl_fixityOp))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_checkUniqueFixitiesGo dtb__1) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__0).Frontend_dAst.f_FixityDecl_fixityOp) 1) mc1))) (fun (tailDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__0, tailDecls))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Loader/Fixity.vuna"
let v_checkUniqueFixities = (fun (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((v_checkUniqueFixitiesGo ds) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 83 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_lookupDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if ((dtb__3).Frontend_dAst.f_FixityDecl_fixityOp = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__3)) else ((v_lookupDecl mc0) dtb__4))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixityDecl = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupDecl op) (t).f_FixityTable_fixityDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> (B_dData_dMaybe.C_Maybe_Just (dtb__5))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_lookupDecl op) v_builtinFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixity = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupFixityDecl t) op) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__6).Frontend_dAst.f_FixityDecl_fixityLevel; B_dData_dPair.f_Pair_second = (dtb__6).Frontend_dAst.f_FixityDecl_fixityAssoc }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Loader/Fixity.vuna"
let v_unknownFixityMsg = (fun (op : string) -> ((Base_dDiagnostics_dRn.v_rnMsg (Base_dDiagnostics_dRn.C_RnErr_UnknownFixity (op))) (B_dData_dVec.C_Vec__x58__x58_ (op, B_dData_dVec.C_Vec_Nil))))

# 113 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOf = (fun (t : t_FixityTable) (c : t_ChainOp) -> (match ((v_lookupFixity t) (c).f_ChainOp_chainOp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (Base_dDiag.C_Check_OkC (dtb__7))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (c).f_ChainOp_chainIsBacktick then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 9; B_dData_dPair.f_Pair_second = 1 })) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan (c).f_ChainOp_chainRef))) (Base_dDiag.C_Check_ErrC ((v_unknownFixityMsg (c).f_ChainOp_chainOp)))))
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainBacktick = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> ((Frontend_dCst.v_backtickOfFacts (t).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef e))))

# 134 "Vuna/Compiler/Loader/Fixity.vuna"
let v_isChainNode = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> (match ((Frontend_dCst.v_sectionOfFacts (t).f_FixityTable_fixFacts) (Frontend_dAst.v_exprSpan e)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut3 = e in (match nd_uscrut3 with
  | Frontend_dAst.C_Expr_EApp (dtb__9, dtb__10, dtb__11) -> (match dtb__9 with
  | Frontend_dAst.C_Expr_EVar (dtb__12, dtb__13) -> (match dtb__10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__17 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dLexer.v_isSymbolName dtb__12) then true else ((v_chainBacktick t) e))
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

# 149 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityFuel = 1073741824

# 228 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_foldApps = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (((v_foldApps (Frontend_dAst.C_Expr_EApp (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__18, B_dData_dList.C_List_Nil)), mc2))) dtb__19) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_reorderPatternF = (fun (fuel : int) (t : t_FixityTable) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Frontend_dAstWalk.v_mapPat ((v_reorderPatternF (fuel - 1)) t)) pat)))

# 317 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderPattern = (fun (t : t_FixityTable) (pat : Frontend_dAst.t_Pat) -> (((v_reorderPatternF v_fixityFuel) t) pat))

# 30 "Vuna/Compiler/Loader/Fixity.vuna"
let v_renameMode = (fun (p : t_FixityTable) -> (match p with
  | { f_FixityTable_renameMode = dtb__20; f_FixityTable_fixityDecls = dtb__21; f_FixityTable_fixFacts = dtb__22 } -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Loader/Fixity.vuna"
let v_infixTerm = (fun (t : t_FixityTable) (c : t_ChainOp) (lhs : Frontend_dAst.t_Expr) (rhs : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (if (if (v_renameMode t) then ((c).f_ChainOp_chainOp = ">>") else false) then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (">>=", sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), rhs, sp)), B_dData_dList.C_List_Nil)))), sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((c).f_ChainOp_chainOp, sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), sp))))

# 184 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_climb = (fun (fuel : int) (t : t_FixityTable) (minPrec : int) (lhs : Frontend_dAst.t_Expr) (rest : t_ChainOp B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "infix reorder fuel exhausted") else (match rest with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match ((v_fixityOf t) dtb__23) with
  | Base_dDiag.C_Check_ErrC (dtb__25) -> (Base_dDiag.C_Check_ErrC (dtb__25))
  | Base_dDiag.C_Check_OkC (dtb__26) -> (let level = (B_dData_dPair.v_firstOf dtb__26) in (let assoc = (B_dData_dPair.v_secondOf dtb__26) in (let nextMin = (if (assoc = 2) then level else (level + 1)) in (let rhs = (dtb__23).f_ChainOp_chainRhs in (if (level < minPrec) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = rest })) else ((Base_dCommon.v_bind ((((((v_climb (fuel - 1)) t) nextMin) rhs) dtb__24) sp)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__27; B_dData_dPair.f_Pair_second = dtb__28 } -> ((((((v_climb (fuel - 1)) t) minPrec) (((((v_infixTerm t) dtb__23) lhs) dtb__27) sp)) dtb__28) sp)
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 154 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_collectChainF = (fun (mc0 : int) (mc1 : t_FixityTable) (mc2 : Frontend_dAst.t_Expr) -> (match mc2 with
  | Frontend_dAst.C_Expr_EApp (dtb__29, dtb__30, dtb__31) -> (match dtb__29 with
  | Frontend_dAst.C_Expr_EVar (dtb__32, dtb__33) -> (match dtb__30 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (match dtb__35 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (if ((v_isChainNode mc1) mc2) then ((Base_dCommon.v_bind (((v_reorderExprF (mc0 - 1)) mc1) dtb__34)) (fun (l2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_chainOperandF (mc0 - 1)) mc1) dtb__36)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = l2; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb__32; f_ChainOp_chainIsBacktick = ((v_chainBacktick mc1) mc2); f_ChainOp_chainRhs = (B_dData_dPair.v_firstOf p); f_ChainOp_chainRef = dtb__31 }, (B_dData_dPair.v_secondOf p))) })))))) else ((Base_dCommon.v_bind (((v_reorderNonChainF (mc0 - 1)) mc1) mc2)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_reorderNonChainF (mc0 - 1)) mc1) mc2)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_reorderNonChainF (mc0 - 1)) mc1) mc2)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_reorderNonChainF (mc0 - 1)) mc1) mc2)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_reorderNonChainF (mc0 - 1)) mc1) mc2)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_reorderNonChainF (mc0 - 1)) mc1) mc2)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))))
))
# 172 "Vuna/Compiler/Loader/Fixity.vuna"
and v_chainOperandF = (fun (fuel : int) (t : t_FixityTable) (r : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (if (((Frontend_dCst.v_parenDepthOfFacts (t).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef r))) > 0) then ((Base_dCommon.v_bind (((v_reorderExprF (fuel - 1)) t) r)) (fun (r2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = r2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))) else (((v_collectChainF (fuel - 1)) t) r))))
# 210 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderChainF = (fun (fuel : int) (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_collectChainF (fuel - 1)) t) e)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__38; B_dData_dPair.f_Pair_second = dtb__39 } -> ((Base_dCommon.v_bind ((((((v_climb ((2 * (B_dData_dList.v_length dtb__39)) + 2)) t) 0) dtb__38) dtb__39) (Frontend_dAst.v_exprRef e))) (fun (q : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> (if ((B_dData_dList.v_length dtb__41) = 0) then (Base_dDiag.C_Check_OkC (dtb__40)) else (Base_dDiag.v_icInternal "infix reorder left an operator"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 234 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderNonChainF = (fun (mc0 : int) (mc1 : t_FixityTable) (mc2 : Frontend_dAst.t_Expr) -> (match mc2 with
  | Frontend_dAst.C_Expr_EApp (dtb__42, dtb__43, dtb__44) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (match dtb__42 with
  | Frontend_dAst.C_Expr_ELam (dtb__45, dtb__46, dtb__47) -> (match ((Frontend_dCst.v_sectionOfFacts (mc1).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefSpan dtb__47)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> (if (v_renameMode mc1) then ((((((v_reorderSectionApplyF (mc0 - 1)) mc1) dtb__48) dtb__46) dtb__43) dtb__44) else (((((v_reorderAppF (mc0 - 1)) mc1) dtb__42) dtb__43) dtb__44))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_reorderAppF (mc0 - 1)) mc1) dtb__42) dtb__43) dtb__44)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_reorderAppF (mc0 - 1)) mc1) dtb__42) dtb__43) dtb__44)
))
  | Frontend_dAst.C_Expr_ELam (dtb__49, dtb__50, dtb__51) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (match ((Frontend_dCst.v_sectionOfFacts (mc1).f_FixityTable_fixFacts) (Frontend_dAst.v_nodeRefSpan dtb__51)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> ((Base_dCommon.v_bind ((Frontend_dAstWalk.v_mapExpr ((v_reorderExprF (mc0 - 1)) mc1)) dtb__50)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__49, b, dtb__51))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((v_reorderExprF (mc0 - 1)) mc1) dtb__50)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__49, b, dtb__51))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((Frontend_dAstWalk.v_mapExprPat ((v_reorderExprF (mc0 - 1)) mc1)) ((v_reorderPatternF (mc0 - 1)) mc1)) mc2))
))
# 260 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAppF = (fun (fuel : int) (t : t_FixityTable) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((Frontend_dAstWalk.v_mapExprPat ((v_reorderExprF (fuel - 1)) t)) ((v_reorderPatternF (fuel - 1)) t)) (Frontend_dAst.C_Expr_EApp (fn, args, sp)))))
# 267 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderSectionApplyF = (fun (mc0 : int) (mc1 : t_FixityTable) (mc2 : Frontend_dCst.t_SectionShape) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc3 with
  | Frontend_dAst.C_Expr_EApp (dtb__53, dtb__54, dtb__55) -> (match dtb__53 with
  | Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (match mc2 with
  | Frontend_dCst.C_SectionShape_SectionLeft (dtb__58) -> (let nd_uscrut12 = dtb__54 in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match dtb__62 with
  | B_dData_dList.C_List_Nil -> (((((((v_applySectionLeftF (mc0 - 1)) mc1) dtb__56) dtb__57) dtb__61) mc4) mc5)
  | _ -> (((((v_reorderAppF (mc0 - 1)) mc1) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57)), dtb__54, dtb__55))) mc4) mc5)
)
  | _ -> (((((v_reorderAppF (mc0 - 1)) mc1) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57)), dtb__54, dtb__55))) mc4) mc5)
)
  | _ -> (((((v_reorderAppF (mc0 - 1)) mc1) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57)), dtb__54, dtb__55))) mc4) mc5)
))
  | Frontend_dCst.C_SectionShape_SectionRight (dtb__63) -> (let nd_uscrut12 = dtb__54 in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__67 with
  | B_dData_dList.C_List_Nil -> (((((((v_applySectionRightF (mc0 - 1)) mc1) dtb__56) dtb__57) dtb__64) mc4) mc5)
  | _ -> (((((v_reorderAppF (mc0 - 1)) mc1) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57)), dtb__54, dtb__55))) mc4) mc5)
)
  | _ -> (((((v_reorderAppF (mc0 - 1)) mc1) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57)), dtb__54, dtb__55))) mc4) mc5)
)
  | _ -> (((((v_reorderAppF (mc0 - 1)) mc1) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57)), dtb__54, dtb__55))) mc4) mc5)
))
  | Frontend_dCst.C_SectionShape_SectionOp (dtb__68) -> (((((v_reorderAppF (mc0 - 1)) mc1) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__56, dtb__57)), dtb__54, dtb__55))) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((((v_reorderAppF (mc0 - 1)) mc1) mc3) mc4) mc5))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((((v_reorderAppF (mc0 - 1)) mc1) mc3) mc4) mc5))
))
# 285 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionLeftF = (fun (mc0 : int) (mc1 : t_FixityTable) (mc2 : string) (mc3 : Frontend_dAst.t_NodeRef) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc6 : Frontend_dAst.t_NodeRef) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_reorderExprF (mc0 - 1)) mc1) dtb__69)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_reorderExprF (mc0 - 1)) mc1) mc4)) (fun (o2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> (((v_reorderExprF (mc0 - 1)) mc1) x))) dtb__70)) (fun (r2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc2, mc3)), (B_dData_dList.C_List__x58__x58_ (a2, (B_dData_dList.C_List__x58__x58_ (o2, B_dData_dList.C_List_Nil)))), mc6))) r2) mc6))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 295 "Vuna/Compiler/Loader/Fixity.vuna"
and v_applySectionRightF = (fun (mc0 : int) (mc1 : t_FixityTable) (mc2 : string) (mc3 : Frontend_dAst.t_NodeRef) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc6 : Frontend_dAst.t_NodeRef) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else ((Base_dCommon.v_bind (((v_reorderExprF (mc0 - 1)) mc1) mc4)) (fun (o2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_reorderExprF (mc0 - 1)) mc1) dtb__71)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> (((v_reorderExprF (mc0 - 1)) mc1) x))) dtb__72)) (fun (r2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc2, mc3)), (B_dData_dList.C_List__x58__x58_ (o2, (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)))), mc6))) r2) mc6))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | _ -> failwith "DT: impossible branch"
))
# 309 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderExprF = (fun (mc0 : int) (mc1 : t_FixityTable) (mc2 : Frontend_dAst.t_Expr) -> (match mc2 with
  | Frontend_dAst.C_Expr_EApp (dtb__73, dtb__74, dtb__75) -> (match dtb__73 with
  | Frontend_dAst.C_Expr_EVar (dtb__76, dtb__77) -> (match dtb__74 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__79 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (if ((v_isChainNode mc1) mc2) then (((v_reorderChainF (mc0 - 1)) mc1) mc2) else (((v_reorderNonChainF (mc0 - 1)) mc1) mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((v_reorderNonChainF (mc0 - 1)) mc1) mc2))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((v_reorderNonChainF (mc0 - 1)) mc1) mc2))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((v_reorderNonChainF (mc0 - 1)) mc1) mc2))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((v_reorderNonChainF (mc0 - 1)) mc1) mc2))
)
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((v_reorderNonChainF (mc0 - 1)) mc1) mc2))
))

# 306 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderExpr = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> (((v_reorderExprF v_fixityFuel) t) e))

# 337 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitParamF = (fun (fuel : int) (t : t_FixityTable) (p : Frontend_dAst.t_TraitParam) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (match (p).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (p))
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> ((Base_dCommon.v_bind (((v_reorderExprF (fuel - 1)) t) dtb__82)) (fun (k2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitParam_traitParamName = (p).Frontend_dAst.f_TraitParam_traitParamName; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (k2)) }))))
  | _ -> failwith "DT: impossible branch"
)))

# 346 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderInstanceMethodDeclF = (fun (mc0 : int) (mc1 : t_FixityTable) (mc2 : Frontend_dAst.t_Decl) -> (match mc2 with
  | Frontend_dAst.C_Decl_DFun (dtb__83, dtb__84, dtb__85, dtb__86) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((((Frontend_dAstWalk.v_mapDeclWith ((v_reorderExprF (mc0 - 1)) mc1)) ((v_reorderPatternF (mc0 - 1)) mc1)) (fun (d : Frontend_dAst.t_Decl) -> (Base_dDiag.C_Check_OkC (d)))) ((v_reorderTraitParamF (mc0 - 1)) mc1)) (Frontend_dAst.C_Decl_DFun (dtb__83, dtb__84, dtb__85, dtb__86))))
  | Frontend_dAst.C_Decl_DSig (dtb__87, dtb__88, dtb__89, dtb__90) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((((Frontend_dAstWalk.v_mapDeclWith ((v_reorderExprF (mc0 - 1)) mc1)) ((v_reorderPatternF (mc0 - 1)) mc1)) (fun (d : Frontend_dAst.t_Decl) -> (Base_dDiag.C_Check_OkC (d)))) ((v_reorderTraitParamF (mc0 - 1)) mc1)) (Frontend_dAst.C_Decl_DSig (dtb__87, dtb__88, dtb__89, dtb__90))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_declSpan mc2))) (Base_dDiag.v_icInternal "instance body has a declaration that is neither a signature nor a function"))
))

# 324 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderDeclF = (fun (fuel : int) (t : t_FixityTable) (d : Frontend_dAst.t_Decl) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "infix reorder") else (((((Frontend_dAstWalk.v_mapDeclWith ((v_reorderExprF (fuel - 1)) t)) ((v_reorderPatternF (fuel - 1)) t)) ((v_reorderInstanceMethodDeclF (fuel - 1)) t)) ((v_reorderTraitParamF (fuel - 1)) t)) d)))

# 374 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderProgram = (fun (t : t_FixityTable) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Frontend_dAstWalk.v_mapDeclsWith ((v_reorderDeclF v_fixityFuel) t)) decls))

# 31 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityDecls = (fun (p : t_FixityTable) -> (match p with
  | { f_FixityTable_renameMode = dtb__91; f_FixityTable_fixityDecls = dtb__92; f_FixityTable_fixFacts = dtb__93 } -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixFacts = (fun (p : t_FixityTable) -> (match p with
  | { f_FixityTable_renameMode = dtb__94; f_FixityTable_fixityDecls = dtb__95; f_FixityTable_fixFacts = dtb__96 } -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainOp = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__97; f_ChainOp_chainIsBacktick = dtb__98; f_ChainOp_chainRhs = dtb__99; f_ChainOp_chainRef = dtb__100 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainIsBacktick = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__101; f_ChainOp_chainIsBacktick = dtb__102; f_ChainOp_chainRhs = dtb__103; f_ChainOp_chainRef = dtb__104 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainRhs = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__105; f_ChainOp_chainIsBacktick = dtb__106; f_ChainOp_chainRhs = dtb__107; f_ChainOp_chainRef = dtb__108 } -> dtb__107
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Loader/Fixity.vuna"
let v_chainRef = (fun (p : t_ChainOp) -> (match p with
  | { f_ChainOp_chainOp = dtb__109; f_ChainOp_chainIsBacktick = dtb__110; f_ChainOp_chainRhs = dtb__111; f_ChainOp_chainRef = dtb__112 } -> dtb__112
  | _ -> failwith "DT: impossible branch"
))
