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
  | Frontend_dRast.C_DoStmt_DLet (dtb__12, dtb__13) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_concatMap (fun (bd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (v_patNames (B_dData_dPair.v_firstOf bd)))) dtb__12); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap (fun (bd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB mc0) (B_dData_dPair.v_secondOf bd)))) dtb__12) }
  | Frontend_dRast.C_DoStmt_DExpr (dtb__14, dtb__15) -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = ((v_exprRefsB mc0) dtb__14) }
  | Frontend_dRast.C_DoStmt_DBind (dtb__16, dtb__17, dtb__18) -> { B_dData_dPair.f_Pair_first = (v_patNames dtb__16); B_dData_dPair.f_Pair_second = ((v_exprRefsB mc0) dtb__17) }
  | _ -> failwith "DT: impossible branch"
))
# 33 "Vuna/Compiler/Elab/Termination.vuna"
and v_refsOfStmts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match ((v_refsOfStmt mc0) dtb__19) with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> (match ((v_refsOfStmts ((B_dData_dList.v_append dtb__21) mc0)) dtb__20) with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__22) dtb__24) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))
# 41 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsB = (fun (bound : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (match e with
  | Frontend_dRast.C_Expr_EVar (dtb__25, dtb__26) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__25)) bound) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast_dName.v_rnameKey dtb__25), B_dData_dList.C_List_Nil)))
  | Frontend_dRast.C_Expr_EInt (dtb__27, dtb__28) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Expr_EStr (dtb__29, dtb__30) -> B_dData_dList.C_List_Nil
  | Frontend_dRast.C_Expr_ELam (dtb__31, dtb__32, dtb__33) -> ((v_exprRefsB ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__31)) bound)) dtb__32)
  | Frontend_dRast.C_Expr_EApp (dtb__34, dtb__35, dtb__36) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__34)) ((B_dData_dList.v_concatMap (v_exprRefsB bound)) dtb__35))
  | Frontend_dRast.C_Expr_EPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__40)) ((v_exprRefsB (B_dData_dList.C_List__x58__x58_ (dtb__37, bound))) dtb__41))
  | Frontend_dRast.C_Expr_ELet (dtb__43, dtb__44, dtb__45, dtb__46) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (bd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB bound) (B_dData_dPair.v_secondOf bd)))) dtb__43)) ((v_exprRefsB ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (bd : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (v_patNames (B_dData_dPair.v_firstOf bd)))) dtb__43)) bound)) dtb__44))
  | Frontend_dRast.C_Expr_ECase (dtb__47, dtb__48, dtb__49) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__47)) ((B_dData_dList.v_concatMap (fun (alt : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB ((B_dData_dList.v_append (v_patNames (B_dData_dPair.v_firstOf alt))) bound)) (B_dData_dPair.v_secondOf alt)))) dtb__48))
  | Frontend_dRast.C_Expr_EIf (dtb__50, dtb__51, dtb__52, dtb__53) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__50)) ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__51)) ((v_exprRefsB bound) dtb__52)))
  | Frontend_dRast.C_Expr_EField (dtb__54, dtb__55, dtb__56) -> ((v_exprRefsB bound) dtb__54)
  | Frontend_dRast.C_Expr_ERecord (dtb__57, dtb__58, dtb__59) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB bound) (B_dData_dPair.v_secondOf q)))) dtb__58)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__60, dtb__61, dtb__62) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__60)) ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB bound) (B_dData_dPair.v_secondOf q)))) dtb__61))
  | Frontend_dRast.C_Expr_EDo (dtb__63, dtb__64) -> (B_dData_dPair.v_secondOf ((v_refsOfStmts bound) dtb__63))
  | Frontend_dRast.C_Expr_EAnn (dtb__65, dtb__66, dtb__67) -> ((B_dData_dList.v_append ((v_exprRefsB bound) dtb__65)) ((v_exprRefsB bound) dtb__66))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__68, dtb__69) -> ((B_dData_dList.v_concatMap (fun (c : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB ((B_dData_dList.v_append (v_patsNames (B_dData_dPair.v_firstOf c))) bound)) (B_dData_dPair.v_secondOf c)))) dtb__68)
  | _ -> B_dData_dList.C_List_Nil
))

# 70 "Vuna/Compiler/Elab/Termination.vuna"
let v_refsOfDef = (fun (clauses : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (c : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB (v_patsNames (B_dData_dPair.v_firstOf c))) (B_dData_dPair.v_secondOf c)))) clauses)))

# 73 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_mapEdges = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__70); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_filter (fun (r : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) r) mc0))) (v_refsOfDef (B_dData_dPair.v_secondOf dtb__70))) }, ((v_mapEdges mc0) dtb__71)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Termination.vuna"
let v_callGraph = (fun (defs : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_mapEdges (B_dContainer_dHashMap.v_ofNames (Elab_dTermination_dMeasure.v_defNames defs))) defs))

# 81 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjOf = (fun (n : string) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> dtb__72
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjTblOf = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 95 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addSrcs = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (let cur = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__73) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> dtb__75
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_addSrcs mc0) dtb__74) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__73) (B_dData_dList.C_List__x58__x58_ (mc0, cur))) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_reverseAdjOf = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | { B_dData_dPair.f_Pair_first = dtb__78; B_dData_dPair.f_Pair_second = dtb__79 } -> (((v_addSrcs dtb__78) dtb__79) (v_reverseAdjOf dtb__77))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_replacePair = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = dtb__83 } -> (if (dtb__82 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__81)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = dtb__83 }, (((v_replacePair mc0) mc1) dtb__81))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Termination.vuna"
let v_addEdge = (fun (n : string) (m : string) (acc : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((B_dData_dList.v_lookupPair n) acc) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> (((v_replacePair n) (B_dData_dList.C_List__x58__x58_ (m, dtb__84))) acc)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (m, B_dData_dList.C_List_Nil)) }, acc))
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addEdges = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (((v_addEdges mc0) dtb__86) (((v_addEdge dtb__85) mc0) mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_transposeGo = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (match dtb__87 with
  | { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__90 } -> ((v_transposeGo dtb__88) (((v_addEdges dtb__89) dtb__90) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dedupTransposed = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__93; B_dData_dPair.f_Pair_second = dtb__94 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__93; B_dData_dPair.f_Pair_second = (Elab_dTermination_dMeasure.v_dedup dtb__94) }, (v_dedupTransposed dtb__92)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Termination.vuna"
let v_transpose = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedupTransposed ((v_transposeGo g) B_dData_dList.C_List_Nil)))

# 133 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgeCount = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match dtb__95 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> ((B_dData_dList.v_length dtb__98) + (v_edgeCount dtb__96))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Elab/Termination.vuna"
let v_graphFuel = (fun (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> (((4 * (B_dData_dList.v_length nodes)) + (4 * (v_edgeCount g))) + 16))

# 141 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsPost = (fun (steps : (string, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (fuel : int) (g : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (post : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post } else (let nd_uscrut5 = steps in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (match dtb__99 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (if dtb__102 then (((((v_dfsPost dtb__100) (fuel - 1)) g) visited) (B_dData_dList.C_List__x58__x58_ (dtb__101, post))) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__101) visited) then (((((v_dfsPost dtb__100) (fuel - 1)) g) visited) post) else (((((v_dfsPost ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (m : string) -> { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = false })) ((v_adjOf dtb__101) g))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = true }, dtb__100)))) (fuel - 1)) g) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__101) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = post }
  | _ -> failwith "DT: impossible branch"
))))

# 151 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsAll = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (if (mc1 <= 0) then mc4 else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__103) mc3) then (((((v_dfsAll dtb__104) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_dfsPost (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = false }, B_dData_dList.C_List_Nil))) mc1) mc2) mc3) mc4) with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> (((((v_dfsAll dtb__104) (mc1 - 1)) mc2) dtb__105) dtb__106)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Elab/Termination.vuna"
let v_postOrder = (fun (gT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (g : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (nodes : string B_dData_dList.t_List) -> (let post = (((((v_dfsAll nodes) ((v_graphFuel g) nodes)) gT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_length post) = (B_dData_dList.v_length nodes)); B_dData_dPair.f_Pair_second = post }))

# 170 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = false } } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__107) mc3) then (((((v_collectComp dtb__108) (mc1 - 1)) mc2) mc3) mc4) else (((((v_collectComp ((B_dData_dList.v_append ((v_adjOf dtb__107) mc2)) dtb__108)) (mc1 - 1)) mc2) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__107) true) mc3)) (B_dData_dList.C_List__x58__x58_ (dtb__107, mc4)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = true } }
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_sccOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if (mc1 <= 0) then { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = mc4 } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__109) mc3) then (((((v_sccOf dtb__110) (mc1 - 1)) mc2) mc3) mc4) else (let nd_uscrut8 = (((((v_collectComp (B_dData_dList.C_List__x58__x58_ (dtb__109, B_dData_dList.C_List_Nil))) (mc1 - 1)) mc2) mc3) B_dData_dList.C_List_Nil) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (match dtb__112 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> (if dtb__114 then (((((v_sccOf dtb__110) (mc1 - 1)) mc2) dtb__111) (B_dData_dList.C_List__x58__x58_ (dtb__113, mc4))) else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__113, mc4)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintEdge = (fun (caller : string) (callee : string) (p : int) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match ((((Elab_dTermination_dMeasure.v_argRelHint p) args) sizes) ctors) with
  | B_dData_dMaybe.C_Maybe_Nothing -> acc
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) callee) dtb__115) sp) acc)
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_strWalk = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match e with
  | Frontend_dRast.C_Expr_EApp (dtb__116, dtb__117, dtb__118) -> (((((((((((((v_strWalkEApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__116) dtb__117) dtb__118) acc)
  | Frontend_dRast.C_Expr_ECase (dtb__119, dtb__120, dtb__121) -> ((((((((((((v_strWalkAlts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__119) dtb__120) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__119) acc))
  | Frontend_dRast.C_Expr_EIf (dtb__122, dtb__123, dtb__124, dtb__125) -> (let acc1 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__122) acc) in (let acc2 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb__122)) region)) dtb__123) acc1) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb__122)) region)) dtb__124) acc2)))
  | Frontend_dRast.C_Expr_ELam (dtb__126, dtb__127, dtb__128) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__127) acc)
  | Frontend_dRast.C_Expr_ELet (dtb__129, dtb__130, dtb__131, dtb__132) -> (let sizes2 = (((Elab_dTermination_dMeasure.v_extendByBinds projs) dtb__129) sizes) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__130) (((((((((((v_strWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__129) acc)))
  | Frontend_dRast.C_Expr_EPi (dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__137) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__136) acc))
  | Frontend_dRast.C_Expr_EField (dtb__139, dtb__140, dtb__141) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__139) acc)
  | Frontend_dRast.C_Expr_ERecord (dtb__142, dtb__143, dtb__144) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__143) acc)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__145, dtb__146, dtb__147) -> (((((((((((v_strWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__146) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__145) acc))
  | Frontend_dRast.C_Expr_EDo (dtb__148, dtb__149) -> (((((((((((v_strWalkStmts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__148) acc)
  | Frontend_dRast.C_Expr_EAnn (dtb__150, dtb__151, dtb__152) -> (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__151) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__150) acc))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__153, dtb__154) -> (((((((((((v_strWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (Elab_dTermination_dMeasure.v_localClauseBinds dtb__153)) acc)
  | Frontend_dRast.C_Expr_EVar (dtb__155, dtb__156) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__155)) comp) then (Elab_dTermination_dMeasure.v_markInvalid acc) else acc)
  | _ -> acc
)))
# 238 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (match ((Elab_dTermination_dMeasure.v_groupHead comp) fn) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (match ((((((((Elab_dTermination_dMeasure.v_argRel p) args) sizes) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) ((((((((v_hintEdge caller) dtb__157) p) args) ctors) sizes) sp) acc)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) dtb__157) dtb__158) sp) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match fn with
  | Frontend_dRast.C_Expr_EVar (dtb__159, dtb__160) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb__159) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb__161) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (let acc1 = (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (dtb__162).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) acc) in (let sizes2 = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) (dtb__162).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb__162).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) (dtb__162).Elab_dTermination_dMeasure.f_HofCall_hofBody) acc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb__161).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then ((((((((((((v_strWalkEAppMap (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((((v_strWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
)))
# 263 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEAppMap = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (let nd_uscrut12 = args in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__164 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (match dtb__166 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut20 = dtb__163 in (match nd_uscrut20 with
  | Frontend_dRast.C_Expr_EVar (dtb__167, dtb__168) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__167)) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (Frontend_dRast_dName.v_rnameKey dtb__167)) B_dData_dList.C_List_Nil) dtb__165) dtb__168) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | Frontend_dRast.C_Expr_EApp (dtb__169, dtb__170, dtb__171) -> (match dtb__169 with
  | Frontend_dRast.C_Expr_EVar (dtb__172, dtb__173) -> (if ((B_dData_dList.v_memName (Frontend_dRast_dName.v_rnameKey dtb__172)) comp) then ((((((((((((((v_strWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (Frontend_dRast_dName.v_rnameKey dtb__172)) dtb__170) dtb__165) dtb__171) acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
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
# 276 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkMapPartialInline = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (g : string) (pargs : Frontend_dRast.t_Expr B_dData_dList.t_List) (lst : Frontend_dRast.t_Expr) (cbsp : Base_dSource.t_Span) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (let acc1 = (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc) in (let elems = (((Elab_dTermination_dMeasure.v_extendElemSizes sizes) lst) "$elem") in (let fullArgs = ((B_dData_dList.v_append pargs) (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "$elem"), cbsp)), B_dData_dList.C_List_Nil))) in (let acc2 = (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1) in (match ((((((((Elab_dTermination_dMeasure.v_argRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid acc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode caller) g) dtb__174) cbsp) acc2)
  | _ -> failwith "DT: impossible branch"
)))))))
# 290 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkApp = (fun (fuel : int) (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (sizes : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (region : string B_dData_dList.t_List) (fn : Frontend_dRast.t_Expr) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) (acc : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Elab_dTermination_dMeasure.v_markInvalid acc) else (((((((((((v_strWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_strWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc))))
# 308 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkArgs = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkArgs (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__176) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__175) mc10)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 328 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkAlts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dRast.t_Expr) (mc10 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc11 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__177, dtb__178) -> (match dtb__177 with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc11) else ((((((((((((v_strWalkAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__178) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc5) mc9) dtb__179)) mc6) mc7) mc8) dtb__180) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
))
# 349 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinds = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> (match dtb__181 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc5) dtb__184) dtb__183)) mc6) mc7) mc8) dtb__182) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__184) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 369 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (((((((((((v_strWalkFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__186) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__188) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
# 389 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkStmts = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : string) (mc7 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc8 : string B_dData_dList.t_List) (mc9 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) (mc10 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (if (mc0 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid mc10) else (match dtb__189 with
  | Frontend_dRast.C_DoStmt_DBind (dtb__191, dtb__192, dtb__193) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) ((((Elab_dTermination_dMeasure.v_extendSizesStrict mc3) mc5) dtb__192) dtb__191)) mc6) mc7) mc8) dtb__190) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__192) mc10))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__194, dtb__195) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__190) (((((((((((v_strWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__194) mc10))
  | Frontend_dRast.C_DoStmt_DLet (dtb__196, dtb__197) -> (((((((((((v_strWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) (((Elab_dTermination_dMeasure.v_extendByBinds mc3) dtb__196) mc5)) mc6) mc7) mc8) dtb__190) (((((((((((v_strWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__196) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Termination.vuna"
let v_strClause = (fun (comp : string B_dData_dList.t_List) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (p : int) (caller : string) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (clause : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (((((((((((v_strWalk ((Frontend_dRast.v_exprBudget 32) (B_dData_dPair.v_secondOf clause))) comp) ctors) projs) p) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf clause))) caller) facts) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf clause)) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))

# 418 "Vuna/Compiler/Elab/Termination.vuna"
let v_groupMessage = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__199 with
  | B_dData_dList.C_List_Nil -> (dtb__198 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

# 436 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_applyCallFields = (fun (mc0 : int) (mc1 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Base_dDiag.t_Diagnostic) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> (match dtb__200 with
  | { B_dData_dPair.f_Pair_first = dtb__202; B_dData_dPair.f_Pair_second = dtb__203 } -> (match dtb__202 with
  | { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } -> (match dtb__204 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (((v_applyCallFields mc0) dtb__201) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCall ({ Base_dDiag.f_CallInfo_callCallee = dtb__207; Base_dDiag.f_CallInfo_callArg = ("argument " ^ (bi_strFromInt mc0)); Base_dDiag.f_CallInfo_callRelation = (Elab_dTermination_dMeasure.v_relText dtb__205); Base_dDiag.f_CallInfo_callSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__203)) }))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Elab/Termination.vuna"
let v_cannotProveMsgEdges = (fun (comp : string B_dData_dList.t_List) (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let desc = (v_groupMessage comp) in (let base = ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CannotProveTermination (desc))) (B_dData_dVec.C_Vec_VCons (desc, B_dData_dVec.C_Vec_Nil))) in (((v_applyCallFields p) edges) (let nd_uscrut5 = edges in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (match dtb__208 with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> ((Base_dDiag.v_withFallbackSpan dtb__211) base)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsSynthetic) base)
  | _ -> failwith "DT: impossible branch"
))))))

# 444 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectClauses = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : string) (mc6 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (if (B_dData_dPair.v_firstOf mc7) then (let nd_uscrut11 = (((((((v_strClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__212) in (match nd_uscrut11 with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (if dtb__214 then ((((((((v_collectClauses dtb__213) mc1) mc2) mc3) mc4) mc5) mc6) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__215) }) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf mc7)) dtb__215) })))
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC (mc7)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectMeasure = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : int) (mc5 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : string B_dData_dList.t_List) (mc7 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> ((Base_dCommon.v_bind ((((((((v_collectClauses ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb__216) mc1)) mc0) mc2) mc3) mc4) dtb__216) mc5) mc7)) (fun (acc2 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((((((v_collectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__217) acc2)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Elab/Termination.vuna"
let v_emptyFail = (fun (p : int) -> { f_FailCandidate_fcRank = 0; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = B_dData_dList.C_List_Nil })

# 472 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintRankOf = (fun (m : int) -> (if (m = Elab_dTermination_dMeasure.v_relMissingGuard) then 4 else (if (m = Elab_dTermination_dMeasure.v_relAscending) then 4 else (if (m = Elab_dTermination_dMeasure.v_relUnknownSize) then 3 else (if (m = Elab_dTermination_dMeasure.v_relOtherPosition) then 2 else (if (m = Elab_dTermination_dMeasure.v_relNoRelation) then 1 else 0))))))

# 482 "Vuna/Compiler/Elab/Termination.vuna"
let v_edgeRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__218; B_dData_dPair.f_Pair_second = dtb__219 } -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> (match dtb__220 with
  | { B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = dtb__223 } -> (v_hintRankOf dtb__221)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgesRankOf = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> ((Elab_dTermination_dMeasure.v_maxInt (v_edgeRankOf dtb__224)) (v_edgesRankOf dtb__225))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Elab/Termination.vuna"
let v_betterFail = (fun (p : int) (edges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> (let rank = (v_edgesRankOf edges) in (if (rank > (best).f_FailCandidate_fcRank) then { f_FailCandidate_fcRank = rank; f_FailCandidate_fcPos = p; f_FailCandidate_fcEdges = edges } else best)))

# 536 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_computePosFactsWork = (fun (names : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (rgT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (fuel : int) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (work : string B_dData_dList.t_List) -> (if (fuel <= 0) then facts else (let namesTbl = (B_dContainer_dHashMap.v_ofNames names) in (let scan = (((((Elab_dTermination_dMeasure.v_posScanNames namesTbl) defTbl) (Elab_dTermination_dMeasure.v_posTblOf facts)) work) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let fresh = ((Elab_dTermination_dMeasure.v_posFilterTbl (B_dData_dPair.v_firstOf scan)) (Elab_dTermination_dMeasure.v_posTblOf (B_dData_dPair.v_secondOf scan))) in (let newFacts = ((Elab_dTermination_dMeasure.v_posFilterTbl fresh) (Elab_dTermination_dMeasure.v_posTblOf facts)) in (let merged = ((Elab_dTermination_dMeasure.v_posUnionTbl facts) fresh) in (let nextWork = (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (n : string) -> ((v_adjOf n) rgT))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) newFacts))) in (match nextWork with
  | B_dData_dList.C_List_Nil -> merged
  | _ -> ((((((v_computePosFactsWork names) defTbl) rgT) (fuel - 1)) merged) nextWork)
)))))))))

# 557 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfunNames = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__226, dtb__227) -> (match dtb__226 with
  | Frontend_dRast.C_Decl_DFun (dtb__228, dtb__229, dtb__230, dtb__231) -> (B_dData_dList.C_List__x58__x58_ (dtb__228, (v_dfunNames dtb__227)))
  | Frontend_dRast.C_Decl_DInstance (dtb__232, dtb__233, dtb__234, dtb__235) -> ((B_dData_dList.v_append (v_dfunNames dtb__234)) (v_dfunNames dtb__227))
  | _ -> (v_dfunNames dtb__227)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_anyOwnTbl = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__236) mc0) then true else ((v_anyOwnTbl mc0) dtb__237))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 615 "Vuna/Compiler/Elab/Termination.vuna"
let v_callMode = (fun (mc0 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__239 } -> (match dtb__238 with
  | { B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = dtb__241 } -> (match dtb__240 with
  | { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = dtb__243 } -> dtb__241
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_tryMeasureGo = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (remaining : int) (maxP : int) (lastP : int) (lastEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (best : t_FailCandidate) -> (if (remaining <= 0) then (if ((best).f_FailCandidate_fcRank > 0) then (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) (best).f_FailCandidate_fcPos) (best).f_FailCandidate_fcEdges))) else (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges comp) lastP) lastEdges)))) else (let p = (maxP - remaining) in (let nd_uscrut11 = ((((((((v_collectMeasure comp) defTbl) ctors) projs) p) facts) comp) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__244) -> (match dtb__244 with
  | { B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = dtb__246 } -> (if dtb__245 then (let modes = (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_callMode) dtb__246)) in (if (Elab_dTermination_dMeasure.v_notEmpty modes) then (if (Elab_dTermination_dMeasure.v_allSame modes) then (if ((Elab_dTermination_dMeasure.v_hasWeakCycle comp) dtb__246) then ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__246) best) else (Base_dDiag.C_Check_OkC (0))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__246) best)) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__246) best))) else ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (remaining - 1)) maxP) p) dtb__246) (((v_betterFail p) dtb__246) best)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__247) -> (Base_dDiag.C_Check_ErrC (dtb__247))
  | _ -> failwith "DT: impossible branch"
)))))

# 496 "Vuna/Compiler/Elab/Termination.vuna"
let v_tryMeasure = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (p : int) (maxP : int) -> ((((((((((v_tryMeasureGo comp) defTbl) ctors) projs) facts) (maxP - p)) maxP) p) B_dData_dList.C_List_Nil) (v_emptyFail p)))

# 517 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkStrictGroup = (fun (comp : string B_dData_dList.t_List) (defTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ctors : string B_dData_dList.t_List) (projs : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (facts : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let factsTbl = (Elab_dTermination_dMeasure.v_posTblOf facts) in (match (((((((v_tryMeasure comp) defTbl) ctors) projs) factsTbl) 0) ((Elab_dTermination_dMeasure.v_maxArityOf comp) defTbl)) with
  | Base_dDiag.C_Check_OkC (dtb__248) -> (Base_dDiag.C_Check_OkC (dtb__248))
  | Base_dDiag.C_Check_ErrC (dtb__249) -> (match ((((((Elab_dTermination_dScc.v_tryFuelThread comp) defTbl) ctors) projs) factsTbl) dtb__249) with
  | Base_dDiag.C_Check_OkC (dtb__250) -> (Base_dDiag.C_Check_OkC (dtb__250))
  | Base_dDiag.C_Check_ErrC (dtb__251) -> ((((((Elab_dTermination_dScc.v_sctCheck comp) defTbl) ctors) projs) factsTbl) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 528 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkComp = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc5 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match dtb__253 with
  | B_dData_dList.C_List_Nil -> (if ((B_dData_dList.v_memName dtb__252) ((v_adjOf dtb__252) mc4)) then (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> (((((v_checkStrictGroup mc0) mc1) mc2) mc3) mc5)
))

# 604 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_checkSccsWith = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List B_dData_dList.t_List) (mc2 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) (mc4 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc6 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> (if ((v_anyOwnTbl mc0) dtb__254) then ((Base_dCommon.v_bind ((((((v_checkComp dtb__254) mc2) mc3) mc4) mc5) mc6)) (fun (n : int) -> ((Base_dCommon.v_bind (((((((v_checkSccsWith mc0) dtb__255) mc2) mc3) mc4) mc5) mc6)) (fun (m : int) -> (Base_dDiag.C_Check_OkC ((n + m))))))) else (((((((v_checkSccsWith mc0) dtb__255) mc2) mc3) mc4) mc5) mc6))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 571 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationGroups = (fun (own : string B_dData_dList.t_List) (ownDecls : Frontend_dRast.t_Decl B_dData_dList.t_List) (depDecls : Frontend_dRast.t_Decl B_dData_dList.t_List) (tableDecls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (let allDecls = ((B_dData_dList.v_append depDecls) ownDecls) in (let resolved = (Elab_dTermination_dMeasure.v_expandForwarders allDecls) in (let defs = (Elab_dTermination_dMeasure.v_groupDefs resolved) in (let defTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) defs) in (let ctors = (Elab_dTermination_dMeasure.v_ctorNamesOf ((B_dData_dList.v_append depDecls) tableDecls)) in (let projs = ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_projectionsOf defs)) (Elab_dTermination_dMeasure.v_fieldProjectionsOf ((B_dData_dList.v_append depDecls) tableDecls))) in (let g = (v_callGraph defs) in (let gT = (v_adjTblOf g) in (let nodes = (Elab_dTermination_dMeasure.v_defNames defs) in (let rgT = (v_reverseAdjOf g) in (let callerNames = ((B_dData_dList.v_filter (fun (n : string) -> (Elab_dTermination_dMeasure.v_notEmpty ((v_adjOf n) gT)))) nodes) in (let facts = ((((((v_computePosFactsWork nodes) defTbl) rgT) 1024) B_dData_dList.C_List_Nil) callerNames) in (let ownTbl = (B_dContainer_dHashMap.v_ofNames own) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Termination") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Termination") "term-facts") else 0) in (let fuel = ((v_graphFuel g) nodes) in (let postR = (((v_postOrder gT) g) nodes) in (let compsR = (((((v_sccOf (B_dData_dPair.v_secondOf postR)) fuel) rgT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in (if (B_dData_dPair.v_firstOf postR) then (if (B_dData_dPair.v_firstOf compsR) then (((((((v_checkSccsWith ownTbl) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf compsR))) defTbl) ctors) projs) gT) facts) else (Base_dDiag.v_icFuel "termination-scc")) else (Base_dDiag.v_icFuel "termination-scc"))))))))))))))))))))

# 565 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDeclsWith = (fun (own : string B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((((v_checkTerminationGroups own) decls) B_dData_dList.C_List_Nil) decls))

# 554 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDecls = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_checkTerminationDeclsWith (v_dfunNames decls)) decls))
