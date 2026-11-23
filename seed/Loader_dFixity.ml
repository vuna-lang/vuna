open Vuna_runtime
type t_FixityTable = { f_FixityTable_renameMode : bool; f_FixityTable_fixityDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List }
and t_ChainOp = { f_ChainOp_chainOp : string; f_ChainOp_chainIsBacktick : bool; f_ChainOp_chainRhs : Frontend_dAst.t_Expr; f_ChainOp_chainRef : Frontend_dAst.t_NodeRef }

# 28 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOf = (fun (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = true; f_FixityTable_fixityDecls = ds })

# 32 "Vuna/Compiler/Loader/Fixity.vuna"
let v_tableOfKeepOps = (fun (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> { f_FixityTable_renameMode = false; f_FixityTable_fixityDecls = ds })

# 35 "Vuna/Compiler/Loader/Fixity.vuna"
let v_renameMode = (fun (mc0 : t_FixityTable) -> (match mc0 with
  | { f_FixityTable_renameMode = dtb__0; f_FixityTable_fixityDecls = dtb__1 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityDecls = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "->"; Frontend_dAst.f_FixityDecl_fixityLevel = 1; Frontend_dAst.f_FixityDecl_fixityAssoc = 2; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "&&"; Frontend_dAst.f_FixityDecl_fixityLevel = 3; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "||"; Frontend_dAst.f_FixityDecl_fixityLevel = 2; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixityRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))))

# 47 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOpOf = (fun (d : Frontend_dAst.t_FixityDecl) -> (d).Frontend_dAst.f_FixityDecl_fixityOp)

# 44 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityOps = ((B_dData_dList.v_map v_fixityOpOf) v_builtinFixityDecls)

# 68 "Vuna/Compiler/Loader/Fixity.vuna"
let v_withFixitySpan = (fun (sp : Base_dSource.t_Span) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile sp) = "") then e else ((Base_dDiag.v_withFallbackSpan sp) e)))

# 55 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_checkUniqueFixitiesGo = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (let sp = (Frontend_dAst.v_fixitySpan dtb__2) in (if ((B_dData_dList.v_memName (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp) v_builtinFixityOps) then ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_BuiltinFixity ((dtb__2).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp)) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> ((Base_dDiag.v_onErrDiag (v_withFixitySpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_DuplicateFixity ((dtb__2).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_checkUniqueFixitiesGo dtb__3) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp) 1) mc1))) (fun (tailDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__2, tailDecls))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Loader/Fixity.vuna"
let v_checkUniqueFixities = (fun (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((v_checkUniqueFixitiesGo ds) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 72 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_lookupDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if ((dtb__5).Frontend_dAst.f_FixityDecl_fixityOp = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__5)) else ((v_lookupDecl mc0) dtb__6))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixityDecl = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupDecl op) (t).f_FixityTable_fixityDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (B_dData_dMaybe.C_Maybe_Just (dtb__7))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_lookupDecl op) v_builtinFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixity = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupFixityDecl t) op) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__8).Frontend_dAst.f_FixityDecl_fixityLevel; B_dData_dPair.f_Pair_second = (dtb__8).Frontend_dAst.f_FixityDecl_fixityAssoc }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Loader/Fixity.vuna"
let v_unknownFixityMsg = (fun (op : string) -> ((Base_dDiagnostics_dRn.v_rnMsg (Base_dDiagnostics_dRn.C_RnErr_UnknownFixity (op))) (B_dData_dVec.C_Vec_VCons (op, B_dData_dVec.C_Vec_Nil))))

# 102 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOf = (fun (t : t_FixityTable) (c : t_ChainOp) -> (match ((v_lookupFixity t) (c).f_ChainOp_chainOp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (Base_dDiag.C_Check_OkC (dtb__9))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (c).f_ChainOp_chainIsBacktick then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 9; B_dData_dPair.f_Pair_second = 1 })) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan (c).f_ChainOp_chainRef))) (Base_dDiag.C_Check_ErrC ((v_unknownFixityMsg (c).f_ChainOp_chainOp)))))
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Loader/Fixity.vuna"
let v_infixTerm = (fun (t : t_FixityTable) (c : t_ChainOp) (lhs : Frontend_dAst.t_Expr) (rhs : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (if (v_renameMode t) then (if ((c).f_ChainOp_chainOp = ">>") then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (">>=", sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), rhs, sp)), B_dData_dList.C_List_Nil)))), sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((c).f_ChainOp_chainOp, sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), sp))) else (if (c).f_ChainOp_chainIsBacktick then (Frontend_dAst.C_Expr_EBacktick ((c).f_ChainOp_chainOp, lhs, rhs, sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((c).f_ChainOp_chainOp, sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), sp)))))

# 152 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_climb = (fun (fuel : int) (t : t_FixityTable) (minPrec : int) (lhs : Frontend_dAst.t_Expr) (rest : t_ChainOp B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "infix reorder fuel exhausted") else (match rest with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match ((v_fixityOf t) dtb__10) with
  | Base_dDiag.C_Check_ErrC (dtb__12) -> (Base_dDiag.C_Check_ErrC (dtb__12))
  | Base_dDiag.C_Check_OkC (dtb__13) -> (let level = (B_dData_dPair.v_firstOf dtb__13) in (let assoc = (B_dData_dPair.v_secondOf dtb__13) in (let nextMin = (if (assoc = 2) then level else (level + 1)) in (let rhs = (dtb__10).f_ChainOp_chainRhs in (if (level < minPrec) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = rest })) else ((Base_dCommon.v_bind ((((((v_climb (fuel - 1)) t) nextMin) rhs) dtb__11) sp)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = dtb__15 } -> ((((((v_climb (fuel - 1)) t) minPrec) (((((v_infixTerm t) dtb__10) lhs) dtb__14) sp)) dtb__15) sp)
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 193 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_foldApps = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (((v_foldApps (Frontend_dAst.C_Expr_EApp (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__16, B_dData_dList.C_List_Nil)), mc2))) dtb__17) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_reorderPattern = (fun (t : t_FixityTable) (pat : Frontend_dAst.t_Pat) -> (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__18, dtb__19) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PVar (dtb__18, dtb__19))))
  | Frontend_dAst.C_Pat_PWild (dtb__20) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PWild (dtb__20))))
  | Frontend_dAst.C_Pat_PInt (dtb__21, dtb__22) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PInt (dtb__21, dtb__22))))
  | Frontend_dAst.C_Pat_PStr (dtb__23, dtb__24) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PStr (dtb__23, dtb__24))))
  | Frontend_dAst.C_Pat_PCon (dtb__25, dtb__26, dtb__27) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern t) p))) dtb__26)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb__25, pats2, dtb__27))))))
  | Frontend_dAst.C_Pat_PAs (dtb__28, dtb__29, dtb__30) -> ((Base_dCommon.v_bind ((v_reorderPattern t) dtb__29)) (fun (inner2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb__28, inner2, dtb__30))))))
  | Frontend_dAst.C_Pat_PRecord (dtb__31, dtb__32, dtb__33) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> ((v_reorderRecPatField t) p))) dtb__32)) (fun (fs : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PRecord (dtb__31, fs, dtb__33))))))
  | _ -> failwith "DT: impossible branch"
))
# 381 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderRecPatField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__34; B_dData_dPair.f_Pair_second = dtb__35 } -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__35)) (fun (p2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__34; B_dData_dPair.f_Pair_second = p2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_collectChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EBacktick (dtb__36, dtb__37, dtb__38, dtb__39) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__37)) (fun (l2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain mc0) dtb__38)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = l2; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb__36; f_ChainOp_chainIsBacktick = true; f_ChainOp_chainRhs = dtb__40; f_ChainOp_chainRef = dtb__39 }, dtb__41)) }))
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dAst.C_Expr_EInfix (dtb__42, dtb__43, dtb__44, dtb__45) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__43)) (fun (l2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain mc0) dtb__44)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = l2; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb__42; f_ChainOp_chainIsBacktick = false; f_ChainOp_chainRhs = dtb__46; f_ChainOp_chainRef = dtb__45 }, dtb__47)) }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
))
# 178 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderChain = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain t) e)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> ((Base_dCommon.v_bind ((((((v_climb ((2 * (B_dData_dList.v_length dtb__49)) + 2)) t) 0) dtb__48) dtb__49) (Frontend_dAst.v_exprRef e))) (fun (q : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (if ((B_dData_dList.v_length dtb__51) = 0) then (Base_dDiag.C_Check_OkC (dtb__50)) else (Base_dDiag.v_icInternal "infix reorder left an operator"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 198 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderNonChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__52, dtb__53, dtb__54) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__53)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (dtb__52, ps, dtb__54))))))
  | Frontend_dAst.C_Expr_EAnn (dtb__55, dtb__56, dtb__57) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__55)) (fun (i2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__56)) (fun (t2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EAnn (i2, t2, dtb__57))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__58, dtb__59) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_DoStmt) -> ((v_reorderDoStmt mc0) v))) dtb__58)) (fun (ss : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (ss, dtb__59))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__60, dtb__61, dtb__62) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__60)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__61)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__62))))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__63, dtb__64, dtb__65) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__64)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__63, fs, dtb__65))))))
  | Frontend_dAst.C_Expr_EField (dtb__66, dtb__67, dtb__68) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__66)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__67, dtb__68))))))
  | Frontend_dAst.C_Expr_EIf (dtb__69, dtb__70, dtb__71, dtb__72) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__69)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__70)) (fun (th2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__71)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, th2, el2, dtb__72))))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__73, dtb__74, dtb__75) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__73)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderAlts mc0) dtb__74)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__75))))))))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__76, dtb__77) -> ((Base_dCommon.v_bind ((v_reorderClauses mc0) dtb__76)) (fun (cs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELocalFun (cs, dtb__77))))))
  | Frontend_dAst.C_Expr_ELet (dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dCommon.v_bind ((v_reorderBinds mc0) dtb__78)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__79)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__80, dtb__81))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__85)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__86)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__82, dtb__83, dtb__84, dom2, cod2, dtb__87))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__88, dtb__89, dtb__90) -> (match dtb__88 with
  | Frontend_dAst.C_Expr_EParen (dtb__91, dtb__92) -> (match dtb__91 with
  | Frontend_dAst.C_Expr_ESectR (dtb__93, dtb__94, dtb__95) -> (if (v_renameMode mc0) then (match dtb__89 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__93)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__96)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__97)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__94, dtb__90)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)))), dtb__90))) rest2) dtb__90)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__93)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__89)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EParen ((Frontend_dAst.C_Expr_ESectR (e2, dtb__94, dtb__95)), dtb__92)), args2, dtb__90)))))))))
  | Frontend_dAst.C_Expr_ESectL (dtb__98, dtb__99, dtb__100) -> (if (v_renameMode mc0) then (match dtb__89 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__101)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__99)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__102)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__98, dtb__90)), (B_dData_dList.C_List__x58__x58_ (a2, (B_dData_dList.C_List__x58__x58_ (e2, B_dData_dList.C_List_Nil)))), dtb__90))) rest2) dtb__90)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__99)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__89)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EParen ((Frontend_dAst.C_Expr_ESectL (dtb__98, e2, dtb__100)), dtb__92)), args2, dtb__90)))))))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__88)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__89)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__90))))))))
)
  | Frontend_dAst.C_Expr_ESectR (dtb__103, dtb__104, dtb__105) -> (if (v_renameMode mc0) then (match dtb__89 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__103)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__106)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__107)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__104, dtb__90)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)))), dtb__90))) rest2) dtb__90)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__103)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__89)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_ESectR (e2, dtb__104, dtb__105)), args2, dtb__90)))))))))
  | Frontend_dAst.C_Expr_ESectL (dtb__108, dtb__109, dtb__110) -> (if (v_renameMode mc0) then (match dtb__89 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__111)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__109)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__112)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__108, dtb__90)), (B_dData_dList.C_List__x58__x58_ (a2, (B_dData_dList.C_List__x58__x58_ (e2, B_dData_dList.C_List_Nil)))), dtb__90))) rest2) dtb__90)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__109)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__89)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_ESectL (dtb__108, e2, dtb__110)), args2, dtb__90)))))))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__88)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__89)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__90))))))))
)
  | Frontend_dAst.C_Expr_ELam (dtb__113, dtb__114, dtb__115) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__114)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__113, b, dtb__115))))))
  | Frontend_dAst.C_Expr_EParen (dtb__116, dtb__117) -> ((v_reorderExpr mc0) dtb__116)
  | Frontend_dAst.C_Expr_ESectR (dtb__118, dtb__119, dtb__120) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__118)) (fun (e2 : Frontend_dAst.t_Expr) -> (if (v_renameMode mc0) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__120) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__119, dtb__120)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, dtb__120)), B_dData_dList.C_List_Nil)))), dtb__120)), dtb__120)))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectR (e2, dtb__119, dtb__120)))))))
  | Frontend_dAst.C_Expr_ESectL (dtb__121, dtb__122, dtb__123) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__122)) (fun (e2 : Frontend_dAst.t_Expr) -> (if (v_renameMode mc0) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__123) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__121, dtb__123)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, dtb__123)), (B_dData_dList.C_List__x58__x58_ (e2, B_dData_dList.C_List_Nil)))), dtb__123)), dtb__123)))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectL (dtb__121, e2, dtb__123)))))))
  | Frontend_dAst.C_Expr_ESectOp (dtb__124, dtb__125) -> (if (v_renameMode mc0) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__124, dtb__125)))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectOp (dtb__124, dtb__125)))))
  | Frontend_dAst.C_Expr_EFloat (dtb__126, dtb__127) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__126, dtb__127))))
  | Frontend_dAst.C_Expr_EStr (dtb__128, dtb__129) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__128, dtb__129))))
  | Frontend_dAst.C_Expr_EInt (dtb__130, dtb__131) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__130, dtb__131))))
  | Frontend_dAst.C_Expr_EVar (dtb__132, dtb__133) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__132, dtb__133))))
  | _ -> (Base_dDiag.v_icInternal "Fixity.reorderNonChain: unexpected expression form")
))
# 292 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderExpr = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EBacktick (dtb__134, dtb__135, dtb__136, dtb__137) -> ((v_reorderChain mc0) (Frontend_dAst.C_Expr_EBacktick (dtb__134, dtb__135, dtb__136, dtb__137)))
  | Frontend_dAst.C_Expr_EInfix (dtb__138, dtb__139, dtb__140, dtb__141) -> ((v_reorderChain mc0) (Frontend_dAst.C_Expr_EInfix (dtb__138, dtb__139, dtb__140, dtb__141)))
  | _ -> ((v_reorderNonChain mc0) mc1)
))
# 298 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderInterpParts = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (match dtb__142 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__144) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__143)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__144)), ps))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__145) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__145)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__143)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e2)), ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 309 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBinds = (fun (t : t_FixityTable) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Binding) -> ((v_reorderBind t) v))) binds))
# 312 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBind = (fun (t : t_FixityTable) (binding : Frontend_dAst.t_Binding) -> ((Base_dCommon.v_bind ((v_reorderPattern t) (binding).Frontend_dAst.f_Binding_bindPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderBindingSig t) (binding).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((v_reorderExpr t) (binding).Frontend_dAst.f_Binding_bindValue)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Binding_bindPat = p2; Frontend_dAst.f_Binding_bindValue = v2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (binding).Frontend_dAst.f_Binding_bindRef })))))))))
# 319 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBindingSig = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) (dtb__146).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__146).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 326 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderFields = (fun (t : t_FixityTable) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderField t) v))) fields))
# 329 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__148)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 333 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClauses = (fun (t : t_FixityTable) (clauses : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_LocalClause) -> ((v_reorderClause t) v))) clauses))
# 337 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlts = (fun (t : t_FixityTable) (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Alt) -> ((v_reorderAlt t) a))) alts))
# 340 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlt = (fun (t : t_FixityTable) (alt : Frontend_dAst.t_Alt) -> ((Base_dCommon.v_bind ((v_reorderPattern t) (alt).Frontend_dAst.f_Alt_altPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr t) (alt).Frontend_dAst.f_Alt_altBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Alt_altPat = p2; Frontend_dAst.f_Alt_altBody = b2; Frontend_dAst.f_Alt_altRef = (alt).Frontend_dAst.f_Alt_altRef })))))))
# 346 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClause = (fun (t : t_FixityTable) (clause : Frontend_dAst.t_LocalClause) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (pat : Frontend_dAst.t_Pat) -> ((v_reorderPattern t) pat))) (clause).Frontend_dAst.f_LocalClause_lcPats)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr t) (clause).Frontend_dAst.f_LocalClause_lcBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_LocalClause_lcPats = pats2; Frontend_dAst.f_LocalClause_lcBody = b2; Frontend_dAst.f_LocalClause_lcRef = (clause).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (clause).Frontend_dAst.f_LocalClause_lcHead })))))))
# 352 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderDoStmt = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__149, dtb__150) -> ((Base_dCommon.v_bind ((v_reorderBinds mc0) dtb__149)) (fun (b2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (b2, dtb__150))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__151, dtb__152) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__151)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (e2, dtb__152))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb__153, dtb__154, dtb__155) -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__153)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__154)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (p2, e2, dtb__155))))))))
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitParam = (fun (t : t_FixityTable) (p : Frontend_dAst.t_TraitParam) -> (match (p).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (p))
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> ((Base_dCommon.v_bind ((v_reorderExpr t) dtb__156)) (fun (k2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitParam_traitParamName = (p).Frontend_dAst.f_TraitParam_traitParamName; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (k2)) }))))
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderCtor = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__157; Frontend_dAst.f_Ctor_ctorType = dtb__158; Frontend_dAst.f_Ctor_ctorArity = dtb__159; Frontend_dAst.f_Ctor_ctorRef = dtb__160 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__158)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__157; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__159; Frontend_dAst.f_Ctor_ctorRef = dtb__160 }))))
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderRecordField = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__161; Frontend_dAst.f_Field_fieldType = dtb__162; Frontend_dAst.f_Field_fieldRef = dtb__163 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__162)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__161; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__163 }))))
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitMethod = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__164; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__165; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__166 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__165)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__164; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__166 }))))
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderInstanceMethodDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DFun (dtb__167, dtb__168, dtb__169, dtb__170) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__168)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__169)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__167, pats2, b2, dtb__170))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__171, dtb__172, dtb__173, dtb__174) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__172)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__173)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__171, ctx2, ty2, dtb__174))))))))
  | _ -> (Base_dDiag.C_Check_OkC (mc1))
))

# 386 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__175, dtb__176, dtb__177, dtb__178) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__175)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__176)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderInstanceMethodDecl mc0) v))) dtb__177)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, ms, dtb__178))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_TraitParam) -> ((v_reorderTraitParam mc0) p))) dtb__180)) (fun (ps : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__181)) (fun (ss : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_TraitMethod) -> ((v_reorderTraitMethod mc0) v))) dtb__182)) (fun (ms : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__179, ps, ss, ms, dtb__183))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Field) -> ((v_reorderRecordField mc0) v))) dtb__186)) (fun (fs : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__184, dtb__185, fs, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191))))))
  | Frontend_dAst.C_Decl_DFun (dtb__192, dtb__193, dtb__194, dtb__195) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__193)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__194)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__192, pats2, b2, dtb__195))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__196, dtb__197, dtb__198, dtb__199) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__197)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__198)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__196, ctx2, ty2, dtb__199))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__200, dtb__201, dtb__202, dtb__203) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__202)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__200, dtb__201, ty2, dtb__203))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__204, dtb__205, dtb__206) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__205)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__204, ty2, dtb__206))))))
  | Frontend_dAst.C_Decl_DData (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__209)) (fun (k2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Frontend_dAst.t_Ctor) -> ((v_reorderCtor mc0) c))) dtb__210)) (fun (cs : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__207, dtb__208, k2, cs, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215))))))))
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderProgram = (fun (t : t_FixityTable) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderDecl t) v))) decls))
