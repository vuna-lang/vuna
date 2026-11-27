open Vuna_runtime
type t_FailCandidate = { f_FailCandidate_fcRank : int; f_FailCandidate_fcPos : int; f_FailCandidate_fcEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 17 "Vuna/Compiler/Elab/Termination.vuna"
let v_patsNames = (fun (ps : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap Frontend_dAstWalk.v_patBinders) ps))

# 20 "Vuna/Compiler/Elab/Termination.vuna"
let v_altPatOf = (fun (a : Frontend_dAst.t_Alt) -> (a).Frontend_dAst.f_Alt_altPat)

# 23 "Vuna/Compiler/Elab/Termination.vuna"
let v_altBodyOf = (fun (a : Frontend_dAst.t_Alt) -> (a).Frontend_dAst.f_Alt_altBody)

# 26 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_altsToPairs = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__0).Frontend_dAst.f_Alt_altPat; B_dData_dPair.f_Pair_second = (dtb__0).Frontend_dAst.f_Alt_altBody }, (v_altsToPairs dtb__1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Termination.vuna"
let v_bindingPatNames = (fun (b : Frontend_dAst.t_Binding) -> (Frontend_dAstWalk.v_patBinders (b).Frontend_dAst.f_Binding_bindPat))

# 30 "Vuna/Compiler/Elab/Termination.vuna"
let v_stmtBinderNames = (fun (mc0 : Frontend_dAst.t_DoStmt) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__2, dtb__3) -> ((B_dData_dList.v_concatMap v_bindingPatNames) dtb__2)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__4, dtb__5) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_DoStmt_DBind (dtb__6, dtb__7, dtb__8) -> (Frontend_dAstWalk.v_patBinders dtb__6)
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/Termination.vuna"
let v_bindingBinderNames = (fun (b : Frontend_dAst.t_Binding) -> (Frontend_dAstWalk.v_patBinders (b).Frontend_dAst.f_Binding_bindPat))

# 35 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_stmtRefsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_DoStmt) -> (match mc2 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__9, dtb__10) -> (((v_exprRefsBindsF (mc0 - 1)) mc1) dtb__9)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__11, dtb__12) -> (((v_exprRefsBF (mc0 - 1)) mc1) dtb__11)
  | Frontend_dAst.C_DoStmt_DBind (dtb__13, dtb__14, dtb__15) -> (((v_exprRefsBF (mc0 - 1)) mc1) dtb__14)
  | _ -> failwith "DT: impossible branch"
))
# 40 "Vuna/Compiler/Elab/Termination.vuna"
and v_refsOfStmtsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_stmtRefsF (mc0 - 1)) mc1) dtb__16)) (((v_refsOfStmtsF (mc0 - 1)) ((B_dData_dList.v_append (v_stmtBinderNames dtb__16)) mc1)) dtb__17)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 53 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBF = (fun (fuel : int) (bound : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__18, dtb__19) -> (if ((B_dData_dList.v_memName dtb__18) bound) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__18, B_dData_dList.C_List_Nil)))
  | Frontend_dAst.C_Expr_EInt (dtb__20, dtb__21) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EStr (dtb__22, dtb__23) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_ELam (dtb__24, dtb__25, dtb__26) -> (((v_exprRefsBF (fuel - 1)) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__24)) bound)) dtb__25)
  | Frontend_dAst.C_Expr_EApp (dtb__27, dtb__28, dtb__29) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__27)) ((B_dData_dList.v_concatMap ((v_exprRefsBF (fuel - 1)) bound)) dtb__28))
  | Frontend_dAst.C_Expr_EPi (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__33)) (((v_exprRefsBF (fuel - 1)) (B_dData_dList.C_List__x58__x58_ (dtb__30, bound))) dtb__34))
  | Frontend_dAst.C_Expr_ELet (dtb__36, dtb__37, dtb__38, dtb__39) -> ((B_dData_dList.v_append (((v_exprRefsBindsF (fuel - 1)) bound) dtb__36)) (((v_exprRefsBF (fuel - 1)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinderNames) dtb__36)) bound)) dtb__37))
  | Frontend_dAst.C_Expr_ECase (dtb__40, dtb__41, dtb__42) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__40)) ((B_dData_dList.v_concatMap (fun (alt : Frontend_dAst.t_Alt) -> (((v_exprRefsBF (fuel - 1)) ((B_dData_dList.v_append (Frontend_dAstWalk.v_patBinders (v_altPatOf alt))) bound)) (v_altBodyOf alt)))) dtb__41))
  | Frontend_dAst.C_Expr_EIf (dtb__43, dtb__44, dtb__45, dtb__46) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__43)) ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__44)) (((v_exprRefsBF (fuel - 1)) bound) dtb__45)))
  | Frontend_dAst.C_Expr_EField (dtb__47, dtb__48, dtb__49) -> (((v_exprRefsBF (fuel - 1)) bound) dtb__47)
  | Frontend_dAst.C_Expr_ERecord (dtb__50, dtb__51, dtb__52) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprRefsBF (fuel - 1)) bound) (B_dData_dPair.v_secondOf (Obj.magic q))))) dtb__51)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__53, dtb__54, dtb__55) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__53)) ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprRefsBF (fuel - 1)) bound) (B_dData_dPair.v_secondOf (Obj.magic q))))) dtb__54))
  | Frontend_dAst.C_Expr_EDo (dtb__56, dtb__57) -> (((v_refsOfStmtsF (fuel - 1)) bound) dtb__56)
  | _ -> B_dData_dList.C_List_Nil
)))
# 74 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBindsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_exprRefsBindingF (mc0 - 1)) mc1) dtb__58)) (((v_exprRefsBindsF (mc0 - 1)) mc1) dtb__59)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 82 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBindingF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding) -> (match mc2 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__60; Frontend_dAst.f_Binding_bindValue = dtb__61; Frontend_dAst.f_Binding_bindSig = dtb__62; Frontend_dAst.f_Binding_bindRef = dtb__63 } -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (match dtb__61 with
  | Frontend_dAst.C_BindingValue_BVal (dtb__64) -> (((v_exprRefsBF (mc0 - 1)) mc1) dtb__64)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__65) -> (((v_exprRefsClausesF (mc0 - 1)) mc1) dtb__65)
  | _ -> failwith "DT: impossible branch"
)) (match dtb__62 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (((v_exprRefsBF (mc0 - 1)) mc1) (dtb__66).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
# 97 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsClausesF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_exprRefsBF (mc0 - 1)) ((B_dData_dList.v_append (v_patsNames (dtb__67).Frontend_dAst.f_LocalClause_lcPats)) mc1)) (dtb__67).Frontend_dAst.f_LocalClause_lcBody)) (((v_exprRefsClausesF (mc0 - 1)) mc1) dtb__68)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Elab/Termination.vuna"
let v_exprRefsB = (fun (bound : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (((v_exprRefsBF ((Frontend_dAstQuery.v_exprBudget 64) e)) bound) e))

# 113 "Vuna/Compiler/Elab/Termination.vuna"
let v_refsOfDef = (fun (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (c : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB (v_patsNames (B_dData_dPair.v_firstOf c))) (B_dData_dPair.v_secondOf c)))) clauses)))

# 116 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_mapEdges = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__69); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_filter (fun (r : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) r) mc0))) (v_refsOfDef (B_dData_dPair.v_secondOf dtb__69))) }, ((v_mapEdges mc0) dtb__70)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Elab/Termination.vuna"
let v_callGraph = (fun (defs : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_mapEdges (B_dContainer_dHashMap.v_ofNames (Elab_dTermination_dMeasure.v_defNames defs))) defs))

# 124 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjOf = (fun (n : string) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> dtb__71
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjTblOf = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 138 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addSrcs = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (let cur = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__72) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> dtb__74
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_addSrcs mc0) dtb__73) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__72) (B_dData_dList.C_List__x58__x58_ (mc0, cur))) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_reverseAdjOf = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (match dtb__75 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> (((v_addSrcs dtb__77) dtb__78) (v_reverseAdjOf dtb__76))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_replacePair = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__79 with
  | { B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__82 } -> (if (dtb__81 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__80)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__82 }, (((v_replacePair mc0) mc1) dtb__80))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Termination.vuna"
let v_addEdge = (fun (n : string) (m : string) (acc : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((B_dData_dList.v_lookupPair n) acc) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> (((v_replacePair n) (B_dData_dList.C_List__x58__x58_ (m, dtb__83))) acc)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (m, B_dData_dList.C_List_Nil)) }, acc))
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addEdges = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (((v_addEdges mc0) dtb__85) (((v_addEdge dtb__84) mc0) mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_transposeGo = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (match dtb__86 with
  | { B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = dtb__89 } -> ((v_transposeGo dtb__87) (((v_addEdges dtb__88) dtb__89) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_dedupTransposed = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = (Elab_dTermination_dMeasure.v_dedup dtb__93) }, (v_dedupTransposed dtb__91)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Elab/Termination.vuna"
let v_transpose = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedupTransposed ((v_transposeGo g) B_dData_dList.C_List_Nil)))

# 176 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgeCount = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> ((B_dData_dList.v_length dtb__97) + (v_edgeCount dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Elab/Termination.vuna"
let v_graphFuel = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> (((4 * (B_dData_dList.v_length nodes)) + (4 * (v_edgeCount g))) + 16))

# 184 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsPost = (fun (steps : (string, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (post : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post } else (let nd_uscrut5 = steps in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> (if dtb__101 then (((((v_dfsPost dtb__99) (fuel - 1)) g) visited) (B_dData_dList.C_List__x58__x58_ (dtb__100, post))) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__100) visited) then (((((v_dfsPost dtb__99) (fuel - 1)) g) visited) post) else (((((v_dfsPost ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (m : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic m); B_dData_dPair.f_Pair_second = false })) ((v_adjOf dtb__100) g))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = true }, dtb__99)))) (fuel - 1)) g) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__100) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post }
  | _ -> failwith "DT: impossible branch"
))))

# 194 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsAll = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (if (mc1 <= 0) then mc4 else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__102) mc3) then (((((v_dfsAll dtb__103) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_dfsPost (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = false }, B_dData_dList.C_List_Nil))) mc1) mc2) mc3) mc4) with
  | { B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = dtb__105 } -> (((((v_dfsAll dtb__103) (mc1 - 1)) mc2) dtb__104) dtb__105)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Termination.vuna"
let v_postOrder = (fun (gT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> (let post = (((((v_dfsAll nodes) ((v_graphFuel g) nodes)) gT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_length post) = (B_dData_dList.v_length nodes)); B_dData_dPair.f_Pair_second = post }))

# 213 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = false } } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__106) mc3) then (((((v_collectComp dtb__107) (mc1 - 1)) mc2) mc3) mc4) else (((((v_collectComp ((B_dData_dList.v_append ((v_adjOf dtb__106) mc2)) dtb__107)) (mc1 - 1)) mc2) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__106) true) mc3)) (B_dData_dList.C_List__x58__x58_ (dtb__106, mc4)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true } }
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_sccOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc4 } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__108) mc3) then (((((v_sccOf dtb__109) (mc1 - 1)) mc2) mc3) mc4) else (let nd_uscrut8 = (((((v_collectComp (B_dData_dList.C_List__x58__x58_ (dtb__108, B_dData_dList.C_List_Nil))) (mc1 - 1)) mc2) mc3) B_dData_dList.C_List_Nil) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__110; B_dData_dPair.f_Pair_second = dtb__111 } -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (if dtb__113 then (((((v_sccOf dtb__109) (mc1 - 1)) mc2) dtb__110) (B_dData_dList.C_List__x58__x58_ (dtb__112, mc4))) else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__112, mc4)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintEdge = (fun (caller : string) (callee : string) (p : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match ((((Elab_dTermination_dMeasure.v_argRelHint p) args) sizes) ctors) with
  | B_dData_dMaybe.C_Maybe_Nothing -> acc
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) callee) dtb__114) sp) acc)
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_strWalk = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match e with
  | Frontend_dAst.C_Expr_EApp (dtb__115, dtb__116, dtb__117) -> (((((((((((((v_strWalkEApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__115) dtb__116) (Frontend_dAst.v_nodeRefSpan dtb__117)) acc)
  | Frontend_dAst.C_Expr_ECase (dtb__118, dtb__119, dtb__120) -> ((((((((((((v_strWalkAlts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__118) (v_altsToPairs dtb__119)) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__118) acc))
  | Frontend_dAst.C_Expr_EIf (dtb__121, dtb__122, dtb__123, dtb__124) -> (let acc1 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__121) acc) in (let acc2 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb__121)) region)) dtb__122) acc1) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb__121)) region)) dtb__123) acc2)))
  | Frontend_dAst.C_Expr_ELam (dtb__125, dtb__126, dtb__127) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__126) acc)
  | Frontend_dAst.C_Expr_ELet (dtb__128, dtb__129, dtb__130, dtb__131) -> (let sizes2 = (((Elab_dTermination_dMeasure.v_extendByBinds projs) dtb__128) sizes) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__129) (((((((((((v_strWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__128) acc)))
  | Frontend_dAst.C_Expr_EPi (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__136) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__135) acc))
  | Frontend_dAst.C_Expr_EField (dtb__138, dtb__139, dtb__140) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__138) acc)
  | Frontend_dAst.C_Expr_ERecord (dtb__141, dtb__142, dtb__143) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__142) acc)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__144, dtb__145, dtb__146) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__145) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__144) acc))
  | Frontend_dAst.C_Expr_EDo (dtb__147, dtb__148) -> (((((((((((v_strWalkStmts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__147) acc)
  | Frontend_dAst.C_Expr_EVar (dtb__149, dtb__150) -> (if ((B_dData_dList.v_memName dtb__149) comp) then (Elab_dTermination_dMeasure.v_markInvalid acc) else acc)
  | Frontend_dAst.C_Expr_EInt (dtb__151, dtb__152) -> acc
  | Frontend_dAst.C_Expr_EStr (dtb__153, dtb__154) -> acc
  | Frontend_dAst.C_Expr_EFloat (dtb__155, dtb__156) -> acc
  | Frontend_dAst.C_Expr_EInterp (dtb__157, dtb__158) -> acc
  | _ -> failwith "DT: impossible branch"
)))
# 279 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> (match ((((((((Elab_dTermination_dMeasure.v_argRel p) args) sizes) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) ((((((((v_hintEdge caller) dtb__159) p) args) ctors) sizes) sp) acc)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) dtb__159) dtb__160) sp) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__161, dtb__162) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__163) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (let acc1 = (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (dtb__164).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc) in (let sizes2 = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__164).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__164).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) (dtb__164).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__163).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then ((((((((((((v_strWalkEAppMap (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
)))
# 304 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (match dtb__166 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match dtb__168 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut20 = dtb__165 in (match nd_uscrut20 with
  | Frontend_dAst.C_Expr_EVar (dtb__169, dtb__170) -> (if ((B_dData_dList.v_memName dtb__169) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__169) B_dData_dList.C_List_Nil) dtb__167) (Frontend_dAst.v_nodeRefSpan dtb__170)) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Frontend_dAst.C_Expr_EApp (dtb__171, dtb__172, dtb__173) -> (match dtb__171 with
  | Frontend_dAst.C_Expr_EVar (dtb__174, dtb__175) -> (if ((B_dData_dList.v_memName dtb__174) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__174) dtb__172) dtb__167) (Frontend_dAst.v_nodeRefSpan dtb__173)) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
))
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
))))
# 317 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dAst.t_Expr B_dData_dList.t_List) (lst : Frontend_dAst.t_Expr) (cbsp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (let acc1 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc) in (let elems = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem") in (let fullArgs = ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("$elem", (Frontend_dAst.v_detachedNodeRef cbsp))), B_dData_dList.C_List_Nil))) in (let acc2 = (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1) in (match ((((((((Elab_dTermination_dMeasure.v_argRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid acc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__176) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) g) dtb__176) cbsp) acc2)
  | _ -> failwith "DT: impossible branch"
)))))))
# 331 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc))))
# 349 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkArgs = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__177, dtb__178) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkArgs (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__178) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__177) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 369 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_Expr) (mc10 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc11 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__179, dtb__180) -> (match dtb__179 with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc11) else ((((((((((((v_strWalkAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__180) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc5) mc9) dtb__181)) mc6) mc7) mc8) dtb__182) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
))
# 390 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) (((Elab_dTermination_dMeasure.v_extendBindingSizes mc3) mc5) dtb__183)) mc6) mc7) mc8) dtb__184) (((((((((((v_strWalkBinding (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__183) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 410 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinding = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then acc else (let acc1 = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__186) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__186) acc)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__187) -> (((((((((((v_strWalkClauses (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__187) acc)
  | _ -> failwith "DT: impossible branch"
) in (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (dtb__185).Frontend_dAst.f_BindingSig_sigType) acc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> acc1
  | _ -> failwith "DT: impossible branch"
))))
# 424 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkClauses = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (if (mc0 <= 0) then mc10 else (((((((((((v_strWalkClauses (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__189) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) (dtb__188).Frontend_dAst.f_LocalClause_lcBody) mc10)))
  | B_dData_dList.C_List_Nil -> mc10
  | _ -> failwith "DT: impossible branch"
))
# 443 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__191) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__193) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 463 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkStmts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (match dtb__194 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__196, dtb__197, dtb__198) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc5) dtb__197) dtb__196)) mc6) mc7) mc8) dtb__195) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__197) mc10))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__199, dtb__200) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__195) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__199) mc10))
  | Frontend_dAst.C_DoStmt_DLet (dtb__201, dtb__202) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) (((Elab_dTermination_dMeasure.v_extendByBinds mc3) dtb__201) mc5)) mc6) mc7) mc8) dtb__195) (((((((((((v_strWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__201) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Elab/Termination.vuna"
let v_strClause = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (clause : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((((((((((v_strWalk ((Frontend_dAstQuery.v_exprBudget 32) (B_dData_dPair.v_secondOf clause))) comp) ctors) projs) p) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf clause))) caller) facts) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf clause)) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))

# 492 "Vuna/Compiler/Elab/Termination.vuna"
let v_groupMessage = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (match dtb__204 with
  | B_dData_dList.C_List_Nil -> (dtb__203 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

# 510 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_applyCallFields = (fun (mc0 : int) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Base_dDiag.t_Diagnostic) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 } -> (match dtb__207 with
  | { B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = dtb__210 } -> (match dtb__209 with
  | { B_dData_dPair.f_Pair_first = dtb__211; B_dData_dPair.f_Pair_second = dtb__212 } -> (((v_applyCallFields mc0) dtb__206) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCall ({ Base_dDiag.f_CallInfo_callCallee = dtb__212; Base_dDiag.f_CallInfo_callArg = ("argument " ^ (string_of_int mc0)); Base_dDiag.f_CallInfo_callRelation = (Elab_dTermination_dMeasure.v_relText dtb__210); Base_dDiag.f_CallInfo_callSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__208)) }))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Elab/Termination.vuna"
let v_cannotProveMsgEdges = (fun (comp : string B_dData_dList.t_List) (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let desc = (v_groupMessage comp) in (let base = ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CannotProveTermination (desc))) (B_dData_dVec.C_Vec__x58__x58_ (desc, B_dData_dVec.C_Vec_Nil))) in (((v_applyCallFields p) edges) (let nd_uscrut5 = edges in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__213 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> ((Base_dDiag.v_withFallbackSpan dtb__216) base)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsSynthetic) base)
  | _ -> failwith "DT: impossible branch"
))))))

# 518 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectClauses = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : string) (mc6 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__217, dtb__218) -> (if (B_dData_dPair.v_firstOf mc7) then (let nd_uscrut11 = (((((((v_strClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__217) in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (if dtb__219 then ((((((((v_collectClauses dtb__218) mc1) mc2) mc3) mc4) mc5) mc6) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__220) }) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__220) })))
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC (mc7)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectMeasure = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : string B_dData_dList.t_List) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> ((Base_dCommon.v_bind ((((((((v_collectClauses ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__221) mc1)) mc0) mc2) mc3) mc4) dtb__221) mc5) mc7)) (fun (acc2 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((((((v_collectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__222) acc2)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Elab/Termination.vuna"
let v_emptyFail = (fun (p : int) -> { f_FailCandidate_fcRank = 0; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = B_dData_dList.C_List_Nil })

# 546 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintRankOf = (fun (m : int) -> (if (m = Elab_dTermination_dMeasure.v_relMissingGuard) then 4 else (if (m = Elab_dTermination_dMeasure.v_relAscending) then 4 else (if (m = Elab_dTermination_dMeasure.v_relUnknownSize) then 3 else (if (m = Elab_dTermination_dMeasure.v_relOtherPosition) then 2 else (if (m = Elab_dTermination_dMeasure.v_relNoRelation) then 1 else 0))))))

# 556 "Vuna/Compiler/Elab/Termination.vuna"
let v_edgeRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> (match dtb__223 with
  | { B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__226 } -> (match dtb__225 with
  | { B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__228 } -> (v_hintRankOf dtb__226)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgesRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> ((Elab_dTermination_dMeasure.v_maxInt (v_edgeRankOf dtb__229)) (v_edgesRankOf dtb__230))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Elab/Termination.vuna"
let v_betterFail = (fun (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> (let rank = (v_edgesRankOf edges) in (if (rank > (best).f_FailCandidate_fcRank) then { f_FailCandidate_fcRank = rank; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = edges } else best)))

# 610 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_computePosFactsWork = (fun (names : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (rgT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (work : string B_dData_dList.t_List) -> (if (fuel <= 0) then facts else (let namesTbl = (B_dContainer_dHashMap.v_ofNames names) in (let scan = (((((Elab_dTermination_dMeasure.v_posScanNames namesTbl) defTbl) (Elab_dTermination_dMeasure.v_posTblOf facts)) work) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let fresh = ((Elab_dTermination_dMeasure.v_posFilterTbl (B_dData_dPair.v_firstOf scan)) (Elab_dTermination_dMeasure.v_posTblOf (B_dData_dPair.v_secondOf scan))) in (let newFacts = ((Elab_dTermination_dMeasure.v_posFilterTbl fresh) (Elab_dTermination_dMeasure.v_posTblOf facts)) in (let merged = ((Elab_dTermination_dMeasure.v_posUnionTbl facts) fresh) in (let nextWork = (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (n : string) -> ((v_adjOf n) rgT))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) newFacts))) in (match nextWork with
  | B_dData_dList.C_List_Nil -> merged
  | _ -> ((((((v_computePosFactsWork names) defTbl) rgT) (fuel - 1)) merged) nextWork)
)))))))))

# 631 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfunNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (match dtb__231 with
  | Frontend_dAst.C_Decl_DFun (dtb__233, dtb__234, dtb__235, dtb__236) -> (B_dData_dList.C_List__x58__x58_ (dtb__233, (v_dfunNames dtb__232)))
  | Frontend_dAst.C_Decl_DInstance (dtb__237, dtb__238, dtb__239, dtb__240) -> ((B_dData_dList.v_append (v_dfunNames dtb__239)) (v_dfunNames dtb__232))
  | _ -> (v_dfunNames dtb__232)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_anyOwnTbl = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__241) mc0) then true else ((v_anyOwnTbl mc0) dtb__242))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 689 "Vuna/Compiler/Elab/Termination.vuna"
let v_callMode = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__243; B_dData_dPair.f_Pair_second = dtb__244 } -> (match dtb__243 with
  | { B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = dtb__246 } -> (match dtb__245 with
  | { B_dData_dPair.f_Pair_first = dtb__247; B_dData_dPair.f_Pair_second = dtb__248 } -> dtb__246
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 574 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_tryMeasureGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (remaining : int) (maxP : int) (lastP : int) (lastEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> (if (remaining <= 0) then (if ((best).f_FailCandidate_fcRank > 0) then (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) (best).f_FailCandidate_fcPos) (best).f_FailCandidate_fcEdges))) else (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) lastP) lastEdges)))) else (let p = (maxP - remaining) in (let nd_uscrut11 = ((((((((v_collectMeasure comp) defTbl) ctors) projs) p) facts) comp) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__249) -> (match dtb__249 with
  | { B_dData_dPair.f_Pair_first = dtb__250; B_dData_dPair.f_Pair_second = dtb__251 } -> (if dtb__250 then (let modes = (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_callMode) dtb__251)) in (if (Elab_dTermination_dMeasure.v_notEmpty modes) then (if (Elab_dTermination_dMeasure.v_allSame modes) then (if ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) dtb__251) then ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__251) best) else (Base_dDiag.C_Check_OkC (0))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__251) best)) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__251) best))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__251) (((v_betterFail p) dtb__251) best)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__252) -> (Base_dDiag.C_Check_ErrC (dtb__252))
  | _ -> failwith "DT: impossible branch"
)))))

# 570 "Vuna/Compiler/Elab/Termination.vuna"
let v_tryMeasure = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (p : int) (maxP : int) -> ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (maxP - p)) maxP) p) B_dData_dList.C_List_Nil) (v_emptyFail p)))

# 591 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkStrictGroup = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let factsTbl = (Elab_dTermination_dMeasure.v_posTblOf facts) in (match (((((((v_tryMeasure comp) defTbl) ctors) projs) factsTbl) 0) ((Elab_dTermination_dMeasure.v_maxArityOf comp) defTbl)) with
  | Base_dDiag.C_Check_OkC (dtb__253) -> (Base_dDiag.C_Check_OkC (dtb__253))
  | Base_dDiag.C_Check_ErrC (dtb__254) -> (match ((((((Elab_dTermination_dScc.v_tryFuelThread comp) defTbl) ctors) projs) factsTbl) dtb__254) with
  | Base_dDiag.C_Check_OkC (dtb__255) -> (Base_dDiag.C_Check_OkC (dtb__255))
  | Base_dDiag.C_Check_ErrC (dtb__256) -> ((((((Elab_dTermination_dScc.v_sctCheck comp) defTbl) ctors) projs) factsTbl) dtb__256)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 602 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match dtb__258 with
  | B_dData_dList.C_List_Nil -> (if ((B_dData_dList.v_memName dtb__257) ((v_adjOf dtb__257) mc4)) then (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
))

# 678 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_checkSccsWith = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List B_dData_dList.t_List) (mc2 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if ((v_anyOwnTbl mc0) dtb__259) then ((Base_dCommon.v_bind ((((((v_checkComp dtb__259) mc2) mc3) mc4) mc5) mc6)) (fun (n : int) -> ((Base_dCommon.v_bind (((((((v_checkSccsWith mc0) dtb__260) mc2) mc3) mc4) mc5) mc6)) (fun (m : int) -> (Base_dDiag.C_Check_OkC ((n + m))))))) else (((((((v_checkSccsWith mc0) dtb__260) mc2) mc3) mc4) mc5) mc6))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 645 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationGroups = (fun (own : string B_dData_dList.t_List) (ownDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (depDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (tableDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let allDecls = ((B_dData_dList.v_append depDecls) ownDecls) in (let resolved = (Elab_dTermination_dMeasure.v_expandForwarders allDecls) in (let defs = (Elab_dTermination_dMeasure.v_groupDefs resolved) in (let defTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) defs) in (let ctors = (Elab_dTermination_dMeasure.v_ctorNamesOf ((B_dData_dList.v_append depDecls) tableDecls)) in (let projs = ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_projectionsOf defs)) (Elab_dTermination_dMeasure.v_fieldProjectionsOf ((B_dData_dList.v_append depDecls) tableDecls))) in (let g = (v_callGraph defs) in (let gT = (v_adjTblOf g) in (let nodes = (Elab_dTermination_dMeasure.v_defNames defs) in (let rgT = (v_reverseAdjOf g) in (let callerNames = ((B_dData_dList.v_filter (fun (n : string) -> (Elab_dTermination_dMeasure.v_notEmpty ((v_adjOf n) gT)))) nodes) in (let facts = ((((((v_computePosFactsWork nodes) defTbl) rgT) 1024) B_dData_dList.C_List_Nil) callerNames) in (let ownTbl = (B_dContainer_dHashMap.v_ofNames own) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Termination") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Termination") "term-facts") else 0) in (let fuel = ((v_graphFuel g) nodes) in (let postR = (((v_postOrder gT) g) nodes) in (let compsR = (((((v_sccOf (B_dData_dPair.v_secondOf postR)) fuel) rgT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in (if (B_dData_dPair.v_firstOf postR) then (if (B_dData_dPair.v_firstOf compsR) then (((((((v_checkSccsWith ownTbl) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf compsR))) defTbl) ctors) projs) gT) facts) else (Base_dDiag.v_icFuel "termination-scc")) else (Base_dDiag.v_icFuel "termination-scc"))))))))))))))))))))

# 639 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDeclsWith = (fun (own : string B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_checkTerminationGroups own) decls) B_dData_dList.C_List_Nil) decls))

# 628 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkTerminationDeclsWith (v_dfunNames decls)) decls))

# 537 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcRank = (fun (p : t_FailCandidate) -> (match p with
  | { f_FailCandidate_fcRank = dtb__261; f_FailCandidate_fcPos = dtb__262; f_FailCandidate_fcEdges = dtb__263 } -> dtb__261
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcPos = (fun (p : t_FailCandidate) -> (match p with
  | { f_FailCandidate_fcRank = dtb__264; f_FailCandidate_fcPos = dtb__265; f_FailCandidate_fcEdges = dtb__266 } -> dtb__265
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcEdges = (fun (p : t_FailCandidate) -> (match p with
  | { f_FailCandidate_fcRank = dtb__267; f_FailCandidate_fcPos = dtb__268; f_FailCandidate_fcEdges = dtb__269 } -> dtb__269
  | _ -> failwith "DT: impossible branch"
))
