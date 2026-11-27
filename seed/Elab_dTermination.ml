open Vuna_runtime
type t_FailCandidate = { f_FailCandidate_fcRank : int; f_FailCandidate_fcPos : int; f_FailCandidate_fcEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 16 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_patNames = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PWild (dtb__0) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb__1, dtb__2, dtb__3) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patNames (B_dData_dPair.v_secondOf (Obj.magic q))))) dtb__2)
  | Frontend_dAst.C_Pat_PCon (dtb__4, dtb__5, dtb__6) -> ((B_dData_dList.v_concatMap v_patNames) dtb__5)
  | Frontend_dAst.C_Pat_PAs (dtb__7, dtb__8, dtb__9) -> (B_dData_dList.C_List__x58__x58_ (dtb__7, (v_patNames dtb__8)))
  | Frontend_dAst.C_Pat_PVar (dtb__10, dtb__11) -> (B_dData_dList.C_List__x58__x58_ (dtb__10, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 24 "Vuna/Compiler/Elab/Termination.vuna"
let v_patsNames = (fun (ps : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_patNames) ps))

# 27 "Vuna/Compiler/Elab/Termination.vuna"
let v_altPatOf = (fun (a : Frontend_dAst.t_Alt) -> (a).Frontend_dAst.f_Alt_altPat)

# 30 "Vuna/Compiler/Elab/Termination.vuna"
let v_altBodyOf = (fun (a : Frontend_dAst.t_Alt) -> (a).Frontend_dAst.f_Alt_altBody)

# 33 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_altsToPairs = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__12).Frontend_dAst.f_Alt_altPat; B_dData_dPair.f_Pair_second = (dtb__12).Frontend_dAst.f_Alt_altBody }, (v_altsToPairs dtb__13)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Elab/Termination.vuna"
let v_bindingPatNames = (fun (b : Frontend_dAst.t_Binding) -> (v_patNames (b).Frontend_dAst.f_Binding_bindPat))

# 37 "Vuna/Compiler/Elab/Termination.vuna"
let v_stmtBinderNames = (fun (mc0 : Frontend_dAst.t_DoStmt) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__14, dtb__15) -> ((B_dData_dList.v_concatMap v_bindingPatNames) dtb__14)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__16, dtb__17) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_DoStmt_DBind (dtb__18, dtb__19, dtb__20) -> (v_patNames dtb__18)
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Termination.vuna"
let v_bindingBinderNames = (fun (b : Frontend_dAst.t_Binding) -> (v_patNames (b).Frontend_dAst.f_Binding_bindPat))

# 42 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_stmtRefsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_DoStmt) -> (match mc2 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__21, dtb__22) -> (((v_exprRefsBindsF (mc0 - 1)) mc1) dtb__21)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__23, dtb__24) -> (((v_exprRefsBF (mc0 - 1)) mc1) dtb__23)
  | Frontend_dAst.C_DoStmt_DBind (dtb__25, dtb__26, dtb__27) -> (((v_exprRefsBF (mc0 - 1)) mc1) dtb__26)
  | _ -> failwith "DT: impossible branch"
))
# 47 "Vuna/Compiler/Elab/Termination.vuna"
and v_refsOfStmtsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_stmtRefsF (mc0 - 1)) mc1) dtb__28)) (((v_refsOfStmtsF (mc0 - 1)) ((B_dData_dList.v_append (v_stmtBinderNames dtb__28)) mc1)) dtb__29)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBF = (fun (fuel : int) (bound : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__30, dtb__31) -> (if ((B_dData_dList.v_memName dtb__30) bound) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__30, B_dData_dList.C_List_Nil)))
  | Frontend_dAst.C_Expr_EInt (dtb__32, dtb__33) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EStr (dtb__34, dtb__35) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_ELam (dtb__36, dtb__37, dtb__38) -> (((v_exprRefsBF (fuel - 1)) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__36)) bound)) dtb__37)
  | Frontend_dAst.C_Expr_EApp (dtb__39, dtb__40, dtb__41) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__39)) ((B_dData_dList.v_concatMap ((v_exprRefsBF (fuel - 1)) bound)) dtb__40))
  | Frontend_dAst.C_Expr_EPi (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__45)) (((v_exprRefsBF (fuel - 1)) (B_dData_dList.C_List__x58__x58_ (dtb__42, bound))) dtb__46))
  | Frontend_dAst.C_Expr_ELet (dtb__48, dtb__49, dtb__50, dtb__51) -> ((B_dData_dList.v_append (((v_exprRefsBindsF (fuel - 1)) bound) dtb__48)) (((v_exprRefsBF (fuel - 1)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinderNames) dtb__48)) bound)) dtb__49))
  | Frontend_dAst.C_Expr_ECase (dtb__52, dtb__53, dtb__54) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__52)) ((B_dData_dList.v_concatMap (fun (alt : Frontend_dAst.t_Alt) -> (((v_exprRefsBF (fuel - 1)) ((B_dData_dList.v_append (v_patNames (v_altPatOf alt))) bound)) (v_altBodyOf alt)))) dtb__53))
  | Frontend_dAst.C_Expr_EIf (dtb__55, dtb__56, dtb__57, dtb__58) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__55)) ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__56)) (((v_exprRefsBF (fuel - 1)) bound) dtb__57)))
  | Frontend_dAst.C_Expr_EField (dtb__59, dtb__60, dtb__61) -> (((v_exprRefsBF (fuel - 1)) bound) dtb__59)
  | Frontend_dAst.C_Expr_ERecord (dtb__62, dtb__63, dtb__64) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprRefsBF (fuel - 1)) bound) (B_dData_dPair.v_secondOf (Obj.magic q))))) dtb__63)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__65, dtb__66, dtb__67) -> ((B_dData_dList.v_append (((v_exprRefsBF (fuel - 1)) bound) dtb__65)) ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprRefsBF (fuel - 1)) bound) (B_dData_dPair.v_secondOf (Obj.magic q))))) dtb__66))
  | Frontend_dAst.C_Expr_EDo (dtb__68, dtb__69) -> (((v_refsOfStmtsF (fuel - 1)) bound) dtb__68)
  | _ -> B_dData_dList.C_List_Nil
)))
# 81 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBindsF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_exprRefsBindingF (mc0 - 1)) mc1) dtb__70)) (((v_exprRefsBindsF (mc0 - 1)) mc1) dtb__71)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 89 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBindingF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding) -> (match mc2 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__72; Frontend_dAst.f_Binding_bindValue = dtb__73; Frontend_dAst.f_Binding_bindSig = dtb__74; Frontend_dAst.f_Binding_bindRef = dtb__75 } -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (match dtb__73 with
  | Frontend_dAst.C_BindingValue_BVal (dtb__76) -> (((v_exprRefsBF (mc0 - 1)) mc1) dtb__76)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__77) -> (((v_exprRefsClausesF (mc0 - 1)) mc1) dtb__77)
  | _ -> failwith "DT: impossible branch"
)) (match dtb__74 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (((v_exprRefsBF (mc0 - 1)) mc1) (dtb__78).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
# 104 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsClausesF = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_exprRefsBF (mc0 - 1)) ((B_dData_dList.v_append (v_patsNames (dtb__79).Frontend_dAst.f_LocalClause_lcPats)) mc1)) (dtb__79).Frontend_dAst.f_LocalClause_lcBody)) (((v_exprRefsClausesF (mc0 - 1)) mc1) dtb__80)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Elab/Termination.vuna"
let v_exprRefsB = (fun (bound : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (((v_exprRefsBF ((Frontend_dAstQuery.v_exprBudget 64) e)) bound) e))

# 120 "Vuna/Compiler/Elab/Termination.vuna"
let v_refsOfDef = (fun (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (c : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB (v_patsNames (B_dData_dPair.v_firstOf c))) (B_dData_dPair.v_secondOf c)))) clauses)))

# 123 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_mapEdges = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__81); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_filter (fun (r : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) r) mc0))) (v_refsOfDef (B_dData_dPair.v_secondOf dtb__81))) }, ((v_mapEdges mc0) dtb__82)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Termination.vuna"
let v_callGraph = (fun (defs : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_mapEdges (B_dContainer_dHashMap.v_ofNames (Elab_dTermination_dMeasure.v_defNames defs))) defs))

# 131 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjOf = (fun (n : string) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> dtb__83
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjTblOf = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 145 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addSrcs = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (let cur = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__84) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> dtb__86
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_addSrcs mc0) dtb__85) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__84) (B_dData_dList.C_List__x58__x58_ (mc0, cur))) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_reverseAdjOf = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (match dtb__87 with
  | { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__90 } -> (((v_addSrcs dtb__89) dtb__90) (v_reverseAdjOf dtb__88))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_replacePair = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__93; B_dData_dPair.f_Pair_second = dtb__94 } -> (if (dtb__93 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__92)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__93; B_dData_dPair.f_Pair_second = dtb__94 }, (((v_replacePair mc0) mc1) dtb__92))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Elab/Termination.vuna"
let v_addEdge = (fun (n : string) (m : string) (acc : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((B_dData_dList.v_lookupPair n) acc) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (((v_replacePair n) (B_dData_dList.C_List__x58__x58_ (m, dtb__95))) acc)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (m, B_dData_dList.C_List_Nil)) }, acc))
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addEdges = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (((v_addEdges mc0) dtb__97) (((v_addEdge dtb__96) mc0) mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_transposeGo = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> ((v_transposeGo dtb__99) (((v_addEdges dtb__100) dtb__101) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_dedupTransposed = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match dtb__102 with
  | { B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = dtb__105 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = (Elab_dTermination_dMeasure.v_dedup dtb__105) }, (v_dedupTransposed dtb__103)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Elab/Termination.vuna"
let v_transpose = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedupTransposed ((v_transposeGo g) B_dData_dList.C_List_Nil)))

# 183 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgeCount = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (match dtb__106 with
  | { B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = dtb__109 } -> ((B_dData_dList.v_length dtb__109) + (v_edgeCount dtb__107))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Elab/Termination.vuna"
let v_graphFuel = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> (((4 * (B_dData_dList.v_length nodes)) + (4 * (v_edgeCount g))) + 16))

# 191 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsPost = (fun (steps : (string, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (post : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post } else (let nd_uscrut5 = steps in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (if dtb__113 then (((((v_dfsPost dtb__111) (fuel - 1)) g) visited) (B_dData_dList.C_List__x58__x58_ (dtb__112, post))) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__112) visited) then (((((v_dfsPost dtb__111) (fuel - 1)) g) visited) post) else (((((v_dfsPost ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (m : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic m); B_dData_dPair.f_Pair_second = false })) ((v_adjOf dtb__112) g))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = true }, dtb__111)))) (fuel - 1)) g) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__112) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post }
  | _ -> failwith "DT: impossible branch"
))))

# 201 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsAll = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (if (mc1 <= 0) then mc4 else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__114) mc3) then (((((v_dfsAll dtb__115) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_dfsPost (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = false }, B_dData_dList.C_List_Nil))) mc1) mc2) mc3) mc4) with
  | { B_dData_dPair.f_Pair_first = dtb__116; B_dData_dPair.f_Pair_second = dtb__117 } -> (((((v_dfsAll dtb__115) (mc1 - 1)) mc2) dtb__116) dtb__117)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Elab/Termination.vuna"
let v_postOrder = (fun (gT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> (let post = (((((v_dfsAll nodes) ((v_graphFuel g) nodes)) gT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_length post) = (B_dData_dList.v_length nodes)); B_dData_dPair.f_Pair_second = post }))

# 220 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = false } } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__118) mc3) then (((((v_collectComp dtb__119) (mc1 - 1)) mc2) mc3) mc4) else (((((v_collectComp ((B_dData_dList.v_append ((v_adjOf dtb__118) mc2)) dtb__119)) (mc1 - 1)) mc2) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__118) true) mc3)) (B_dData_dList.C_List__x58__x58_ (dtb__118, mc4)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true } }
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_sccOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc4 } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__120) mc3) then (((((v_sccOf dtb__121) (mc1 - 1)) mc2) mc3) mc4) else (let nd_uscrut8 = (((((v_collectComp (B_dData_dList.C_List__x58__x58_ (dtb__120, B_dData_dList.C_List_Nil))) (mc1 - 1)) mc2) mc3) B_dData_dList.C_List_Nil) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> (match dtb__123 with
  | { B_dData_dPair.f_Pair_first = dtb__124; B_dData_dPair.f_Pair_second = dtb__125 } -> (if dtb__125 then (((((v_sccOf dtb__121) (mc1 - 1)) mc2) dtb__122) (B_dData_dList.C_List__x58__x58_ (dtb__124, mc4))) else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__124, mc4)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintEdge = (fun (caller : string) (callee : string) (p : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match ((((Elab_dTermination_dMeasure.v_argRelHint p) args) sizes) ctors) with
  | B_dData_dMaybe.C_Maybe_Nothing -> acc
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) callee) dtb__126) sp) acc)
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_extendClauseSizes = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (((v_extendClauseSizes mc0) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc0) mc1) (dtb__127).Frontend_dAst.f_LocalClause_lcBody) (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))))) dtb__128)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Elab/Termination.vuna"
let v_extendBindingSizes = (fun (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__129) -> ((((Elab_dTermination_dMeasure.v_extendSizesStrict projs) sizes) dtb__129) (b).Frontend_dAst.f_Binding_bindPat)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__130) -> (((v_extendClauseSizes projs) sizes) dtb__130)
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_strWalk = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match e with
  | Frontend_dAst.C_Expr_EApp (dtb__131, dtb__132, dtb__133) -> (((((((((((((v_strWalkEApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__131) dtb__132) (Frontend_dAst.v_nodeRefSpan dtb__133)) acc)
  | Frontend_dAst.C_Expr_ECase (dtb__134, dtb__135, dtb__136) -> ((((((((((((v_strWalkAlts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__134) (v_altsToPairs dtb__135)) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__134) acc))
  | Frontend_dAst.C_Expr_EIf (dtb__137, dtb__138, dtb__139, dtb__140) -> (let acc1 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__137) acc) in (let acc2 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb__137)) region)) dtb__138) acc1) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb__137)) region)) dtb__139) acc2)))
  | Frontend_dAst.C_Expr_ELam (dtb__141, dtb__142, dtb__143) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__142) acc)
  | Frontend_dAst.C_Expr_ELet (dtb__144, dtb__145, dtb__146, dtb__147) -> (let sizes2 = (((Elab_dTermination_dMeasure.v_extendByBinds projs) dtb__144) sizes) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__145) (((((((((((v_strWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__144) acc)))
  | Frontend_dAst.C_Expr_EPi (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__152) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__151) acc))
  | Frontend_dAst.C_Expr_EField (dtb__154, dtb__155, dtb__156) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__154) acc)
  | Frontend_dAst.C_Expr_ERecord (dtb__157, dtb__158, dtb__159) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__158) acc)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__160, dtb__161, dtb__162) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__161) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__160) acc))
  | Frontend_dAst.C_Expr_EDo (dtb__163, dtb__164) -> (((((((((((v_strWalkStmts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__163) acc)
  | Frontend_dAst.C_Expr_EVar (dtb__165, dtb__166) -> (if ((B_dData_dList.v_memName dtb__165) comp) then (Elab_dTermination_dMeasure.v_markInvalid acc) else acc)
  | _ -> acc
)))
# 283 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> (match ((((((((Elab_dTermination_dMeasure.v_argRel p) args) sizes) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) ((((((((v_hintEdge caller) dtb__167) p) args) ctors) sizes) sp) acc)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) dtb__167) dtb__168) sp) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dAst.C_Expr_EVar (dtb__169, dtb__170) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__169) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__171) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (let acc1 = (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (dtb__172).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc) in (let sizes2 = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__172).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__172).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) (dtb__172).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__171).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then ((((((((((((v_strWalkEAppMap (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
)))
# 308 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__176 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut20 = dtb__173 in (match nd_uscrut20 with
  | Frontend_dAst.C_Expr_EVar (dtb__177, dtb__178) -> (if ((B_dData_dList.v_memName dtb__177) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__177) B_dData_dList.C_List_Nil) dtb__175) (Frontend_dAst.v_nodeRefSpan dtb__178)) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Frontend_dAst.C_Expr_EApp (dtb__179, dtb__180, dtb__181) -> (match dtb__179 with
  | Frontend_dAst.C_Expr_EVar (dtb__182, dtb__183) -> (if ((B_dData_dList.v_memName dtb__182) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__182) dtb__180) dtb__175) (Frontend_dAst.v_nodeRefSpan dtb__181)) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
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
# 321 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dAst.t_Expr B_dData_dList.t_List) (lst : Frontend_dAst.t_Expr) (cbsp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (let acc1 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc) in (let elems = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem") in (let fullArgs = ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("$elem", (Frontend_dAst.v_detachedNodeRef cbsp))), B_dData_dList.C_List_Nil))) in (let acc2 = (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1) in (match ((((((((Elab_dTermination_dMeasure.v_argRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid acc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) g) dtb__184) cbsp) acc2)
  | _ -> failwith "DT: impossible branch"
)))))))
# 335 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dAst.t_Expr) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc))))
# 353 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkArgs = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkArgs (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__186) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__185) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 373 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_Expr) (mc10 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc11 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = dtb__190 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc11) else ((((((((((((v_strWalkAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__188) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc5) mc9) dtb__189)) mc6) mc7) mc8) dtb__190) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
))
# 394 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) (((v_extendBindingSizes mc3) mc5) dtb__191)) mc6) mc7) mc8) dtb__192) (((((((((((v_strWalkBinding (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__191) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 414 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinding = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then acc else (let acc1 = (match (b).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb__194) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__194) acc)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__195) -> (((((((((((v_strWalkClauses (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__195) acc)
  | _ -> failwith "DT: impossible branch"
) in (match (b).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (dtb__193).Frontend_dAst.f_BindingSig_sigType) acc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> acc1
  | _ -> failwith "DT: impossible branch"
))))
# 428 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkClauses = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (if (mc0 <= 0) then mc10 else (((((((((((v_strWalkClauses (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__197) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) (dtb__196).Frontend_dAst.f_LocalClause_lcBody) mc10)))
  | B_dData_dList.C_List_Nil -> mc10
  | _ -> failwith "DT: impossible branch"
))
# 462 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__199) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__201) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 482 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkStmts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (match dtb__202 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__204, dtb__205, dtb__206) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc5) dtb__205) dtb__204)) mc6) mc7) mc8) dtb__203) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__205) mc10))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__207, dtb__208) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__203) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__207) mc10))
  | Frontend_dAst.C_DoStmt_DLet (dtb__209, dtb__210) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) (((Elab_dTermination_dMeasure.v_extendByBinds mc3) dtb__209) mc5)) mc6) mc7) mc8) dtb__203) (((((((((((v_strWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__209) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Termination.vuna"
let v_strClause = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (clause : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((((((((((v_strWalk ((Frontend_dAstQuery.v_exprBudget 32) (B_dData_dPair.v_secondOf clause))) comp) ctors) projs) p) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf clause))) caller) facts) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf clause)) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))

# 511 "Vuna/Compiler/Elab/Termination.vuna"
let v_groupMessage = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (match dtb__212 with
  | B_dData_dList.C_List_Nil -> (dtb__211 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

# 529 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_applyCallFields = (fun (mc0 : int) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Base_dDiag.t_Diagnostic) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__213 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> (match dtb__215 with
  | { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 } -> (match dtb__217 with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (((v_applyCallFields mc0) dtb__214) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCall ({ Base_dDiag.f_CallInfo_callCallee = dtb__220; Base_dDiag.f_CallInfo_callArg = ("argument " ^ (string_of_int mc0)); Base_dDiag.f_CallInfo_callRelation = (Elab_dTermination_dMeasure.v_relText dtb__218); Base_dDiag.f_CallInfo_callSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__216)) }))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Elab/Termination.vuna"
let v_cannotProveMsgEdges = (fun (comp : string B_dData_dList.t_List) (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let desc = (v_groupMessage comp) in (let base = ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CannotProveTermination (desc))) (B_dData_dVec.C_Vec__x58__x58_ (desc, B_dData_dVec.C_Vec_Nil))) in (((v_applyCallFields p) edges) (let nd_uscrut5 = edges in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__221 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> ((Base_dDiag.v_withFallbackSpan dtb__224) base)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsSynthetic) base)
  | _ -> failwith "DT: impossible branch"
))))))

# 537 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectClauses = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : string) (mc6 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (if (B_dData_dPair.v_firstOf mc7) then (let nd_uscrut11 = (((((((v_strClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__225) in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__228 } -> (if dtb__227 then ((((((((v_collectClauses dtb__226) mc1) mc2) mc3) mc4) mc5) mc6) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__228) }) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__228) })))
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC (mc7)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectMeasure = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : string B_dData_dList.t_List) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> ((Base_dCommon.v_bind ((((((((v_collectClauses ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__229) mc1)) mc0) mc2) mc3) mc4) dtb__229) mc5) mc7)) (fun (acc2 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((((((v_collectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__230) acc2)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Elab/Termination.vuna"
let v_emptyFail = (fun (p : int) -> { f_FailCandidate_fcRank = 0; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = B_dData_dList.C_List_Nil })

# 565 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintRankOf = (fun (m : int) -> (if (m = Elab_dTermination_dMeasure.v_relMissingGuard) then 4 else (if (m = Elab_dTermination_dMeasure.v_relAscending) then 4 else (if (m = Elab_dTermination_dMeasure.v_relUnknownSize) then 3 else (if (m = Elab_dTermination_dMeasure.v_relOtherPosition) then 2 else (if (m = Elab_dTermination_dMeasure.v_relNoRelation) then 1 else 0))))))

# 575 "Vuna/Compiler/Elab/Termination.vuna"
let v_edgeRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__231; B_dData_dPair.f_Pair_second = dtb__232 } -> (match dtb__231 with
  | { B_dData_dPair.f_Pair_first = dtb__233; B_dData_dPair.f_Pair_second = dtb__234 } -> (match dtb__233 with
  | { B_dData_dPair.f_Pair_first = dtb__235; B_dData_dPair.f_Pair_second = dtb__236 } -> (v_hintRankOf dtb__234)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgesRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__237, dtb__238) -> ((Elab_dTermination_dMeasure.v_maxInt (v_edgeRankOf dtb__237)) (v_edgesRankOf dtb__238))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Elab/Termination.vuna"
let v_betterFail = (fun (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> (let rank = (v_edgesRankOf edges) in (if (rank > (best).f_FailCandidate_fcRank) then { f_FailCandidate_fcRank = rank; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = edges } else best)))

# 629 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_computePosFactsWork = (fun (names : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (rgT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (work : string B_dData_dList.t_List) -> (if (fuel <= 0) then facts else (let namesTbl = (B_dContainer_dHashMap.v_ofNames names) in (let scan = (((((Elab_dTermination_dMeasure.v_posScanNames namesTbl) defTbl) (Elab_dTermination_dMeasure.v_posTblOf facts)) work) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let fresh = ((Elab_dTermination_dMeasure.v_posFilterTbl (B_dData_dPair.v_firstOf scan)) (Elab_dTermination_dMeasure.v_posTblOf (B_dData_dPair.v_secondOf scan))) in (let newFacts = ((Elab_dTermination_dMeasure.v_posFilterTbl fresh) (Elab_dTermination_dMeasure.v_posTblOf facts)) in (let merged = ((Elab_dTermination_dMeasure.v_posUnionTbl facts) fresh) in (let nextWork = (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (n : string) -> ((v_adjOf n) rgT))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) newFacts))) in (match nextWork with
  | B_dData_dList.C_List_Nil -> merged
  | _ -> ((((((v_computePosFactsWork names) defTbl) rgT) (fuel - 1)) merged) nextWork)
)))))))))

# 650 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfunNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (match dtb__239 with
  | Frontend_dAst.C_Decl_DFun (dtb__241, dtb__242, dtb__243, dtb__244) -> (B_dData_dList.C_List__x58__x58_ (dtb__241, (v_dfunNames dtb__240)))
  | Frontend_dAst.C_Decl_DInstance (dtb__245, dtb__246, dtb__247, dtb__248) -> ((B_dData_dList.v_append (v_dfunNames dtb__247)) (v_dfunNames dtb__240))
  | _ -> (v_dfunNames dtb__240)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 693 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_anyOwnTbl = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__249, dtb__250) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__249) mc0) then true else ((v_anyOwnTbl mc0) dtb__250))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Elab/Termination.vuna"
let v_callMode = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__251; B_dData_dPair.f_Pair_second = dtb__252 } -> (match dtb__251 with
  | { B_dData_dPair.f_Pair_first = dtb__253; B_dData_dPair.f_Pair_second = dtb__254 } -> (match dtb__253 with
  | { B_dData_dPair.f_Pair_first = dtb__255; B_dData_dPair.f_Pair_second = dtb__256 } -> dtb__254
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_tryMeasureGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (remaining : int) (maxP : int) (lastP : int) (lastEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> (if (remaining <= 0) then (if ((best).f_FailCandidate_fcRank > 0) then (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) (best).f_FailCandidate_fcPos) (best).f_FailCandidate_fcEdges))) else (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) lastP) lastEdges)))) else (let p = (maxP - remaining) in (let nd_uscrut11 = ((((((((v_collectMeasure comp) defTbl) ctors) projs) p) facts) comp) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__257) -> (match dtb__257 with
  | { B_dData_dPair.f_Pair_first = dtb__258; B_dData_dPair.f_Pair_second = dtb__259 } -> (if dtb__258 then (let modes = (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_callMode) dtb__259)) in (if (Elab_dTermination_dMeasure.v_notEmpty modes) then (if (Elab_dTermination_dMeasure.v_allSame modes) then (if ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) dtb__259) then ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__259) best) else (Base_dDiag.C_Check_OkC (0))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__259) best)) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__259) best))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__259) (((v_betterFail p) dtb__259) best)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__260) -> (Base_dDiag.C_Check_ErrC (dtb__260))
  | _ -> failwith "DT: impossible branch"
)))))

# 589 "Vuna/Compiler/Elab/Termination.vuna"
let v_tryMeasure = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (p : int) (maxP : int) -> ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (maxP - p)) maxP) p) B_dData_dList.C_List_Nil) (v_emptyFail p)))

# 610 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkStrictGroup = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let factsTbl = (Elab_dTermination_dMeasure.v_posTblOf facts) in (match (((((((v_tryMeasure comp) defTbl) ctors) projs) factsTbl) 0) ((Elab_dTermination_dMeasure.v_maxArityOf comp) defTbl)) with
  | Base_dDiag.C_Check_OkC (dtb__261) -> (Base_dDiag.C_Check_OkC (dtb__261))
  | Base_dDiag.C_Check_ErrC (dtb__262) -> (match ((((((Elab_dTermination_dScc.v_tryFuelThread comp) defTbl) ctors) projs) factsTbl) dtb__262) with
  | Base_dDiag.C_Check_OkC (dtb__263) -> (Base_dDiag.C_Check_OkC (dtb__263))
  | Base_dDiag.C_Check_ErrC (dtb__264) -> ((((((Elab_dTermination_dScc.v_sctCheck comp) defTbl) ctors) projs) factsTbl) dtb__264)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 621 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (match dtb__266 with
  | B_dData_dList.C_List_Nil -> (if ((B_dData_dList.v_memName dtb__265) ((v_adjOf dtb__265) mc4)) then (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
))

# 697 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_checkSccsWith = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List B_dData_dList.t_List) (mc2 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__268) -> (if ((v_anyOwnTbl mc0) dtb__267) then ((Base_dCommon.v_bind ((((((v_checkComp dtb__267) mc2) mc3) mc4) mc5) mc6)) (fun (n : int) -> ((Base_dCommon.v_bind (((((((v_checkSccsWith mc0) dtb__268) mc2) mc3) mc4) mc5) mc6)) (fun (m : int) -> (Base_dDiag.C_Check_OkC ((n + m))))))) else (((((((v_checkSccsWith mc0) dtb__268) mc2) mc3) mc4) mc5) mc6))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationGroups = (fun (own : string B_dData_dList.t_List) (ownDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (depDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (tableDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let allDecls = ((B_dData_dList.v_append depDecls) ownDecls) in (let resolved = (Elab_dTermination_dMeasure.v_expandForwarders allDecls) in (let defs = (Elab_dTermination_dMeasure.v_groupDefs resolved) in (let defTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) defs) in (let ctors = (Elab_dTermination_dMeasure.v_ctorNamesOf ((B_dData_dList.v_append depDecls) tableDecls)) in (let projs = ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_projectionsOf defs)) (Elab_dTermination_dMeasure.v_fieldProjectionsOf ((B_dData_dList.v_append depDecls) tableDecls))) in (let g = (v_callGraph defs) in (let gT = (v_adjTblOf g) in (let nodes = (Elab_dTermination_dMeasure.v_defNames defs) in (let rgT = (v_reverseAdjOf g) in (let callerNames = ((B_dData_dList.v_filter (fun (n : string) -> (Elab_dTermination_dMeasure.v_notEmpty ((v_adjOf n) gT)))) nodes) in (let facts = ((((((v_computePosFactsWork nodes) defTbl) rgT) 1024) B_dData_dList.C_List_Nil) callerNames) in (let ownTbl = (B_dContainer_dHashMap.v_ofNames own) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Termination") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Termination") "term-facts") else 0) in (let fuel = ((v_graphFuel g) nodes) in (let postR = (((v_postOrder gT) g) nodes) in (let compsR = (((((v_sccOf (B_dData_dPair.v_secondOf postR)) fuel) rgT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in (if (B_dData_dPair.v_firstOf postR) then (if (B_dData_dPair.v_firstOf compsR) then (((((((v_checkSccsWith ownTbl) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf compsR))) defTbl) ctors) projs) gT) facts) else (Base_dDiag.v_icFuel "termination-scc")) else (Base_dDiag.v_icFuel "termination-scc"))))))))))))))))))))

# 658 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDeclsWith = (fun (own : string B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_checkTerminationGroups own) decls) B_dData_dList.C_List_Nil) decls))

# 647 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkTerminationDeclsWith (v_dfunNames decls)) decls))

# 556 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcRank = (fun (p : t_FailCandidate) -> (match p with
  | { f_FailCandidate_fcRank = dtb__269; f_FailCandidate_fcPos = dtb__270; f_FailCandidate_fcEdges = dtb__271 } -> dtb__269
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcPos = (fun (p : t_FailCandidate) -> (match p with
  | { f_FailCandidate_fcRank = dtb__272; f_FailCandidate_fcPos = dtb__273; f_FailCandidate_fcEdges = dtb__274 } -> dtb__273
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcEdges = (fun (p : t_FailCandidate) -> (match p with
  | { f_FailCandidate_fcRank = dtb__275; f_FailCandidate_fcPos = dtb__276; f_FailCandidate_fcEdges = dtb__277 } -> dtb__277
  | _ -> failwith "DT: impossible branch"
))
