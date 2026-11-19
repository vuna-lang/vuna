open Vuna_runtime
type t_FixityTable = { f_FixityTable_renameMode : bool; f_FixityTable_fixityDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List }
and t_ChainOp = { f_ChainOp_chainOp : string; f_ChainOp_chainIsBacktick : bool; f_ChainOp_chainRhs : Frontend_dAst.t_Expr; f_ChainOp_chainSpan : Base_dSource.t_Span }

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
let v_builtinFixityDecls = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "->"; Frontend_dAst.f_FixityDecl_fixityLevel = 1; Frontend_dAst.f_FixityDecl_fixityAssoc = 2; Frontend_dAst.f_FixityDecl_fixitySpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "&&"; Frontend_dAst.f_FixityDecl_fixityLevel = 3; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixitySpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_FixityDecl_fixityOp = "||"; Frontend_dAst.f_FixityDecl_fixityLevel = 2; Frontend_dAst.f_FixityDecl_fixityAssoc = 1; Frontend_dAst.f_FixityDecl_fixitySpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, B_dData_dList.C_List_Nil))))))

# 51 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOpOf = (fun (d : Frontend_dAst.t_FixityDecl) -> (d).Frontend_dAst.f_FixityDecl_fixityOp)

# 48 "Vuna/Compiler/Loader/Fixity.vuna"
let v_builtinFixityOps = ((B_dData_dList.v_map v_fixityOpOf) v_builtinFixityDecls)

# 59 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_checkUniqueFixitiesGo = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> ((fun sp -> ((fun declKey -> (if ((B_dData_dList.v_memName (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp) v_builtinFixityOps) then ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_BuiltinFixity ((dtb__2).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp)) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) declKey) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (((v_checkUniqueFixitiesGo dtb__3) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_DuplicateFixity ((dtb__2).Frontend_dAst.f_FixityDecl_fixityOp))) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((v_checkUniqueFixitiesGo dtb__3) ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) (dtb__2).Frontend_dAst.f_FixityDecl_fixityOp) 1) mc1)) ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) declKey) 1) mc2))) (fun (tailDecls : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__2, tailDecls))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (String.concat "" [(dtb__2).Frontend_dAst.f_FixityDecl_fixityOp; "@"; (Base_dSource.v_spanFile sp); ":"; (bi_strFromInt (Base_dSource.v_spanStartLine sp)); ":"; (bi_strFromInt (Base_dSource.v_spanStartCol sp))]))) (dtb__2).Frontend_dAst.f_FixityDecl_fixitySpan)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Loader/Fixity.vuna"
let v_checkUniqueFixities = (fun (ds : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (((v_checkUniqueFixitiesGo ds) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)))

# 76 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_lookupDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if ((dtb__6).Frontend_dAst.f_FixityDecl_fixityOp = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__6)) else ((v_lookupDecl mc0) dtb__7))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixityDecl = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupDecl op) (t).f_FixityTable_fixityDecls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (B_dData_dMaybe.C_Maybe_Just (dtb__8))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_lookupDecl op) v_builtinFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Loader/Fixity.vuna"
let v_lookupFixity = (fun (t : t_FixityTable) (op : string) -> (match ((v_lookupFixityDecl t) op) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__9).Frontend_dAst.f_FixityDecl_fixityLevel; B_dData_dPair.f_Pair_second = (dtb__9).Frontend_dAst.f_FixityDecl_fixityAssoc }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Loader/Fixity.vuna"
let v_unknownFixityMsg = (fun (op : string) -> ((Base_dDiagnostics_dRn.v_rnMsg (Base_dDiagnostics_dRn.C_RnErr_UnknownFixity (op))) (B_dData_dVec.C_Vec_VCons (op, B_dData_dVec.C_Vec_Nil))))

# 106 "Vuna/Compiler/Loader/Fixity.vuna"
let v_fixityOf = (fun (t : t_FixityTable) (c : t_ChainOp) -> (match ((v_lookupFixity t) (c).f_ChainOp_chainOp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (Base_dDiag.C_Check_OkC (dtb__10))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (c).f_ChainOp_chainIsBacktick then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 9; B_dData_dPair.f_Pair_second = 1 })) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (c).f_ChainOp_chainSpan)) (Base_dDiag.C_Check_ErrC ((v_unknownFixityMsg (c).f_ChainOp_chainOp)))))
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Loader/Fixity.vuna"
let v_infixTerm = (fun (t : t_FixityTable) (c : t_ChainOp) (lhs : Frontend_dAst.t_Expr) (rhs : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (if (v_renameMode t) then (if ((c).f_ChainOp_chainOp = ">>") then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (">>=", sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), rhs, sp)), B_dData_dList.C_List_Nil)))), sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((c).f_ChainOp_chainOp, sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), sp))) else (if (c).f_ChainOp_chainIsBacktick then (Frontend_dAst.C_Expr_EBacktick ((c).f_ChainOp_chainOp, lhs, rhs, sp)) else (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((c).f_ChainOp_chainOp, sp)), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), sp)))))

# 156 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_climb = (fun (fuel : int) (t : t_FixityTable) (minPrec : int) (lhs : Frontend_dAst.t_Expr) (rest : t_ChainOp B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icInternal "infix reorder fuel exhausted") else (match rest with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match ((v_fixityOf t) dtb__11) with
  | Base_dDiag.C_Check_ErrC (dtb__13) -> (Base_dDiag.C_Check_ErrC (dtb__13))
  | Base_dDiag.C_Check_OkC (dtb__14) -> ((fun level -> ((fun assoc -> ((fun nextMin -> ((fun rhs -> (if (level < minPrec) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = rest })) else ((Base_dCommon.v_bind ((((((v_climb (fuel - 1)) t) nextMin) rhs) dtb__12) sp)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = dtb__16 } -> ((((((v_climb (fuel - 1)) t) minPrec) (((((v_infixTerm t) dtb__11) lhs) dtb__15) sp)) dtb__16) sp)
  | _ -> failwith "DT: impossible branch"
))))) (dtb__11).f_ChainOp_chainRhs)) (if (assoc = 2) then level else (level + 1)))) (B_dData_dPair.v_secondOf dtb__14))) (B_dData_dPair.v_firstOf dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 197 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_foldApps = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (((v_foldApps (Frontend_dAst.C_Expr_EApp (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__17, B_dData_dList.C_List_Nil)), mc2))) dtb__18) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_reorderPattern = (fun (t : t_FixityTable) (pat : Frontend_dAst.t_Pat) -> (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__19, dtb__20) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PVar (dtb__19, dtb__20))))
  | Frontend_dAst.C_Pat_PWild (dtb__21) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PWild (dtb__21))))
  | Frontend_dAst.C_Pat_PInt (dtb__22, dtb__23) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PInt (dtb__22, dtb__23))))
  | Frontend_dAst.C_Pat_PStr (dtb__24, dtb__25) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PStr (dtb__24, dtb__25))))
  | Frontend_dAst.C_Pat_PCon (dtb__26, dtb__27, dtb__28) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern t) p))) dtb__27)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb__26, pats2, dtb__28))))))
  | Frontend_dAst.C_Pat_PAs (dtb__29, dtb__30, dtb__31) -> ((Base_dCommon.v_bind ((v_reorderPattern t) dtb__30)) (fun (inner2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb__29, inner2, dtb__31))))))
  | Frontend_dAst.C_Pat_PRecord (dtb__32, dtb__33, dtb__34) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> ((v_reorderRecPatField t) p))) dtb__33)) (fun (fs : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PRecord (dtb__32, fs, dtb__34))))))
  | _ -> failwith "DT: impossible branch"
))
# 375 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderRecPatField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__36)) (fun (p2 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = p2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Loader/Fixity.vuna"
let rec v_collectChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EBacktick (dtb__37, dtb__38, dtb__39, dtb__40) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__38)) (fun (l2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain mc0) dtb__39)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = l2; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb__37; f_ChainOp_chainIsBacktick = true; f_ChainOp_chainRhs = dtb__41; f_ChainOp_chainSpan = dtb__40 }, dtb__42)) }))
  | _ -> failwith "DT: impossible branch"
)))))
  | Frontend_dAst.C_Expr_EInfix (dtb__43, dtb__44, dtb__45, dtb__46) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__44)) (fun (l2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain mc0) dtb__45)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = l2; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ f_ChainOp_chainOp = dtb__43; f_ChainOp_chainIsBacktick = false; f_ChainOp_chainRhs = dtb__47; f_ChainOp_chainSpan = dtb__46 }, dtb__48)) }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderNonChain mc0) mc1)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e2; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))))
))
# 182 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderChain = (fun (t : t_FixityTable) (e : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_collectChain t) e)) (fun (p : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__49; B_dData_dPair.f_Pair_second = dtb__50 } -> ((Base_dCommon.v_bind ((((((v_climb ((2 * (B_dData_dList.v_length dtb__50)) + 2)) t) 0) dtb__49) dtb__50) (Frontend_dAst.v_exprSpan e))) (fun (q : (Frontend_dAst.t_Expr, t_ChainOp B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (if ((B_dData_dList.v_length dtb__52) = 0) then (Base_dDiag.C_Check_OkC (dtb__51)) else (Base_dDiag.v_icInternal "infix reorder left an operator"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 202 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderNonChain = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__53, dtb__54, dtb__55) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__54)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (dtb__53, ps, dtb__55))))))
  | Frontend_dAst.C_Expr_EAnn (dtb__56, dtb__57, dtb__58) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__56)) (fun (i2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__57)) (fun (t2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EAnn (i2, t2, dtb__58))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__59, dtb__60) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_DoStmt) -> ((v_reorderDoStmt mc0) v))) dtb__59)) (fun (ss : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (ss, dtb__60))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__61, dtb__62, dtb__63) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__61)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__62)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__63))))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__64, dtb__65, dtb__66) -> ((Base_dCommon.v_bind ((v_reorderFields mc0) dtb__65)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__64, fs, dtb__66))))))
  | Frontend_dAst.C_Expr_EField (dtb__67, dtb__68, dtb__69) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__67)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__68, dtb__69))))))
  | Frontend_dAst.C_Expr_EIf (dtb__70, dtb__71, dtb__72, dtb__73) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__70)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__71)) (fun (th2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__72)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, th2, el2, dtb__73))))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__74, dtb__75, dtb__76) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__74)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderAlts mc0) dtb__75)) (fun (alts2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__76))))))))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__77, dtb__78) -> ((Base_dCommon.v_bind ((v_reorderClauses mc0) dtb__77)) (fun (cs : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELocalFun (cs, dtb__78))))))
  | Frontend_dAst.C_Expr_ELet (dtb__79, dtb__80, dtb__81, dtb__82) -> ((Base_dCommon.v_bind ((v_reorderBinds mc0) dtb__79)) (fun (binds2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__80)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__81, dtb__82))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__86)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__87)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__83, dtb__84, dtb__85, dom2, cod2, dtb__88))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__89, dtb__90, dtb__91) -> (match dtb__89 with
  | Frontend_dAst.C_Expr_EParen (dtb__92, dtb__93) -> (match dtb__92 with
  | Frontend_dAst.C_Expr_ESectR (dtb__94, dtb__95, dtb__96) -> (if (v_renameMode mc0) then (match dtb__90 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__94)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__97)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__98)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__95, dtb__91)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)))), dtb__91))) rest2) dtb__91)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__94)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__90)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EParen ((Frontend_dAst.C_Expr_ESectR (e2, dtb__95, dtb__96)), dtb__93)), args2, dtb__91)))))))))
  | Frontend_dAst.C_Expr_ESectL (dtb__99, dtb__100, dtb__101) -> (if (v_renameMode mc0) then (match dtb__90 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__102)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__100)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__103)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__99, dtb__91)), (B_dData_dList.C_List__x58__x58_ (a2, (B_dData_dList.C_List__x58__x58_ (e2, B_dData_dList.C_List_Nil)))), dtb__91))) rest2) dtb__91)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__100)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__90)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EParen ((Frontend_dAst.C_Expr_ESectL (dtb__99, e2, dtb__101)), dtb__93)), args2, dtb__91)))))))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__89)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__90)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__91))))))))
)
  | Frontend_dAst.C_Expr_ESectR (dtb__104, dtb__105, dtb__106) -> (if (v_renameMode mc0) then (match dtb__90 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__104)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__107)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__108)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__105, dtb__91)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ (a2, B_dData_dList.C_List_Nil)))), dtb__91))) rest2) dtb__91)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__104)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__90)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_ESectR (e2, dtb__105, dtb__106)), args2, dtb__91)))))))))
  | Frontend_dAst.C_Expr_ESectL (dtb__109, dtb__110, dtb__111) -> (if (v_renameMode mc0) then (match dtb__90 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "section application without arguments")
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__112)) (fun (a2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__110)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) x))) dtb__113)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((v_foldApps (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__109, dtb__91)), (B_dData_dList.C_List__x58__x58_ (a2, (B_dData_dList.C_List__x58__x58_ (e2, B_dData_dList.C_List_Nil)))), dtb__91))) rest2) dtb__91)))))))))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__110)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__90)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_ESectL (dtb__109, e2, dtb__111)), args2, dtb__91)))))))))
  | _ -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__89)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) a))) dtb__90)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__91))))))))
)
  | Frontend_dAst.C_Expr_ELam (dtb__114, dtb__115, dtb__116) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__115)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__114, b, dtb__116))))))
  | Frontend_dAst.C_Expr_EParen (dtb__117, dtb__118) -> ((v_reorderExpr mc0) dtb__117)
  | Frontend_dAst.C_Expr_ESectR (dtb__119, dtb__120, dtb__121) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__119)) (fun (e2 : Frontend_dAst.t_Expr) -> (if (v_renameMode mc0) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "vuna_section"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__120, dtb__121)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("vuna_section", dtb__121)), B_dData_dList.C_List_Nil)))), dtb__121)), dtb__121)))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectR (e2, dtb__120, dtb__121)))))))
  | Frontend_dAst.C_Expr_ESectL (dtb__122, dtb__123, dtb__124) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__123)) (fun (e2 : Frontend_dAst.t_Expr) -> (if (v_renameMode mc0) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "vuna_section"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__122, dtb__124)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("vuna_section", dtb__124)), (B_dData_dList.C_List__x58__x58_ (e2, B_dData_dList.C_List_Nil)))), dtb__124)), dtb__124)))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectL (dtb__122, e2, dtb__124)))))))
  | Frontend_dAst.C_Expr_ESectOp (dtb__125, dtb__126) -> (if (v_renameMode mc0) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__125, dtb__126)))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectOp (dtb__125, dtb__126)))))
  | Frontend_dAst.C_Expr_EFloat (dtb__127, dtb__128) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__127, dtb__128))))
  | Frontend_dAst.C_Expr_EStr (dtb__129, dtb__130) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__129, dtb__130))))
  | Frontend_dAst.C_Expr_EInt (dtb__131, dtb__132) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__131, dtb__132))))
  | Frontend_dAst.C_Expr_EVar (dtb__133, dtb__134) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__133, dtb__134))))
  | _ -> (Base_dDiag.v_icInternal "Fixity.reorderNonChain: unexpected expression form")
))
# 296 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderExpr = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EBacktick (dtb__135, dtb__136, dtb__137, dtb__138) -> ((v_reorderChain mc0) (Frontend_dAst.C_Expr_EBacktick (dtb__135, dtb__136, dtb__137, dtb__138)))
  | Frontend_dAst.C_Expr_EInfix (dtb__139, dtb__140, dtb__141, dtb__142) -> ((v_reorderChain mc0) (Frontend_dAst.C_Expr_EInfix (dtb__139, dtb__140, dtb__141, dtb__142)))
  | _ -> ((v_reorderNonChain mc0) mc1)
))
# 302 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderInterpParts = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (match dtb__143 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__145) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__144)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__145)), ps))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__146) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__146)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_reorderInterpParts mc0) dtb__144)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e2)), ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 313 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBinds = (fun (t : t_FixityTable) (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderBind t) v))) binds))
# 316 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderBind = (fun (mc0 : t_FixityTable) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__147)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__148)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p2; B_dData_dPair.f_Pair_second = v2 }))))))
  | _ -> failwith "DT: impossible branch"
))
# 322 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderFields = (fun (t : t_FixityTable) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderField t) v))) fields))
# 325 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderField = (fun (mc0 : t_FixityTable) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__150)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 329 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClauses = (fun (t : t_FixityTable) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderClause t) v))) clauses))
# 333 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlts = (fun (t : t_FixityTable) (alts : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (a : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_reorderAlt t) a))) alts))
# 336 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderAlt = (fun (mc0 : t_FixityTable) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__151)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__152)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p2; B_dData_dPair.f_Pair_second = b2 }))))))
  | _ -> failwith "DT: impossible branch"
))
# 342 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderClause = (fun (mc0 : t_FixityTable) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = dtb__154 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (pat : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) pat))) dtb__153)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__154)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = pats2; B_dData_dPair.f_Pair_second = b2 }))))))
  | _ -> failwith "DT: impossible branch"
))
# 348 "Vuna/Compiler/Loader/Fixity.vuna"
and v_reorderDoStmt = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__155, dtb__156) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__155)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (e2, dtb__156))))))
  | Frontend_dAst.C_DoStmt_DBind (dtb__157, dtb__158, dtb__159) -> ((Base_dCommon.v_bind ((v_reorderPattern mc0) dtb__157)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__158)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (p2, e2, dtb__159))))))))
  | _ -> failwith "DT: impossible branch"
))

# 411 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitParam = (fun (t : t_FixityTable) (p : Frontend_dAst.t_TraitParam) -> (match (p).Frontend_dAst.f_TraitParam_traitParamKind with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (p))
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> ((Base_dCommon.v_bind ((v_reorderExpr t) dtb__160)) (fun (k2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitParam_traitParamName = (p).Frontend_dAst.f_TraitParam_traitParamName; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (k2)) }))))
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderCtor = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__161; Frontend_dAst.f_Ctor_ctorType = dtb__162; Frontend_dAst.f_Ctor_ctorArity = dtb__163; Frontend_dAst.f_Ctor_ctorSpan = dtb__164 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__162)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__161; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__163; Frontend_dAst.f_Ctor_ctorSpan = dtb__164 }))))
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderRecordField = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__165; Frontend_dAst.f_Field_fieldType = dtb__166; Frontend_dAst.f_Field_fieldSpan = dtb__167 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__166)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__165; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldSpan = dtb__167 }))))
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderTraitMethod = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__168; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__169; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__170 } -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__169)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__168; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__170 }))))
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderInstanceMethodDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DFun (dtb__171, dtb__172, dtb__173, dtb__174) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__172)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__173)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__171, pats2, b2, dtb__174))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__175, dtb__176, dtb__177, dtb__178) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__176)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__177)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__175, ctx2, ty2, dtb__178))))))))
  | _ -> (Base_dDiag.C_Check_OkC (mc1))
))

# 380 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderDecl = (fun (mc0 : t_FixityTable) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__179, dtb__180, dtb__181, dtb__182) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__179)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__180)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderInstanceMethodDecl mc0) v))) dtb__181)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, ms, dtb__182))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_TraitParam) -> ((v_reorderTraitParam mc0) p))) dtb__184)) (fun (ps : Frontend_dAst.t_TraitParam B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__185)) (fun (ss : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_TraitMethod) -> ((v_reorderTraitMethod mc0) v))) dtb__186)) (fun (ms : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__183, ps, ss, ms, dtb__187))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Field) -> ((v_reorderRecordField mc0) v))) dtb__190)) (fun (fs : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__188, dtb__189, fs, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195))))))
  | Frontend_dAst.C_Decl_DFun (dtb__196, dtb__197, dtb__198, dtb__199) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (p : Frontend_dAst.t_Pat) -> ((v_reorderPattern mc0) p))) dtb__197)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__198)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__196, pats2, b2, dtb__199))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__200, dtb__201, dtb__202, dtb__203) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (e : Frontend_dAst.t_Expr) -> ((v_reorderExpr mc0) e))) dtb__201)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__202)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__200, ctx2, ty2, dtb__203))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__204, dtb__205, dtb__206, dtb__207) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__206)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__204, dtb__205, ty2, dtb__207))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__208, dtb__209, dtb__210) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__209)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__208, ty2, dtb__210))))))
  | Frontend_dAst.C_Decl_DData (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> ((Base_dCommon.v_bind ((v_reorderExpr mc0) dtb__213)) (fun (k2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Frontend_dAst.t_Ctor) -> ((v_reorderCtor mc0) c))) dtb__214)) (fun (cs : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__211, dtb__212, k2, cs, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219))))))))
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Loader/Fixity.vuna"
let v_reorderProgram = (fun (t : t_FixityTable) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (fun (v : Frontend_dAst.t_Decl) -> ((v_reorderDecl t) v))) decls))
