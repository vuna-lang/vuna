open Vuna_runtime
type t_FailCandidate = { f_FailCandidate_fcRank : int; f_FailCandidate_fcPos : int; f_FailCandidate_fcEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 15 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_patNames = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PWild (dtb__0) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Pat_PRecord (dtb__1, dtb__2, dtb__3) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair) -> (v_patNames (B_dData_dPair.v_secondOf q)))) dtb__2)
  | Frontend_dRast.C_Pat_PCon (dtb__4, dtb__5, dtb__6) -> ((B_dData_dList.v_concatMap v_patNames) dtb__5)
  | Frontend_dRast.C_Pat_PAs (dtb__7, dtb__8, dtb__9) -> (B_dData_dList.C_List__x58__x58_ (dtb__7, (v_patNames dtb__8)))
  | Frontend_dRast.C_Pat_PVar (dtb__10, dtb__11) -> (B_dData_dList.C_List__x58__x58_ (dtb__10, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 23 "Vuna/Compiler/Elab/Termination.vuna"
let v_patsNames = (fun (ps : Frontend_dRast.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_patNames) ps))

# 26 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_refsOfStmt = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_DoStmt) -> (match mc1 with
  | Frontend_dRast.C_DoStmt_DExpr (dtb__12, dtb__13) -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ((v_exprRefsB mc0) dtb__12) }
  | Frontend_dRast.C_DoStmt_DBind (dtb__14, dtb__15, dtb__16) -> { B_dData_dPair.f_Pair_first = (v_patNames dtb__14); B_dData_dPair.f_Pair_second = ((v_exprRefsB mc0) dtb__15) }
  | _ -> failwith "DT: impossible branch"
))
# 30 "Vuna/Compiler/Elab/Termination.vuna"
and v_refsOfStmts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match ((v_refsOfStmt mc0) dtb__17) with
  | { B_dData_dPair.f_Pair_first = dtb__19; B_dData_dPair.f_Pair_second = dtb__20 } -> (match ((v_refsOfStmts ((B_dData_dList.v_append dtb__19) mc0)) dtb__18) with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__20) dtb__22) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))
# 38 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsB = (fun (bound : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (match e with
  | Frontend_dRast.C_Expr_EVar (dtb__23, dtb__24) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__23)) bound) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast_dName.v_rnameKey dtb__23), B_dData_dList.C_List_Nil)))
  | Frontend_dRast.C_Expr_EInt (dtb__25, dtb__26) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Expr_EStr (dtb__27, dtb__28) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Expr_ELam (dtb__29, dtb__30, dtb__31) -> ((v_exprRefsB ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__29)) bound)) dtb__30)
  | Frontend_dRast.C_Expr_EApp (dtb__32, dtb__33, dtb__34) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__32)) ((B_dData_dList.v_concatMap (v_exprRefsB bound)) dtb__33))
  | Frontend_dRast.C_Expr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__38)) ((v_exprRefsB (B_dData_dList.C_List__x58__x58_ (dtb__35, bound))) dtb__39))
  | Frontend_dRast.C_Expr_ELet (dtb__41, dtb__42, dtb__43, dtb__44) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (bd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB bound) (B_dData_dPair.v_secondOf bd)))) dtb__41)) ((v_exprRefsB ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (bd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (v_patNames (B_dData_dPair.v_firstOf bd)))) dtb__41)) bound)) dtb__42))
  | Frontend_dRast.C_Expr_ECase (dtb__45, dtb__46, dtb__47) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__45)) ((B_dData_dList.v_concatMap (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB ((B_dData_dList.v_append (v_patNames (B_dData_dPair.v_firstOf alt))) bound)) (B_dData_dPair.v_secondOf alt)))) dtb__46))
  | Frontend_dRast.C_Expr_EIf (dtb__48, dtb__49, dtb__50, dtb__51) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__48)) ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__49)) ((v_exprRefsB bound) dtb__50)))
  | Frontend_dRast.C_Expr_EField (dtb__52, dtb__53, dtb__54) -> ((v_exprRefsB bound) dtb__52)
  | Frontend_dRast.C_Expr_ERecord (dtb__55, dtb__56, dtb__57) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB bound) (B_dData_dPair.v_secondOf q)))) dtb__56)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__58, dtb__59, dtb__60) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__58)) ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB bound) (B_dData_dPair.v_secondOf q)))) dtb__59))
  | Frontend_dRast.C_Expr_EDo (dtb__61, dtb__62) -> (B_dData_dPair.v_secondOf ((v_refsOfStmts bound) dtb__61))
  | Frontend_dRast.C_Expr_EAnn (dtb__63, dtb__64, dtb__65) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__63)) ((v_exprRefsB bound) dtb__64))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__66, dtb__67) -> ((B_dData_dList.v_concatMap (fun (c : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB ((B_dData_dList.v_append (v_patsNames (B_dData_dPair.v_firstOf c))) bound)) (B_dData_dPair.v_secondOf c)))) dtb__66)
  | _ -> B_dData_dList.C_List_Nil
))

# 67 "Vuna/Compiler/Elab/Termination.vuna"
let v_refsOfDef = (fun (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (c : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB (v_patsNames (B_dData_dPair.v_firstOf c))) (B_dData_dPair.v_secondOf c)))) clauses)))

# 70 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_mapEdges = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__68); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_filter (fun (r : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) r) mc0))) (v_refsOfDef (B_dData_dPair.v_secondOf dtb__68))) }, ((v_mapEdges mc0) dtb__69)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Elab/Termination.vuna"
let v_callGraph = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_mapEdges (B_dContainer_dHashMap.v_ofNames (Elab_dTermination_dMeasure.v_defNames defs))) defs))

# 79 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjOf = (fun (n : string) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) n) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> dtb__70
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjTblOf = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) g) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))

# 93 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addSrcs = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> ((fun cur -> (((v_addSrcs mc0) dtb__72) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__71) (B_dData_dList.C_List__x58__x58_ (mc0, cur))) mc2))) (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__71) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> dtb__73
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_reverseAdjOf = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { B_dData_dPair.f_Pair_first = dtb__76; B_dData_dPair.f_Pair_second = dtb__77 } -> (((v_addSrcs dtb__76) dtb__77) (v_reverseAdjOf dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_replacePair = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | { B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 } -> (if (dtb__80 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__79)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 }, (((v_replacePair mc0) mc1) dtb__79))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/Termination.vuna"
let v_addEdge = (fun (n : string) (m : string) (acc : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((B_dData_dList.v_lookupPair n) acc) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (((v_replacePair n) (B_dData_dList.C_List__x58__x58_ (m, dtb__82))) acc)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (m, B_dData_dList.C_List_Nil)) }, acc))
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addEdges = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (((v_addEdges mc0) dtb__84) (((v_addEdge dtb__83) mc0) mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_transposeGo = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (match dtb__85 with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> ((v_transposeGo dtb__86) (((v_addEdges dtb__87) dtb__88) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dedupTransposed = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = (Elab_dTermination_dMeasure.v_dedup dtb__92) }, (v_dedupTransposed dtb__90)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Elab/Termination.vuna"
let v_transpose = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedupTransposed ((v_transposeGo g) B_dData_dList.C_List_Nil)))

# 131 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgeCount = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__95; B_dData_dPair.f_Pair_second = dtb__96 } -> ((B_dData_dList.v_length dtb__96) + (v_edgeCount dtb__94))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Elab/Termination.vuna"
let v_graphFuel = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> (((4 * (B_dData_dList.v_length nodes)) + (4 * (v_edgeCount g))) + 16))

# 139 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsPost = (fun (steps : (string, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (post : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post } else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> (if dtb__100 then (((((v_dfsPost dtb__98) (fuel - 1)) g) visited) (B_dData_dList.C_List__x58__x58_ (dtb__99, post))) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__99) visited) then (((((v_dfsPost dtb__98) (fuel - 1)) g) visited) post) else (((((v_dfsPost ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (m : string) -> { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = false })) ((v_adjOf dtb__99) g))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = true }, dtb__98)))) (fuel - 1)) g) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__99) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post }
  | _ -> failwith "DT: impossible branch"
)) steps)))

# 149 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsAll = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (if (mc1 <= 0) then mc4 else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__101) mc3) then (((((v_dfsAll dtb__102) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_dfsPost (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = false }, B_dData_dList.C_List_Nil))) mc1) mc2) mc3) mc4) with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (((((v_dfsAll dtb__102) (mc1 - 1)) mc2) dtb__103) dtb__104)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Termination.vuna"
let v_postOrder = (fun (gT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> ((fun post -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_length post) = (B_dData_dList.v_length nodes)); B_dData_dPair.f_Pair_second = post }) (((((v_dfsAll nodes) ((v_graphFuel g) nodes)) gT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil)))

# 168 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = false } } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__105) mc3) then (((((v_collectComp dtb__106) (mc1 - 1)) mc2) mc3) mc4) else (((((v_collectComp ((B_dData_dList.v_append ((v_adjOf dtb__105) mc2)) dtb__106)) (mc1 - 1)) mc2) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__105) true) mc3)) (B_dData_dList.C_List__x58__x58_ (dtb__105, mc4)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true } }
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_sccOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc4 } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__107) mc3) then (((((v_sccOf dtb__108) (mc1 - 1)) mc2) mc3) mc4) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__109; B_dData_dPair.f_Pair_second = dtb__110 } -> (match dtb__110 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (if dtb__112 then (((((v_sccOf dtb__108) (mc1 - 1)) mc2) dtb__109) (B_dData_dList.C_List__x58__x58_ (dtb__111, mc4))) else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__111, mc4)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_collectComp (B_dData_dList.C_List__x58__x58_ (dtb__107, B_dData_dList.C_List_Nil))) (mc1 - 1)) mc2) mc3) B_dData_dList.C_List_Nil))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintEdge = (fun (caller : string) (callee : string) (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match ((((Elab_dTermination_dMeasure.v_argRelHint p) args) sizes) ctors) with
  | B_dData_dMaybe.C_Maybe_Nothing -> acc
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) callee) dtb__113) sp) acc)
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_strWalk = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match e with
  | Frontend_dRast.C_Expr_EApp (dtb__114, dtb__115, dtb__116) -> (((((((((((((v_strWalkEApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__114) dtb__115) dtb__116) acc)
  | Frontend_dRast.C_Expr_ECase (dtb__117, dtb__118, dtb__119) -> ((((((((((((v_strWalkAlts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__117) dtb__118) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__117) acc))
  | Frontend_dRast.C_Expr_EIf (dtb__120, dtb__121, dtb__122, dtb__123) -> ((fun acc1 -> ((fun acc2 -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb__120)) region)) dtb__122) acc2)) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb__120)) region)) dtb__121) acc1))) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__120) acc))
  | Frontend_dRast.C_Expr_ELam (dtb__124, dtb__125, dtb__126) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__125) acc)
  | Frontend_dRast.C_Expr_ELet (dtb__127, dtb__128, dtb__129, dtb__130) -> ((fun sizes2 -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__128) (((((((((((v_strWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__127) acc))) ((Elab_dTermination_dMeasure.v_extendByBinds dtb__127) sizes))
  | Frontend_dRast.C_Expr_EPi (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__135) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__134) acc))
  | Frontend_dRast.C_Expr_EField (dtb__137, dtb__138, dtb__139) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__137) acc)
  | Frontend_dRast.C_Expr_ERecord (dtb__140, dtb__141, dtb__142) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__141) acc)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__143, dtb__144, dtb__145) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__144) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__143) acc))
  | Frontend_dRast.C_Expr_EDo (dtb__146, dtb__147) -> (((((((((((v_strWalkStmts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__146) acc)
  | Frontend_dRast.C_Expr_EAnn (dtb__148, dtb__149, dtb__150) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__149) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__148) acc))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__151, dtb__152) -> (((((((((((v_strWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (Elab_dTermination_dMeasure.v_localClauseBinds dtb__151)) acc)
  | Frontend_dRast.C_Expr_EVar (dtb__153, dtb__154) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__153)) comp) then (Elab_dTermination_dMeasure.v_markInvalid acc) else acc)
  | _ -> acc
)))
# 236 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (match ((((((((Elab_dTermination_dMeasure.v_argRel p) args) sizes) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) ((((((((v_hintEdge caller) dtb__155) p) args) ctors) sizes) sp) acc)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) dtb__155) dtb__156) sp) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__157, dtb__158) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__157) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__159) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> ((fun acc1 -> ((fun sizes2 -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) (dtb__160).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)) (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__160).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__160).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder))) (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (dtb__160).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__159).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then ((((((((((((v_strWalkEAppMap (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
)))
# 261 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__162 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__164 with
  | B_dData_dList.C_List_Nil -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Frontend_dRast.C_Expr_EVar (dtb__165, dtb__166) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__165)) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (Frontend_dRast_dName.v_rnameKey dtb__165)) B_dData_dList.C_List_Nil) dtb__163) dtb__166) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Frontend_dRast.C_Expr_EApp (dtb__167, dtb__168, dtb__169) -> (match dtb__167 with
  | Frontend_dRast.C_Expr_EVar (dtb__170, dtb__171) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__170)) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (Frontend_dRast_dName.v_rnameKey dtb__170)) dtb__168) dtb__163) dtb__169) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__161)
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) args)))
# 274 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dRast.t_Expr B_dData_dList.t_List) (lst : Frontend_dRast.t_Expr) (cbsp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (match ((((((((Elab_dTermination_dMeasure.v_argRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid acc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) g) dtb__172) cbsp) acc2)
  | _ -> failwith "DT: impossible branch"
)) (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1))) ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "$elem"), cbsp)), B_dData_dList.C_List_Nil))))) (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem"))) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc))))
# 288 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc))))
# 306 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkArgs = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkArgs (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__174) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__173) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 326 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dRast.t_Expr) (mc10 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc11 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | { B_dData_dPair.f_Pair_first = dtb__177; B_dData_dPair.f_Pair_second = dtb__178 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc11) else ((((((((((((v_strWalkAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__176) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) (((Elab_dTermination_dMeasure.v_extendSizesStrict mc5) mc9) dtb__177)) mc6) mc7) mc8) dtb__178) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
))
# 347 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__179, dtb__180) -> (match dtb__179 with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) (((Elab_dTermination_dMeasure.v_extendSizesStrict mc5) dtb__182) dtb__181)) mc6) mc7) mc8) dtb__180) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__182) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 367 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (match dtb__183 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__184) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__186) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 387 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkStmts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (match dtb__187 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__189, dtb__190, dtb__191) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) (((Elab_dTermination_dMeasure.v_extendSizesStrict mc5) dtb__190) dtb__189)) mc6) mc7) mc8) dtb__188) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__190) mc10))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__192, dtb__193) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__188) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__192) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Elab/Termination.vuna"
let v_strClause = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (clause : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (((((((((((v_strWalk ((Frontend_dRast.v_exprBudget 32) (B_dData_dPair.v_secondOf clause))) comp) ctors) projs) p) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf clause))) caller) facts) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf clause)) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))

# 415 "Vuna/Compiler/Elab/Termination.vuna"
let v_groupMessage = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (match dtb__195 with
  | B_dData_dList.C_List_Nil -> (dtb__194 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

# 433 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_applyCallFields = (fun (mc0 : int) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Base_dDiag.t_Diagnostic) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__198; B_dData_dPair.f_Pair_second = dtb__199 } -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (match dtb__200 with
  | { B_dData_dPair.f_Pair_first = dtb__202; B_dData_dPair.f_Pair_second = dtb__203 } -> (((v_applyCallFields mc0) dtb__197) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCall ({ Base_dDiag.f_CallInfo_callCallee = dtb__203; Base_dDiag.f_CallInfo_callArg = ("argument " ^ (bi_strFromInt mc0)); Base_dDiag.f_CallInfo_callRelation = (Elab_dTermination_dMeasure.v_relText dtb__201); Base_dDiag.f_CallInfo_callSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__199)) }))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Termination.vuna"
let v_cannotProveMsgEdges = (fun (comp : string B_dData_dList.t_List) (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun desc -> ((fun base -> (((v_applyCallFields p) edges) ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> ((Base_dDiag.v_withFallbackSpan dtb__207) base)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsSynthetic) base)
  | _ -> failwith "DT: impossible branch"
)) edges))) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CannotProveTermination (desc))) (B_dData_dVec.C_Vec_VCons (desc, B_dData_dVec.C_Vec_Nil))))) (v_groupMessage comp)))

# 441 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectClauses = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : string) (mc6 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (if (B_dData_dPair.v_firstOf mc7) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> (if dtb__210 then ((((((((v_collectClauses dtb__209) mc1) mc2) mc3) mc4) mc5) mc6) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__211) }) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__211) })))
  | _ -> failwith "DT: impossible branch"
)) (((((((v_strClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__208)) else (Base_dDiag.C_Check_OkC (mc7)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectMeasure = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : string B_dData_dList.t_List) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> ((Base_dCommon.v_bind ((((((((v_collectClauses ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__212) mc1)) mc0) mc2) mc3) mc4) dtb__212) mc5) mc7)) (fun (acc2 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((((((v_collectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__213) acc2)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Elab/Termination.vuna"
let v_emptyFail = (fun (p : int) -> { f_FailCandidate_fcRank = 0; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = B_dData_dList.C_List_Nil })

# 477 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintRankOf = (fun (m : int) -> (if (m = Elab_dTermination_dMeasure.v_relMissingGuard) then 4 else (if (m = Elab_dTermination_dMeasure.v_relAscending) then 4 else (if (m = Elab_dTermination_dMeasure.v_relUnknownSize) then 3 else (if (m = Elab_dTermination_dMeasure.v_relOtherPosition) then 2 else (if (m = Elab_dTermination_dMeasure.v_relNoRelation) then 1 else 0))))))

# 487 "Vuna/Compiler/Elab/Termination.vuna"
let v_edgeRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (match dtb__214 with
  | { B_dData_dPair.f_Pair_first = dtb__216; B_dData_dPair.f_Pair_second = dtb__217 } -> (match dtb__216 with
  | { B_dData_dPair.f_Pair_first = dtb__218; B_dData_dPair.f_Pair_second = dtb__219 } -> (v_hintRankOf dtb__217)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgesRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> ((Elab_dTermination_dMeasure.v_maxInt (v_edgeRankOf dtb__220)) (v_edgesRankOf dtb__221))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Termination.vuna"
let v_betterFail = (fun (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> ((fun rank -> (if (rank > (best).f_FailCandidate_fcRank) then { f_FailCandidate_fcRank = rank; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = edges } else best)) (v_edgesRankOf edges)))

# 541 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_computePosFactsWork = (fun (names : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (rgT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (work : string B_dData_dList.t_List) -> (if (fuel <= 0) then facts else ((fun namesTbl -> ((fun scan -> ((fun fresh -> ((fun newFacts -> ((fun merged -> ((fun nextWork -> (match nextWork with
  | B_dData_dList.C_List_Nil -> merged
  | _ -> ((((((v_computePosFactsWork names) defTbl) rgT) (fuel - 1)) merged) nextWork)
)) (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (n : string) -> ((v_adjOf n) rgT))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) newFacts))))) ((Elab_dTermination_dMeasure.v_posUnionTbl facts) fresh))) ((Elab_dTermination_dMeasure.v_posFilterTbl fresh) (Elab_dTermination_dMeasure.v_posTblOf facts)))) ((Elab_dTermination_dMeasure.v_posFilterTbl (B_dData_dPair.v_firstOf scan)) (Elab_dTermination_dMeasure.v_posTblOf (B_dData_dPair.v_secondOf scan))))) (((((Elab_dTermination_dMeasure.v_posScanNames namesTbl) defTbl) (Elab_dTermination_dMeasure.v_posTblOf facts)) work) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))) (B_dContainer_dHashMap.v_ofNames names))))

# 562 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfunNames = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | Frontend_dRast.C_Decl_DFun (dtb__224, dtb__225, dtb__226, dtb__227) -> (B_dData_dList.C_List__x58__x58_ (dtb__224, (v_dfunNames dtb__223)))
  | _ -> (v_dfunNames dtb__223)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 595 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_anyOwnTbl = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__228) mc0) then true else ((v_anyOwnTbl mc0) dtb__229))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 610 "Vuna/Compiler/Elab/Termination.vuna"
let v_callMode = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (match dtb__230 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> (match dtb__232 with
  | { B_dData_dPair.f_Pair_first = dtb__234; B_dData_dPair.f_Pair_second = dtb__235 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_tryMeasureGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (remaining : int) (maxP : int) (lastP : int) (lastEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> (if (remaining <= 0) then (if ((best).f_FailCandidate_fcRank > 0) then (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) (best).f_FailCandidate_fcPos) (best).f_FailCandidate_fcEdges))) else (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) lastP) lastEdges)))) else ((fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__236) -> (match dtb__236 with
  | { B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = dtb__238 } -> (if dtb__237 then ((fun modes -> (if (Elab_dTermination_dMeasure.v_notEmpty modes) then (if (Elab_dTermination_dMeasure.v_allSame modes) then (if ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) dtb__238) then ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__238) best) else (Base_dDiag.C_Check_OkC (0))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__238) best)) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__238) best))) (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_callMode) dtb__238))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__238) (((v_betterFail p) dtb__238) best)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__239) -> (Base_dDiag.C_Check_ErrC (dtb__239))
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_collectMeasure comp) defTbl) ctors) projs) p) facts) comp) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))) (maxP - remaining))))

# 501 "Vuna/Compiler/Elab/Termination.vuna"
let v_tryMeasure = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (p : int) (maxP : int) -> ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (maxP - p)) maxP) p) B_dData_dList.C_List_Nil) (v_emptyFail p)))

# 522 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkStrictGroup = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun factsTbl -> (match (((((((v_tryMeasure comp) defTbl) ctors) projs) factsTbl) 0) ((Elab_dTermination_dMeasure.v_maxArityOf comp) defTbl)) with
  | Base_dDiag.C_Check_OkC (dtb__240) -> (Base_dDiag.C_Check_OkC (dtb__240))
  | Base_dDiag.C_Check_ErrC (dtb__241) -> (match ((((((Elab_dTermination_dScc.v_tryFuelThread comp) defTbl) ctors) projs) factsTbl) dtb__241) with
  | Base_dDiag.C_Check_OkC (dtb__242) -> (Base_dDiag.C_Check_OkC (dtb__242))
  | Base_dDiag.C_Check_ErrC (dtb__243) -> ((((((Elab_dTermination_dScc.v_sctCheck comp) defTbl) ctors) projs) factsTbl) dtb__243)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Elab_dTermination_dMeasure.v_posTblOf facts)))

# 533 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (match dtb__245 with
  | B_dData_dList.C_List_Nil -> (if ((B_dData_dList.v_memName dtb__244) ((v_adjOf dtb__244) mc4)) then (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
))

# 599 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_checkSccsWith = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List B_dData_dList.t_List) (mc2 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (if ((v_anyOwnTbl mc0) dtb__246) then ((Base_dCommon.v_bind ((((((v_checkComp dtb__246) mc2) mc3) mc4) mc5) mc6)) (fun (n : int) -> ((Base_dCommon.v_bind (((((((v_checkSccsWith mc0) dtb__247) mc2) mc3) mc4) mc5) mc6)) (fun (m : int) -> (Base_dDiag.C_Check_OkC ((n + m))))))) else (((((((v_checkSccsWith mc0) dtb__247) mc2) mc3) mc4) mc5) mc6))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 569 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDeclsWith = (fun (own : string B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((fun defs -> ((fun defTbl -> ((fun ctors -> ((fun projs -> ((fun g -> ((fun gT -> ((fun nodes -> ((fun rgT -> ((fun callerNames -> ((fun facts -> ((fun ownTbl -> ((fun _u -> ((fun fuel -> ((fun postR -> ((fun compsR -> (if (B_dData_dPair.v_firstOf postR) then (if (B_dData_dPair.v_firstOf compsR) then (((((((v_checkSccsWith ownTbl) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf compsR))) defTbl) ctors) projs) gT) facts) else (Base_dDiag.v_icFuel "termination-scc")) else (Base_dDiag.v_icFuel "termination-scc"))) (((((v_sccOf (B_dData_dPair.v_secondOf postR)) fuel) rgT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))) (((v_postOrder gT) g) nodes))) ((v_graphFuel g) nodes))) (if (dtp_debug_on 0) then (dtp_debug_line "term-facts") else 0))) (B_dContainer_dHashMap.v_ofNames own))) ((((((v_computePosFactsWork nodes) defTbl) rgT) 1024) B_dData_dList.C_List_Nil) callerNames))) ((B_dData_dList.v_filter (fun (n : string) -> (Elab_dTermination_dMeasure.v_notEmpty ((v_adjOf n) gT)))) nodes))) (v_reverseAdjOf g))) (Elab_dTermination_dMeasure.v_defNames defs))) (v_adjTblOf g))) (v_callGraph defs))) (Elab_dTermination_dMeasure.v_projectionsOf defs))) (Elab_dTermination_dMeasure.v_ctorNamesOf decls))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) defs))) (Elab_dTermination_dMeasure.v_groupDefs decls)))

# 559 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDecls = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_checkTerminationDeclsWith (v_dfunNames decls)) decls))
